vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights (grinlex)" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically (grinlex)" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally (grinlex)" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size (grinlex)" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split (grinlex)" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab (grinlex)" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab (grinlex)" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab (grinlex)" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab (grinlex)" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab (grinlex)" })

keymap.set("n", "<leader>ttt", "<cmd>terminal<CR>", { desc = "Open terminal in current buffer (grinlex)" })
