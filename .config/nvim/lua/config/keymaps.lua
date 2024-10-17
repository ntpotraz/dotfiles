local keymap = vim.keymap.set

-- General
keymap("i", "jk", "<ESC>")
keymap("n", "<leader>l", "<CMD>Lazy check<CR>" )

-- Movement
keymap("n", "J", "5jzz", { noremap = true })
keymap("n", "K", "5kzz", { noremap = true })
keymap("n", "n", "nzz", { noremap = true })
keymap("n", "N", "Nzz", { noremap = true })
keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
keymap("n", "<C-d>", "<C-d>zz", { noremap = true })

-- Diagnostic keymaps
vim.diagnostic.config({ jump = {float = true}})
keymap('n', '[d', "vim.diagnostic.jump({count = 1, float = true})", { desc = 'Go to previous [D]iagnostic message' })
keymap('n', ']d', "vim.diagnostic.jump({count = -1, float = true})", { desc = 'Go to next [D]iagnostic message' })
keymap('n', '<leader>f', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Split
keymap("n", "ss", "<CMD>split<CR>", { silent = true })
keymap("n", "sv", "<CMD>vs<CR>", { silent = true })

-- Buffer
keymap("n", "<Tab>", "<CMD>bnext<CR>", { silent = true })
keymap("n", "<S-Tab>", "<CMD>bprev<CR>", { silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
keymap("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Mason
keymap("n", "<leader>cm", "<CMD>Mason<CR>")

-- Oil
keymap("n", "-", "<CMD>Oil --float<CR>", {silent = true})
