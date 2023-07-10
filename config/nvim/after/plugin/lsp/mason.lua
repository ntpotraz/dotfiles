require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "jsonls",
    "cssls",
    "eslint",
    "pyright",
    "clangd",
    "html",
    "marksman",
  },
})
