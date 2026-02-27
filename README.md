# <p align="center">🛠️ Grinlex's Dotfiles</p>

<p align="center">
  <a href="https://discord.gg/YqTKmA5qbf">
    <img src="https://img.shields.io/badge/Join-Discord-%235865F2?logo=discord&logoColor=white" alt="Join Discord" />
  </a>
</p>

<p align="center">
  This is my dotfiles repository - collection of <strong>the most convenient</strong> configurations <strong>for me</strong>, as far as I could make, for programs and Unix-like environments.
  <img src="https://i.imgur.com/1r3XDdr.png" alt="Zsh Preview" />
</p>

## ✨ Features

### 🔁 Enhanced Zsh Config
- Delete word on <kbd>Ctrl + delete / backspace</kbd>
- Convenient and beautiful `bira` theme
- Command completion via `zsh-autosuggestions`
- Alias completion
- Zoxide & uv setup

### 🔗 Shell aliases
- `dotfiles` = `git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"`
- `mc-{start,stop,log,rcon}` = `$MINECRAFT_SERVER_DIR/{start,stop,log,rcon}.sh`

### 🧬 .zshenv Setup
Adds `$HOME/bin` & `$HOME/.local/bin` to `$PATH` if exist.  
Setup spicetify, jdtls, kotlin-lsp, Android SDK, Vulkan SDK and many other programs if they exist.  
See [.zshenv](./.zshenv)

### 📝 Neovim Setup

A modern Neovim configuration with powerful language tooling and visual polish:

