return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts_extend = { "ensure_installed" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "luadoc",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
