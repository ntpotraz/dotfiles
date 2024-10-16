return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  name = "gruvbox",
  config = function()
    vim.cmd.colorscheme("gruvbox")
    vim.o.background = "dark"
  end,
}