- 🎨 Beautiful theme: [`Carbonfox`](https://github.com/EdenEast/nightfox.nvim#carbonfox)
- ⚙️ Plugin manager: [`lazy.nvim`](https://github.com/folke/lazy.nvim)

#### 🔑 Keybindings (Leader: <kbd>Space</kbd>)

| Keybind                    | Action                                                     |
|----------------------------|------------------------------------------------------------|
| <kbd>leader + s..</kbd>    | Window split management                                    |
| <kbd>Ctrl + arrows</kbd>   | Change split size (mini.basics)                            |
| <kbd>Ctrl + h/j/k/l</kbd>  | Split navigation (mini.basics)                             |
| <kbd>leader + t..</kbd>    | Tab management                                             |
| <kbd>leader + e..</kbd>    | File explorer (nvim-tree)                                  |
| <kbd>leader + nh</kbd>     | Clear search highlights                                    |
| <kbd>leader + n</kbd>      | Notifications (snacks)                                     |
| <kbd>leader + g..</kbd>    | Code actions (native + mini.surround)                      |
| <kbd>leader + rs</kbd>     | Restart LSP                                                |
| <kbd>leader + d/D</kbd>    | Show diagnostics (line / buffer)                           |
| <kbd>leader + x..</kbd>    | Open diagnostics window (trouble)                          |
| <kbd>P</kbd>               | Toggle diagnostics window preview (trouble)                |
| <kbd>leader + f..</kbd>    | Open search (telescope)                                    |
| <kbd>Ctrl + h/j/k/l</kbd>  | Navigate search results (telescope)                        |
| <kbd>Alt + h/j/k/l</kbd>   | Navigate search preview (telescope)                        |
| <kbd>Ctrl + e</kbd>        | Quote text (exact) (telescope)                             |
| <kbd>K</kbd>               | Show hover docs                                            |
| <kbd>Ctrl + Space</kbd>    | Show autocomplete (blink.cmp)                              |
| <kbd>Ctrl + j/k</kbd>      | Navigate autocomplete (blink.cmp)                          |
| <kbd>Alt + j/k</kbd>       | Scroll autocomplete docs (blink.cmp)                       |
| <kbd>Ctrl + e</kbd>        | Cancel autocomplete (blink.cmp)                            |
| <kbd>gc..</kbd>            | Linewise comment (Comment)                                 |
| <kbd>gb..</kbd>            | Blockwise comment (Comment)                                |
| <kbd>leader + h..</kbd>    | Git hunk navigation (gitsigns)                             |
| <kbd>leader + lg</kbd>     | Launch LazyGit (lazygit)                                   |
| <kbd>]/[ + t</kbd>         | Next / previous todo comment (todo-comments)               |
| <kbd>zA</kbd>              | Toggle region comment fold under cursor (region-folding)   |
| <kbd>zR</kbd>              | Open all region comment folds (region-folding)             |
| <kbd>zM</kbd>              | Close all region comment folds (region-folding)            |
| <kbd>Alt + h/j/k/l</kbd>   | Move selection / current line (mini.move)                  |
| <kbd>s [+..]</kbd>         | Substitute (substitute)                                    |
| <kbd>Alt + i</kbd>         | Toggle terminal (FTerm)                                    |

---

### 📸 Neovim Preview

<p align="center">
  <img src="https://i.imgur.com/aoflPRr.png" alt="Neovim Preview 1" />
</p>
<p align="center">
  <img src="https://i.imgur.com/3BHb0hE.png" alt="Neovim Preview 2" />
</p>

## 📦 Requirements

Install with:

```bash
sudo pacman -S cmake make clang unzip python3 fzf ripgrep zsh zoxide lazygit uv fastfetch neovim
cargo install --locked tree-sitter-cli
```

```bash
# For the latest version of nvim
sudo snap install nvim --classic
sudo apt install cmake make clang-tidy g++ unzip python3-venv fzf ripgrep xclip zoxide bash-completion npm fastfetch
cargo install --locked tree-sitter-cli

## lazy git for Ubuntu 25.04 and earlier
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm -rf ./lazygit ./lazygit.tar.gz

## lazy git for Ubuntu 25.10 and later
sudo apt install lazygit
```

## 🚀 Installation

Using [Arch Wiki's dotfile method](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git):

```bash
git clone --bare https://github.com/GrinlexGH/.dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

If you get error like:

```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

You can backup these files and try again:

```bash
mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | grep -E "^\s" | awk '{print $1}' | \
while read file; do
    mkdir -p ".dotfiles-backup/$(dirname "$file")"
    mv "$file" ".dotfiles-backup/$file"
done

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

To update the dotfiles later:

```bash
dotfiles pull
```

## 🌐 Useful stuff

Nerd fonts:  
https://www.nerdfonts.com/font-downloads  

Zsh plugins:  
https://github.com/zsh-users/zsh-autosuggestions

Fix self-hosted servers when VPN is on:
```bash
if ! grep -q "direct_lan" /etc/iproute2/rt_tables; then
  echo "200 direct_lan" | sudo tee -a /etc/iproute2/rt_tables
fi

sudo tee /etc/NetworkManager/dispatcher.d/99-nginx-routing << 'EOF'
#!/bin/bash

INTERFACE=$1
ACTION=$2

if [[ "$INTERFACE" =~ ^(tun|wg|utun|ppp) ]]; then
    exit 0
fi

case "$ACTION" in
    up)
        LAN_IP=$(ip -4 addr show "$INTERFACE" | awk '/inet / {print $2}' | cut -d/ -f1)
        LAN_NET=$(ip route show dev "$INTERFACE" | grep -v default | grep "scope link" | awk '{print $1}' | head -n1)
        GATEWAY=$(ip route show dev "$INTERFACE" | awk '/default via/ {print $3}' | head -n1)

        TABLE_ID="200"

        if [ -n "$LAN_IP" ] && [ -n "$LAN_NET" ] && [ -n "$GATEWAY" ]; then
            ip route add $LAN_NET dev $INTERFACE scope link table $TABLE_ID 2>/dev/null
            ip route add default via $GATEWAY dev $INTERFACE table $TABLE_ID 2>/dev/null
            ip rule del from $LAN_IP table $TABLE_ID 2>/dev/null
            ip rule add from $LAN_IP table $TABLE_ID priority 0 2>/dev/null
        fi
        ;;
    down)
        ip rule del table 200 2>/dev/null
        ip route flush table 200 2>/dev/null
        ;;
esac
EOF

sudo chmod +x /etc/NetworkManager/dispatcher.d/99-nginx-routing
```
