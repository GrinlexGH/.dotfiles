return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        hijack_cursor = true,
        disable_netrw = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
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
    },
    keys = {
        { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
        { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
        { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
        {"<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
    end,
}
