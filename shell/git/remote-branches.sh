#!/usr/bin/env bash

#===============================================================================
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md#ripgrep-integration
# 1. Search for text in files using Ripgrep
# 2. Interactively narrow down the list using fzf
# 3. Open the file in Vim
#===============================================================================

git-remote-branches() {
  local format='%(refname:short) %(objectname:short) %(committerdate:iso8601) %(committeremail)'
  local remote_name='refs/remotes/origin/'
  git for-each-ref \
    --sort=-committerdate \
    --format="${format}" \
    "${remote_name}" |
    column -t
}
