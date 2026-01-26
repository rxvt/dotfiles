return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- General LSP settings
      opts.inlay_hints = { enabled = false }

      -- Diagnostics styling
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.float = opts.diagnostics.float or {}

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
  },
}
