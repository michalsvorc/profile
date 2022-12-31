#===============================================================================
# Used for setting interactive shell configuration and executing commands for
# all users, will be read when starting as an interactive shell.
#===============================================================================

#===============================================================================
# Variables
#===============================================================================

readonly shell_config_dir="${HOME}/.local/profile/shell"

#===============================================================================
# Git prompt integration
#===============================================================================

setopt PROMPT_SUBST
source "${shell_config_dir}/git_prompt.sh"

#===============================================================================
# History
#===============================================================================

setopt INC_APPEND_HISTORY \
  HIST_IGNORE_SPACE \
  HIST_IGNORE_ALL_DUPS

source "${shell_config_dir}/history_search.sh"

#===============================================================================
# Completion
#===============================================================================

# Basic auto/tab complete.
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Replace zsh's default completion selection menu with fzf.
# Link: https://github.com/Aloxaf/fzf-tab
source "${HOME}/.local/share/zsh/fzf-tab/fzf-tab.plugin.zsh"

#===============================================================================
# Vi mode
#===============================================================================

source "${shell_config_dir}/vi_mode.sh"

#===============================================================================
# Alacritty terminal emulator
#===============================================================================

source "${shell_config_dir}/alacritty.sh"

#===============================================================================
# nnn file explorer
#===============================================================================

source "${shell_config_dir}/nnn_quitcd.sh"

#===============================================================================
# SSH agent
#===============================================================================

source "${shell_config_dir}/ssh_agent.sh"

#===============================================================================
# Shell aliases
#===============================================================================

source "${shell_config_dir}/aliases.sh"

#===============================================================================
# Syntax higlighting
# Must be sourced at the end of the .zshrc file.
#===============================================================================

source "${shell_config_dir}/syntax_hlg.sh"
