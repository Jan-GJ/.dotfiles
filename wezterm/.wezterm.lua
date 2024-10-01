local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function get_system_theme()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function get_color_theme(appearance)
	if appearance:find("Dark") then
		return "GruvboxDark"
	else
		return "GruvboxLight"
	end
end

config.color_scheme = get_color_theme(get_system_theme())

config.enable_tab_bar = false
config.enable_scroll_bar = false

config.font_size = 16
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
