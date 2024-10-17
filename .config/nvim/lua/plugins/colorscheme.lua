return {

  -- Gruvbox
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

  -- Transparent
  {
    "xiyaowong/transparent.nvim",
    opts = {},
    lazy = false,
    keys = {
      vim.keymap.set("n", "<leader>tb", "<CMD>TransparentToggle<CR>", { desc = "[T]oggle Transparent [B]ackground" }),
    },
  },
}
