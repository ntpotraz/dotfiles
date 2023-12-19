-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remove Keymaps
keymap("n", "<C-h>", vim.keymap.del)
keymap("n", "<C-j>", vim.keymap.del)
keymap("n", "<C-k>", vim.keymap.del)
keymap("n", "<C-l>", vim.keymap.del)
keymap("n", "<C-l>", vim.keymap.del)

keymap("i", "jk", "<Esc>")
keymap("n", "<C-a>", "gg<S-v>G")
keymap("n", "s", "s")

-- Tab Stuff
keymap("n", "tt", ":tabedit<CR>", opts)
keymap("n", "<tab>", ":tabnext<CR>", opts)
keymap("n", "<S-tab>", ":tabprev<CR>", opts)

-- Movement
keymap("n", "J", "5j")
keymap("n", "K", "5k", opts)
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")

-- Splits
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)

-- Increment/Decrement
keymap("n", "-", "<C-x>", opts)
keymap("n", "=", "<C-a>", opts)

-- Terminal Stuff
keymap("n", "<Leader>tt", ":sp<CR>:term<CR>15<C-w>-i", opts)
keymap("n", "<Leader>vt", ":vsp<CR>:term<CR>i", opts)
keymap("t", "kj", "<C-\\><C-n>", opts)

-- Diagnostic on cursor
keymap("n", "<leader>f", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Toggle transparency
keymap("n", "<leader>tb", ":TransparentToggle<CR>", opts)

-- Navigator
keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
keymap("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
keymap("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })
