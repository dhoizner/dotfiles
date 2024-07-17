local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()
wezterm.log_info("reloading")

require("tabs").setup(config)
require("mouse").setup(config)
require("links").setup(config)
require("keys").setup(config)

config.webgpu_power_preference = "HighPerformance"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Colorscheme
-- try tokyo night?
config.color_scheme = "Catppuccin Frappe"

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6

config.term = "wezterm"
config.window_decorations = "RESIZE"

-- Fonts
config.font_size = 11
config.font = wezterm.font_with_fallback({
	{ family = "Comic Code Ligatures" },
	{ family = "FiraCode Nerd Font Mono" },
	{ family = "Symbols Nerd Font Mono" },
})
config.bold_brightens_ansi_colors = true
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
	},
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- 	window_background_opacity = 0.6,
-- 	macos_window_background_blur = 20,
config.scrollback_lines = 10000

-- Command Palette
config.command_palette_font_size = 13
config.command_palette_bg_color = "#394b70"
config.command_palette_fg_color = "#828bb8"

return config

-- local k = require("utils/keys")
-- local cs = require("utils/color_scheme")
--
-- local w = require("wezterm")
-- local act = w.action
--
-- return {
-- 	-- disable_default_key_bindings = true,
-- 	-- color_scheme = "Catppuccin Frappe",
-- 	color_scheme = cs.get_color_scheme(),
-- 	window_decorations = "RESIZE",
-- 	font = w.font_with_fallback({
-- 		{ family = "Comic Code Ligatures" },
-- 		{ family = "FiraCode Nerd Font Mono" },
-- 		{ family = "Symbols Nerd Font Mono" },
-- 	}),
-- 	font_size = 13.0,
-- 	hide_tab_bar_if_only_one_tab = true,
--
-- 	set_environment_variables = {
-- 		TERM = "wezterm",
-- 	},
--
-- 	-- keys
-- 	keys = {
-- 		k.cmd_key("f", k.multiple_actions(":Grep")),
-- 		k.cmd_key("i", k.multiple_actions(":SmartGoTo")),
-- 		k.cmd_key("P", k.multiple_actions(":GoToCommand")),
-- 		k.cmd_key("p", k.multiple_actions(":GoToFile")),
-- 		k.cmd_key("j", k.multiple_actions(":GoToFile")),
-- 		k.cmd_to_tmux_prefix("1", "1"),
-- 		k.cmd_to_tmux_prefix("2", "2"),
-- 		k.cmd_to_tmux_prefix("3", "3"),
-- 		k.cmd_to_tmux_prefix("4", "4"),
-- 		k.cmd_to_tmux_prefix("5", "5"),
-- 		k.cmd_to_tmux_prefix("6", "6"),
-- 		k.cmd_to_tmux_prefix("7", "7"),
-- 		k.cmd_to_tmux_prefix("8", "8"),
-- 		k.cmd_to_tmux_prefix("9", "9"),
-- 		k.cmd_to_tmux_prefix("`", "n"),
-- 		k.cmd_to_tmux_prefix("b", "B"),
-- 		k.cmd_to_tmux_prefix("C", "C"),
-- 		k.cmd_to_tmux_prefix("d", "D"),
-- 		k.cmd_to_tmux_prefix("G", "G"),
-- 		k.cmd_to_tmux_prefix("g", "g"),
-- 		k.cmd_to_tmux_prefix("K", "T"),
-- 		k.cmd_to_tmux_prefix("k", "K"),
-- 		k.cmd_to_tmux_prefix("l", "L"),
-- 		k.cmd_to_tmux_prefix("n", '"'),
-- 		k.cmd_to_tmux_prefix("N", "%"),
-- 		k.cmd_to_tmux_prefix("o", "u"),
-- 		k.cmd_to_tmux_prefix("T", "!"),
-- 		k.cmd_to_tmux_prefix("t", "c"),
-- 		k.cmd_to_tmux_prefix("w", "x"),
-- 		k.cmd_to_tmux_prefix("z", "z"),
-- 		k.cmd_to_tmux_prefix("Z", "Z"),
--
-- 		k.cmd_key(
-- 			"q",
-- 			act.Multiple({
-- 				act.SendKey({ key = "\x1b" }), -- escape
-- 				k.multiple_actions(":qa!"),
-- 			})
-- 		),
--
-- 		k.cmd_key(
-- 			"s",
-- 			act.Multiple({
-- 				act.SendKey({ key = "\x1b" }), -- escape
-- 				k.multiple_actions(":w"),
-- 			})
-- 		),
--
-- 		{
-- 			mods = "CMD|SHIFT",
-- 			key = "}",
-- 			action = act.Multiple({
-- 				act.SendKey({ mods = "CTRL", key = "Space" }),
-- 				act.SendKey({ key = "n" }),
-- 			}),
-- 		},
-- 		{
-- 			mods = "CMD|SHIFT",
-- 			key = "{",
-- 			action = act.Multiple({
-- 				act.SendKey({ mods = "CTRL", key = "Space" }),
-- 				act.SendKey({ key = "p" }),
-- 			}),
-- 		},
--
-- 		{
-- 			mods = "CTRL",
-- 			key = "Tab",
-- 			action = act.Multiple({
-- 				act.SendKey({ mods = "CTRL", key = "Space" }),
-- 				act.SendKey({ key = "n" }),
-- 			}),
-- 		},
--
-- 		{
-- 			mods = "CTRL|SHIFT",
-- 			key = "Tab",
-- 			action = act.Multiple({
-- 				act.SendKey({ mods = "CTRL", key = "Space" }),
-- 				act.SendKey({ key = "n" }),
-- 			}),
-- 		},
--
-- 		{
-- 			mods = "ALT",
-- 			key = "Enter",
-- 			action = w.action.DisableDefaultAssignment,
-- 		},
-- 	},
-- }
