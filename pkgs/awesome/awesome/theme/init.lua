-- Theme handling library
local beautiful = require("beautiful")
-- Standard awesome library
local gears = require("gears")

-- Themes define colors, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/default.lua")
