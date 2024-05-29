local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 250
config.enable_wayland = false
config.freetype_load_target = "Normal"
config.dpi = 96
config.font = wezterm.font_with_fallback({
	family = "JetBrainsMono Nerd Font Mono",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 14
-- config.color_scheme = "Tango (terminal.sexy)" -- "GitHub Dark"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 4
config.window_background_opacity = 1.0
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0
config.use_dead_keys = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

return config
