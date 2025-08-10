# <p align="center">🛠️ Grinlex's Dotfiles</p>

<p align="center">
  <a href="https://discord.gg/YqTKmA5qbf">
    <img src="https://img.shields.io/badge/Join-Discord-%235865F2?logo=discord&logoColor=white" alt="Join Discord" />
  </a>
</p>

<p align="center">
  This is my dotfiles repository - collection of <strong>the most convenient</strong> configurations <strong>for me</strong>, as far as I could make, for programs and Unix-like environments (primarily for <strong>Termux</strong>).
  <img src="https://i.imgur.com/x8lkjcv.jpeg" alt="Zsh Preview" />
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
- `pdall` = `pd login --user grinlex archlinux`
- `alert` = `notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"`
- `mc-start` = `'$_minecraft_server_path/start.sh'` (change `$_minecraft_server_path` in `.zshrc`)
- `mc-stop` = `'$_minecraft_server_path/stop.sh'`
- `mc-log` = `'$_minecraft_server_path/log.sh'`
- `mc-rcon` = `'$_minecraft_server_path/rcon.sh'`

### 🧬 .zshenv Setup
Adds `$HOME/bin` & `$HOME/.local/bin` to `$PATH` if exist.  
Setup spicetify, jdtls, kotlin-lsp, Android SDK & Vulkan SDK if they exist.  
See [.zshenv](./.zshenv)

### 📝 Neovim Setup

A modern Neovim configuration with powerful language tooling and visual polish:

- 🎨 Beautiful theme: [`Carbonfox`](https://github.com/EdenEast/nightfox.nvim#carbonfox)
- ⚙️ Plugin manager: [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- 🔴 Inline showing errors: [`tiny-inline-diagnostic.nvim`](https://github.com/rachartier/tiny-inline-diagnostic.nvim)

#### 🔑 Keybindings (Leader: <kbd>Space</kbd>)

| Keybind                   | Action                                                     |
|---------------------------|------------------------------------------------------------|
| <kbd>Space + s..</kbd>    | Window split management                                    |
| <kbd>Ctrl + arrows</kbd>  | Change split size (mini.basics)                            |
| <kbd>Ctrl + h/j/k/l</kbd> | Split navigation (mini.basics)                             |
| <kbd>Space + t..</kbd>    | Tab management                                             |
| <kbd>Space + e..</kbd>    | File explorer (nvim-tree)                                  |
| <kbd>Space + nh</kbd>     | Clear search highlights                                    |
| <kbd>Space + n</kbd>      | Notifications (snacks)                                     |
| <kbd>Space + g..</kbd>    | LSP actions                                                |
| <kbd>Space + rs</kbd>     | Restart LSP                                                |
| <kbd>Space + d/D</kbd>    | Show diagnostics (line / buffer)                           |
| <kbd>Space + x..</kbd>    | Open diagnostics window (trouble)                          |
| <kbd>P</kbd>              | Toggle diagnostics window preview (trouble)                |
| <kbd>Space + f..</kbd>    | Open search (telescope)                                    |
| <kbd>Ctrl + h/j/k/l</kbd> | Navigate search results (telescope)                        |
| <kbd>Alt + h/j/k/l</kbd>  | Navigate search preview (telescope)                        |
| <kbd>Ctrl + e</kbd>       | Quote text (exact) (telescope)                             |
| <kbd>K</kbd>              | Show hover docs                                            |
| <kbd>Ctrl + Space</kbd>   | Show autocomplete (blink.cmp)                              |
| <kbd>Ctrl + j/k</kbd>     | Navigate autocomplete (blink.cmp)                          |
| <kbd>Alt + j/k</kbd>      | Scroll autocomplete docs (blink.cmp)                       |
| <kbd>Ctrl + e</kbd>       | Cancel autocomplete (blink.cmp)                            |
| <kbd>gc..</kbd>           | Linewise comment (Comment)                                 |
| <kbd>gb..</kbd>           | Blockwise comment (Comment)                                |
| <kbd>Space + h..</kbd>    | Git hunk navigation (gitsigns)                             |
| <kbd>Space + lg</kbd>     | Launch LazyGit (lazygit)                                   |
| <kbd>]/[ + t</kbd>        | Next / previous todo comment (todo-comments)               |
| <kbd>zA</kbd>             | Toggle region comment fold under cursor (region-folding)   |
| <kbd>zR</kbd>             | Open all region comment folds (region-folding)             |
| <kbd>zM</kbd>             | Close all region comment folds (region-folding)            |
| <kbd>Alt + h/j/k/l</kbd>  | Move selection / current line (mini.move)                  |
| <kbd>s + a/r/d</kbd>      | Surround manipulations (mini.surround)                     |

---

### 📸 Neovim Preview

<p align="center">
  <img src="https://i.imgur.com/2MsHPG0.jpeg" alt="Neovim Preview 1" />
</p>
<p align="center">
  <img src="https://i.imgur.com/nI7EzWr.jpeg" alt="Neovim Preview 2" />
</p>

## 📦 Requirements

Install with:

```bash
pkg upd && pkg upg -y && pkg i cmake make clang unzip python3 fzf ripgrep termux-api zsh zoxide lazygit uv proot-distro neofetch neovim
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
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

To update the dotfiles later:

```bash
dotfiles pull
```

## 🤝 Contributing

These dotfiles are tailored for my workflow, but feel free to fork, adapt, or suggest improvements. PRs and feedback are always welcome!

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

```
      \    /\
       )  ( ')
      (  /  )
       \(__)|
```
