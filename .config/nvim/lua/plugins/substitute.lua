return {
    "gbprod/substitute.nvim",
    opts = { },
    keys = {
        { "s", function() require("substitute").operator() end, desc = "Substitute with motion (Substitute)" },
        { "ss", function() require("substitute").line() end, desc = "Substitute line (Substitute)" },
        { "S", function() require("substitute").eol() end, desc = "Substitute to end of line (Substitute)" },
        { "s", function() require("substitute").visual() end, mode = "x", desc = "Substitute in visual mode (Substitute)" },
    },
}
