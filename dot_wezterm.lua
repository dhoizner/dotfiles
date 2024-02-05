local w = require("wezterm")
local act = w.action
local mux = w.mux

-- https://github.com/mrjones2014/smart-splits.nvim#wezterm
-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_VIM == "true"
end

-- TODO: make it work
local function is_helix(pane) end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

return {
	color_scheme = "Catppuccin Frappe",
	-- color_scheme = "Catppuccin Macchiato (Gogh)",
	-- window_background_opacity = 0.6,
	-- macos_window_background_blur = 20,
	window_decorations = "RESIZE",
	font = w.font("Comic Code Ligatures"),
	font_size = 12.0,
	hide_tab_bar_if_only_one_tab = true,
	leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		-- { key = 'o', mods = 'CTRL', action = act.ShowDebugOverlay},
		-- move between split panes
		split_nav("move", "h"),
		split_nav("move", "j"),
		split_nav("move", "k"),
		split_nav("move", "l"),
		-- resize panes
		split_nav("resize", "h"),
		split_nav("resize", "j"),
		split_nav("resize", "k"),
		split_nav("resize", "l"),
		{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "f", mods = "LEADER", action = act.TogglePaneZoomState },
		{ key = "Space", mods = "LEADER", action = act.RotatePanes("Clockwise") },
		{ key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "c", mods = "LEADER", action = act.QuickSelect },
		{ key = "0", mods = "LEADER", action = act.PaneSelect({ mode = "SwapWithActive" }) },
		-- { key = '', mods = 'LEADER', action = act.ActivateKeyTable { name = 'mux' } },
		{ key = "LeftArrow", mods = "CMD", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "RightArrow", mods = "CMD", action = act.SendKey({ key = "e", mods = "CTRL" }) },
		{ key = "Backspace", mods = "CMD", action = act.SendKey({ key = "u", mods = "CTRL" }) },
	},
}
