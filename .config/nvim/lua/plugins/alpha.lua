return {
    "goolord/alpha-nvim",
    dependencies = {
        "echasnovski/mini.icons",
        "MaximilianLloyd/ascii.nvim",
    },
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = require("ascii").get_random("misc", "hydra")

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New File", "<cmd>ene<CR>"),
            dashboard.button("SPC ee", "  Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("SPC rf", "  Recent files", [[<cmd>Telescope oldfiles<CR>]]),
            dashboard.button("SPC ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC fs", "  Find String", [[<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>"]]),
            dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.config.layout[1].val = 0

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "⚡ Neovim loaded "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
