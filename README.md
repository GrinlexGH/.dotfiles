# <p align="center">🛠️ Grinlex's Dotfiles</p>

<p align="center">
  <a href="https://discord.gg/YqTKmA5qbf">
    <img src="https://img.shields.io/badge/Join-Discord-%235865F2?logo=discord&logoColor=white" alt="Join Discord" />
  </a>
</p>

<p align="center">
  This is my dotfiles repository - collection of <strong>the most convenient</strong> configurations <strong>for me</strong>, as far as I could make, for programs and Unix-like environments (primarily for <strong>Ubuntu</strong>).
</p>

## ✨ Features

### 🔁 Enhanced Bash Tab Completion
Custom `.initrc` configuration for intuitive file navigation:
- <kbd>Tab</kbd>: Cycle forward through directory entries.
- <kbd>Shift + Tab</kbd>: Cycle backward.
- No annoying beeps - just smooth tabbing like in Windows `cmd`.

### 📝 Neovim Setup

A modern Neovim configuration with powerful language tooling and visual polish:

- 🧠 **LSP support** for:
  - C++ → [`mason.nvim`](https://github.com/mason-org/mason.nvim) | [`clangd`](https://clangd.llvm.org/)
  - Python → [`mason.nvim`](https://github.com/mason-org/mason.nvim) | [`ruff`](https://github.com/astral-sh/ruff)
  - Lua → [`mason.nvim`](https://github.com/mason-org/mason.nvim) | [`lua_ls`](https://github.com/LuaLS/lua-language-server)
  - Java → [`nvim-java`](https://github.com/nvim-java/nvim-java) | [`jdtls`](https://github.com/eclipse-jdtls/eclipse.jdt.ls)
- 📁 File explorer via [`nvim-tree`](https://github.com/nvim-tree/nvim-tree.lua)
- 🎨 Beautiful theme: [`Carbonfox`](https://github.com/EdenEast/nightfox.nvim#carbonfox)
- ⚙️ Plugin manager: [`lazy.nvim`](https://github.com/folke/lazy.nvim)

#### 🔑 Keybindings (Leader: <kbd>Space</kbd>)

| Keybind                | Action                                 |
|------------------------|----------------------------------------|
| <kbd>Space + s..</kbd> | Window split management                |
| <kbd>Space + t..</kbd> | Tab management                         |
| <kbd>Space + w..</kbd> | Session management                     |
| <kbd>Space + e..</kbd> | File explorer (nvim-tree)              |
| <kbd>Space + nh</kbd>  | Clear search highlights                |
| <kbd>Space + g..</kbd> | LSP actions                            |
| <kbd>Space + d/D</kbd> | Show diagnostics (line / buffer)       |
| <kbd>Space + x..</kbd> | Open diagnostics window (trouble.nvim) |
| <kbd>K</kbd>           | Show hover docs                        |
| <kbd>Ctrl + j/k</kbd>  | Navigate autocomplete                  |
| <kbd>Ctrl + b/f</kbd>  | Scroll autocomplete docs               |
| <kbd>Ctrl + e</kbd>    | Cancel autocomplete                    |
| <kbd>Space + rs</kbd>  | Restart LSP                            |
| <kbd>Space + mp</kbd>  | Format file / range                    |
| <kbd>gc..</kbd>        | Linewise comment                       |
| <kbd>gb..</kbd>        | Blockwise comment                      |
| <kbd>Space + h..</kbd> | Git hunk navigation                    |
| <kbd>Space + lg</kbd>  | Launch LazyGit                         |

---

### 📸 Neovim Preview

<p align="center">
  <img src="https://i.imgur.com/QVYQ09O.png" alt="Neovim Preview 1" />
</p>
<p align="center">
  <img src="https://i.imgur.com/MXZtiff.png" alt="Neovim Preview 2" />
</p>

## 📦 Requirements

Install with:

```bash
# neovim >= 0.11.0
sudo snap install nvim --classic
sudo apt install make clang-tidy g++ unzip python3-venv fzf ripgrep xclip zoxide bash-completion

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
