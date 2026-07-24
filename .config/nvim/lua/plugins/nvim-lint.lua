return {
    "mfussenegger/nvim-lint",
    event = "LspAttach",
    config = function()
        local lint = require'lint'

        lint.linters_by_ft = {
            python = { "ruff" },
            cpp = { "clangtidy" },
            c = { "clangtidy" }
        }

        require'lint'.linters.clangtidy.args = {
            "-p", "build/", "-"
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("lint", { clear = true }),
            callback = function() lint.try_lint() end,
        })
    end,
    keys = {
        { "<leader>gl", function() require'lint'.try_lint() end, desc = "Lint current file (nvim-lint)" },
    },
}
