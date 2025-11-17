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
- `editor.lua` - Editor behavior modifications (e.g., change without yanking)
- `markdown.lua` - Markdown rendering and linting config
- `web.lua`, `sql.lua`, `testing.lua` - Language/tool specific configs

### Important Configuration Details

**Global Options** (options.lua):
- `scrolloff = 5` - Always show 5 lines above/below cursor
- `lazyvim_python_lsp = "basedpyright"` - Use basedpyright instead of default

**Custom Keymaps** (keymaps.lua):
- Always use descriptive `desc` field when defining keymaps
- `jj` in insert mode = ESC
- `c`/`C`/`cc` = Change without yanking (use black hole register)
- `<C-[>` / `<C-]>` = Navigate jumplist
- `<leader>q` = Original q functionality (q remapped to no-op)

**Completion** (completion.lua):
- Completion is manual-trigger only (all auto-trigger disabled)
- Toggle with `<leader>uk`
- Preselect enabled but auto-insert disabled

## LazyVim Extension Pattern

This config extends LazyVim by:
1. Importing base LazyVim plugins in lazy.lua
2. Overriding specific plugins in `lua/plugins/*.lua`
3. Adding custom plugins alongside LazyVim plugins

When modifying plugins, check if LazyVim already provides configuration - override rather than duplicate.
