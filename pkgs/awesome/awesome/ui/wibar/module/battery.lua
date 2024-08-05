-- Battery widget for Awesome Window Manager
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local battery = wibox.widget.textbox("Bat: NA")
watch('bash -c "cat /sys/class/power_supply/BAT0/capacity"', 10, function(_, stdout)
  battery.text = "Bat:" .. " " .. stdout
end)

return function()
  return battery
end
