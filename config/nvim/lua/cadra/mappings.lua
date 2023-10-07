vim.g.mapleader = ' '

-- Escape
vim.keymap.set('i', 'jk', '<Esc>')

-- Movement Stuff
vim.keymap.set('n', 'J', '5jzz')
vim.keymap.set('n', 'K', '5kzz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Spliting Stuff
vim.keymap.set('n', 'ss', ':split<CR>', { desc = 'Split horizontal' })
vim.keymap.set('n', 'sv', ':vsplit<CR>', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>-', '5<C-w>-', { desc = 'Decrease buffer height' })
vim.keymap.set('n', '<leader>=', '5<C-w>+', { desc = 'Increase buffer height' })
vim.keymap.set('n', '<leader>,', '5<C-w><', { desc = 'Increase size of current vertical buffer' })
vim.keymap.set('n', '<leader>.', '5<C-w>>', { desc = 'Decrease size of current vertical buffer' })

-- Terminal Stuff
vim.keymap.set('t', 'kj', '<C-\\><C-n>', { desc = 'Terminal to normal mode' })
vim.keymap.set('n', '<leader>t', ':split<CR>15<C-w>-:term<CR>i', { desc = 'Open terminal at bottom' })
vim.keymap.set('n', '<leader>vt', ':vsplit<CR>:term<CR>i', { desc = 'Open vertical terminal' })

-- Increment Numbers
vim.keymap.set('n', '<leader>a', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>x', '<C-x>', { desc = 'Increment number' })

-- ===============Plugins======================================================

-- Nvim Tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- Bufferline
vim.keymap.set('n', 'tt', ':tabnew<CR>', { desc = 'Open new tab', silent = true })
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', { desc = 'Open Tab 1', silent = true })
