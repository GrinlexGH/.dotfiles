return {
    "saghen/blink.cmp",
    version = "1.*",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "enter",
            ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },

            ['<M-k>'] = { 'scroll_documentation_up', 'fallback' },
            ['<M-j>'] = { 'scroll_documentation_down', 'fallback' },
        },
        signature = {
            enabled = false,
        },
        completion = {
            accept = {
                auto_brackets = { enabled = true, },
            },
            menu = {
                auto_show = true,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
            }
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
    },
}
