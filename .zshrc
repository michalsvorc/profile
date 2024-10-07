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
export EDITOR_SIMPLE='nvim --clean'

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
path=("$HOME/.cargo/bin/" "${path[@]}")
export PATH

#===============================================================================
# Command prompt
#===============================================================================

autoload -U colors && colors
export PS1='%F{blue}%~%f $ '

#===============================================================================
# Virtual environment prompt prefix
#===============================================================================

if [[ -f '/.dockerenv' ]]; then
  VIRTUAL_ENV_PREFIX='%{$fg[yellow]%}V%{$reset_color%} '
  export PS1="${VIRTUAL_ENV_PREFIX}${PS1}"
fi

#===============================================================================
# History
#===============================================================================

setopt INC_APPEND_HISTORY \
  HIST_IGNORE_SPACE \
  HIST_IGNORE_ALL_DUPS

source "${shell_dir}/history_search.sh"

#===============================================================================
# vi mode
# https://github.com/jeffreytse/zsh-vi-mode
#===============================================================================

source "${plugins_dir}/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

#===============================================================================
# SSH agent
# Link: https://wiki.archlinux.org/title/SSH_keys#SSH_agents
#===============================================================================

source "${shell_dir}/ssh_agent.sh"

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

#===============================================================================
# fzf tab completion
# https://github.com/lincheney/fzf-tab-completion
#===============================================================================

source "${plugins_dir}/zsh/fzf-tab-completion/zsh/fzf-zsh-completion.sh"
bindkey '^I' fzf_completion

#===============================================================================
# Syntax higlighting
# Must be sourced at the end of the .zshrc file.
# Link: https://github.com/zsh-users/zsh-syntax-highlighting
#===============================================================================

source "${plugins_dir}/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

#===============================================================================
# Utilities
#===============================================================================

# change directory
source "${shell_dir}/cd/up.sh"

# fzf
source "${shell_dir}/fzf/rg.sh"
source "${shell_dir}/fzf/fd.sh"
source "${shell_dir}/fzf/tab-completion.sh"

# git
source "${shell_dir}/git/remote.sh"
source "${shell_dir}/git/client.sh"
