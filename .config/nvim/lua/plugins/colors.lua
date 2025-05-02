return {
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    name = 'bluloco',
    config = function()
      require('bluloco').setup({
        style = 'dark',
        commentStyle = { italics = true },
        transparent = false,
        italics = true,
        terminal = vim.fn.has('gui_running') == 1,
        guicursor = true,
        rainbow_headings = true,
      })
      vim.cmd('colorscheme bluloco')
    end,
  },
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    keys = {
      { '<leader>tb', '<CMD>TransparentToggle<CR>', desc = 'Toggle [T]ransparent [B]ackground' },
    },
    opts = {
      extra_groups = {
        "NormalFloat",
        "Pmenu",
        "CmpItemAbbr",
      },
      exclude_groups = {},
    }
  }
}
