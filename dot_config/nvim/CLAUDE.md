# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim). LazyVim is a Neovim setup powered by lazy.nvim that provides a complete IDE experience with pre-configured plugins.

## Code Style

- **Language**: Lua
- **Formatter**: `stylua .` (2 spaces, 120 column width)
- **Indentation**: 2 spaces
- **String literals**: Use double quotes
- **Table formatting**: Space after opening brace and before closing brace
- **Testing**: Manual testing only - open Neovim to test changes

## Architecture

### Bootstrap and Loading Sequence

1. `init.lua` - Entry point that loads lazy.nvim
2. `lua/config/lazy.lua` - Bootstraps lazy.nvim and configures plugin loading
3. `lua/config/options.lua` - Global options set before lazy.nvim loads
4. `lua/config/keymaps.lua` - Custom keymaps (auto-loaded on VeryLazy event)
5. `lua/config/autocmds.lua` - Custom autocommands (auto-loaded on VeryLazy event)
6. `lua/plugins/*.lua` - All plugin configurations (auto-loaded by lazy.nvim)

### Plugin Configuration Pattern

All files in `lua/plugins/` are automatically loaded by lazy.nvim. Each file returns either:
- A single plugin spec table
- An array of plugin spec tables

Three primary patterns for configuring plugins:

1. **Simple config** - Use plain `opts` table:
```lua
{
  "plugin/name",
  opts = {
    setting = value,
  },
}
```

2. **Complex config** - Use `opts` function for merging with parent specs:
```lua
{
  "plugin/name",
  opts = function(_, opts)
    opts.setting = value
    return opts
  end,
}
```

3. **Override LazyVim plugin** - Specify the plugin again with new opts:
```lua
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "tokyonight-storm",
  },
}
```

See `lua/plugins/example.lua` for comprehensive examples of all patterns.

### Key Architectural Decisions

- **Lazy loading**: Custom plugins load at startup (defaults.lazy = false in lazy.lua)
- **Plugin updates**: Auto-check enabled, notifications disabled
- **UI consistency**: All floating windows use "rounded" borders (configured in ui.lua)
- **Completion behavior**: Manual trigger only - auto-completion disabled (completion.lua)
- **LSP**: basedpyright for Python, with toggle keymap `<leader>cL` (lsp.lua)

### Plugin Organization

- `ui.lua` - Visual/UI configurations (colorscheme, borders, noice.nvim)
- `lsp.lua` - LSP server configurations and keymaps
- `completion.lua` - Completion behavior (blink.cmp with manual trigger)
- `mason.lua` - Tool installation via Mason (LSP servers, formatters, linters)
- `editor.lua` - Editor behavior modifications (change without yanking)
- `markdown.lua` - Markdown rendering (render-markdown.nvim) and linting (markdownlint-cli2)
- `testing.lua` - Neotest configuration (disables virtual text for test status)
- `example.lua` - Reference examples of plugin configuration patterns

### Important Configuration Details

**Global Options** (options.lua):
- `scrolloff = 5` - Always show 5 lines above/below cursor
- `lazyvim_python_lsp = "basedpyright"` - Use basedpyright instead of default

**Custom Keymaps** (keymaps.lua):
- Always use descriptive `desc` field when defining keymaps
- `jj` in insert mode = ESC
- `<` / `>` in visual mode = Indent and reselect
- `<C-[>` / `<C-]>` = Navigate jumplist backward/forward
- `<leader>q` = Original q functionality (q remapped to no-op)
- `c`/`C`/`cc` in normal mode = Change without yanking (use black hole register)
- `c` in visual mode = Change selection without yanking

**Completion** (completion.lua):
- Uses blink.cmp as completion engine
- Completion is manual-trigger only (all auto-trigger disabled)
- Toggle completion on/off with `<leader>uk`
- Preselect enabled but auto-insert disabled
- Uses Snacks.nvim toggle for completion state management

**LSP Configuration** (lsp.lua):
- Inlay hints disabled by default
- Diagnostics use rounded borders
- Emmet language server configured for web filetypes (HTML, CSS, JSX, TSX, Vue, Svelte)
- `<leader>cL` = Toggle basedpyright LSP on/off for Python files

**Mason Tools** (mason.lua):
- Mason UI uses rounded borders
- Auto-installs essential tools:
  - LSP servers: basedpyright, gopls, lua-language-server, bash-language-server, emmet-language-server, json-lsp, yaml-language-server, marksman, dockerfile-language-server, docker-compose-language-service
  - Formatters: stylua, gofumpt, goimports, shfmt, ruff
  - Linters: shellcheck, markdownlint-cli2
  - Debuggers: debugpy, delve
  - Tools: markdown-toc, taplo, emmet-ls

**Markdown Configuration** (markdown.lua):
- render-markdown.nvim disabled by default
- Custom heading icons and checkbox rendering configured
- markdownlint-cli2 uses custom config path: `/home/pcino/.markdownlint-cli2.yaml`

**Testing Configuration** (testing.lua):
- Neotest virtual text disabled for cleaner test status display

## LazyVim Extension Pattern

This config extends LazyVim by:
1. Importing base LazyVim plugins in lazy.lua
2. Overriding specific plugins in `lua/plugins/*.lua`
3. Adding custom plugins alongside LazyVim plugins

When modifying plugins, check if LazyVim already provides configuration - override rather than duplicate.
