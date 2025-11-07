-- In your Mason plugin configuration
return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
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
      "sqlfluff",
      "stylua",
      "taplo",
      "yaml-language-server",
      -- Add all your essential tools here
    },
  },
}
