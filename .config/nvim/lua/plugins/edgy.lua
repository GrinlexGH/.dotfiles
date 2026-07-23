return {
    "folke/edgy.nvim",
    lazy = false,
    opts = {
        left = {
            {
                title = "Neo-Tree",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "filesystem"
                end,
                pinned = true,
                open = "Neotree show filesystem left",
                size = { width = 30 }
            }
        },

        right = {
            { ft = "dapui_scopes", title = "Scopes", size = { width = 38 } },
            { ft = "dapui_breakpoints", title = "Breakpoints" },
            { ft = "dapui_stacks", title = "Stacks" },
            { ft = "dapui_watches", title = "Watches" }
        },

        bottom = {
            { ft = "dap-repl", title = "DAP REPL", size = { height = 10 } },
            { ft = "dapui_console", title = "DAP Console", size = { height = 10 } },
            { ft = "qf", title = "QuickFix" }
        },

        options = {
            left = { size = 30 },
            right = { size = 38 },
            bottom = { size = 10 }
        },
        animate = { enabled = false }
    }
}
