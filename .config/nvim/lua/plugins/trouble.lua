return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ---@module "trouble"
    ---@type trouble.Config
    opts = { focus = true, },
    cmd = "Trouble",
    keys = {
        { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open workspace diagnostics (trouble)" },
        { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open document diagnostics (trouble)", },
        { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open quickfix list (trouble)" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open location list (trouble)" },
        { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos (trouble)" },
    },
}
