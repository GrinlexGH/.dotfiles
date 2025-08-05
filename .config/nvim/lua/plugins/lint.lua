return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "ruff" },
            cpp = { "clangtidy" },
            c = { "clangtidy" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("lint", { clear = true }),
            callback = function() lint.try_lint() end,
        })
    end,
    keys = {
        { "<leader>l", function() require("lint").try_lint() end, desc = "Trigger linting for current file (lint)" },
    },
}
