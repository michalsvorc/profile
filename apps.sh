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
# Install applications
#
## LF
# Description: Terminal file manager.
# Link: https://github.com/gokcehan/lf
#===============================================================================

ARG app_repository='https://raw.githubusercontent.com/michalsvorc/scripts/main/apps/lf.sh'

RUN cd "$local_dir_bin" \
  && curl \
    "$app_repository" \
    | bash

#===============================================================================
## Neovim
# Description: Vim-fork focused on extensibility and usability.
# Link: https://github.com/neovim/neovim
#===============================================================================

ARG app_id='nvim'
ARG app_dir="${app_id}_app"
ARG app_repository='https://raw.githubusercontent.com/michalsvorc/scripts/main/apps/nvim.sh'

RUN cd "$local_dir_bin" \
  && mkdir -p "$app_dir" \
  && cd "$app_dir" \
  && curl \
    "$app_repository" \
    | bash \
  && cd .. \
  && ln -s "${app_dir}/squashfs-root/AppRun" "$app_id"

