-- Core editor options

local opt = vim.opt

-- Line numbers & gutter
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

-- Indentation (4 spaces default; C#/.NET standard)
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

-- Splits & scrolling
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.wrap = false

-- UI & visuals
opt.termguicolors = true
opt.showmode = false -- shown in lualine
opt.winborder = "rounded"
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.colorcolumn = '101'

-- Files, undo & responsiveness
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.confirm = true
opt.fileformats = { "unix", "dos" }

-- Completion menu behavior
opt.completeopt = { "menu", "menuone", "noselect" }

-- Sync with system clipboard (deferred slightly if desired; fast on Windows)
opt.clipboard = "unnamedplus"

-- Mouse support
opt.mouse = "a"
