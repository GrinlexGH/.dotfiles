return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        filesystem = {
            filtered_items = { visible = true }
        },
        window = {
            width = 38 -- Don't forget to change it in edgy.nvim config too
        }
    },
    keys = {
        { "<leader>e", "<cmd>Neotree toggle reveal<cr>", desc = "File explorer (neo-tree.nvim)" }
    }
}
