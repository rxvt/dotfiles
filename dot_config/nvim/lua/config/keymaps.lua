-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("n", "<C-]>", "<C-i>", { desc = "Jump forward in jumplist" })
vim.keymap.set("n", "<C-[>", "<C-o>", { desc = "Jump backward in jumplist" })
vim.keymap.set("n", "<leader>q", "q", { noremap = true, silent = true })
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
