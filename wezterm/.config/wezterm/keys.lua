local wezterm = require("wezterm")
local act = wezterm.action
local keys = {}

keys = {
-- General
-- Switch to a monitoring workspace, which will have `top` launched into it

{
  key = "W",
  mods = "LEADER",
  action = act.PromptInputLine({
    description = wezterm.format({
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { AnsiColor = "Fuchsia" } },
      { Text = "Enter name for new workspace" },
    }),
  action = wezterm.action_callback(function(window, pane, line)
  -- line will be `nil` if they hit escape without entering anything
  -- An empty string if they just hit enter
  -- Or the actual line of text they wrote
    if line then
      window:perform_action(
        act.SwitchToWorkspace({
          name = line,
        }),
        pane
      )
    end
  end),
}),
},
{ key = ".", mods = "LEADER", action = act.SwitchWorkspaceRelative(1) },
{ key = ",", mods = "LEADER", action = act.SwitchWorkspaceRelative(-1) },
{ key = "CapsLock", mods = "NONE", action = act.SendKey { key = 'Escape'} },
{
  mods = "LEADER",
  key = "c",
  action = act.SpawnTab("CurrentPaneDomain"),
},
{
  mods = "LEADER",
  key = "x",
  action = act.CloseCurrentPane({ confirm = false }),
},
{
  mods = "LEADER",
  key = "b",
  action = act.ActivateTabRelative(-1),
},
{
  mods = "LEADER",
  key = "n",
  action = act.ActivateTabRelative(1),
},
{
  mods = "LEADER",
  key = "s",
  action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
},
{
  mods = "LEADER",
  key = "-",
  action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
},
  {
    mods = "LEADER",
    key = "t",
    action = act.SplitPane({
      direction = "Down",
      size = { Percent = 30 }
    })
  },

{
  mods = "LEADER",
  key = "h",
  action = act.ActivatePaneDirection("Left"),
},
{
  mods = "LEADER",
  key = "j",
  action = act.ActivatePaneDirection("Down"),
},
{
  mods = "LEADER",
  key = "k",
  action = act.ActivatePaneDirection("Up"),
},
{
  mods = "LEADER",
  key = "l",
  action = act.ActivatePaneDirection("Right"),
},
{
  mods = "LEADER",
  key = "LeftArrow",
  action = act.AdjustPaneSize({ "Left", 5 }),
},
{
  mods = "LEADER",
  key = "RightArrow",
  action = act.AdjustPaneSize({ "Right", 5 }),
},
{
  mods = "LEADER",
  key = "DownArrow",
  action = act.AdjustPaneSize({ "Down", 5 }),
},
{
  mods = "LEADER",
  key = "UpArrow",
  action = act.AdjustPaneSize({ "Up", 5 }),
},
  -- Copy Mode
  {
    mods = "LEADER",
    key = "v",
    action = act.ActivateCopyMode,
  }
}

return keys
