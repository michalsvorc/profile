# Shared shell profile sourced by interactive and login shells

#===============================================================================
# Shell partials
#===============================================================================

shell_partials_dir="${HOME}/.local/profile/shell"

source "${shell_partials_dir}/term.sh"
source "${shell_partials_dir}/aliases.sh"
source "${shell_partials_dir}/history_search.sh"
source "${shell_partials_dir}/lf.sh"

#===============================================================================
# Settings
#===============================================================================

# History
HISTSIZE=10000
SAVEHIST=10000
export LESSHISTFILE=/dev/null

#===============================================================================
# Bash
#===============================================================================

# Read configuration for Bash interactive shell
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
  fi
fi
