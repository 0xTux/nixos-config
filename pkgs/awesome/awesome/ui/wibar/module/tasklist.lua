local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

return function(s)
  -- Create a tasklist widget
  return awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    style = {
      shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
      end,
      shape_border_color = "#27272A",
      shape_border_width = dpi(1),
    },
    widget_template = {
      {
        {
          {
            {
              id = "icon_role",
              widget = wibox.widget.imagebox,
            },
            layout = wibox.layout.fixed.horizontal,
          },
          widget = wibox.container.margin,
          margins = dpi(6),
        },
        id = "background_role",
        widget = wibox.container.background,
      },
      widget = wibox.container.margin,
      margins = dpi(6),
    },
  })
end
