return {
    "gbprod/substitute.nvim",
    opts = { },
    keys = {
        { "s", function() require("substitute").operator() end, desc = "Substitute with motion (substitute)" },
        { "ss", function() require("substitute").line() end, desc = "Substitute line (substitute)" },
        { "S", function() require("substitute").eol() end, desc = "Substitute to end of line (substitute)" },
        { "s", function() require("substitute").visual() end, mode = "x", desc = "Substitute in visual mode (substitute)" },
    },
}
