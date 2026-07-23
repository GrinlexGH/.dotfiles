return {
    "backdround/improved-search.nvim",
    keys = {
        { "n", function() require'improved-search'.stable_next() end, mode = { "n", "x", "o" }, desc = "Search next (improved-search.nvim)" },
        { "N", function() require'improved-search'.stable_previous() end, mode = { "n", "x", "o" }, desc = "Searcg previous (improved-search.nvim)" },

        { "!", function() require'improved-search'.current_word() end, desc = "Search current word (improved-search.nvim)" },
        { "!", function() require'improved-search'.in_place() end, mode = "x", desc = "Search selection (improved-search.nvim)" }
    }
}
