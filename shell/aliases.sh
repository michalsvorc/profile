#===============================================================================
# Shell aliases
#===============================================================================

alias awsc='aws --cli-auto-prompt'
alias bat='bat --plain'
alias ftp='ncftp'
alias ls='exa --all --git --group --group-directories-first --icons --long --time-style=long-iso'
alias qrdecode='zbarimg'
alias qrencode='qrencode -t ASCIIi'
alias xclip_c='xclip -selection c'
alias temp='cat /sys/class/thermal/thermal_zone*/temp'

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

# OpenRC services
alias docker_start='rc-service docker start'

# Custom
alias ed="$EDITOR"
alias fe='n'
alias mount_as_user='mount -o umask=0022,gid=$(id -g),uid=$(id -u)'
alias npr='npm run'
alias t='tmux -u2'
alias uid='lazydocker'
alias uig='lazygit'
