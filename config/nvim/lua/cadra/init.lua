print('Greetings, Cadra!')

require 'cadra.mappings'
require 'cadra.lazy'

vim.opt.nu = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  command = "set norelativenumber",
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set relativenumber",
})
vim.api.nvim_create_autocmd("TermEnter", {
  pattern = "*",
  command = "set norelativenumber",
})
vim.api.nvim_create_autocmd("TermLeave", {
  pattern = "*",
  command = "set norelativenumber",
})

-- Tab Stuff
vim.opt.tabstop = 2      -- insert 2 spaces for a tab
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2   -- the number of spaces inserted for each indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.showtabline = 2  -- always show tabs

-- Formatting
vim.opt.si = true    -- make indenting smarter again
vim.opt.ai = true    -- uses previous indent when starting new line
vim.opt.wrap = false -- display lines as one long line

-- Generated Files
vim.opt.swapfile = false                              -- creates a swapfile
vim.opt.backup = false                                -- creates a backup file
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir" -- sets undo directory
vim.opt.undofile = true                               -- enable persistent undo
vim.opt.writebackup = false                           -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Search
vim.opt.hlsearch = false  -- highlight all matches on previous search pattern
vim.opt.incsearch = true  -- shows current matching pattern while entering search
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true  -- smart case

-- Split
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

-- Visual
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.numberwidth = 4      -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"   -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 8        -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.colorcolumn = "80"   -- creates a vertical column, for page spacing

-- Misc
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.timeoutlen = 500                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
