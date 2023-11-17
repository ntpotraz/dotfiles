-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd

autocmd("InsertEnter", {
  pattern = "*",
  command = "set norelativenumber",
})

autocmd("InsertLeave", {
  pattern = "*",
  command = "set relativenumber",
})

autocmd("TermEnter", {
  pattern = "*",
  command = "set norelativenumber",
})

autocmd("TermLeave", {
  pattern = "*",
  command = "set relativenumber",
})
