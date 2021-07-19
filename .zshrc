# ZSH shell configuration
# Inspired by https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/

#===============================================================================
# Source shell partials
#===============================================================================
shell_part_dir="$HOME/.local/profile/.config/shell"

[ -f "$shell_part_dir/test_interactive.sh" ] \
  && source "$shell_part_dir/test_interactive.sh"

[ -f "$shell_part_dir/exports.sh" ] && source "$shell_part_dir/exports.sh"
[ -f "$shell_part_dir/aliases.sh" ] && source "$shell_part_dir/aliases.sh"

#===============================================================================
# Colors
#===============================================================================

autoload -U colors && colors

#===============================================================================
# Command prompt
#===============================================================================

PS1="%{$fg[yellow]%}%n@$(date +"%R:%S") %{$fg[blue]%}%~%{$reset_color%}$%b "

# Git prompt integration
setopt PROMPT_SUBST
[ -f "$shell_part_dir/git_prompt.sh" ] && source "$shell_part_dir/git_prompt.sh"

#===============================================================================
# Settings
#===============================================================================

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#===============================================================================
# Completion
#===============================================================================

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#===============================================================================
# Vi mode
#===============================================================================

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
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
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#===============================================================================
# zsh-syntax-highlighting
# Highlighting should be sourced at the end.
#===============================================================================

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

