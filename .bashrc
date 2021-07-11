# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi

#===============================================================================
# Exports
#===============================================================================

# $EDITOR
export EDITOR='/usr/local/bin/nvim'

#===============================================================================
# Command prompt
#===============================================================================

# git-prompt integration
git_prompt_dir=$(
[[ -e '/usr/share/git' ]] \
  && printf '/usr/share/git' \
  || printf "${HOME}/.config/git"
)

if [[ -e "${git_prompt_dir}/git-prompt.sh" ]]; then
  source "${git_prompt_dir}/git-prompt.sh" \
  && export GIT_PS1_SHOWCOLORHINTS=true \
  && export GIT_PS1_SHOWDIRTYSTATE=true \
  && export GIT_PS1_SHOWUNTRACKEDFILES=true \
  && export GIT_PS1_SHOWUPSTREAM="auto"

  PS1='\[\e[33m\]\u@$(date +"%R:%S") \[\e[34m\]\w \[\e[33m\]$(__git_ps1 "(%s) ")\[\e[34m\]\$\[\e[m\] '
else
  PS1='\[\e[33m\]\u@$(date +"%R:%S") \[\e[34m\]\w \[\e[34m\]\$\[\e[m\] '
fi

#===============================================================================
# Aliases
#===============================================================================

# GNU
alias grep='grep --color=always'
alias less='less -r'
alias ll='find -maxdepth 1 -printf "%y %m %n %u %g %T+\t%p %f\n"'
alias ls='ls -alF --color=auto --group-directories-first'
alias sensors='watch -n5 sensors -A'
alias tree='tree --dirsfirst'

# Sudo
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias mount='sudo mount'
alias umount='sudo umount'
alias cryptsetup='sudo cryptsetup'
alias rc-service='sudo rc-service'

# Remap
alias vim=$EDITOR

#===============================================================================
# Ranger file manager integration
#===============================================================================

ranger_plugins_dir=$(
[[ -e '/opt/ranger/plugins' ]] \
  && printf '/opt/ranger/plugins' \
  || printf "${HOME}/.config/ranger/plugins"
)

# Automatically change the directory in bash after closing ranger with ranger-cd
source "${ranger_plugins_dir}/core/shell_automatic_cd.sh" && alias ranger='ranger_cd'

# Change the prompt when you open a shell from inside ranger
source "${ranger_plugins_dir}/core/shell_subshell_notice.sh"
