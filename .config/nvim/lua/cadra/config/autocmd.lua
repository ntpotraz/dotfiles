local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('InsertEnter', {
  desc = 'Turns relative numbers off in Insert mode',
  pattern = '*',
  command = 'set norelativenumber',
})
autocmd('InsertLeave', {
  desc = 'Turns relative numbers on in Normal mode',
  pattern = '*',
  command = 'set relativenumber',
})
autocmd('TermEnter', {
  desc = 'Turns relative numbers off in Terminal mode',
  pattern = '*',
  command = 'set norelativenumber',
})
autocmd('TermLeave', {
  desc = 'Turns relative numbers on when leaving Terminal mode',
  pattern = '*',
  command = 'set relativenumber',
})
