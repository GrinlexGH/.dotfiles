return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ---@module "trouble"
    ---@type trouble.Config
    opts = { focus = true, },
    cmd = "Trouble",
    keys = {
        { "<leader>fD", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open workspace diagnostics (trouble.nvim)" },
    }
}
