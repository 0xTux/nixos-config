local awful = require("awful")

awful.spawn.with_shell([[
  if ! pidof barrierc; then
    barrierc -f --debug INFO --display :0 --name esoteric --disable-crypto 192.168.1.2:24800 &
  fi
]])
-- awful.spawn.single_instance("firefox")
-- awful.spawn.single_instance("discord")
-- awful.spawn.single_instance("spotify")
-- awful.spawn.single_instance("copyq")
-- awful.spawn.single_instance("blueman-applet")
