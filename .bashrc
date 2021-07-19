# Bash shell configuration

#===============================================================================
# Source partials
#===============================================================================

shell_part_dir="$HOME/.local/profile/.config/shell"

[ -f "$shell_part_dir/test_interactive.sh" ] && source "$shell_part_dir/test_interactive.sh"

[ -f "$shell_part_dir/exports.sh" ] && source "$shell_part_dir/exports.sh"
[ -f "$shell_part_dir/aliases.sh" ] && source "$shell_part_dir/aliases.sh"

#===============================================================================
# Command prompt
#===============================================================================

PS1='\[\e[33m\]\u@$(date +"%R:%S") \[\e[34m\]\w \[\e[33m\]\[\e[34m\]\$\[\e[m\] '

# Git prompt integration
[ -f "$shell_part_dir/git_prompt.sh" ] && source "$shell_part_dir/git_prompt.sh"

#===============================================================================
# Vi mode
#===============================================================================

set -o vi

