return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'echasnovski/mini.icons',
    'yavorski/lualine-macro-recording.nvim',
  },
  event = 'VeryLazy',
  opts = {
    theme = 'auto',
    sections = {
      lualine_x = {
        { 'macro_recording', separator = '' },
        'filetype',
      },
    },
  }
}
