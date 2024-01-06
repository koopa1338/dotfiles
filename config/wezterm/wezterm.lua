local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("Inconsolata Nerd Font Mono")
config.enable_tab_bar = false
config.color_scheme_dirs = { '/home/koopa/.config/wezterm/' }
config.color_scheme = "Wpgtk"
config.xcursor_theme = "capitaine-dark"
config.use_ime = true
config.use_dead_keys = false
config.xim_im_name = 'fcitx'
config.warn_about_missing_glyphs = false
config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}

config.keys = {
	{ key = "Space", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
	{ key = "n", mods = "SHIFT|CTRL", action = wezterm.action.SpawnWindow },
}

return config
