#===============================================================================
# Shared shell configuration sourced by interactive and login shells
#===============================================================================

shell_config_dir="${HOME}/.local/profile/shell"

source "${shell_config_dir}/term.sh"
source "${shell_config_dir}/aliases.sh"
source "${shell_config_dir}/bash_loader.sh"
source "${shell_config_dir}/history.sh"
source "${shell_config_dir}/plugins/history_search.sh"
source "${shell_config_dir}/plugins/lf.sh"
source "${shell_config_dir}/plugins/ssh_agent.sh"

