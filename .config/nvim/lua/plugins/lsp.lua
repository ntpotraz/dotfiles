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
          { path = 'snacks.nvim', words = { 'Snacks' } },
          { path = 'lazy.nvim', words = { 'LazyVim' } },
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
          'basedpyright',
          'rust-analyzer',
          'gopls',

          -- Formatters & Linters
          'stylua',
          'biome',
          'prettierd',
        },
      },
    },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = true,
    })

    vim.lsp.config('basedpyright', {
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "basic",
          }
        }
      }
    })
  end,
}
