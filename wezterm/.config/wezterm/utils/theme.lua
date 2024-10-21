local wezterm = require 'wezterm'
local theme = {}
-- Use wezterm get_appearance function to figure out if winow is in Dark mode or Light mode
theme.get_appearance = function()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

-- Set appropriate theme based on appearance
theme.scheme_for_appearance = function(appearance, light_theme, dark_theme)
  if appearance:find 'Dark' then
    return dark_theme
  else
    return dark_theme
  end
end

return theme
