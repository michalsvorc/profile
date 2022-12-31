#===============================================================================
# This file is sourced on all invocations of the shell, unless
# the -f option is set.
#===============================================================================

export SHELL='/bin/zsh'
export EDITOR='nvim'
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

