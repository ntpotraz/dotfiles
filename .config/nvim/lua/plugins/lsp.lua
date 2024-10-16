return {
  "neovim/nvim-lspconfig",
  dependencies = {
  -- Automatically install LSPs and related tools to stdpath for Neovim
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "stylua",
          "lua_ls",
          "html-lsp",
          "cssls",
          "ts_ls",
        }
      }
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
    -- { -- optional completion source for require statements and module annotations
    --   "hrsh7th/nvim-cmp",
    --   opts = function(_, opts)
    --     opts.sources = opts.sources or {}
    --     table.insert(opts.sources, {
    --       name = "lazydev",
    --       group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    --     })
    --   end,
  },
  config = function()
    require"lspconfig".lua_ls.setup{
      filetypes = { "lua" },
    }
    require"lspconfig".html.setup{
      filetypes = { "html"  }
    }
    require"lspconfig".cssls.setup{
      filetypes = {  "css"  }
    }
    require"lspconfig".ts_ls.setup{
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact"
      },
    }
  end,
}
