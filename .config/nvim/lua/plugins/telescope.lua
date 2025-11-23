return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
        "sharkdp/fd",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -GNinja -DCMAKE_POLICY_VERSION_MINIMUM=\"3.5\" -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
        },
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
    cmd = "Telescope",
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--glob=!.git/",
                },
                mappings = {
                    i = {
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                        ["<C-h>"] = actions.results_scrolling_left,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-l>"] = actions.results_scrolling_right,

                        ["<M-h>"] = actions.preview_scrolling_left,
                        ["<M-j>"] = actions.preview_scrolling_down,
                        ["<M-k>"] = actions.preview_scrolling_up,
                        ["<M-l>"] = actions.preview_scrolling_right,
                    },
                },
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-e>"] = lga_actions.quote_prompt(),
                        },
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")
        telescope.load_extension("project")
    end,
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files (telescope)" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files (telescope)" },
        { "<leader>fs", function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "Find string (Telescope)" },
        { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find exact string (telescope)" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos (telescope)" },
        { "<leader>fp", "<cmd>Telescope project<cr>", desc = "Find in project (telescope)" },
    },
}
