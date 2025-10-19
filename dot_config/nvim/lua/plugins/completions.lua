return {
  "saghen/blink.cmp",
  -- Make blink.cmp toogleable
  opts = function(_, opts)
    -- Initialize completion state globally instead of per-buffer
    if vim.g.completion == nil then
      vim.g.completion = true
    end

    Snacks.toggle({
      name = "Completion",
      get = function()
        return vim.g.completion
      end,
      set = function(state)
        vim.g.completion = state
      end,
    }):map("<leader>uk")

    opts.enabled = function()
      return vim.g.completion ~= false
    end

    -- Disable preselect and autocomplete
    opts.completion = opts.completion or {}
    opts.completion.list = opts.completion.list or {}
    opts.completion.list.selection = {
      preselect = true, -- Preselect first entry
      auto_insert = false, -- Do not auto insert
    }
    opts.completion.trigger = {
      show_on_insert_on_trigger_character = false, -- Disable auto-popup
      show_on_keyword = false,
      show_on_trigger_character = false,
    }

    -- Ghost text - currently makes the menu look different
    -- opts.cmdline = { completion = { ghost_text = { enabled = true } } }

    return opts
  end,
}
