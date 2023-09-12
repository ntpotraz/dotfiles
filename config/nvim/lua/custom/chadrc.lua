---@type ChadrcConfig
local M = {}

vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

M.ui = { theme = "gruvchad" }
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
return M
