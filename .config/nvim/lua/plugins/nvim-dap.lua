return {
    "mfussenegger/nvim-dap",
    config = function()
        vim.cmd("hi DapBreakpointColor guifg=#fa4848")
        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
    end,
    keys = {
        { "<F5>", function() require'dap'.continue() end, desc = "Continue / Start (nvim-dap)" },
        { "<F7>", function() require'dap'.terminate() end, desc = "Terminate session (nvim-dap)" },
        { "<F9>", function() require'dap'.toggle_breakpoint() end, desc = "Toggle Breakpoint (nvim-dap)" },
        { "<F10>", function() require'dap'.step_over() end, desc = "Step Over (nvim-dap)" },
        { "<F11>", function() require'dap'.step_into() end, desc = "Step Into (nvim-dap)" },
        { "<F12>", function() require'dap'.step_out() end, desc = "Step Out (nvim-dap)" }
    }
}
