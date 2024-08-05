local awful = require("awful")
local naughty = require("naughty")
local ruled = require("ruled")

--- Notifications
ruled.notification.connect_signal("request::rules", function()
  -- All notifications will match this rule.
  ruled.notification.append_rule({
    rule = nil,
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 5,
    },
  })
end)

-- Defines the default notification layout.
naughty.connect_signal("request::display", function(n)
  naughty.layout.box({ notification = n })
end)
