return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
    keys = {
      {
        "<leader>cL",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "basedpyright" })

          if #clients > 0 then
            -- Stop basedpyright
            for _, client in ipairs(clients) do
              vim.lsp.stop_client(client.id)
            end
            vim.notify("Basedpyright stopped", vim.log.levels.INFO)
          else
            -- Start basedpyright
            vim.cmd("LspStart basedpyright")
            vim.notify("Basedpyright started", vim.log.levels.INFO)
          end
        end,
        desc = "Toggle basedpyright LSP",
      },
    },
  },
}
