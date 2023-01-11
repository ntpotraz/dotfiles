-- Space is leader
vim.g.mapleader = ' '

-- File browser 
vim.keymap.set('n', '<leader>sf', vim.cmd.Ex)

-- JK to escape
vim.keymap.set('i', 'jk', '<Esc>')

-- Combine line under
vim.keymap.set('n', '<leader>J', 'mzJ`z')

-- Move up and down by 5
vim.keymap.set('n', 'J', '5j')
vim.keymap.set('n', 'K', '5k')

-- Move highlighted text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")


-- Increment/decrement
vim.keymap.set('n', '<leader>a', '<C-a>')
vim.keymap.set('n', '<leader>x', '<C-x>')
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Tab stuff
vim.keymap.set('n', 'tt', ':tabe<Return>', { silent = true })
vim.keymap.set('n', 'tw', ':tabnext<Return>')
vim.keymap.set('n', 'tb', ':tabprevious<Return>')

-- Split stuff
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
vim.keymap.set('', '<Space>k', '<C-w>k')
vim.keymap.set('', '<Space>j', '<C-w>j')
vim.keymap.set('', '<Space>h', '<C-w>h')
vim.keymap.set('', '<Space>l', '<C-w>l')

-- Resize window
vim.keymap.set('n', '<Space>,', '<C-w><')
vim.keymap.set('n', '<Space>.', '<C-w>>')
vim.keymap.set('n', '<Space>-', '<C-w>-')
vim.keymap.set('n', '<Space>=', '<C-w>+')

-- Terminal
vim.keymap.set('n', '<Leader>t', ':split<cr>:term<cr>10<C-w>-i')
vim.keymap.set('t', 'kj', '<C-\\><C-n>')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'Q', '<nop>')
