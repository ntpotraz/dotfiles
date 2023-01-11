local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "scss",
    "typescript",
    "typescriptreact",
  },
  jsx_single_quote = true,
  use_tabs = false
})
