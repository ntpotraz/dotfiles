return {
    'nvimdev/dashboard-nvim',
    dependencies = {
      {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = {},
      },
    },
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
          statusline = true,
        },
        config = {
          header = vim.split(logo, '\n'),
          -- stylua: ignore
          center = {
            { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'f' },
            { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'n' },
            { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'r' },
            { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'g' },
            { action = [[lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('config') })]], desc = ' Config', icon = ' ', key = 'c' },
            { action = [[lua require('persistence').load()]], desc = ' Restore Session', icon = ' ', key = 's' },
            { action = 'LazyExtras', desc = ' Lazy Extras', icon = ' ', key = 'x' },
            { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
            { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
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
}
