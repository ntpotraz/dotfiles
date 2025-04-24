return {
  "folke/zen-mode.nvim",
  keys = {
    { "zm", "<CMD>ZenMode<CR>", silent = true },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    window = {
      options = {
        relativenumber = false,
        number = false,
        list = false,
        colorcolumn = "",
      },
    },
    plugins = {
      lualine = { enabled = false },
    },
  },
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}
