#===============================================================================
# Git prompt integration
# Link: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#===============================================================================

# git-prompt integration
git_prompt_dir=$(
[[ -e '/usr/share/git' ]] \
  && printf '/usr/share/git' \
  || printf "$HOME/.local/share/git"
)

if [[ -e "${git_prompt_dir}/git-prompt.sh" ]]; then
  source "${git_prompt_dir}/git-prompt.sh" \
  && export GIT_PS1_SHOWCOLORHINTS=true \
  && export GIT_PS1_SHOWDIRTYSTATE=true \
  && export GIT_PS1_SHOWUNTRACKEDFILES=true \
  && export GIT_PS1_SHOWUPSTREAM="auto"

  PS1=$PS1'$(__git_ps1 "(%s) ")'
fi

