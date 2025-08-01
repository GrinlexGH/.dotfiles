return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "FelipeLema/cmp-async-path",
        "folke/lazydev.nvim",
        { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<M-j>"] = cmp.mapping.scroll_docs(-4),
                ["<M-k>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "lazydev", group_index = 0, },
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "async_path" },
                { name = "luasnip" },
                { name = "buffer" },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 30,
                    ellipsis_char = "...",
                }),
            },
        })
    end,
}
