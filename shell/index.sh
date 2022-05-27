#===============================================================================
# Shared shell configuration sourced by interactive and login shells
#===============================================================================

shell_partials_dir="${HOME}/.local/profile/shell"
source "${shell_partials_dir}/term.sh"

source "${shell_partials_dir}/aliases.sh"
source "${shell_partials_dir}/bash_loader.sh"
source "${shell_partials_dir}/history.sh"
source "${shell_partials_dir}/history_search.sh"
source "${shell_partials_dir}/lf.sh"
source "${shell_partials_dir}/ssh_agent.sh"

