return {
    "numToStr/FTerm.nvim",
    opts = { },
    keys = {
        { "<A-i>", function() require("FTerm").toggle() end, mode = { "n" }, },
        { "<A-i>", function() require("FTerm").toggle() end, mode = { "t" }, },
    },
}
