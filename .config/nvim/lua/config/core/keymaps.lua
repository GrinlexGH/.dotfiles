vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically (grinlex)" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally (grinlex)" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size (grinlex)" })

keymap.set("n", "U", "<cmd>redo<CR>", { desc = "Redo (grinlex)" })

keymap.set("i", "<C-H>", "<C-W>", { desc = "Delete previous word (grinlex)" })
keymap.set("i", "<C-Del>", "<C-o>de", { desc = "Delete word (grinlex)" })
