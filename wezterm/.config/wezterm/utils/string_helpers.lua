local wezterm = require("wezterm")
local string_helpers = {}

string_helpers.basename = function(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

return string_helpers
