return {
    "lambdalisue/vim-suda",
    event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    init = function()
        vim.g.suda_smart_edit = 1
    end
}
