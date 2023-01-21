#===============================================================================
# Used for setting interactive shell configuration and executing commands for
# all users, will be read when starting as an interactive shell.
#===============================================================================

#===============================================================================
# Variables
#===============================================================================

shell_dir="${HOME}/.local/profile/shell"
plugins_dir="${shell_dir}/plugins"
share_dir="${HOME}/.local/share"

#===============================================================================
# Shell aliases
#===============================================================================

source "${shell_dir}/aliases.sh"

#===============================================================================
# Command prompt
#===============================================================================

autoload -U colors && colors
export PS1="%{$fg[blue]%}%~%{$reset_color%} $%b "

#===============================================================================
# Git prompt integration
# Link: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#===============================================================================

setopt PROMPT_SUBST
source "${plugins_dir}/git-prompt.sh"

export GIT_PS1_SHOWCOLORHINTS=true \
export GIT_PS1_SHOWDIRTYSTATE=true \
export GIT_PS1_SHOWUNTRACKEDFILES=true \
export GIT_PS1_SHOWUPSTREAM="auto"
export PS1=$PS1'$(__git_ps1 "(%s) ")'

#===============================================================================
# Docker environment prefix in prompt
#===============================================================================

test -f '/.dockerenv' && dockerenv_prefix='D '

export PS1="%{$fg[yellow]%}${dockerenv_prefix:-}%{$reset_color%}$PS1"

#===============================================================================
# History
#===============================================================================

setopt INC_APPEND_HISTORY \
  HIST_IGNORE_SPACE \
  HIST_IGNORE_ALL_DUPS

source "${shell_dir}/history_search.sh"

#===============================================================================
# Completion
#===============================================================================

# Basic auto/tab complete.
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#===============================================================================
# Vi mode
# Link: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
#===============================================================================

source "${plugins_dir}/vi-mode.plugin.zsh"

#===============================================================================
# nnn file explorer
# Link: https://github.com/jarun/nnn/wiki/Basic-use-cases#configure-cd-on-quit
#===============================================================================

source "${plugins_dir}/quitcd.bash_zsh"

#===============================================================================
# SSH agent
# Link: https://wiki.archlinux.org/title/SSH_keys#SSH_agents
#===============================================================================

source "${shell_dir}/ssh_agent.sh"

#===============================================================================
# fzf completion
# Link: https://github.com/Aloxaf/fzf-tab
#===============================================================================

source "${share_dir}/zsh/fzf-tab/fzf-tab.plugin.zsh"

#===============================================================================
# Syntax higlighting
# Must be sourced at the end of the .zshrc file.
# Link: https://github.com/zsh-users/zsh-syntax-highlighting
#===============================================================================

source "${share_dir}/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
