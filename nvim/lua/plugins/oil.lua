require('oil').setup({
  default_file_explorer = false,
  keymaps = {
    ['<C-h>'] = false,
    ['q'] = { 'actions.close', mode = 'n' },
    ['<ESC>'] = { 'actions.close', mode = 'n' },
  },
  view_options = {
    show_hidden = true,
  },
  float = {
    max_width = 0.7,
    max_height = 0.5,
    preview_split = 'below',
  },
})
