local opt = vim.opt
local g = vim.g
local api = vim.api
local cmd = vim.cmd

-- Auto number colum switching
opt.relativenumber = true
api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  command = "set norelativenumber",
})
api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set relativenumber",
})
api.nvim_create_autocmd("TermEnter", {
  pattern = "*",
  command = "set norelativenumber",
})
api.nvim_create_autocmd("TermLeave", {
  pattern = "*",
  command = "set norelativenumber",
})

-- Tab Stuff
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.softtabstop = 2
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.expandtab = true -- convert tabs to spaces
opt.showtabline = 2 -- always show tabs

-- Formatting
opt.si = true -- make indenting smarter again
opt.ai = true -- uses previous indent when starting new line
opt.wrap = false -- display lines as one long line

-- Generated Files
opt.swapfile = false -- creates a swapfile
opt.backup = false -- creates a backup file
opt.undodir = os.getenv "HOME" .. "/.vim/undodir" -- sets undo directory
opt.undofile = true -- enable persistent undo
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Search
opt.hlsearch = false -- highlight all matches on previous search pattern
opt.incsearch = true -- shows current matching pattern while entering search
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case

-- Split
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

-- Visual
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.scrolloff = 8 -- is one of my fav
opt.sidescrolloff = 8
opt.colorcolumn = "80" -- creates a vertical column, for page spacing

-- Misc
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300 -- faster completion (4000ms default)

opt.shortmess:append { c = true }

cmd [[set iskeyword+=-]]
cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Plugin Stuff
-- ===========================================================================

-- Auto close nvim-tree
api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end,
})

-- Auto open nvim-tree
local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end
api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Copilot
g.copilot_no_tab_map = true
g.copilot_assume_mapped = true
g.copilot_tab_fallback = ""
