local wezterm = require("wezterm")
return {
	-- color_scheme = 'termnial.sexy',
	-- color_scheme = "Catppuccin Mocha",
	color_scheme = "nord",
	enable_tab_bar = false,
	-- font_size = 16.0,
	font_size = 14.0,
	-- font = wezterm.font('JetBrains Mono'),
	font = wezterm.font("Hack Nerd Font Mono"),
	font_rules = {
		{
			intensity = "Bold",
			font = wezterm.font({ family = "Hack Nerd Font Mono", weight = "Regular" }),
		},
	},
	macos_window_background_blur = 30,
	native_macos_fullscreen_mode = true,
	window_background_opacity = 1.0,
	-- window_background_opacity = 0.92,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "Enter",
			mods = "CMD",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "'",
			mods = "CTRL",
			action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
