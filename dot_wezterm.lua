local wezterm = require("wezterm")
local act = wezterm.action

return {
	color_scheme = "Catppuccin Macchiato (Gogh)",
	window_background_opacity = 0.6,
	macos_window_background_blur = 20,
	window_decorations = "RESIZE",
	font = wezterm.font("Comic Code Ligatures"),
	font_size = 12.0,
	hide_tab_bar_if_only_one_tab = true,
	keys = {
		{ key = "LeftArrow", mods = "CMD", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "RightArrow", mods = "CMD", action = act.SendKey({ key = "e", mods = "CTRL" }) },
		{ key = "Backspace", mods = "CMD", action = act.SendKey({ key = "u", mods = "CTRL" }) },
	},
}
