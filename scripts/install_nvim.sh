#!/usr/bin/env bash
#
# Application: Neovim
# Description: Vim-fork focused on extensibility and usability.
# Releases: https://github.com/neovim/neovim/releases
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

readonly app_id='nvim'
readonly asset='nvim-linux64.tar.gz'
readonly remote_scripts='https://raw.githubusercontent.com/michalsvorc/scripts/main'

readonly bin_dir="${HOME}/.local/bin"
readonly share_dir="${HOME}/.local/share"

#===============================================================================
# Functions
#===============================================================================

create_symlink() {
  local source="$1"
  local target="$2"

  ln -sfn "$source" "$target"
}

prepare_directories() {
  mkdir -p \
    "$bin_dir" \
    "$share_dir"
}

main() {
  local install_script="${remote_scripts}/apps/${app_id}.sh"
  local install_dir="${share_dir}/${app_id}/bin"
  local extracted_dir=$(printf "$asset" | cut -f1 -d".")

  mkdir -p "$install_dir" \
    && cd "$_" \
    && bash <(curl -Ls "$install_script") --asset "$asset" \
    && tar -xvf "$asset" \
    && rm "$asset" \
    && create_symlink \
      "${install_dir}/${extracted_dir}/bin/${app_id}" \
      "${bin_dir}/${app_id}"
}

#===============================================================================
# Execution
#===============================================================================

prepare_directories \
  && main
