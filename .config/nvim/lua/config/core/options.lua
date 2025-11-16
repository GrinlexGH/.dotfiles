-- Netrw configuration (Vim's built-in file explorer)
-- Style 3: tree view layout
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbering:
opt.relativenumber = true -- Show relative line numbers (distance to cursor)
opt.number = true         -- Show absolute number for current line

-- Tab and indentation settings:
opt.tabstop = 4       -- Visual width of a tab character
opt.shiftwidth = 4    -- Size of auto-indent operations
opt.expandtab = true  -- Convert tabs to spaces
opt.autoindent = true -- Maintain current indent level on new lines

-- Line wrapping:
opt.wrap = false -- Disable line wrapping (long lines extend beyond screen)

-- Search behavior:
opt.ignorecase = true -- Case-insensitive searching
opt.smartcase = true  -- Case-sensitive if search contains uppercase

-- Visual enhancements:
opt.cursorline = true -- Highlight current line

-- Color settings:
opt.termguicolors = true -- Enable true-color support
opt.background = "dark"  -- Use dark color schemes

-- Interface elements:
opt.signcolumn = "yes" -- Always show sign column (for diagnostics, git, etc)

-- Backspace behavior:
opt.backspace = "indent,eol,start"
-- Allows deleting:
--   indent = indentation
--   eol    = line breaks (merge lines)
--   start  = characters before insertion point

-- Clipboard integration:
opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Window splitting behavior:
opt.splitright = true -- Vertical splits open to the right
opt.splitbelow = true -- Horizontal splits open below

-- Invisible characters visualization:
opt.list = true -- Show invisible characters
opt.listchars = {
    space = "·",    -- Spaces (except trailing)
    tab = "→ ",     -- Tabs (arrow + spaces)
    trail = "•",    -- Trailing spaces (end of line)
    extends = "↪",  -- Line continuation marker (right)
    precedes = "↩", -- Line continuation marker (left)
}

-- Close all terminals before exit
vim.api.nvim_create_autocmd("ExitPre", {
    pattern = "*",
    callback = function(_)
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "terminal" then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end,
})
