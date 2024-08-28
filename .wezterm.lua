local wezterm = require 'wezterm'
local config = {}
local is_darwin <const> = wezterm.target_triple:find("darwin") ~= nil
local is_linux <const> = wezterm.target_triple:find("linux") ~= nil

-- Font
config.font = wezterm.font 'Iosevka Nerd Font'
config.font_size = 15.0

-- Colorscheme
config.color_scheme = 'Treehouse'

-- Window
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.7

-- Confirm Close
config.window_close_confirmation = 'NeverPrompt'

-- MacOS Specific settings
if is_darwin then
  config.macos_window_background_blur = 10
end

-- Windows OS Specific settings
if not is_darwin and not is_linux then
  config.win32_system_backdrop = 'Acrylic'
  config.default_prog = { 'powershell.exe' }
end


return config
