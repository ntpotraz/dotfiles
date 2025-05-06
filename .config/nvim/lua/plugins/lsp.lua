return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'saghen/blink.cmp' },
    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          { path = "snacks.nvim", words = { "Snacks" } },
          { path = "lazy.nvim", words = { "LazyVim" } },
        },
      },
    },
    {
      'williamboman/mason.nvim',
      opts = {},
      keys = {
        { '<leader>cm', '<CMD>Mason<CR>', { silent = true, desc = '[C]all [M]ason' } },
      },
    },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {},
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          -- LSPs
          'lua_ls',
          'html',
          'cssls',
          'ts_ls',
          'emmet_language_server',
          'pyright',

          -- Formatters & Linters
          'stylua',
          'biome',
          'prettierd',
          'ruff',
        },
      },
    },
  },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    vim.diagnostic.config({
      virtual_text = true,
    })

    local lsp = require('lspconfig')

    lsp.lua_ls.setup({
      capabilities = capabilities,
      filetypes = 'lua',
    })
    lsp.html.setup({
      capabilities = capabilities,
      filetypes = 'html',
    })
    lsp.cssls.setup({
      capabilities = capabilities,
      filetypes = 'css',
    })
    lsp.ts_ls.setup({
      capabilities = capabilities,
      filetypes = {
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
      },
    })
    lsp.pyright.setup({
      capabilities = capabilities,
      filetypes = 'python',
    })
  end,
}
