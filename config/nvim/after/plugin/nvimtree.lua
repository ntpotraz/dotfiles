local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- custom mappings
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))

  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'N', api.fs.create, opts('Create File'))
  vim.keymap.set('n', 'R', api.fs.rename, opts('Rename File'))
  vim.keymap.set('n', 'D', api.fs.remove, opts('Rename File'))
  vim.keymap.set('n', 'X', api.fs.cut, opts('Rename File'))
  vim.keymap.set('n', 'P', api.fs.paste, opts('Rename File'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
