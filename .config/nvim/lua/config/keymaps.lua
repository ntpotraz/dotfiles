local keymap = vim.keymap.set

-- General
keymap("i", "jk", "<ESC>")
keymap("n", "<leader>l", "<CMD>Lazy check<CR>")

-- Movement
keymap("n", "J", "5jzz", { noremap = true })
keymap("n", "K", "5kzz", { noremap = true })
keymap("n", "n", "nzz", { noremap = true })
keymap("n", "N", "Nzz", { noremap = true })
keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
keymap("n", "<C-d>", "<C-d>zz", { noremap = true })

-- Split
keymap("n", "ss", "<CMD>split<CR>", { silent = true })
keymap("n", "sv", "<CMD>vs<CR>", { silent = true })

-- Buffer
keymap("n", "<Tab>", "<CMD>bnext<CR>", { silent = true })
keymap("n", "<S-Tab>", "<CMD>bprev<CR>", { silent = true })

-- Terminal
keymap("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("t", "<C-d>", "<C-\\><C-n><CMD>bd!<CR>", { desc = "Exit terminal mode" })
keymap("n", "<leader>ft", '<CMD>lua require("FTerm").toggle()<CR>')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
keymap("n", "<Esc>", "<CMD>nohlsearch<CR>")

