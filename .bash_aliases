# dotfiles git repository
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# minecraft server aliases
if [ -x '/mnt/hdd/minecraft server/start.sh' ]; then
    alias mc-start='/mnt/hdd/minecraft\ server/start.sh'
fi

if [ -x '/mnt/hdd/minecraft server/stop.sh' ]; then
    alias mc-stop='/mnt/hdd/minecraft\ server/stop.sh'
fi

if [ -x '/mnt/hdd/minecraft server/log.sh' ]; then
    alias mc-log='/mnt/hdd/minecraft\ server/log.sh'
fi

if [ -x '/mnt/hdd/minecraft server/rcon.sh' ]; then
    alias mc-rcon='/mnt/hdd/minecraft\ server/rcon.sh'
fi

