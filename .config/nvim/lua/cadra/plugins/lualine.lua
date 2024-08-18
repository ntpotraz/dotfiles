return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  event = 'VeryLazy',
  opts = {
    sections = {
      lualine_x = { 'filetype' }
    }
  }
}
