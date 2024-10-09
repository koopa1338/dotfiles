local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local setup = {
	check_for_updates = true,
	font = wezterm.font("Inconsolata Nerd Font Mono"),
	font_size = 14,
	color_scheme_dirs = { wezterm.config_dir },
	color_scheme = "Wpgtk",
	xcursor_theme = "capitaine-dark",
	use_dead_keys = false,
	use_ime = true,
	xim_im_name = "ibus",
	warn_about_missing_glyphs = false,
	window_padding = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	},
	enable_tab_bar = true,
	enable_scroll_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	debug_key_events = false,
	keys = {
		{ key = "Space", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
		{ key = "n", mods = "SHIFT|CTRL", action = wezterm.action.SpawnWindow },
	},
}

-- setting config values
for k, v in pairs(setup) do
	config[k] = v
end

return config
