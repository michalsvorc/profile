#===============================================================================
# Search and execute command from shell history file
#
# Dependencies: fzf, sed
#===============================================================================

hiss() {
  eval "$(
    history 1 |
      fzf +s --tac |
      sed 's/ *[0-9]* *//'
  )"
}
