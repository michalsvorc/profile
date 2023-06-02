#!/usr/bin/env bash

readonly script_dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
readonly plugins_dir="${script_dir}/../plugins"

#===============================================================================
# Functions
#===============================================================================

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
target="${plugins_dir}/git/$(basename $source)"

download_script "$source" "$target"

#===============================================================================
# ohmyzsh vi mode
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh
#===============================================================================

source='https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/vi-mode/vi-mode.plugin.zsh'
target="${plugins_dir}/zsh/$(basename $source)"

download_script "$source" "$target"

#===============================================================================
# nnn quit cd
# https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.bash_sh_zsh
#===============================================================================

source='https://raw.githubusercontent.com/jarun/nnn/master/misc/quitcd/quitcd.bash_sh_zsh'
target="${plugins_dir}/nnn/$(basename $source)"

download_script "$source" "$target"

#===============================================================================
# nnn preview-tui
# https://github.com/jarun/nnn/blob/master/plugins/preview-tui
#===============================================================================

source='https://raw.githubusercontent.com/jarun/nnn/master/plugins/preview-tui'
target="${plugins_dir}/nnn/$(basename $source)"

download_script "$source" "$target"
