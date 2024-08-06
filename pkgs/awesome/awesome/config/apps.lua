-- This is used later as the default terminal and editor to run.
local apps = {}
apps.terminal = "wezterm"
apps.terminal_floating = "wezterm start --class wezterm-floating"
apps.editor = "nvim"
apps.editor_cmd = apps.terminal .. " -e " .. apps.editor
apps.neovide = "neovide"
apps.browser = "firefox"
apps.file_explorer = "thunar"

-- Set the terminal for the menubar.
require("menubar").utils.terminal = apps.terminal

return apps
