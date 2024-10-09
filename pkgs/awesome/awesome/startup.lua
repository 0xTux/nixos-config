local awful = require("awful")

awful.spawn.with_shell([[
  if ! pidof barrierc; then
    barrierc -f --debug INFO --display :0 --name esoteric --disable-crypto 192.168.1.2:24800 &
  fi
]])

-- awful.spawn.single_instance("firefox", {}, function(c)
--   return c.class == "firefox"
-- end)
awful.spawn.single_instance("copyq", {}, function(c)
  return c.class == "copyq"
end)
awful.spawn.single_instance("blueman-applet", {}, function(c)
  return c.class == ".blueman-manager-wrapped"
end)
-- awful.spawn.single_instance("discord", {}, function(c)
--   return c.class == "discord"
-- end)
