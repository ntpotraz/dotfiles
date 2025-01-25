return {
  "numToStr/Fterm.nvim",
  lazy = true,
  keys = {
    { "<leaderft", "<CMD>lua require('FTerm').open()<CR>", desc = "Open [F]loating [T]erminal" },
    { "<A-q>", "<CMD>lua require('FTerm').close()<CR><ESC>", desc = "Close Floating Terminal", mode = "t" },
  },
  opts = {},
}
