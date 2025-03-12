return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "[C]all [F]ormatter",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      html = { "prettierd" },
      css = { "biome" },
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
    },
    formatters = {
      biome = {
        append_args = {
          "--indent-style=space",
          "--semicolons=always",
        },
      },
    },
  },
}
