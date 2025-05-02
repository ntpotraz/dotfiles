return {
  'nvim-treesitter/nvim-treesitter',
  build = '<CMD>TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
    ensure_installed = {
      'vim',
      'lua',
      'vimdoc',
      'luadoc',
      'html',
      'css',
      'javascript',
      'typescript',
      'tsx',
      'markdown',
      'markdown_inline',
    },
  },
}
