#!/usr/bin/env bash
#
# Author: Michal Svorc <dev@michalsvorc.com>
# License: MIT license (https://opensource.org/licenses/MIT)

#===============================================================================
# Abort the script on errors and unbound variables
#===============================================================================

set -o errexit      # Abort on nonzero exit status.
set -o nounset      # Abort on unbound variable.
set -o pipefail     # Don't hide errors within pipes.
# set -o xtrace       # Set debugging.

#===============================================================================
# Variables
#===============================================================================

readonly version='1.2.0'
readonly argv0=${0##*/}
readonly shell='/bin/zsh'
readonly editor='nvim'
readonly remote_scripts='https://raw.githubusercontent.com/michalsvorc/scripts/main'

readonly bin_dir="${HOME}/.local/bin"
readonly config_dir="${HOME}/.config"
readonly profile_dir="${HOME}/.local/profile"
readonly share_dir="${HOME}/.local/share"

#===============================================================================
# Usage
#===============================================================================

usage() {
  cat <<EOF
Usage:  ${argv0}

Initialize \$USER profile configuration files in \$HOME.

Options:
    -h, --help      Show help screen and exit.
    -v, --version   Show program version and exit.

EOF
  exit ${1:-0}
}

#===============================================================================
# Functions
#===============================================================================

die() {
  local message="$1"

  printf 'Error: %s\n\n' "$message" >&2

  usage 1 1>&2
}

print_version() {
  printf '%s version: %s\n' "$argv0" "$version"
}

export_env_variables() {
  local target="$1"

  printf '
# Added by local profile initialization script.
export SHELL=%s
export EDITOR=%s
export PATH=\"%s:${PATH}\"\n
' \
    "$shell" \
    "$editor" \
    '${HOME}/.local/bin' \
    >> "$target"
}

create_symlink() {
  local source="$1"
  local target="$2"

  ln -sfn "$source" "$target"
}

link_home() {
  file='profile';       create_symlink "${HOME}/.${file}"           "${HOME}/.z${file}"
  file='logout';        create_symlink "${profile_dir}/${file}.sh"  "${HOME}/.z${file}"
  file='zshrc';         create_symlink "${profile_dir}/${file}.sh"  "${HOME}/.${file}"
  file='editorconfig';  create_symlink "${profile_dir}/${file}"     "${HOME}/.${file}"
  file='gitconfig';     create_symlink "${profile_dir}/${file}"     "${HOME}/.${file}"
  file='vimrc';         create_symlink "${profile_dir}/${file}"     "${HOME}/.${file}"
  file='tigrc';         create_symlink "${profile_dir}/${file}"     "${HOME}/.${file}"
  file='tmux.conf';     create_symlink "${profile_dir}/${file}"     "${HOME}/.${file}"
  file='xinitrc';       create_symlink "${profile_dir}/${file}"     "${HOME}/.${file}"
  file='Xresources';    create_symlink "${profile_dir}/${file}"     "${HOME}/.${file}"
}

link_config() {
  dir='alacritty';      create_symlink "${profile_dir}/config/${dir}"   "${config_dir}/${dir}"
  dir='awesome';        create_symlink "${profile_dir}/config/${dir}"   "${config_dir}/${dir}"
  dir='lf';             create_symlink "${profile_dir}/config/${dir}"   "${config_dir}/${dir}"
  dir='nvim';           create_symlink "${profile_dir}/config/${dir}"   "${config_dir}/${dir}"
  dir='tmux';           create_symlink "${profile_dir}/config/${dir}"   "${config_dir}/${dir}"
}

prepare_directories() {
  mkdir -p "$bin_dir" "$config_dir" "$profile_dir" "$share_dir"
}

print_installation() {
  local app_id="$1"

  printf 'Installing %s\n' "$app_id"
}

#===============================================================================
# Install LF
# Description: Terminal file manager.
# Link: https://github.com/gokcehan/lf
#===============================================================================

install_lf() {
  local app_id='lf'
  local install_script="${remote_scripts}/apps/${app_id}.sh"
  local install_dir="${share_dir}/${app_id}/bin"

  print_installation "$app_id"

  mkdir -p "$install_dir" \
    && cd "$_" \
    && curl \
      "$install_script" \
      | bash \
    && create_symlink "${install_dir}/${app_id}" "${bin_dir}/${app_id}"
}

#===============================================================================
# Install Neovim
# Description: Vim-fork focused on extensibility and usability.
# Link: https://github.com/neovim/neovim
#===============================================================================

install_neovim() {
  local app_id='nvim'
  local install_script="${remote_scripts}/apps/${app_id}.sh"
  local install_dir="${share_dir}/${app_id}/appimage"

  print_installation "$app_id"

  mkdir -p "$install_dir" \
    && cd "$_" \
    && curl \
      "$install_script" \
      | bash \
    && create_symlink "${install_dir}/squashfs-root/AppRun" "${bin_dir}/${app_id}"
}

#===============================================================================
# Main
#===============================================================================

main() {
  printf '%s\n' 'Initializing user profile' \
    && prepare_directories \
    && export_env_variables "${HOME}/.profile" \
    && link_home \
    && link_config

  print_installation 'additional applications' \
    && install_lf \
    && install_neovim
}

#===============================================================================
# Execution
#===============================================================================

test $# -eq 0 && main && exit 0

case "${1:-}" in
  -h | --help )
    usage 0
    ;;
  -v | --version )
    print_version
    exit 0
    ;;
  * )
    die "$(printf 'Unrecognized argument "%s".' "${1#-}")"
    ;;
esac

