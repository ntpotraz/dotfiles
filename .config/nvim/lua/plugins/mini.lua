return {
  'echasnovski/mini.nvim', version = false,
  config = function()
    require('mini.ai').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.diff').setup({
      view = {
        style = 'sign',
        signs = { add = '▒', change = '▒', delete = '▒' },
      },
    })
  end
}
