-- This is used later as the default terminal and editor to run.
local apps = {}
apps.terminal = "wezterm"
apps.editor = "nvim"
apps.editor_cmd = apps.terminal .. " -e " .. apps.editor

-- Set the terminal for the menubar.
require("menubar").utils.terminal = apps.terminal

return apps
