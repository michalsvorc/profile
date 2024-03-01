#===============================================================================
# Used for setting interactive shell configuration and executing commands for
# all users, will be read when starting as an interactive shell.
#===============================================================================

#===============================================================================
# Variables
#===============================================================================

PROFILE_DIR="${DIR_LOCAL_HOME}/profile"
PLUGINS_DIR="${PROFILE_DIR}/plugins"
SHELL_DIR="${PROFILE_DIR}/shell"

#===============================================================================
# Shell aliases
#===============================================================================

source "${SHELL_DIR}/aliases.sh"

#===============================================================================
# PATH
#===============================================================================

typeset -U PATH path
path=("$DIR_BIN_HOME" "${path[@]}")
export PATH

#===============================================================================
# Command prompt
#===============================================================================

autoload -U colors && colors
export PS1='%{$fg[blue]%}%~%{$reset_color%} $%b '

#===============================================================================
# Git prompt integration
# Link: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#===============================================================================

setopt PROMPT_SUBST
source "${PLUGINS_DIR}/git/git-prompt.sh"

GIT_PROMPT='$(__git_ps1 "(%s) ")'
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export PS1="${PS1}${GIT_PROMPT}"

#===============================================================================
# Docker environment prefix in prompt
#===============================================================================

if [[ -f '/.dockerenv' ]]; then
  DOCKERENV_PROMPT='%{$fg[yellow]%}D %{$reset_color%}'
  export PS1="${DOCKERENV_PROMPT}${PS1}"
fi

#===============================================================================
# History
#===============================================================================

setopt INC_APPEND_HISTORY \
  HIST_IGNORE_SPACE \
  HIST_IGNORE_ALL_DUPS

source "${SHELL_DIR}/history_search.sh"

#===============================================================================
# ohmyzsh vi mode
# Link: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh
#===============================================================================

source "${PLUGINS_DIR}/zsh/vi-mode.plugin.zsh"

#===============================================================================
# SSH agent
# Link: https://wiki.archlinux.org/title/SSH_keys#SSH_agents
#===============================================================================

source "${SHELL_DIR}/ssh_agent.sh"

#===============================================================================
# nnn file explorer
# https://github.com/jarun/nnn
# https://github.com/jarun/nnn/wiki/Usage
#===============================================================================

source "${PLUGINS_DIR}/nnn/quitcd.bash_sh_zsh"

#===============================================================================
# Completions
# You may have to force rebuild zcompdump after adding a completion file:
# $ rm -f ~/.zcompdump; compinit
#===============================================================================
fpath=("${XDG_DATA_HOME}/zsh/site-functions" "${fpath[@]}")

# Basic auto/tab complete.
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Replace default completion selection menu with fzf
# Link: https://github.com/Aloxaf/fzf-tab
source "${PLUGINS_DIR}/zsh/fzf-tab/fzf-tab.plugin.zsh"

#===============================================================================
# Syntax higlighting
# Must be sourced at the end of the .zshrc file.
# Link: https://github.com/zsh-users/zsh-syntax-highlighting
#===============================================================================

source "${PLUGINS_DIR}/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
