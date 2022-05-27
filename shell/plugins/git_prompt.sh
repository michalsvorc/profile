#===============================================================================
# Git prompt integration
# Link: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#===============================================================================

source_git_prompt() {
  local script_path=$1

  source $script_path \
    && export GIT_PS1_SHOWCOLORHINTS=true \
    && export GIT_PS1_SHOWDIRTYSTATE=true \
    && export GIT_PS1_SHOWUNTRACKEDFILES=true \
    && export GIT_PS1_SHOWUPSTREAM="auto"

  PS1=$PS1'$(__git_ps1 "(%s) ")'
}

script_path_system='/usr/share/git/git-prompt.sh'
script_path_user="$HOME/.local/share/git/git-prompt.sh"

if [[ -e $script_path_system ]]; then
  source_git_prompt $script_path_system
elif [[ -e $script_path_user ]]; then
  source_git_prompt $script_path_user
fi

