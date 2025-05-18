# <p align="center">🛠️ Grinlex's Dotfiles</p>

<p align="center">
  <a href="https://discord.gg/YqTKmA5qbf">
    <img src="https://img.shields.io/badge/Join-Discord-%235865F2?logo=discord&logoColor=white" alt="Join Discord" />
  </a>
</p>

<p align="center">
  A carefully curated set of configuration files for a Unix-like environment (primarily <strong>Ubuntu</strong>), designed for <strong>convenience</strong> and <strong>productivity</strong>.
</p>

## ✨ Features

### 🔁 Enhanced Bash Tab Completion
Custom `.initrc` configuration for intuitive file navigation:
- <kbd>Tab</kbd>: Cycle forward through directory entries.
- <kbd>Shift + Tab</kbd>: Cycle backward.
- No annoying beeps—just smooth tabbing like in Windows `cmd`.

### 📝 Neovim Setup

A modern Neovim configuration with powerful language tooling and visual polish:

- 🧠 **LSP support** for:
  - C++ → [`clangd`](https://clangd.llvm.org/)
  - Python → [`Ruff`](https://github.com/astral-sh/ruff)
  - Lua → [`lua-language-server`](https://github.com/LuaLS/lua-language-server)
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
| <kbd>Ctrl + j/k</kbd>  | Navigate LSP autocomplete              |
| <kbd>Ctrl + b/f</kbd>  | Scroll LSP autocomplete docs           |
| <kbd>Ctrl + e</kbd>    | Cancel LSP autocomplete                |
| <kbd>Space + rs</kbd>  | Restart LSP                            |
| <kbd>Space + mp</kbd>  | Format file / range                    |
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

---

## 🚀 Installation

### 📦 Requirements:
Before installation, ensure the following tools are installed:

```bash
sudo apt install zoxide bash-completion
```

---

Using [Arch Wiki's dotfile method](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git):

```bash
git clone --bare https://github.com/GrinlexGH/.dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

To update your dotfiles:

```bash
dotfiles checkout -f
```

For a safer update (with backup):

```bash
mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | grep "\s\+\." | awk '{print $1}' | \
xargs -I{} mv {} .dotfiles-backup/{}
```

## 🤝 Contributing

These dotfiles are tailored for my workflow, but feel free to fork, adapt, or suggest improvements. PRs and feedback are always welcome!
