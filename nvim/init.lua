-- Neovim 0.12+ modular configuration (native vim.pack + vim.lsp)

-- Enable Lua module bytecode cache for faster startup
if vim.loader then
  vim.loader.enable()
end

-- Core configuration (keymaps loads early so mapleader is set before plugins)
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Plugins (managed natively via Neovim 0.12 vim.pack)
require("plugins")
