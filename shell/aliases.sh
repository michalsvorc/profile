#===============================================================================
# Shell aliases
#===============================================================================

# GNU
alias grep='grep --color=always'
alias less='less -r'
alias ll='find -maxdepth 1 -printf "%y %m %n %u %g %T+\t%p %f\n"'
alias ls='ls -alF --color=auto --group-directories-first'
alias sensors='watch -n5 sensors -A'
alias tree='tree --dirsfirst'

# Sudo
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias mount='sudo mount'
alias umount='sudo umount'
alias cryptsetup='sudo cryptsetup'
alias rc-service='sudo rc-service'

# Shortcuts
alias e=$EDITOR

