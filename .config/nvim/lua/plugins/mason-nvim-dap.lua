return {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    opts = { handlers = {} },
    dependencies = {
        { "mason-org/mason.nvim", opts = { } },
        { "mfussenegger/nvim-dap" }
    },
}
