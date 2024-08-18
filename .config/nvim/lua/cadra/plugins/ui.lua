return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function()
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      local wk = require("which-key")
      wk.add({
        { "<leader>g", group = "[G]it" },
        { "<leader>c", group = "[C]all" },
        { "<leader>o", group = "[O]bsidian" },
      })
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  { -- Transparent Background
    'xiyaowong/transparent.nvim',
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          view = "mini",
        },
        {
          filter = { cmdline = ":TSInstallInfo" },
          view = "popup",
        },
        {
          filter = { cmdline = ":term" },
          view = "popup",
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  {
    "MunifTanjim/nui.popup",
    opts = {
      border = {
        sstyle = "double"
      }
    }
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = '#000000',
      render = "minimal",
      stages = "fade",
      timeout = 2000,
    },
  },

  {                       -- Persisetence - For remembering seesion
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  { -- Dashboard
    'nvimdev/dashboard-nvim',
    opts = function()
      local logo = [[
______________________________________/\\\_______________________________
 _____________________________________\/\\\_______________________________
  _____________________________________\/\\\_______________________________
   _____/\\\\\\\\__/\\\\\\\\\___________\/\\\___/\\/\\\\\\\___/\\\\\\\\\____
    ___/\\\//////__\////////\\\_____/\\\\\\\\\__\/\\\/////\\\_\////////\\\___
     __/\\\___________/\\\\\\\\\\___/\\\////\\\__\/\\\___\///____/\\\\\\\\\\__
      _\//\\\_________/\\\/////\\\__\/\\\__\/\\\__\/\\\__________/\\\/////\\\__
       __\///\\\\\\\\_\//\\\\\\\\/\\_\//\\\\\\\/\\_\/\\\_________\//\\\\\\\\/\\_
        ____\////////___\////////\//___\///////\//__\///___________\////////\//__
ntpotraz@github 
  ]]

      logo = string.rep('\n', 8) .. logo .. '\n\n'

      local opts = {
        theme = 'doom',
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, '\n'),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
            { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
            { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
            { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config", icon = " ", key = "c" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = '  %s'
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'DashboardLoaded',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      return opts
    end,
  },
}
