#===============================================================================
# Git prompt integration
#
# Link: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# Dependencies: git
#===============================================================================

#===============================================================================
# Variables
#===============================================================================

readonly script_name='git-prompt.sh'
readonly script_path_system="/usr/share/git/${script_name}"
readonly script_path_user="${HOME}/.local/share/git/${script_name}"

#===============================================================================
# Execution
#===============================================================================

if [[ -e "$script_path_system" ]]; then
  script_path="$script_path_system"
elif [[ -e "$script_path_user" ]]; then
  script_path="$script_path_user"
fi

source $script_path \
  && export GIT_PS1_SHOWCOLORHINTS=true \
  && export GIT_PS1_SHOWDIRTYSTATE=true \
  && export GIT_PS1_SHOWUNTRACKEDFILES=true \
  && export GIT_PS1_SHOWUPSTREAM="auto"

PS1=$PS1'$(__git_ps1 "(%s) ")'
