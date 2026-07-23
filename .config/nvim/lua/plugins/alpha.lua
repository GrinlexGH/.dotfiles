return {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    event = "VimEnter",
    config = function()
        local dashboard = require'alpha.themes.dashboard'

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New File", [[<cmd>ene<CR>]]),
            dashboard.button("SPC e", "  Toggle file explorer", [[<cmd>Neotree toggle reveal<CR>]]),
            dashboard.button("SPC rf", "  Recent files", [[<cmd>Telescope oldfiles<CR>]]),
            dashboard.button("SPC ff", "󰱼  Find File", [[<cmd>Telescope find_files<CR>]]),
            dashboard.button("SPC fs", "  Find String", [[<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>"]]),
            dashboard.button("q", "  Quit NVIM", [[<cmd>qa<CR>]])
        }

        require'alpha'.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "Neovim loaded "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end
        })
    end
}
