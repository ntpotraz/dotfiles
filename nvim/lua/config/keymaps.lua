-- Keymaps
-- Leader keys are set here before plugins load so which-key and other plugins pick them up.
-- Add your own mappings below!

local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General
keymap('i', 'jk', '<ESC>', { noremap = true })
keymap('n', '<leader>R', function()
  vim.cmd('update')
  vim.cmd('source %')
  vim.notify('Reloaded: ' .. vim.fn.expand('%:t'))
end, { desc = 'Save and source current file' })
keymap('n', '<leader>cf', function() vim.lsp.buf.format() end, { silent = true })

-- Project Actions
keymap('n', '<leader>rn', function() vim.lsp.buf.rename() end, { silent = true, desc = '[R]e[n]ame' })

-- Movement
keymap('n', 'n', 'nzz', { noremap = true })
keymap('n', 'N', 'Nzz', { noremap = true })
keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
keymap('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Split
keymap('n', 'ss', '<CMD>split<CR>', { silent = true })
keymap('n', 'sv', '<CMD>vs<CR>', { silent = true })

-- System Copy/Paste
keymap({'v', 'x'}, '<leader>y', '"+y"', { noremap = true, silent  = true })
keymap('n', '<leader>yy', '"+yy"', { noremap = true, silent  = true })
keymap({'n', 'v', 'x'}, '<leader>p', '"+p', { noremap = true, silent  = true })
keymap('n', '<leader>cp', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, { desc = 'Copy absolute file path' })

-- Buffer
keymap('n', '<Tab>', '<CMD>bnext<CR>', { silent = true })
keymap('n', '<S-Tab>', '<CMD>bprev<CR>', { silent = true })

-- Terminal
keymap('t', '<C-q>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('t', '<C-d>', '<C-\\><C-n><CMD>bd!<CR>', { desc = 'Exit terminal mode and close buffer' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
keymap('n', '<Esc>', '<CMD>nohlsearch<CR>')

-- Diagnostics
keymap('n', '<leader>f', function() vim.diagnostic.open_float() end, { silent = true, desc = '[F]loating Diagnostics'})
keymap({'n', 'i'}, '<C-h>', function() vim.lsp.buf.hover() end, {noremap = true, silent = true, desc = 'Signature Help'})

-- Plugins -----------------------------------------------------------------------------------------

keymap('n', '<leader>lu', function() vim.pack.update() end, { silent = true })

-- Snacks ------------------------------------------------------------------------------------------

-- Picker
keymap('n', "'f", function() Snacks.picker.files() end)
keymap('n', "'c", function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, { desc = 'Search config files' })
keymap('n', "'r", function() Snacks.picker.grep() end)
keymap('n', "'e", function() Snacks.explorer() end)
keymap('n', '<leader><leader>', function() Snacks.picker.buffers() end)

-- Git
keymap('n', "'g", function() Snacks.picker.git_diff() end, { desc = '[G]it Diff'})
keymap('n', '<leader>gg', function() Snacks.lazygit() end, { desc = 'LazyGit' })

-- LSP
keymap('n', 'gd', function() Snacks.picker.lsp_definitions() end, { desc = '[G]oto [d]efinition' })
keymap('n', 'gD', function() Snacks.picker.lsp_declarations() end, { desc = '[G]oto [D]eclaration' })
keymap('n', 'gr', function() Snacks.picker.lsp_references() end, { desc = 'Find [r]eferences' })
keymap('n', 'gI', function() Snacks.picker.lsp_implementations() end, { desc = '[G]oto [I]mplementations' })

-- Movement
keymap( 'n', ']]', function() Snacks.words.jump() end, { desc = 'Jump to next instance of word' })
keymap( 'n', '[[', function() Snacks.words.jump(-1) end, { desc = 'Jump to previous instance of word' })

-- Zen
keymap( 'n', "<leader>z",  function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
keymap( 'n', "<leader>Z",  function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })

-- Terminal
keymap( 'n', '<leader>tt', function() Snacks.terminal(nil, { win = {position = "float", border = true}}) end, { desc = 'Open [T]erminal' })

-- Oil ---------------------------------------------------------------------------------------------
keymap( 'n', '-', '<CMD>Oil --float<CR>', { noremap = true })

-- Tmux Navigation ---------------------------------------------------------------------------------
keymap('n', '<C-h>', '<CMD>NvimTmuxNavigateLeft<CR>', { noremap = true })
keymap('n', '<C-j>', '<CMD>NvimTmuxNavigateDown<CR>', { noremap = true })
keymap('n', '<C-k>', '<CMD>NvimTmuxNavigateUp<CR>', { noremap = true })
keymap('n', '<C-l>', '<CMD>NvimTmuxNavigateRight<CR>', { noremap = true })

-- Reference snippets for installed tools (uncomment or adapt as you like):
--
-- Snacks Picker:
--   Snacks.picker.files()
--   Snacks.picker.grep()
--   Snacks.picker.buffers()
--   Snacks.picker.diagnostics()
--   Snacks.picker.lsp_symbols()
--   Snacks.explorer()
--   
--
-- Native Neovim 0.12 LSP defaults already built in:
--   grn  -> vim.lsp.buf.rename()
--   gra  -> vim.lsp.buf.code_action()
--   grr  -> vim.lsp.buf.references()
--   gri  -> vim.lsp.buf.implementation()
--   grt  -> vim.lsp.buf.type_definition()
--   gO   -> vim.lsp.buf.document_symbol()
--   K    -> vim.lsp.buf.hover()
--   <C-s> (insert) -> vim.lsp.buf.signature_help()
--
-- Easy-Dotnet commands:
--   :Dotnet              (interactive menu)
--   :Dotnet build
--   :Dotnet run
--   :Dotnet testrunner
--   :Dotnet diagnostic
--   :Dotnet project view
--
-- vim.pack maintenance:
--   :lua vim.pack.update()
