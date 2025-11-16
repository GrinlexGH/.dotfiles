return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.surround").setup({
            mappings = {
                add = "<leader>gsa",
                delete = "<leader>gsd",
                find = "<leader>gsf",
                find_left = "<leader>gsF",
                highlight = "<leader>gsh",
                replace = "<leader>gsr",
                update_n_lines = "<leader>gsn",
            }
        })
        require("mini.move").setup()
        require("mini.icons").setup()
        require("mini.trailspace").setup()
        require("mini.basics").setup({
            mappings = {
                windows = true,
                move_with_alt = true,
            },
        })

    end,
}
