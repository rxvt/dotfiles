return {
  {
    "LazyVim",
    opts = function()
      vim.keymap.set("n", "c", '"_c', { noremap = true, desc = "Change without yanking" })
      vim.keymap.set("n", "C", '"_C', { noremap = true, desc = "Change to end of line without yanking" })
      vim.keymap.set("n", "cc", '"_cc', { noremap = true, desc = "Change entire line without yanking" })
      vim.keymap.set("x", "c", '"_c', { noremap = true, desc = "Change selection without yanking" })
    end,
  },
}
