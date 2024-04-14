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

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap('t', 'kj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Transparent Background
keymap('n', '<leader>tb', ':TransparentToggle<CR>', { silent = true, noremap = true })
