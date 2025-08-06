return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = { "BufReadPost", "BufNewFile" },
    ---@module "ts_context_commentstring"
    ---@type ts_context_commentstring.Config
    opts = {
        enable_autocmd = false,
    },
}
