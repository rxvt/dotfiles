return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true

        end,
      })
    end,
    opts = {
      enabled = false,
      render_modes = { "n", "c", "t" },
      heading = {
        width = "block",
        min_width = 30,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      checkbox = {
        enabled = true,
        render_modes = false,
        right_pad = 1,
        unchecked = {
          icon = "󰄱 ",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = nil,
        },
        checked = {
          icon = "󰱒 ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = "@markup.strikethrough",
        },
        custom = {
          todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        },
      },
      link = {
        custom = {
          python = {
            pattern = "%.py$",
            icon = "󰌠 ",
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", "/home/pcino/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
