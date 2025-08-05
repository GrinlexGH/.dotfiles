return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = { },
    keys = {
        { "<C-k>", function() require("lsp_signature").toggle_float_win() end, desc = "toggle signature", mode = { "n", "i" }, }
    },
}
