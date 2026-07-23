return {
    "gbprod/substitute.nvim",
    opts = { },
    keys = {
        { "s", function() require'substitute'.operator() end, desc = "Substitute with motion (substitute.nvim)" },
        { "s", function() require'substitute'.visual() end, mode = "x", desc = "Substitute in visual mode (substitute.nvim)" },
        { "ss", function() require'substitute'.line() end, desc = "Substitute line (substitute.nvim)" },
        { "S", function() require'substitute'.eol() end, desc = "Substitute to end of line (substitute.nvim)" }
    },
}
