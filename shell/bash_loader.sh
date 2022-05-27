#===============================================================================
# Read configuration for Bash interactive shell.
#===============================================================================

if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
  fi
fi

