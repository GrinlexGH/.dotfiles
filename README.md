# <p align="center">🛠️ Grinlex's Dotfiles</p>

<p align="center">
  <a href="https://discord.gg/YqTKmA5qbf">
    <img src="https://img.shields.io/badge/Join-Discord-%235865F2?logo=discord&logoColor=white" alt="Join Discord" />
  </a>
</p>

<p align="center">
  This is my dotfiles repository - collection of <strong>the most convenient</strong> configurations <strong>for me</strong>, as far as I could make, for programs in <strong>Termux</strong>.
  <img src="https://i.imgur.com/x8lkjcv.jpeg" alt="Zsh Preview" />
</p>

## ✨️ Differences between main branch

- Removed minecraft server related commands
- Clangd now using 5 jobs instead of 12
- Added alias `pdall` = `pd login --user grinlex archlinux`

## 📦 Requirements

Install with:

```bash
pkg upd && pkg upg -y && pkg i cmake make ninja clang unzip python3 fzf ripgrep termux-api zsh zoxide lazygit uv proot-distro fastfetch neovim
```

## 🚀 Installation

Using [Arch Wiki's dotfile method](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git):

```bash
git clone --bare https://github.com/GrinlexGH/.dotfiles.git -b termux $HOME/.dotfiles

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

## 🌐 Useful links

Android SDK for termux:  
Place in `~/Android/Sdk`  
https://github.com/lzhiyong/termux-ndk  
https://github.com/lzhiyong/android-sdk-tools  
or  
https://github.com/HomuHomu833/android-sdk-custom  
https://github.com/HomuHomu833/android-ndk-custom  

Nerd fonts:  
https://www.nerdfonts.com/font-downloads  

Java LSP:  
Unzip into `~/.jdtls`  
https://download.eclipse.org/jdtls/milestones/

Zsh plugins:  
https://github.com/zsh-users/zsh-autosuggestions

