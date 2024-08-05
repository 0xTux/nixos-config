-- GPU widget for Awesome Window Manager
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local gpu = wibox.widget.textbox("GPU: NA")
watch('bash -c "supergfxctl -g"', 10, function(_, stdout)
  gpu.text = "GPU:" .. " " .. stdout
end)

return function()
  return gpu
end
