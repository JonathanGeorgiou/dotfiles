local wezterm = require 'wezterm'
local utils = {}
-- Use wezterm get_appearance function to figure out if winow is in Dark mode or Light mode
utils.get_appearance = function()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

-- Set appropriate theme based on appearance
utils.scheme_for_appearance = function(appearance)
  if appearance:find 'Dark' then
    return 'catppuccin-mocha'
  else
    return 'catppuccin-latte'
  end
end

return utils
