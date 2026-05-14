# <p align="center">🛠️ Grinlex's Dotfiles</p>

<p align="center">
  <a href="https://discord.gg/YqTKmA5qbf">
    <img src="https://img.shields.io/badge/Join-Discord-%235865F2?logo=discord&logoColor=white" alt="Join Discord" />
  </a>
</p>

<p align="center">
  This is my dotfiles repository - collection of <strong>the most convenient</strong> configurations <strong>for me</strong>, as far as I could make, for programs in <strong>Kali linux</strong>.
  <img width="1888" height="1184" alt="Zsh preview" src="https://github.com/user-attachments/assets/0b8ecd41-0189-4739-83c6-c135c176c39e" />
</p>

## ✨️ Differences between main branch

- Removed minecraft server related commands
- Removed konsole & dolphin config
- Added settings from default kali `.zshrc`

## 📦 Requirements

Install with:

```bash
sudo apt install cmake make ninja-build clang-tidy g++ unzip python3-venv fzf ripgrep xclip zoxide bash-completion npm fastfetch lazygit neovim
cargo install --locked tree-sitter-cli
```

## 🚀 Installation

Using [Arch Wiki's dotfile method](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git):

```bash
git clone --bare https://github.com/GrinlexGH/.dotfiles.git -b kali $HOME/.dotfiles

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
