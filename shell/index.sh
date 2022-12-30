#===============================================================================
# Shared shell configuration sourced by interactive and login shells
#===============================================================================

shell_config_dir="${HOME}/.local/profile/shell"

source "${shell_config_dir}/term.sh"

source "${shell_config_dir}/history.sh"
source "${shell_config_dir}/plugins/history_search.sh"
source "${shell_config_dir}/plugins/lf.sh"
source "${shell_config_dir}/plugins/nnn_quitcd.sh"
source "${shell_config_dir}/plugins/ssh_agent.sh"

source "${shell_config_dir}/aliases.sh"
