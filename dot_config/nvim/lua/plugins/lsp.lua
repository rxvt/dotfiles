return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "aekasitt/tylsp.nvim",
    config = function()
      require("tylsp").setup()
    end,
  },
}
