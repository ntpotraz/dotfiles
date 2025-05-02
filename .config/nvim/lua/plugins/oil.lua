return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  lazy = false,
  keys = {
    { '-', '<CMD>Oil --float<CR>', silent = true },
  },
  opts = {
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
    },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
}
