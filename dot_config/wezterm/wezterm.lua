local k = require("utils/keys")

local w = require("wezterm")
local act = w.action

return {
	-- disable_default_key_bindings = true,
	color_scheme = "Catppuccin Frappe",
	window_decorations = "RESIZE",
	font = w.font_with_fallback({
		{ family = "Comic Code Ligatures" },
		-- { family = "FiraCode Nerd Font Mono" },
		{ family = "Symbols Nerd Font Mono" },
	}),
	font_size = 12.0,
	hide_tab_bar_if_only_one_tab = true,

	set_environment_variables = {
		TERM = "xterm-256color",
	},

	-- keys
	keys = {
		k.cmd_key("f", k.multiple_actions(":Grep")),
		k.cmd_key("q", k.multiple_actions(":qa!")),
		k.cmd_to_tmux_prefix("1", "1"),
		k.cmd_to_tmux_prefix("2", "2"),
		k.cmd_to_tmux_prefix("3", "3"),
		k.cmd_to_tmux_prefix("4", "4"),
		k.cmd_to_tmux_prefix("5", "5"),
		k.cmd_to_tmux_prefix("6", "6"),
		k.cmd_to_tmux_prefix("7", "7"),
		k.cmd_to_tmux_prefix("8", "8"),
		k.cmd_to_tmux_prefix("9", "9"),
		k.cmd_to_tmux_prefix("`", "n"),
		k.cmd_to_tmux_prefix("b", "B"),
		k.cmd_to_tmux_prefix("C", "C"),
		k.cmd_to_tmux_prefix("d", "D"),
		k.cmd_to_tmux_prefix("G", "G"),
		k.cmd_to_tmux_prefix("g", "g"),
		k.cmd_to_tmux_prefix("K", "T"),
		k.cmd_to_tmux_prefix("k", "K"),
		k.cmd_to_tmux_prefix("l", "L"),
		k.cmd_to_tmux_prefix("n", '"'),
		k.cmd_to_tmux_prefix("N", "%"),
		k.cmd_to_tmux_prefix("o", "u"),
		k.cmd_to_tmux_prefix("T", "!"),
		k.cmd_to_tmux_prefix("t", "c"),
		k.cmd_to_tmux_prefix("w", "x"),
		k.cmd_to_tmux_prefix("z", "z"),
		k.cmd_to_tmux_prefix("Z", "Z"),

		k.cmd_key(
			"s",
			act.Multiple({
				act.SendKey({ key = "\x1b" }), -- escape
				k.multiple_actions(":w"),
			})
		),

		{
			mods = "CTRL",
			key = "Tab",
			action = act.Multiple({
				act.SendKey({ mods = "CTRL", key = "b" }),
				act.SendKey({ key = "n" }),
			}),
		},

		{
			mods = "CTRL|SHIFT",
			key = "Tab",
			action = act.Multiple({
				act.SendKey({ mods = "CTRL", key = "b" }),
				act.SendKey({ key = "n" }),
			}),
		},
	},
}
