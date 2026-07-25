return {
    "rmagatti/auto-session",
    event = "VimEnter",
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { "~/", "~/repos", "~/Downloads", "/" },
        bypass_save_filetypes = { "netrw", "alpha" },
        post_restore_cmds = {
            function()
                require'neo-tree.command'.execute({ action = "show", reveal = true })
            end
        }
    }
}
