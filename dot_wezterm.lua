local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.default_prog = {'nu'}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("FantasqueSansM Nerd Font Mono")
config.font_size = 14.5
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "terafox"
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 20
config.native_macos_fullscreen_mode = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- config.use_fancy_tab_bar = false
-- config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},
}

return config
