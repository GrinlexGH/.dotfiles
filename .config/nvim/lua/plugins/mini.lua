return {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
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
        require'mini.icons'.mock_nvim_web_devicons()
        require'mini.trailspace'.setup()
        require'mini.basics'.setup({
            mappings = {
                windows = true,
                move_with_alt = true
            }
        })
        require'mini.bufremove'.setup()

        -- Disable mini.trailspace in dashboard
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "snacks_dashboard" },
            callback = function(_)
                vim.b.minitrailspace_disable = true
            end
        })
    end,
    keys = {
        {
            "<leader>bd",
            function() require'mini.bufremove'.delete(0, false) end,
            desc = "Close buffer (mini.nvim)",
        }
    }
}
