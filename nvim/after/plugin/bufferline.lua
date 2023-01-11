
require("bufferline").setup{
options = {
    mode = "tabs",
    separator_style = {'',''},
    indicator = 'none',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    background = {
      fg = '#474747',
    },
    background = {
      fg = '#f0b62f',
      bg = '#1f1b1b',
      bold = false
    },
    buffer_selected = {
      fg = '#272727',
      bg = '#7f7263',
      bold = true,
    },
    fill = {
      bg = '#322b2c'
    }
  },
}

vim.keymap.set('n', '<S-t>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
