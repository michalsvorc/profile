#===============================================================================
# This file is sourced on all invocations of the shell, unless
# the -f option is set.
#===============================================================================

case $TERM in
  xterm) TERM=xterm-256color;;
esac

export XDG_CONFIG_HOME="${HOME}/.config"

#===============================================================================
# Shell history configuration
#===============================================================================

export HISTSIZE=10000
export SAVEHIST=10000
export LESSHISTFILE=/dev/null

