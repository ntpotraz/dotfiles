return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
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
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
