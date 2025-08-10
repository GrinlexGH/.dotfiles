return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        ts.install({
            "json",
            "yaml",
            "html",
            "css",
            "prisma",
            "markdown",
            "markdown_inline",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "vimdoc",
            "c",
            "cpp",
            "glsl",
            "java",
            "kotlin",
            "rust",
            "python",
            "pascal",
            "ruby",
            "squirrel",
        })
    end,
}
