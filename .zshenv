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
export PATH="${HOME}/.local/bin:${PATH}"
export XDG_CONFIG_HOME="${HOME}/.config"

#===============================================================================
# Terminal
#===============================================================================

case $TERM in
  xterm) TERM=xterm-256color;;
esac

#===============================================================================
# History
#===============================================================================

export HISTSIZE=10000
export SAVEHIST=10000
export LESSHISTFILE=/dev/null

