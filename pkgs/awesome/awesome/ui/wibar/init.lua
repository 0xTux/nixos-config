local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local module = require(... .. ".module")

-- Function to create a capsule widget
local function create_capsule_widget(content_widget)
  local capsule = wibox.widget({
    {
      {
        content_widget,
        widget = wibox.container.margin,
        margins = {
          top = dpi(8),
          bottom = dpi(8),
          left = dpi(8),
          right = dpi(8),
        },
      },
      widget = wibox.container.background,
      shape_border_color = "#272727",
      shape_border_width = 1,

      shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
      end,
      bg = beautiful.bg_systray,
    },
    widget = wibox.container.margin,
    margins = beautiful.useless_gap,
  })

  return capsule
end

return function(s)
  -- Create the wibox
  s.mywibox = awful.wibar({
    position = "top",
    height = dpi(45),
    screen = s,
    bg = beautiful.bg_normal,
    widget = {
      widget = wibox.container.margin,
      left = beautiful.useless_gap,
      right = beautiful.useless_gap,
      {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        {
          layout = wibox.layout.fixed.horizontal,
          create_capsule_widget(module.layoutbox()),
          module.tasklist(s),
        },
        {
          layout = wibox.layout.fixed.horizontal,
          module.taglist(s),
        },
        {
          layout = wibox.layout.fixed.horizontal,
          create_capsule_widget(module.profile()),
          create_capsule_widget(module.gpu()),
          create_capsule_widget(module.tailscale()),
          create_capsule_widget(module.battery()),
          create_capsule_widget(module.systray()),
          create_capsule_widget(wibox.widget.textclock()),
        },
      },
    },
  })
end
