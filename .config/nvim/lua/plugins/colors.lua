return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    name = "gruvbox",
    config = function()
      vim.cmd.colorscheme("gruvbox")
      vim.o.background = "dark"
    end,
  },
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    keys = {
      { '<leader>tb', '<CMD>TransparentToggle<CR>', desc = 'Toggle [T]ransparent [B]ackground' },
    },
  }
}
