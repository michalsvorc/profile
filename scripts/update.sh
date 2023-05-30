#!/usr/bin/env bash

readonly script_dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
readonly plugins_dir="${script_dir}/../shell/plugins"

#===============================================================================
# Functions
#===============================================================================

construct_target() {
  local source="$1"

  printf '%s' "${plugins_dir}/$(basename $source)"
}

download_script() {
  local source="$1"
  local target="$2"

  printf 'Downloading %s\n' "$(basename $source)"

  curl -JL "$source" -o "$target"
}

#===============================================================================
# Git prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#===============================================================================

source='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
target="${plugins_dir}/$(basename $source)"
target2=$(construct_target "$source")

download_script "$source" "$target"

#===============================================================================
# ohmyzsh vi mode
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh
#===============================================================================

source='https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/vi-mode/vi-mode.plugin.zsh'
target="${plugins_dir}/$(basename $source)"
target2=$(construct_target "$source")

download_script "$source" "$target"
