return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.surround").setup()
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
