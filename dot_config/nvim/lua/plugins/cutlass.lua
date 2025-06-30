return {
  "svermeulen/vim-cutlass",
  event = "VeryLazy",
  config = function()
    -- vim-cutlass configuration
    vim.g.cutlass_no_mappings = 1 -- Disable default mappings if you want custom ones

    -- Optional: Set up custom mappings
    -- Move operation (equivalent to cut)
    vim.keymap.set("n", "m", "d", { noremap = true })
    vim.keymap.set("x", "m", "d", { noremap = true })
    vim.keymap.set("n", "mm", "dd", { noremap = true })
    vim.keymap.set("n", "M", "D", { noremap = true })
  end,
}
