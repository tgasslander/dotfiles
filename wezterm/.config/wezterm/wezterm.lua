local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "catppuccin-frappe"
config.enable_tab_bar = false -- We don't do tabs because we have tmux, tiling wm, etc.
config.window_close_confirmation = "NeverPrompt" -- Exit without confirmation
config.window_decorations = "RESIZE" -- Remove ugly decorations

-- Avoid clashing with i3 (CMD|SHIFT+R to reload the i3 config)
config.keys = {
	{
		key = "z",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

return config
