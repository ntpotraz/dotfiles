return {
  -- "folke/zen-mode.nvim",
  "cdmill/focus.nvim",
  cmd = { "Focus", "Zen", "Narrow" },
  keys = {
    { "zm", "<CMD>Zen<CR>", silent = true },
    { "zf", "<CMD>Focus<CR>", silent = true },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    auto_zen = true,
    window = {
      options = {
        colorcolumn = "",
      },
    },
    zen = {
      opts = {
        colorcolumn = "",
      },
    },
    plugins = {
      lualine = { enabled = false },
    },
  },
  on_open = function(win) end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function() end,
}
