return {
  'mistricky/codesnap.nvim',
  build = 'make',
  event = 'VeryLazy',
  opts = {
    mac_window_bar = true,
    title = 'CodeSnap.nvim',
    code_font_family = 'CaskaydiaCove Nerd Font',
    watermark_font_family = 'Pacifico',
    watermark = '',
    bg_theme = 'dusk',
    breadcrumbs_separator = '/',
    has_breadcrumbs = false,
  },
}
