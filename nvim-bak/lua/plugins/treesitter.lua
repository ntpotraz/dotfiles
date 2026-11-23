return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter',
    -- The `main` branch has no module system: parsers are installed with
    -- install() and highlighting/indent must be started per buffer.
    config = function()
      local parsers = {
        'vim',
        'lua',
        'vimdoc',
        'luadoc',
        'html',
        'css',
        'javascript',
        'typescript',
        'tsx',
        'markdown',
        'markdown_inline',
        'go',
        'c_sharp',
      }
      require('nvim-treesitter').install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        desc = 'Start treesitter highlighting and indent',
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        callback = function(args)
          -- Silently skip filetypes without an installed parser.
          if not pcall(vim.treesitter.start, args.buf) then
            return
          end
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'html',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'svelte',
      'vue',
      'tsx',
      'jsx',
      'rescript',
      'xml',
      'php',
      'markdown',
      'astro',
      'glimmer',
      'handlebars',
      'hbs',
    },
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ['html'] = {
            enable_close = false,
          },
        },
      })
    end,
  },
}
