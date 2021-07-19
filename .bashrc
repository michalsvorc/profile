# Bash shell configuration

#===============================================================================
# Source shell partials
#===============================================================================

shell_part_dir="$HOME/.local/profile/.config/shell"

source "$shell_part_dir/test_interactive.sh" # show warning if file is missing
source "$shell_part_dir/exports.sh" 2>/dev/null
source "$shell_part_dir/aliases.sh" 2>/dev/null

#===============================================================================
# Command prompt
#===============================================================================

PS1='\[\e[33m\]\u@$(date +"%R:%S") \[\e[34m\]\w \[\e[33m\]\[\e[34m\]\$\[\e[m\] '

# Git prompt integration
[ -f "$shell_part_dir/git_prompt.sh" ] && source "$shell_part_dir/git_prompt.sh"

#===============================================================================
# Settings
#===============================================================================

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/bash_history

#===============================================================================
# Vi mode
#===============================================================================

set -o vi

