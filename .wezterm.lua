local wezterm = require 'wezterm'
local config = {}

-- Font
config.font = wezterm.font 'IosevkaTerm Nerd Font Propo'
config.font_size = 15.0

-- Colorscheme
config.color_scheme = 'Gruvbox Material (Gogh)'

-- Window
config.window_background_opacity = 0.7
config.macos_window_background_blur = 10
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true


return config
