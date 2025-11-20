return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- General LSP settings
      opts.inlay_hints = { enabled = false }

      -- Diagnostics styling
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.float = opts.diagnostics.float or {}
      opts.diagnostics.float.border = "rounded"

      -- Server configurations
      opts.servers = opts.servers or {}

      -- Emmet language server filetypes
      opts.servers.emmet_language_server = opts.servers.emmet_language_server or {}
      opts.servers.emmet_language_server.filetypes = opts.servers.emmet_language_server.filetypes or {}
      vim.list_extend(opts.servers.emmet_language_server.filetypes, {
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "pug",
        "typescriptreact",
        "vue",
        "svelte",
      })
    end,
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
