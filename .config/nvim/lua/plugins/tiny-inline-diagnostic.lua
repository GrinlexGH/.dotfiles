return {
    "rachartier/tiny-inline-diagnostic.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent_bg = true,
        transparent_cursorline = true,
        options = {
            throttle = 0,
            multilines = {
                enabled = true,
                always_show = true,
            },
            enable_on_insert = true,
            enable_in_select = true,
        },
    },
    init = function()
        vim.diagnostic.config({ virtual_text = false })
    end,
}
