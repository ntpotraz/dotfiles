-- Core autocommands

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank({ timeout = 200 })
  end,
})

-- Keep splits balanced when the terminal window resizes
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  desc = "Equalize splits on resize",
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Reload files changed outside Neovim (e.g., dotnet CLI, git checkout)
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup,
  desc = "Check for external file changes",
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Use 2-space indentation for Lua, JSON, YAML, XML/csproj
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "lua", "json", "jsonc", "yaml", "xml", "csproj", "props", "targets" },
  desc = "Use 2-space indentation for config/Lua/XML files",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
