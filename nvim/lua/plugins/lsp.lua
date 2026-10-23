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
          'ruff',
        },
      },
    },
  },
  config = function()
    -- Let Roslyn load projects that have COM references (see the targets file).
    vim.env.CustomAfterMicrosoftCommonTargets = vim.fn.stdpath('config') .. '\\roslyn\\skip-com-references.targets'

    -- Stops Roslyn from loading a buffer as a standalone file-based program
    -- before the solution finishes loading, which hides the rest of the project.
    vim.lsp.config('roslyn_ls', {
      settings = {
        projects = {
          dotnet_enable_file_based_programs = false,
          dotnet_enable_file_based_programs_when_ambiguous = false,
        },
      },
    })

    vim.diagnostic.config({
      virtual_text = true,
      float = {
        border = 'rounded',
      }
    })

    vim.lsp.config('basedpyright', {
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "off",
          }
        }
      }
    })
  end,
}
