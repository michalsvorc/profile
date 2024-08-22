#===============================================================================
# Search and execute command from shell history file
#
# Dependencies: fzf, sed, clipboard
#===============================================================================

hiss() {
  clipboard_command="xclip -selection clipboard"

  # Detect if running on macOS
  if [[ "$(uname)" == "Darwin" ]]; then
    clipboard_command="pbcopy"
  fi

  eval "$(
    history 1 |
      fzf +s --tac \
        --bind="ctrl-c:execute-silent(echo {} | sed 's/ *[0-9]* *//' | tr -d '\n' | $clipboard_command)" \
        --header='CTRL-C to copy to clipboard, ENTER to execute' |
      sed 's/ *[0-9]* *//'
  )"
}
