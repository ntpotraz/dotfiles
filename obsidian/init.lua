-- Shared Vim Motions configuration for all Obsidian vaults.
-- Mirrors ~/.config/nvim so vault editing feels like terminal Neovim.
-- Located outside the vaults; each vault's data.json points here via luaConfigPath.

vim.g.mapleader = " "

-- Options ported from ~/.config/nvim/lua/config/base.lua
vim.opt.insertmodeescape = "jk"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.operatorshadowtimeout = 500

-- Shared appearance / picker sources (so every vault behaves identically)
vim.opt.smoothcursor = true
vim.opt.smoothcursorglide = true
vim.opt.pickeromnisearch = true
vim.opt.pickerdataview = true

-- Line numbers are owned by the "Hybrid Line Numbers" community plugin.
-- Do NOT set vim.opt.number / vim.opt.relativenumber here: that plugin hooks
-- those Vim options, so setting them false disables it on every config load.
-- Vim Motions' own number/relativenumber are already false in its data.json,
-- so its gutter stays out of the way.

-- Jump aids: flash yes, easymotion no, hints yes.
-- Flash stays line-bound like stock Neovim f/F/t/T.
vim.opt.flash = true
vim.opt.flashmultiline = false
vim.opt.flashsearch = true
vim.opt.easymotion = false
vim.opt.hintmode = true
vim.opt.whichkey = "leader"

-- Picker + Oil
vim.opt.pickerleadermappings = true
vim.opt.oil = true
vim.opt.oilhiddenfiles = true
vim.opt.oilsort = "name"

-- Keymaps ported from ~/.config/nvim/lua/config/keymaps.lua
vim.keymap.set("n", "n", "nzz", { desc = "Next match, centered" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous match, centered" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Esc>", function() vim.cmd("nohlsearch") end, { desc = "Clear search highlight" })

-- Tabs and splits (Vim Motions uses workspace tabs, not Neovim buffers)
vim.keymap.set("n", "<Tab>", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "gT", { desc = "Previous tab" })
vim.keymap.set("n", "ss", function() vim.cmd("sp") end, { desc = "Horizontal split" })
vim.keymap.set("n", "sv", function() vim.cmd("vs") end, { desc = "Vertical split" })

-- Snacks.words.jump() analog: walk headings in the current note
vim.keymap.set("n", "]]", "]h", { desc = "Next heading" })
vim.keymap.set("n", "[[", "[h", { desc = "Previous heading" })

-- Snacks-style picker prefix from ~/.config/nvim/lua/plugins/snacks.lua.
-- Editor mappings (fire while a note/editor has focus):
vim.keymap.set("n", "'f", function() vim.cmd("files") end, { desc = "Find files" })
vim.keymap.set("n", "'r", function() vim.cmd("livegrep") end, { desc = "Grep in vault" })
vim.keymap.set("n", "'b", function() vim.cmd("buffers") end, { desc = "Open buffers" })
vim.keymap.set("n", "'h", function() vim.cmd("headings") end, { desc = "Headings across vault" })
vim.keymap.set("n", "'o", function() vim.cmd("outline") end, { desc = "Current note outline" })
vim.keymap.set("n", "'k", function() vim.cmd("backlinks") end, { desc = "Backlinks" })

-- Global mappings for non-editor contexts (file explorer, empty panes, graph,
-- canvas, PDF, reading mode). These use the plugin's Obsidian commands, so the
-- pickers and Oil work even with no note open.
vim.obsidian.keymap.set("'f", ":obcommand vim-motions:picker-files", { desc = "Find files" })
vim.obsidian.keymap.set("'r", ":obcommand vim-motions:picker-livegrep", { desc = "Grep in vault" })
vim.obsidian.keymap.set("'b", ":obcommand vim-motions:picker-buffers", { desc = "Open buffers" })
vim.obsidian.keymap.set("'h", ":obcommand vim-motions:picker-headings", { desc = "Headings across vault" })
vim.obsidian.keymap.set("'e", ":Oil", { desc = "Oil explorer" })
vim.obsidian.keymap.set("-", ":Oil", { desc = "Oil explorer" })

-- Neovim-style '-': open Oil from a note, go up a directory inside Oil.
-- The plugin applies/removes its own '-' mapping around Oil buffers, so we
-- re-assert ours on enter/leave to keep both behaviours working.
local function oil_open_or_parent()
  if vim.g.vim_motions_oil_open then
    vim.cmd("oilparent")
  else
    vim.cmd("Oil")
  end
end

vim.g.vim_motions_oil_open = false
vim.api.nvim_create_autocmd("OilEnter", {
  callback = function()
    vim.g.vim_motions_oil_open = true
    vim.keymap.set("n", "-", oil_open_or_parent, { desc = "Oil: parent directory" })
  end,
})
vim.api.nvim_create_autocmd("OilLeave", {
  callback = function()
    vim.g.vim_motions_oil_open = false
    vim.keymap.set("n", "-", oil_open_or_parent, { desc = "Oil explorer" })
  end,
})

vim.keymap.set("n", "'e", function() vim.cmd("Oil") end, { desc = "Oil explorer" })
vim.keymap.set("n", "-", oil_open_or_parent, { desc = "Oil: open / parent" })
