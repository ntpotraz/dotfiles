local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
  ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "pyright",
      "tsserver",
      "clangd",
      "cssls",
      "eslint",
      "html",
      "jdtls",
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

require('lspconfig').lua_ls.setup({})
