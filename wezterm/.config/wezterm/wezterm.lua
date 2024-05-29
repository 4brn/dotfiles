local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 60
config.enable_wayland = true
-- freetype_load_target = "Normal"
config.dpi = 96
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 22
config.color_scheme = "GitHub Dark"
config.use_fancy_tab_bar = true
config.window_background_opacity = 1.0
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
