return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc }) end

            map("n", "<leader>hs", gs.stage_hunk, "Stage hunk (gitsigns.nvim)")
            map("n", "<leader>hr", gs.reset_hunk, "Reset hunk (gitsigns.nvim)")
            map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk (gitsigns.nvim)")
            map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk (gitsigns.nvim)")

            map("n", "<leader>hS", gs.stage_buffer, "Stage buffer (gitsigns.nvim)")
            map("n", "<leader>hR", gs.reset_buffer, "Reset buffer (gitsigns.nvim)")

            map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk (gitsigns.nvim)")

            map("n", "<leader>hp", gs.preview_hunk, "Preview hunk (gitsigns.nvim)")

            require'scrollbar.handlers.gitsigns'.setup()
        end,
    },
}
