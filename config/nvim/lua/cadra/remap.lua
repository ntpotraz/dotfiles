local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Space is leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File browser
keymap("n", "<leader>sf", vim.cmd.Ex, opts)

-- JK to escape
keymap("i", "jk", "<Esc>", opts)

-- Combine line under
keymap("n", "<leader>J", "mzJ`z", opts)

-- Move up and down by 5
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)

-- Move highlighted text
keymap("v", "J", "<cmd>m '>+1<CR>gv=gv", opts)
keymap("v", "K", "<cmd>m '<-2<CR>gv=gv", opts)

-- Increment/decrement
keymap("n", "<leader>a", "<C-a>", opts)
keymap("n", "<leader>x", "<C-x>", opts)
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Tab stuff
keymap("n", "tt", "<cmd>tabe<Return>", opts)
keymap("n", "T", "<cmd>tabnext<Return>", opts)
keymap("n", "<S-Tab>", "<cmd>tabprevious<Return>", opts)

-- Split stuff
keymap("n", "ss", "<cmd>split<Return>", opts)
keymap("n", "sv", "<cmd>vsplit<Return>", opts)
keymap("n", "<Space>k", "<C-w>k", opts)
keymap("n", "<Space>j", "<C-w>j", opts)
keymap("n", "<Space>h", "<C-w>h", opts)
keymap("n", "<Space>l", "<C-w>l", opts)

-- Resize window
keymap("n", "<Space>,", "2<C-w><", opts)
keymap("n", "<Space>.", "2<C-w>>", opts)
keymap("n", "<Space>-", "2<C-w>-", opts)
keymap("n", "<Space>=", "2<C-w>+", opts)

-- Terminal
keymap("n", "<Leader>t", "<cmd>split<cr><cmd>term<cr>10<C-w>-i", opts)
keymap("n", "<Leader>vt", "<cmd>vsplit<cr><cmd>term<cr>i", opts)
keymap("t", "kj", "<C-\\><C-n>", opts)

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("n", "Q", "<nop>", opts)

-- Format File
keymap("n", "<leader>fp", "<cmd>lua vim.lsp.buf.format()<Cr>", opts)
