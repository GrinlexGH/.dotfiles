return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    opts = {
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
