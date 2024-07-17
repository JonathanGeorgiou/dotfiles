local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}


if wezterm.config_builder then
  config = wezterm.config_builder()
end
config.debug_key_events = true
config.keys = {
  {
    key = 'S',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      -- Here you can dynamically construct a longer list if needed

      local home = wezterm.home_dir
      local workspaces = {
        { id = home,               label = 'Home' },
        { id = home .. '/.config', label = 'Config' },
      }

      window:perform_action(
        act.InputSelector {
          action = wezterm.action_callback(
            function(inner_window, inner_pane, id, label)
              if not id and not label then
                wezterm.log_info 'cancelled'
              else
                wezterm.log_info('id = ' .. id)
                wezterm.log_info('label = ' .. label)
                inner_window:perform_action(
                  act.SwitchToWorkspace {
                    name = label,
                    spawn = {
                      label = 'Workspace: ' .. label,
                      cwd = id,
                    },
                  },
                  inner_pane
                )
              end
            end
          ),
          title = 'Choose Workspace',
          choices = workspaces,
          fuzzy = true,
          fuzzy_description = 'Fuzzy find and/or make a workspace',
        },
        pane
      )
    end),
  },
}

-- Current working directory
--local cwd = pane:get_current_working_dir()
--if cwd then
--if type(cwd) == "userdata" then
---- Wezterm introduced the URL object in 20240127-113634-bbcac864
--cwd = basename(cwd.file_path)
--else
---- 20230712-072601-f4abf8fd or earlier version
--cwd = basename(cwd)
--end
--else
--cwd = ""
--end

config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = false
-- Appearance
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'catppuccin-mocha'
  else
    return 'catppuccin-latte'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

config.keys = {
  --  This will create a new split and run the `top` program inside it
  {
    key = 's',
    mods = 'ALT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      cwd = cwd,
      size = { Percent = 30 },
    },
  },
  {
    key = 'P',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowLauncher
  },
}

return config
