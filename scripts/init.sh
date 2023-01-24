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
#set -o xtrace       # Set debugging.

#===============================================================================
# Variables
#===============================================================================

readonly version='1.3.0'
readonly argv0=${0##*/}

readonly XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
readonly bin_dir="${HOME}/.local/bin"
readonly profile_dir="${HOME}/.local/profile"
readonly profile_config_dir="${profile_dir}/.config"
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

create_symlink() {
  local source="$1"
  local target="$2"

  ln -sfn "$source" "$target"
}

link_home() {
  file='.editorconfig';  create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='.gitconfig';     create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='.tmux.conf';     create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='.vimrc';         create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='.xinitrc';       create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='.Xresources';    create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='.zlogout';       create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='.zshrc';         create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='.zshenv';        create_symlink "${profile_dir}/${file}"    "${HOME}/${file}"
  file='profile';        create_symlink "${HOME}/.${file}"          "${HOME}/.z${file}"
}

link_config() {
  dir='alacritty';       create_symlink "${profile_config_dir}/${dir}"   "${XDG_CONFIG_HOME}/${dir}"
  dir='awesome';         create_symlink "${profile_config_dir}/${dir}"   "${XDG_CONFIG_HOME}/${dir}"
  dir='lazygit';         create_symlink "${profile_config_dir}/${dir}/config.yml"   "${XDG_CONFIG_HOME}/${dir}/config.yml"
  dir='nvim';            create_symlink "${profile_config_dir}/${dir}"   "${XDG_CONFIG_HOME}/${dir}"
  dir='tmux';            create_symlink "${profile_config_dir}/${dir}"   "${XDG_CONFIG_HOME}/${dir}"
}

prepare_directories() {
  mkdir -p \
    "$bin_dir" \
    "$XDG_CONFIG_HOME" \
    "${XDG_CONFIG_HOME}/lazygit" \
    "$profile_dir" \
    "$share_dir"
}

clone_repository() {
  local subdir="$1"
  local repository="$2"
  local install_dir="${share_dir}/${subdir}/${repository##*/}"

  mkdir -p "${share_dir}/${subdir}"
  [ ! -d "$install_dir" ] && git clone "$repository" "$install_dir" || return 0
}

install_nnn_plugins() {
  local repository='https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs'

  sh -c "$(curl -Ls $repository)"
  file='nnn/plugins/preview-tui-custom'; create_symlink "${profile_config_dir}/${file}" "${XDG_CONFIG_HOME}/${file}"
}

#===============================================================================
# Main
#===============================================================================

main() {
  prepare_directories \
  && link_home \
  && link_config \
  && install_nnn_plugins \
  && clone_repository 'zsh'   'https://github.com/Aloxaf/fzf-tab' \
  && clone_repository 'zsh'   'https://github.com/zsh-users/zsh-syntax-highlighting' \
  && clone_repository 'tmux'  'https://github.com/tmux-plugins/tmux-sensible' \
  && printf '%s\n' 'User profile initialized successfully.'
}

#===============================================================================
# Execution
#===============================================================================

if [[ $# -eq 0 ]] ; then
    main
    exit 0
fi

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
