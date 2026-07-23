return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        filesystem = {
            filtered_items = { visible = true }
        },
        window = {
            width = 30 -- Don't forget to change it in edgy.nvim config too
        }
    },
    keys = {
        { "<leader>e", "<Cmd>Neotree toggle reveal<CR>", desc = "File explorer (neo-tree.nvim)", },
    }
}
