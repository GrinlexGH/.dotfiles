return {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
        require'mini.surround'.setup({
            mappings = {
                add = "<leader>gsa",
                delete = "<leader>gsd",
                replace = "<leader>gsr"
            }
        })
        require'mini.move'.setup()
        require'mini.icons'.setup()
        require'mini.trailspace'.setup()
        require'mini.basics'.setup({
            mappings = {
                windows = true,
                move_with_alt = true,
            }
        })
        require'mini.bufremove'.setup()
    end,
    keys = {
        {
            "<leader>bd",
            function() require'mini.bufremove'.delete(0, false) end,
            desc = "Close buffer (mini.nvim)",
        }
    }
}
