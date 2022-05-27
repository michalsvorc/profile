# Zsh configuration

#===============================================================================
# Variables
#===============================================================================

shell_config_dir="${HOME}/.local/profile/shell"

#===============================================================================
# Shared shell configuration
#===============================================================================

source "${shell_config_dir}/index.sh"

#===============================================================================
# Colors
#===============================================================================

autoload -U colors && colors

#===============================================================================
# Command prompt
#===============================================================================

PS1="%{$fg[blue]%}%~%{$reset_color%} $%b "

# Git prompt integration.
setopt PROMPT_SUBST
source "${shell_config_dir}/plugins/git_prompt.sh"

#===============================================================================
# History
#===============================================================================

HISTFILE=~/.cache/zsh_history
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
source "$HOME/.local/share/zsh/fzf-tab/fzf-tab.plugin.zsh"

#===============================================================================
# Vi mode
#===============================================================================

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu.
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere).
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e.
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

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
