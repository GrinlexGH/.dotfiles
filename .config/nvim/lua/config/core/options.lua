vim.g.netrw_liststyle = 3

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"

opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = {
    space = "·",
    tab = "→ ",
    trail = "•",
    extends = "↪",
    precedes = "↩"
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

-- Use powershell 7 on windows
if vim.uv.os_uname().sysname == "Windows_NT" then
    opt.shell = "pwsh"
    opt.shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    opt.shellquote = ""
    opt.shellxquote = ""
end
