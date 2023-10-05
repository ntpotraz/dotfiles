vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Escape
vim.keymap.set('i', 'jk', '<Esc>')

-- Movement Stuff
vim.keymap.set('n', 'J', '5jzz')
vim.keymap.set('n', 'K', '5kzz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Spliting stuff
vim.keymap.set('n', 'ss', ':split<CR>')
vim.keymap.set('n', 'sv', ':vsplit<CR>')
vim.keymap.set('n', '<leader>-', '5<C-w>-')
vim.keymap.set('n', '<leader>=', '5<C-w>+')
vim.keymap.set('n', '<leader>,', '5<C-w><')
vim.keymap.set('n', '<leader>.', '5<C-w>>')

-- Terminal Stuff
vim.keymap.set('t', 'kj', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>t', ':split<CR>15<C-w>-:term<CR>i')
vim.keymap.set('n', '<leader>vt', ':vsplit<CR>:term<CR>i')
