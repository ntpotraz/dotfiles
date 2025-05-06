return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  keys = {
    -- Picker
    {
      "'f",
      function()
        Snacks.picker.files()
      end,
      desc = '[F]ind Files',
    },
    {
      '<leader><space>',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Search Buffers',
    },
    {
      "'r",
      function()
        Snacks.picker.grep()
      end,
      desc = 'G[r]ep Search',
    },
    {
      "'c",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
      end,
      desc = 'Search Config Files',
    },
    {
      "'h",
      function()
        Snacks.picker.help()
      end,
      desc = '[H]elp Pages',
    },
    {
      "'n",
      function()
        Snacks.picker.notifications()
      end,
      desc = '[N]otification history',
    },
    {
      "'e",
      function()
        Snacks.explorer()
      end,
      desc = '[E]xplorer',
    },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    dashboard = {
      enabled = true,
      preset = {
        header = [[
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
  ]],
      },
    },

    picker = {
      win = {
        input = {
          keys = {
            ['<ESC>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
      enabled = true,
      sources = {
        buffers = {
          focus = 'list',
        },
        explorer = {
          layout = {
            layout = {
              position = 'right',
            },
          },
        },
      },
    },

    bigfile = { enabled = true },
    explorer = { enabled = true },
    image = { enabled = true },
    git = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
}
