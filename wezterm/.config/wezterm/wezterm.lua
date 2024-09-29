local wezterm = require("wezterm")
local theme = require("utils/theme")
local keys = require("keys")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- General settings
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "NONE"

-- Theming
local light_theme = "Catppuccin Latte"
local dark_theme = "Catppuccin Mocha"
config.color_scheme = theme.scheme_for_appearance(theme.get_appearance(), light_theme, dark_theme)

-- Set keymaps to those defines in keys.lua file
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = keys

-- Tab bar
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.tab_max_width = 40

return config
