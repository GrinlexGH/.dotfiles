return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
        hijack_cursor = true,
        disable_netrw = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        modified = { enable = true, },
        view = {
            width = "25%",
            number = true,
            relativenumber = true,
        },
        renderer = {
            highlight_git = "icon",
            highlight_diagnostics = "all",
            highlight_modified = "icon",
            indent_markers = {
                enable = true,
            },
            icons = {
                glyphs = {
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                    },
                },
            },
        },
        actions = {
            open_file = {
                window_picker = {
                    enable = false,
                },
            },
        },
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        -- Open in new tab
        -- on_attach = function(bufnr)
        --     local api = require("nvim-tree.api")
        --
        --     local function opts(desc)
        --         return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        --     end
        --
        --     -- Default mappings. Necessary, unless you want to remove/change all of them.
        --     api.config.mappings.default_on_attach(bufnr)
        --
        --     -- Custom mappings
        --     -- Here you can add/change mappings.
        --     vim.keymap.set('n', '<CR>', function() api.node.open.tab_drop(); api.tree.open() end, opts('Open: New Tab'))
        -- end,
    },
    keys = {
        { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
        { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
        { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
        { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
    end,
}
