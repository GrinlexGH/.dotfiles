return {
    "rmagatti/auto-session",
    lazy = false,
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { "~/", "~/Downloads", "/" },
        args_allow_files_auto_save = function()
            local supported = 0

            local tabpages = vim.api.nvim_list_tabpages()
            for _, tabpage in ipairs(tabpages) do
                local windows = vim.api.nvim_tabpage_list_wins(tabpage)
                for _, window in ipairs(windows) do
                    local buffer = vim.api.nvim_win_get_buf(window)
                    local file_name = vim.api.nvim_buf_get_name(buffer)
                    if vim.fn.filereadable(file_name) ~= 0 then
                        supported = supported + 1
                    end
                end
            end

            -- If we have 2 or more windows with supported buffers, save the session
            return supported >= 2
        end,
        bypass_save_filetypes = { "netrw", "alpha", },
        post_restore_cmds = {
            function()
                -- Restore nvim-tree after a session is restored
                local nvim_tree_api = require("nvim-tree.api")
                nvim_tree_api.tree.open()
                nvim_tree_api.tree.change_root(vim.fn.getcwd())
                nvim_tree_api.tree.reload()
            end,
        },
        save_extra_cmds = {
            function()
                local qflist = vim.fn.getqflist()
                -- return nil to clear any old qflist
                if #qflist == 0 then
                    return nil
                end
                local qfinfo = vim.fn.getqflist { title = 1 }

                for _, entry in ipairs(qflist) do
                    -- use filename instead of bufnr so it can be reloaded
                    entry.filename = vim.api.nvim_buf_get_name(entry.bufnr)
                    entry.bufnr = nil
                end

                local setqflist = "call setqflist(" .. vim.fn.string(qflist) .. ")"
                local setqfinfo = 'call setqflist([], "a", ' .. vim.fn.string(qfinfo) .. ")"
                return { setqflist, setqfinfo, "copen" }
            end,
        },
    },
    init = function()
        vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,
}
