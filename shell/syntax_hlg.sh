#===============================================================================
# Fish shell-like syntax highlighting for Zsh.
#
# Link: https://github.com/zsh-users/zsh-syntax-highlighting
#===============================================================================

file_path='zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

if [[ -f "/usr/local/share/${file_path}" ]]; then
  source "/usr/local/share/${file_path}"
elif [[ -f "/usr/share/${file_path}" ]]; then
  source "/usr/share/${file_path}"
elif [[ -f "/opt/homebrew/opt/zsh-syntax-highlighting/share/${file_path}" ]]; then
  source "/opt/homebrew/opt/zsh-syntax-highlighting/share/${file_path}"
fi

