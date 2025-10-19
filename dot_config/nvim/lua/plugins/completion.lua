return {
  "saghen/blink.cmp",
  opts = function(_, opts)
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

    opts.completion = opts.completion or {}
    opts.completion.list = opts.completion.list or {}
    opts.completion.list.selection = {
      preselect = true,
      auto_insert = false,
    }
    opts.completion.trigger = {
      show_on_insert_on_trigger_character = false,
      show_on_keyword = false,
      show_on_trigger_character = false,
    }

    return opts
  end,
}
