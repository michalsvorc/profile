#!/usr/bin/env bash
#
# Author: Michal Svorc <dev@michalsvorc.com>
# License: MIT license (https://opensource.org/licenses/MIT)

#===============================================================================
# Abort the script on errors and unbound variables
#===============================================================================

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

#===============================================================================
# Variables
#===============================================================================

readonly version='1.3.1'
readonly argv0=${0##*/}

readonly XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
readonly bin_dir="${HOME}/.local/bin"
readonly profile_dir="${HOME}/.local/profile"
readonly profile_config_dir="${profile_dir}/.config"
readonly plugins_dir="${profile_dir}/plugins"

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
  exit "${1:-0}"
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

  if [ -e "$target" ]; then
    printf "Warn: ln: failed to create symbolic link '%s': File already exists. Continue...\n" "$target"
    return 0
  fi

  ln -s "$source" "$target"
}

link_home() {
  file='.editorconfig'
  create_symlink "${profile_dir}/${file}" "${HOME}/${file}"
  file='.gitconfig'
  create_symlink "${profile_dir}/${file}" "${HOME}/${file}"
  file='.tmux.conf'
  create_symlink "${profile_dir}/${file}" "${HOME}/${file}"
  file='.vimrc'
  create_symlink "${profile_dir}/${file}" "${HOME}/${file}"
  file='.zlogout'
  create_symlink "${profile_dir}/${file}" "${HOME}/${file}"
  file='.zshrc'
  create_symlink "${profile_dir}/${file}" "${HOME}/${file}"
  file='.zshenv'
  create_symlink "${profile_dir}/${file}" "${HOME}/${file}"
  file='profile'
  create_symlink "${HOME}/.${file}" "${HOME}/.z${file}"
}

link_config() {
  dir='alacritty'
  create_symlink "${profile_config_dir}/${dir}" "${XDG_CONFIG_HOME}/${dir}"
  dir='awesome'
  create_symlink "${profile_config_dir}/${dir}" "${XDG_CONFIG_HOME}/${dir}"
  dir='lazygit'
  create_symlink "${profile_config_dir}/${dir}/config.yml" "${XDG_CONFIG_HOME}/${dir}/config.yml"
  dir='nvim'
  create_symlink "${profile_config_dir}/${dir}" "${XDG_CONFIG_HOME}/${dir}"
}

create_directories() {
  mkdir -p \
    "$bin_dir" \
    "$XDG_CONFIG_HOME" \
    "${XDG_CONFIG_HOME}/lazygit" \
    "$profile_dir"
}

link_nnn_plugins() {
  mkdir -p "${XDG_CONFIG_HOME}/nnn"

  create_symlink \
    "${plugins_dir}/nnn" \
    "${XDG_CONFIG_HOME}/nnn/plugins"
}

#===============================================================================
# Main
#===============================================================================

main() {
  create_directories &&
    link_home &&
    link_config &&
    link_nnn_plugins &&
    printf '%s\n' 'User profile initialized successfully.'
}

#===============================================================================
# Execution
#===============================================================================

if [ $# -eq 0 ]; then
  main
  exit 0
fi

case "${1:-}" in
-h | --help)
  usage 0
  ;;
-v | --version)
  print_version
  exit 0
  ;;
*)
  die "$(printf 'Unrecognized argument "%s".' "${1#-}")"
  ;;
esac
