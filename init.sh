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
  file='editorconfig';  create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
  file='gitconfig';     create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
  file='profile';       create_symlink "${HOME}/.${file}"            "${HOME}/.z${file}"
  file='tigrc';         create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
  file='tmux.conf';     create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
  file='vimrc';         create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
  file='xinitrc';       create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
  file='Xresources';    create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
  file='zlogout';       create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
  file='zshrc';         create_symlink "${profile_dir}/.${file}"     "${HOME}/.${file}"
}

link_config() {
  dir='alacritty';      create_symlink "${profile_dir}/.config/${dir}"   "${config_dir}/${dir}"
  dir='awesome';        create_symlink "${profile_dir}/.config/${dir}"   "${config_dir}/${dir}"
  dir='lazygit';        create_symlink "${profile_dir}/.config/${dir}/config.yml"   "${config_dir}/${dir}/config.yml"
  dir='lf';             create_symlink "${profile_dir}/.config/${dir}"   "${config_dir}/${dir}"
  dir='nvim';           create_symlink "${profile_dir}/.config/${dir}"   "${config_dir}/${dir}"
  dir='tmux';           create_symlink "${profile_dir}/.config/${dir}"   "${config_dir}/${dir}"
}

prepare_directories() {
  mkdir -p \
    "$bin_dir" \
    "$config_dir" \
    "$config_dir"/lazygit \
    "$profile_dir" \
    "$share_dir"
}

#===============================================================================
# Main
#===============================================================================

main() {
    prepare_directories \
    && export_env_variables "${HOME}/.profile" \
    && link_home \
    && link_config \
    && printf '%s\n' 'User profile initialized successfully.'
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

