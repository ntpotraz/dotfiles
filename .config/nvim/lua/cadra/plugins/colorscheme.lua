return {
  { -- Color Scheme
    -- 'catppuccin/nvim',
    'ellisonleao/gruvbox.nvim',
    -- name = 'catppuccin',
    name = 'gruvbox',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.

      -- vim.cmd.colorscheme 'catppuccin'
      vim.cmd.colorscheme 'gruvbox'
      vim.o.background = 'dark'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- { -- Text to Colorscheme OpenAI
  --   'svermeulen/text-to-colorscheme.nvim',
  --   config = {
  --     ai = {
  --       openai_api_key = '',
  --       gpt_model = 'gpt-3.5-turbo',
  --     },
  --   },
  --   init = function()
  --     vim.cmd [[colorscheme text-to-colorscheme]]
  --   end,
  -- },
}
