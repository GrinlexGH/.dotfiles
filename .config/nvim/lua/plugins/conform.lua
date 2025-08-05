return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            yaml = { "prettier" },
            markdown = { "prettier" },
            lua = { "stylua" },
            python = { "isort", "black" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
        formatters = {
            stylua = {
                prepend_args = {
                    "--indent-type", "Spaces",
                    "--indent-width", "4",
                    "--collapse-simple-statement", "Always"
                },
            },
        }
    },
    keys = {
        {
            "<leader>gf",
            function() require("conform").format({ lsp_format = "fallback", }) end,
            desc = "Format file or range (conform)",
            mode = { "n", "v" },
        },
    },
}
