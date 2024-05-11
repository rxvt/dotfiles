-- https://www.reddit.com/r/neovim/comments/14t73nm/can_anyone_help_me_to_install_hopnvim_on_nvchad/ 
local plugins = {
  {
    "phaazon/hop.nvim",
    config = function()
      require'hop'.setup {
      }
    end,
    keys = {
      {
        ",",
        function()
          require("hop").hint_words()
        end,
        mode = {"n", "x", "o"},
      },
      {
        "s",
        function()
          require("hop").hint_char2()
        end,
        mode = {"n", "x", "o"},
      },
      {
        "f",
        function()
          require("hop").hint_char1()
        end,
        mode = {"n", "x", "o"},
      }

    }
  }
}

return plugins
