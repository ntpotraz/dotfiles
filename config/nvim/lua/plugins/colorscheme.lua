return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  terminal_colors = true,
  transparent_mode = true,
  lazy = true,
  priority = 1000,
  opts = {},

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  { "xiyaowong/transparent.nvim" },
}
