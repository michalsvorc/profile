#!/usr/bin/env bash

readonly script_dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
readonly plugins_dir="${script_dir}/../shell/plugins"

#===============================================================================
# Git prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#===============================================================================

source='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
target="${plugins_dir}/$(basename $source)"
curl -JL "$source" -o "$target"

#===============================================================================
# ohmyzsh vi mode
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh
#===============================================================================

source='https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/vi-mode/vi-mode.plugin.zsh'
target="${plugins_dir}/$(basename $source)"
curl -JL "$source" -o "$target"

#===============================================================================
# nnn quit cd
# https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.bash_zsh
#===============================================================================

source='https://raw.githubusercontent.com/jarun/nnn/master/misc/quitcd/quitcd.bash_zsh'
target="${plugins_dir}/nnn_$(basename $source)"
curl -JL "$source" -o "$target"
