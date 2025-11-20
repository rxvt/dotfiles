return {
  ui = {
    border = "rounded",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-macchiato",
      colorscheme = "tokyonight-storm",
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
