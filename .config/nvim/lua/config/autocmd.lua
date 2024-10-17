local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })

-- Highlights text when yanking

autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- -----------------------------------------------------------------------------

-- Turn off relative numbers in insert mode

autocmd("InsertEnter", {
  desc = "Turns relative numbers off in Insert mode",
  pattern = "*",
  command = "set norelativenumber",
})
autocmd("InsertLeave", {
  desc = "Turns relative numbers on in Normal mode",
  pattern = "*",
  command = "set relativenumber",
})

-- -----------------------------------------------------------------------------

-- Turn number off in terminal

autocmd("TermOpen", {
  desc = "Turns relative numbers off in Terminal mode",
  command = "setlocal nonumber norelativenumber",
})

-- -----------------------------------------------------------------------------

-- Set to wrap to true when using markdown file

autocmd("BufEnter", {
  pattern = "*.md",
  group = group,
  callback = function()
    vim.wo.wrap = true
  end,
})
autocmd("BufLeave", {
  pattern = "*",
  group = group,
  callback = function()
    vim.wo.wrap = false
  end,
})

-- -----------------------------------------------------------------------------

-- Signcolumn no background color

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  end,
})

-- -----------------------------------------------------------------------------

-- CMP Background

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3D3836" })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  end,
})

