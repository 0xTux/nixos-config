local awful = require("awful")

local mod = require("binds.mod")
local modkey = mod.modkey

--- Client keybindings.
client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings({
    -- Client state management.
    awful.key({ modkey }, "f", function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end, { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey }, "q", function(c)
      c:kill()
    end, { description = "close", group = "client" }),
    awful.key({ modkey, mod.shift }, "q", function(c)
      if c.pid then
        awful.spawn("kill -9 " .. c.pid)
      end
    end, { description = "force close", group = "client" }),
    awful.key({ modkey }, "space", awful.client.floating.toggle, { description = "toggle floating", group = "client" }),
  })
end)
