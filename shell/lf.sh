#===============================================================================
# lf file explorer
#===============================================================================

lf_config_dir="$HOME/.config/lf"

# Icons
source "$lf_config_dir/icons.sh"

# lf command for changing current directory
source "$lf_config_dir/lfcd.sh"
alias lf='lfcd'
