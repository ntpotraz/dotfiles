local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })

-- Highlights text when yanking

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- -----------------------------------------------------------------------------

-- Turn off relative numbers in insert mode

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

-- -----------------------------------------------------------------------------

-- Turn realtive number off in terminal

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

-- -----------------------------------------------------------------------------

-- Set to wrap to true when using markdown file

autocmd("BufEnter", {
  pattern = "*.md",
  group = group,
  callback = function()
    vim.wo.wrap = true
  end,
})
autocmd("BufLeave", {
  pattern = "*",
  group = group,
  callback = function()
    vim.wo.wrap = false
  end,
})

-- -----------------------------------------------------------------------------
