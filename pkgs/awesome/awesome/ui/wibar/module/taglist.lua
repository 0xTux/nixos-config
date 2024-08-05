local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

return function(s)
  -- Create a taglist widget
  return awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
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
              id = "text_role",
              widget = wibox.widget.textbox,
            },
            layout = wibox.layout.fixed.horizontal,
          },
          widget = wibox.container.margin,
          margins = { left = dpi(15), right = dpi(15) },
        },
        id = "background_role",
        widget = wibox.container.background,
      },
      widget = wibox.container.margin,
      margins = dpi(6),
    },
  })
end
