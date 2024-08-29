return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'echasnovski/mini.icons',
    'yavorski/lualine-macro-recording.nvim',
  },
  event = 'VeryLazy',
  opts = {
    sections = {
      lualine_x = {
        { 'macro_recording', separator = '' },
        'filetype',
      },
    },
  }
}
