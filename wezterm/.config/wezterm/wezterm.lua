local wezterm = require 'wezterm'
local utils = require 'utils'
local keys = require 'keys'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Set keymaps to those defines in keys.lua file
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keys

-- General settings
config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = false
config.color_scheme = utils.scheme_for_appearance(utils.get_appearance())

return config
