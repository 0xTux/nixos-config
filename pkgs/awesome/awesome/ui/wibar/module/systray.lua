-- SysTray widget for Awesome Window Manager
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")

local systray = wibox.widget({
  widget = wibox.container.margin,
  enable_overlay = false,
  -- margins = {
  --   top = dpi(6),
  --   bottom = dpi(6),
  -- },
  wibox.widget.systray(),
})

return function()
  return systray
end
