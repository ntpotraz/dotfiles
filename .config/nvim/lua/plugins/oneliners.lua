return {
  { -- For yanking in ssh
    'ojroques/vim-oscyank',
  },
  { -- Git
    'tpope/vim-fugitive',
  },
  { -- CSS colors
    'brenoprata10/nvim-highlight-colors', opts ={},
  },
  {
    'alexghergh/nvim-tmux-navigation', opts = {},
  },
  {
    'MeanderingProgrammer/render-markdown.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, ---@module 'render-markdown', ---@type render.md.UserConfig, opts = {},
  },
}
