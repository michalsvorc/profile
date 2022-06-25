#!/usr/bin/env bash
#
# Application: Neovim
# Description: Application install script.
# Releases: https://github.com/neovim/neovim/releases
#
# Dependencies: curl, jq
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

readonly repository_id='neovim/neovim'
readonly tag_name='nightly'
readonly target_system='nvim-linux64'
readonly asset="${target_system}.tar.gz"
readonly local_dir="${HOME}/.local"
readonly executable_dir="${local_dir}/bin"
readonly repository_uri="https://api.github.com/repos/${repository_id}/releases"

#===============================================================================
# Functions
#===============================================================================

get_release_metadata() {
  printf '%s' $(\
    jq -r ".[] | select(.tag_name==\"${tag_name}\")" \
    <<< $(curl "$repository_uri")  \
  )
}

parse_download_uri() {
  local release_metadata="$1"

  printf '%s' $(\
    jq -r ".assets \
    | map(select(.name==\"${asset}\"))[0] \
    | .browser_download_url" \
    <<< "$release_metadata"  \
  )
}

#===============================================================================
# Execution
#===============================================================================

release_metadata=$(get_release_metadata)
download_uri=$(parse_download_uri "$release_metadata")

mkdir -p "$executable_dir" \
  && cd "$local_dir" \
  && curl -Lo "$asset" "$download_uri" \
  && tar -xvf "$asset" -C . \
  && rm "$asset" \
  && cd "$executable_dir" \
  && ln -sf "${local_dir}/${target_system}/bin/nvim" 'nvim'

