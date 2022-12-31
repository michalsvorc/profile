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
# Alacritty window title bar.
# Link: https://wiki.gentoo.org/wiki/Alacritty#Zsh
#===============================================================================

if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
then
  precmd()
  {
    print -Pn "\e]0;[%L] %~\a"
  }

  preexec()
  {
    echo -en "\e]0;${1}\a"
  }
fi

#===============================================================================
# Fish shell-like syntax highlighting for Zsh. zsh-syntax-highlighting.zsh must
# be sourced at the end of the .zshrc file.
# Link: https://github.com/zsh-users/zsh-syntax-highlighting
#===============================================================================

zsh_syntax_highlighting='zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

if [[ -f "/usr/local/share/${zsh_syntax_highlighting}" ]]; then
  source "/usr/local/share/${zsh_syntax_highlighting}"
elif [[ -f "/usr/share/${zsh_syntax_highlighting}" ]]; then
  source "/usr/share/${zsh_syntax_highlighting}"
elif [[ -f "/opt/homebrew/opt/zsh-syntax-highlighting/share/${zsh_syntax_highlighting}" ]]; then
  source "/opt/homebrew/opt/zsh-syntax-highlighting/share/${zsh_syntax_highlighting}"
fi

#===============================================================================
# Shell aliases
#===============================================================================

source "${shell_config_dir}/aliases.sh"
