return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    opts.ui = opts.ui or {}
    opts.ui.border = "rounded"

    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      -- LSP servers
      "basedpyright",
      "bash-language-server",
      "debugpy",
      "delve",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "emmet-language-server",
      "emmet-ls",
      "gofumpt",
      "goimports",
      "gopls",
      "json-lsp",
      "lua-language-server",
      "markdown-toc",
      "markdownlint-cli2",
      "marksman",
      "ruff",
      "shellcheck",
      "shfmt",
      "stylua",
      "taplo",
      "yaml-language-server",
    })
  end,
}
