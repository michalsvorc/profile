#===============================================================================
# Shared shell configuration sourced by interactive and login shells
#===============================================================================

shell_config_dir="${HOME}/.local/profile/shell"

source "${shell_config_dir}/history_search.sh"
source "${shell_config_dir}/lf.sh"
source "${shell_config_dir}/nnn_quitcd.sh"
source "${shell_config_dir}/ssh_agent.sh"

source "${shell_config_dir}/aliases.sh"
