return {
    "adigitoleo/haunt.nvim",
    ---@module "haunt"
    ---@type Haunt.config
    opts = { define_commands = false },
    keys = {
        { "<A-i>", function() require("haunt").term({}) end, mode = { "n" }, },
        { "<A-i>", function() require("haunt").reset() end, mode = { "t" }, },
    },
}
