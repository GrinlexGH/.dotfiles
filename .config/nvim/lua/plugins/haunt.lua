return {
    "adigitoleo/haunt.nvim",
    opts = { define_commands = false },
    keys = {
        { "<A-i>", function() require'haunt'.term({}) end, mode = { "n" }, desc = "Toggle terminal (haunt.nvim)" },
        { "<A-i>", function() require'haunt'.reset() end, mode = { "t" }, desc = "Toggle terminal (haunt.nvim)" }
    }
}
