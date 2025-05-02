return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false, -- Loads at startup
    priority = 1000, -- Ensures it loads before other plugins that might depend on it
    config = function()
      -- Configure Kanagawa via its setup function
      require('kanagawa').setup({
        compile = false,             -- Compile theme faster (maybe)
        undercurl = true,            -- Enable undercurls
        commentStyle = { italic = true },
        functionStyle = { italic = false },
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              }
            }
          }
        },
        background = {
            -- Themes: wave, dragon, lotus
            dark = 'wave',
            light = 'lotus'
        },
      })

      -- IMPORTANT: Apply the base colorscheme *after* setup
      vim.cmd('colorscheme kanagawa')
      vim.o.background = 'dark'
      -- vim.o.background = 'light'

      -- Optional: Set background based on theme if needed, though setup might handle it
      -- vim.o.background = 'dark' -- If using dragon or wave

    end,
  },

  {
    'xiyaowong/transparent.nvim',
    -- No need for opts = {} unless you want to configure transparent.nvim itself
    lazy = false, -- Load at startup since you want to toggle anytime
    keys = {
      { '<leader>tb', '<CMD>TransparentToggle<CR>', desc = 'Toggle [T]ransparent [B]ackground' },
    },
    -- Optional: Make sure transparent loads after kanagawa if issues persist
    -- dependencies = { 'rebelot/kanagawa.nvim' }
  }
}
