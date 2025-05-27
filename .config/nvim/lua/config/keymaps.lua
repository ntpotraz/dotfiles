local keymap = vim.keymap.set

-- General
keymap('i', 'jk', '<ESC>')
keymap('n', '<leader>l', '<CMD>Lazy check<CR>')
keymap('n', '<leader>rn', function() vim.lsp.buf.rename() end, { silent = true, desc = '[R]e[n]ame'})

-- Movement
keymap('n', 'n', 'nzz', { noremap = true })
keymap('n', 'N', 'Nzz', { noremap = true })
keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
keymap('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Split
keymap('n', 'ss', '<CMD>split<CR>', { silent = true })
keymap('n', 'sv', '<CMD>vs<CR>', { silent = true })

-- Buffer
keymap('n', '<Tab>', '<CMD>bnext<CR>', { silent = true })
keymap('n', '<S-Tab>', '<CMD>bprev<CR>', { silent = true })

-- Terminal
keymap('t', '<C-q>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('t', '<C-d>', '<C-\\><C-n><CMD>bd!<CR>', { desc = 'Exit terminal mode and close buffer' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
keymap('n', '<Esc>', '<CMD>nohlsearch<CR>')

-- Diagnostics
keymap('n', '<leader>f', function() vim.diagnostic.open_float() end, { silent = true, desc = '[F]loating Diagnostics'})

-- Plugin Keybinds ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
-- NVIM Tmux Navigator
keymap('n', '<C-h>', '<CMD>NvimTmuxNavigateLeft<CR>', {noremap = true, silent = true})
keymap('n', '<C-j>', '<CMD>NvimTmuxNavigateDown<CR>', {noremap = true, silent = true})
keymap('n', '<C-k>', '<CMD>NvimTmuxNavigateUp<CR>', {noremap = true, silent = true})
keymap('n', '<C-l>', '<CMD>NvimTmuxNavigateRight<CR>', {noremap = true, silent = true})

