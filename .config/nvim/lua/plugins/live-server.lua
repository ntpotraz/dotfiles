return {
  "barrett-ruth/live-server.nvim",
  build = "npm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
  maps = {
    vim.keymap.set("n", "<leader>ls", "<CMD>LiveServerStart<CR>", {desc = "Start [L]ive [S]erver"}),
    vim.keymap.set("n", "<leader>lx", "<CMD>LiveServerStop<CR>", {desc = "Stop Live Server"})
  },
  opts = {},
}
