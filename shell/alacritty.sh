#===============================================================================
# Alacritty terminal emulator
# Link: https://wiki.gentoo.org/wiki/Alacritty#Zsh
#===============================================================================

if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
then
  # Window title bar
  precmd()
  {
    print -Pn "\e]0;[%L] %~\a"
  }

  preexec()
  {
    echo -en "\e]0;${1}\a"
  }
fi

