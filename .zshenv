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
export EDITOR='nvim'
export VISUAL="$EDITOR"

#===============================================================================
# PATH
#===============================================================================

typeset -U PATH path
path=("${HOME}/.local/bin" "$path[@]")
export PATH

#===============================================================================
# XDG base directories
#===============================================================================

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

#===============================================================================
# Terminal
#===============================================================================

case $TERM in
  xterm) TERM=xterm-256color;;
esac

#===============================================================================
# Command prompt
#===============================================================================

autoload -U colors && colors
export PS1="%{$fg[blue]%}%~%{$reset_color%} $%b "

#===============================================================================
# History
#===============================================================================

export HISTFILE="${HOME}/.cache/zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export LESSHISTFILE='/dev/null'

#===============================================================================
# nnn file explorer
# https://github.com/jarun/nnn
#===============================================================================

export NNN_OPTS='aDeHix'
export NNN_PLUG='g:!git diff;l:-!git log;p:preview-tui;x:!chmod +x $nnn'
