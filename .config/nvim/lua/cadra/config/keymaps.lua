local keymap = vim.keymap.set

-- General
keymap('i', 'jk', '<ESC>')

-- Split
keymap('n', 'ss', ':split<CR>', { silent = true })
keymap('n', 'sv', ':vs<CR>', { silent = true })

-- Buffer
keymap('n', '<Tab>', ':bnext<CR>', { silent = true })
keymap('n', '<S-Tab>', ':bprev<CR>', { silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal
keymap('t', 'kj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Transparent Background
keymap('n', '<leader>tb', ':TransparentToggle<CR>', { silent = true })

-- CodeSnap
keymap('v', '<leader>cs', ':CodeSnap<CR>', { silent = true })

-- Mason
keymap('n', '<leader>cm', ':Mason<CR>', { silent = true, desc = '[C]all [M]ason' })
