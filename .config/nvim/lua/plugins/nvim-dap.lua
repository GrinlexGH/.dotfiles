return {
    "mfussenegger/nvim-dap",
    config = function()
        vim.cmd("hi DapBreakpointColor guifg=#fa4848")
        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
    end,
    keys = {
        { "<S-F2>", "<cmd>DapToggleBreakpoint<cr>", desc = "Add breakpoint at line (nvim-dap)" },
        { "<S-F5>", "<cmd>DapContinue<cr>", desc = "Continue (nvim-dap)" },
        { "<S-F10>", "<cmd>DapStepOver<cr>", desc = "Step over (nvim-dap)" },
        { "<S-F11>", "<cmd>DapStepInto<cr>", desc = "Step into (nvim-dap)" },
        { "<S-F12>", "<cmd>DapStepOut<cr>", desc = "Step out (nvim-dap)" },
    }
}
