-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("n", "<C-]>", "<C-i>", { desc = "Jump forward in jumplist" })
vim.keymap.set("n", "<C-[>", "<C-o>", { desc = "Jump backward in jumplist" })

-- Toggle basepyright type checker
vim.keymap.set("n", "<leader>cL", function()
  local clients = vim.lsp.get_clients({ name = "basedpyright" })
  if #clients > 0 then
    for _, client in ipairs(clients) do
      vim.lsp.stop_client(client.id)
    end
    vim.notify("Basedpyright disabled")
  else
    require("lspconfig").basedpyright.setup({})
    vim.notify("Basedpyright enabled")
  end
end, { desc = "Toggle Basedpyright" })
