# dotfiles git repository
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# minecraft server aliases
service_exists() {
    local n=$1
    if [[ $(systemctl list-units --all -t service --full --no-legend "$n.service" | sed 's/^\s*//g' | cut -f1 -d' ') == $n.service ]]; then
        return 0
    else
        return 1
    fi
}

if service_exists minecraft-server; then
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
fi

