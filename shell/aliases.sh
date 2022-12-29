#===============================================================================
# Shell aliases
#===============================================================================

# GNU
alias edit="$EDITOR"
alias grep='grep --color=always'
alias mount_uid='mount -o umask=0022,gid=$(id -g),uid=$(id -u)'
alias less='less -r'
alias ls='exa --all --git --group --group-directories-first --icons --long --time-style=long-iso'

# Sudo
alias cryptsetup='sudo cryptsetup'
alias make='sudo make'
alias mount='sudo mount'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias umount='sudo umount'

## Gentoo sudo
alias dispatch-conf='sudo dispatch-conf'
alias efibootmgr='sudo efibootmgr'
alias emaint='sudo emaint'
alias emerge='sudo emerge'
alias eselect='sudo eselect'
alias rc-service='sudo rc-service'

# Custom
alias awsc='aws --cli-auto-prompt'
alias docker-ui='lazydocker'
alias git-ui='lazygit'
alias explore='nnn_quitcd -e'
alias qrencode='qrencode -t ASCIIi'
