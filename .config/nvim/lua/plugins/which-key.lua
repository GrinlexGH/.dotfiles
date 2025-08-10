return {
    "folke/which-key.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons",
    },
    event = "VeryLazy",
    opts = { win = { no_overlap = false, }, },
    keys = {
        { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer local keymaps (which-key)", },
    },
}
