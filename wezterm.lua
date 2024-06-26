local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

config.color_scheme = "GruvboxDark"
config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	weight = "Regular",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 20
config.macos_window_background_blur = 20
config.window_background_opacity = 0.3
config.background = {
	{
		source = {
			File = wezterm.home_dir .. "/.config/wezterm/catto.jpg",
		},
		opacity = 1,
		repeat_x = "NoRepeat",
		horizontal_align = "Right",
		vertical_align = "Bottom",
		hsb = {
			brightness = 0.5,
			hue = 1.0,
			saturation = 1.0,
		},
	},
}

config.window_background_image_hsb = {}
config.enable_tab_bar = false
config.native_macos_fullscreen_mode = true
config.disable_default_key_bindings = true

wezterm.on("gui-startup", function()
	local _, pane, window = mux.spawn_window({})
	local gui_window = window:gui_window()
	gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.keys = {
	{ key = "Enter", mods = "CMD", action = wezterm.action.ToggleFullScreen },
	{ key = "+", mods = "CMD", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "c", mods = "CMD|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "f", mods = "CMD", action = wezterm.action.Search({ CaseSensitiveString = "" }) },
}

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
