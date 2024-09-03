local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'GitHub Dark'

config.default_domain = 'WSL:Debian'

config.enable_tab_bar = false

config.enable_scroll_bar = false

config.window_decorations = "RESIZE"

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

wezterm.font = {
    family = "JetBrains Mono Regular",
}

config.font_size = 15.3

return config
