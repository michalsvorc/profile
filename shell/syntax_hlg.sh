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

