# /etc/skel/.bash_profile

printf 'Login shell: %s, %s\n' 'started' "$(date)"

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

# Non $DISPLAY environment
if [ -z "${DISPLAY}" ]; then

  printf 'Login shell: %s, %s\n' 'Non $DISPLAY environment' "$(date)"

  # X server initialization for non-root users
  if [ "`tty`" = /dev/tty1 ] && [[ $EUID -ne 0 ]]; then
    startx
  fi
fi;

