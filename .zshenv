#===============================================================================
# This file is sourced on all invocations of the shell.
# If the -f flag is present or if the NO_RCS option is
# set within this file, all other initialization files
# are skipped.
#
# This file should contain commands to set the command
# search path, plus other important environment variables.
# This file should not contain commands that produce
# output or assume the shell is attached to a tty.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#
#=============================================================

export SHELL='/bin/zsh'
export MANPAGER="sh -c 'col -b | bat -l man -p'"

#===============================================================================
# XDG base directories
# https://wiki.archlinux.org/title/XDG_Base_Directory
#===============================================================================

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

#===============================================================================
# Custom $HOME directories
#===============================================================================

export DIR_BIN_HOME="${HOME}/.local/bin"
export DIR_LOCAL_HOME="${HOME}/.local"

#===============================================================================
# Terminal
#===============================================================================

case $TERM in
  xterm) TERM=xterm-256color;;
esac

#===============================================================================
# History
#===============================================================================

export HISTFILE="${XDG_CACHE_HOME}/zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export LESSHISTFILE='/dev/null'

#===============================================================================
# Directory bookmarks
#===============================================================================

export B_PROFILE="${HOME}/.local/profile"
export B_CONFIG="$XDG_CONFIG_HOME"
export B_CONFIG_NVIM="${XDG_CONFIG_HOME}/nvim"

#===============================================================================
# Default commands
#===============================================================================

export CMD_LIST_DIR='eza --all --git --group --group-directories-first --icons --long --time-style=long-iso --color=always'
export CMD_PAGER='bat --plain --color=always'

#===============================================================================
# fzf
#===============================================================================

# Command to run when fzf is executed without any arguments
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--multi'
