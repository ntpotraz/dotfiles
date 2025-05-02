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
        },
      },
    },
    {
      'williamboman/mason.nvim',
      opts = {},
      keys = {
        { '<leader>cm', '<CMD>Mason<CR>', { silent = true, desc = '[C]all [M]ason' } }
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
          'lua_ls',
          'biome',
        },
      },
    },
  },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    vim.diagnostic.config {
      virtual_text = true,
    }
    local lsp = require('lspconfig')
    lsp.lua_ls.setup{
      capabilities = capabilities;
      filetypes = 'lua',
    }
  end,
}
