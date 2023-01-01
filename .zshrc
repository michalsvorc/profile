#===============================================================================
# Used for setting interactive shell configuration and executing commands for
# all users, will be read when starting as an interactive shell.
#===============================================================================

#===============================================================================
# Variables
#===============================================================================

readonly shell_dir="${HOME}/.local/profile/shell"
readonly plugins_dir="${shell_dir}/plugins"
readonly share_dir="${HOME}/.local/share"

#===============================================================================
# Shell aliases
#===============================================================================

source "${shell_dir}/aliases.sh"

#===============================================================================
# Git prompt integration
#===============================================================================

setopt PROMPT_SUBST
source "${plugins_dir}/git-prompt.sh"

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
#===============================================================================

source "${plugins_dir}/vi-mode.plugin.zsh"

#===============================================================================
# Alacritty terminal emulator
#===============================================================================

source "${shell_dir}/alacritty.sh"

#===============================================================================
# nnn file explorer
#===============================================================================

source "${plugins_dir}/quitcd.bash_zsh"

#===============================================================================
# SSH agent
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
