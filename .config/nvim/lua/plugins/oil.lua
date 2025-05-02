return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  keys = {
    { '-', '<CMD>Oil --float<CR>', silent = true },
  },
  opts = {
    lazy = false,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['<C-h>'] = false,
      ['q'] = 'actions.close',
      ['<ESC>'] = 'actions.close',
    },
    float = {
      max_width = 100,
      max_height = 25,
      win_options = {
        winblend = 0,
      },
    },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
}
