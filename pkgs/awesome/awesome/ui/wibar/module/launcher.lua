local awful = require("awful")
local beautiful = require("beautiful")

-- Create a launcher widget. Opens the Awesome menu when clicked.
return function()
  return awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = require("ui.menu").main,
  })
end
