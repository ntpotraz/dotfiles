local keymap = vim.keymap.set

return {
  "numToStr/Fterm.nvim",
  lazy = true,
  keys = {
    keymap("n", "<leader>ft", "<CMD>lua require('FTerm').open()<CR>", { desc = "Open [F]loating [T]erminal" }),
    keymap("t", "<A-q>", "<CMD>lua require('FTerm').close()<CR><ESC>", { desc = "Close Floating Terminal" }),
  },
  opts = {},
}
