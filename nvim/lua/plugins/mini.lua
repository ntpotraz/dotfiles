require('mini.ai').setup({})
require('mini.icons').setup({})
require('mini.pairs').setup({})
require('mini.diff').setup({
  view = {
    style = 'sign',
    signs = { add = '▒', change = '▒', delete = '▒' },
  }
})
