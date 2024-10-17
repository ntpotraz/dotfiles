return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    {
      "williamboman/mason.nvim",
      opts = {},
      keys = {
        vim.keymap.set("n", "<leader>cm", "<CMD>Mason<CR>"),
      },
    },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          -- LSP
          "lua_ls",
          "html-lsp",
          "cssls",
          "ts_ls",

          -- Formatters & Linters
          "stylua",
          "biome",
          "prettierd",
        },
      },
    },
    { "j-hui/fidget.nvim", opts = {} },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    -- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  },

  config = function()
    local lsp = require("lspconfig")

    lsp.lua_ls.setup({
      filetypes = { "lua" },
    })

    lsp.html.setup({
      filetypes = { "html" },
      init_options = {
        provideFormatter = false,
      },
    })
    lsp.cssls.setup({
      filetypes = { "css" },
    })
    lsp.ts_ls.setup({
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
    })
  end,
}
