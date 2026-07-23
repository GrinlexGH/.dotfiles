return {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.lib" },
    build = function() require'blink.cmp'.build():pwait() end,
    ---@module "blink.cmp"
    ---@type blink.cmp.config
    opts = {
        keymap = {
            preset = "super-tab",

            ["<CR>"] = { "accept", "fallback" },

            ["<C-j>"] = { "select_next" },
            ["<C-k>"] = { "select_prev" },
            ["<M-j>"] = { "scroll_documentation_down" },
            ["<M-k>"] = { "scroll_documentation_up" },

            ["<C-n>"] = { "fallback" },
            ["<C-p>"] = { "fallback" },
            ["<C-f>"] = { "fallback" },
            ["<C-b>"] = { "fallback" }
        },
        completion = {
            accept = { auto_brackets = { enabled = true } },
            menu = { auto_show = true },
            documentation = { auto_show_delay_ms = 0 }
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100
                }
            }
        },
        fuzzy = { implementation = "rust" },
        signature = { enabled = true }
    }
}
