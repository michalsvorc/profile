#===============================================================================
# Used for setting interactive shell configuration and executing commands for
# all users, will be read when starting as an interactive shell.
#===============================================================================

#===============================================================================
# Editor
#===============================================================================

# Keep in .zshrc to override default system editor
export EDITOR='nvim'
export VISUAL="$EDITOR"

#===============================================================================
# Variables
#===============================================================================

profile_dir="${DIR_LOCAL_HOME}/profile"
plugins_dir="${profile_dir}/plugins"
shell_dir="${profile_dir}/shell"

#===============================================================================
# Shell aliases
#===============================================================================

source "${shell_dir}/aliases.sh"

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
source "${plugins_dir}/git/git-prompt.sh"

GIT_PROMPT='$(__git_ps1 "(%s) ")'
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export PS1="${PS1}${GIT_PROMPT}"

#===============================================================================
# Container environment prefix in prompt
#===============================================================================

if [[ -f '/.dockerenv' ]]; then
  CONTAINER_ENV_PROMPT='%{$fg[yellow]%}C %{$reset_color%}'
  export PS1="${CONTAINER_ENV_PROMPT}${PS1}"
fi

#===============================================================================
# History
#===============================================================================

setopt INC_APPEND_HISTORY \
  HIST_IGNORE_SPACE \
  HIST_IGNORE_ALL_DUPS

source "${shell_dir}/history_search.sh"

#===============================================================================
# ohmyzsh vi mode
# Link: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh
#===============================================================================

source "${plugins_dir}/zsh/vi-mode.plugin.zsh"

#===============================================================================
# SSH agent
# Link: https://wiki.archlinux.org/title/SSH_keys#SSH_agents
#===============================================================================

source "${shell_dir}/ssh_agent.sh"

#===============================================================================
# Change directory functions
#===============================================================================

source "${shell_dir}/cd/ancestor.sh"
source "${shell_dir}/cd/up.sh"

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
source "${plugins_dir}/zsh/fzf-tab/fzf-tab.plugin.zsh"

#===============================================================================
# Syntax higlighting
# Must be sourced at the end of the .zshrc file.
# Link: https://github.com/zsh-users/zsh-syntax-highlighting
#===============================================================================

source "${plugins_dir}/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
