return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    lazy = true,
    keymaps = {
      ["<C-h>"] = false,
      ["q"] = "actions.close",
      ["<ESC>"] = "actions.close",
    },
    float = {
      max_width = 100,
      max_height = 25,
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
