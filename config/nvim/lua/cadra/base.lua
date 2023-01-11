-- Set relative numbers, changes to number in insert mode
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = '*',
	command = "set norelativenumber"
})
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = '*',
	command = "set relativenumber"
})

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.colorcolumn = '80'
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
