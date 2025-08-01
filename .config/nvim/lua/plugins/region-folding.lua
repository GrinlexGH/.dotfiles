return {
    "nicolas-martin/region-folding.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = { region_text = { start = "region", ending = "endregion" }, },
    init = function()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = true
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
    end,
}
