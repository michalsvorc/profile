#===============================================================================
# Shell aliases
#===============================================================================

# Options
alias bat="$CMD_PAGER"
alias xclip-c='xclip -selection c'

# Sudo
alias cryptsetup='sudo cryptsetup'
alias eject='sudo eject'
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

# Use simple editor for sensitive commands
alias pass='EDITOR=$EDITOR_SIMPLE pass'

# Custom
alias e="$EDITOR"
alias g='git'
alias t='tmux -u2'

alias aws_prompt='aws --cli-auto-prompt'
alias fe="nvim -c \"lua require('oil').open()\""
alias ftp='ncftp'
alias gg="git-client"
alias ll="$CMD_LIST_DIR"
alias mount-as-user='mount -o umask=0022,gid=$(id -g),uid=$(id -u)'
alias temp='cat /sys/class/thermal/thermal_zone*/temp'
alias qrdecode='zbarimg'
alias qrencode='qrencode -t ASCIIi'
alias screenshot='import $HOME/tmp/screenshot.png'

# NPM
alias npr='npm run'
alias npi='npm install'

# TypeScript
alias tscheck='npx tsc --noEmit'
