require("mason").setup()
require("mason-null-ls").setup({
  ensure_installed = {
    -- Opt to list sources here, when available in mason.
    'black',
    'stylua',
    'prettier',
  },
  automatic_installation = false,
  handlers = {},
})
require("null-ls").setup({
  sources = {
    -- Anything not supported by mason.
  }
})
