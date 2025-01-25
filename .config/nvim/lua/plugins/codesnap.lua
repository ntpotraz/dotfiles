return {
  "mistricky/codesnap.nvim",
  build = "make",
  event = "VeryLazy",
  keys = {
    { "<leader>cs", "<CMD>CodeSnap<CR>", desc = "[C]ode [S]nap", silent = true, mode = "v" }
  },
  opts = {
    mac_window_bar = true,
    title = "CodeSnap.nvim",
    code_font_family = "VictorMono Nerd Font",
    watermark_font_family = "Pacifico",
    watermark = "",
    bg_theme = "dusk",
    bg_padding = 0,
    breadcrumbs_separator = "/",
    has_breadcrumbs = false,
  },
}
