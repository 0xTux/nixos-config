-- Tailscale widget for Awesome Window Manager
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local tailscale = wibox.widget.textbox("Home: NA")
watch("bash -c \"tailscale ping vega | awk '{print $NF}'\"", 10, function(_, stdout)
  tailscale.text = "Home:" .. " " .. stdout
end)

return function()
  return tailscale
end
