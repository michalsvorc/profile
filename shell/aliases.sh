#===============================================================================
# Shell aliases
#===============================================================================

# Options
alias bat='bat --plain'
alias ls='ls -alF'
alias xclip_c='xclip -selection c'

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

# Use simple editor for sensitive commands
alias pass='EDITOR=$EDITOR_SIMPLE pass'

# Custom
alias e="$EDITOR"
alias f='yazi'
alias g='git'
alias t='tmux -u2'

alias aws_prompt='aws --cli-auto-prompt'
alias ftp='ncftp'
alias ll='eza --all --git --group --group-directories-first --icons --long --time-style=long-iso'
alias mount_as_user='mount -o umask=0022,gid=$(id -g),uid=$(id -u)'
alias temp='cat /sys/class/thermal/thermal_zone*/temp'
alias qrdecode='zbarimg'
alias qrencode='qrencode -t ASCIIi'
alias uid='lazydocker'
alias uig='nvim -c "tab Git"'
alias screenshot='import $HOME/tmp/screenshot.png'

## NPM
alias npr='npm run'
alias npi='npm install'
