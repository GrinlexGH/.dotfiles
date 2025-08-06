return {
    "backdround/improved-search.nvim",
    keys = {
        { "n", function() require("improved-search").stable_next() end, mode = { "n", "x", "o" }, desc = "Next search (improved-search)" },
        { "N", function() require("improved-search").stable_previous() end, mode = { "n", "x", "o" }, desc = "Previous search (improved-search)" },

        { "!", function() require("improved-search").current_word() end, desc = "Search current word (improved-search)" },

        { "!", function() require("improved-search").in_place() end, mode = "x", desc = "Search selection without moving (improved-search)" },
        { "*", function() require("improved-search").forward() end, mode = "x", desc = "Search selection forward (improved-search)" },
        { "#", function() require("improved-search").backward() end, mode = "x", desc = "Search selection backward (improved-search)" },

        { "|", function() require("improved-search").in_place() end, desc = "Search by motion in place (improved-search)" },
    },
}
