return {
  'stevearc/oil.nvim',
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<C-h>"] = false,
      ["q"] = "<CMD>q<CR>",
    },
    float = {
      max_width = 100,
      max_height = 25,
    },
  },
  -- Optional dependencies
  dependencies = { "echasnovski/mini.icons" },
}
