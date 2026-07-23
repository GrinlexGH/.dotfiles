return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require'nvim-treesitter'

        ts.install({
            "json",
            "yaml",
            "markdown",
            "markdown_inline",
            "bash",
            "lua",
            "vim",
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
            "slang"
        })
    end
}
