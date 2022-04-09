#===============================================================================
# Shell aliases
#===============================================================================

# GNU
alias grep='grep --color=always'
alias less='less -r'
alias ls='exa --all --git --group --group-directories-first --icons --long --time-style=long-iso'

# Sudo
alias cryptsetup='sudo cryptsetup'
alias make='sudo make'
alias mount='sudo mount'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias umount='sudo umount'

# Sudo for Gentoo system commands
alias dispatch-conf='sudo dispatch-conf'
alias efibootmgr='sudo efibootmgr'
alias emaint='sudo emaint'
alias emerge='sudo emerge'
alias eselect='sudo eselect'
alias rc-service='sudo rc-service'

# AWS
alias awsc='aws --cli-auto-prompt'

# Other
alias tmux='tmux -2u'

# Shortcuts
alias edit="$EDITOR"

