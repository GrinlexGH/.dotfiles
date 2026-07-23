return {
    "akinsho/bufferline.nvim",
    lazy = false,
    opts = {
        options = {
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true
                }
            }
        }
    },
    keys = {
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer (bufferline.nvim)" },
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer (bufferline.nvim)" },

        { "<A-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left (bufferline.nvim)" },
        { "<A-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right (bufferline.nvim)" },

        { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle current buffer pin (bufferline.nvim)" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all buffers except current (bufferline.nvim)" }
    }
}
