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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function(event)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = desc, buffer = event.buf })
    end

    map("<leader>ms", "I~~<ESC>A~~<ESC>", "Markdown Strikethrough Line")
    -- map("<leader>mb", ..., "Markdown Bold")
    -- etc.

    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>m", group = "markdown", icon = "󰍔", buffer = event.buf },
      })
    end
  end,
})
