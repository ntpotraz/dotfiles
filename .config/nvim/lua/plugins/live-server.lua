return {
  "barrett-ruth/live-server.nvim",
  build = "npm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
  keys = {
    { "<leader>ls", "<CMD>LiveServerStart<CR>", desc = "Start [L]ive [S]erver" },
    { "<leader>lx", "<CMD>LiveServerStop<CR>", desc = "Stop [L]ive Server[X]" },
  },
  opts = {},
}
