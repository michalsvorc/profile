#!/usr/bin/env bash

script_dir=$(
  cd "$(dirname "${BASH_SOURCE[0]}")" || exit
  pwd -P
)
readonly script_dir
readonly plugins_dir="${script_dir}/../plugins"

#===============================================================================
# Functions
#===============================================================================

download_script() {
  local source="$1"
  local target="$2"

  printf 'Downloading %s\n' "$(basename "$source")"

  curl -JL "$source" -o "$target"
}

#===============================================================================
# Git prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#===============================================================================

source='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
target="${plugins_dir}/git/$(basename $source)"

download_script "$source" "$target"

#===============================================================================
# ohmyzsh vi mode
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh
#===============================================================================

source='https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/vi-mode/vi-mode.plugin.zsh'
target="${plugins_dir}/zsh/$(basename $source)"

download_script "$source" "$target"
