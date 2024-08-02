local keymap = vim.keymap.set

-- General
keymap('i', 'jk', '<ESC>')
keymap('n', '<leader>l', '<CMD>Lazy check<CR>' )

-- Movement
keymap('n', 'J', '5jzz', { noremap = true })
keymap('n', 'K', '5kzz', { noremap = true })
keymap('n', 'n', 'nzz', { noremap = true })
keymap('n', 'N', 'Nzz', { noremap = true })
keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
keymap('n', '<C-d>', '<C-d>zz', { noremap = true })

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
keymap('n', '<leader>f', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal
keymap('n', '<leader>tt', '<CMD>split<CR><CMD>term<CR>15<C-w>-i', { desc = '[T]oggle [T]erminal' })
keymap('n', '<leader>vt', '<CMD>vsp<CR><CMD>term<CR>i', { desc = 'Toggle [V]ertical [T]erminal' })
keymap('t', 'kj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('n', '<leader>ft', '<CMD>lua require("FTerm").toggle()<CR>')

-- Transparent Background
keymap('n', '<leader>tb', ':TransparentToggle<CR>', { silent = true })

-- CodeSnap
keymap('v', '<leader>cs', ':CodeSnap<CR>', { silent = true })

-- Mason
keymap('n', '<leader>cm', ':Mason<CR>', { silent = true, desc = '[C]all [M]ason' })

-- Oil
keymap('n', '-', '<CMD>Oil --float<CR>', {silent = true})
