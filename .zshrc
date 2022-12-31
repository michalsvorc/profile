#===============================================================================
# Used for setting interactive shell configuration and executing commands for
# all users, will be read when starting as an interactive shell.
#===============================================================================

#===============================================================================
# Variables
#===============================================================================

readonly shell_config_dir="${HOME}/.local/profile/shell"

#===============================================================================
# Shell configuration scripts
#===============================================================================

source "${shell_config_dir}/history_search.sh"
source "${shell_config_dir}/nnn_quitcd.sh"
source "${shell_config_dir}/ssh_agent.sh"

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
# Alacritty window title bar.
#===============================================================================

source "${shell_config_dir}/vi_mode.sh"

#===============================================================================
# Alacritty terminal emulator
#===============================================================================

source "${shell_config_dir}/alacritty.sh"

#===============================================================================
# Syntax higlighting
#===============================================================================

source "${shell_config_dir}/syntax_hlg.sh"

#===============================================================================
# Shell aliases
#===============================================================================

source "${shell_config_dir}/aliases.sh"
