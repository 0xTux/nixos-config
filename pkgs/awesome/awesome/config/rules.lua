local awful = require("awful")
local ruled = require("ruled")

--- Rules.
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule({
    id = "global",
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
  })

  -- Floating clients.
  ruled.client.append_rule({
    id = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class = {
        "Arandr",
        ".blueman-manager-wrapped",
        "Gpick",
        "wezterm-floating",
      },
    },
    properties = {
      floating = true,
      placement = awful.placement.centered,
    },
  })

  -- Add titlebars to normal clients and dialogs.
  -- ruled.client.append_rule({
  --   id = "titlebars",
  --   rule_any = { type = { "normal", "dialog" } },
  --   properties = { titlebars_enabled = true },
  -- })

  -- Map newly created windows to specific tags
  ruled.client.append_rule({
    rule = { class = "org.wezfurlong.wezterm" },
    properties = { screen = 1, tag = "1" },
  })

  ruled.client.append_rule({
    rule = { class = "neovide" },
    properties = { screen = 1, tag = "1" },
  })

  ruled.client.append_rule({
    rule = { class = "firefox" },
    properties = { screen = 1, tag = "3" },
  })

  ruled.client.append_rule({
    rule = { class = "Thunar" },
    properties = { screen = 1, tag = "3" },
  })

  ruled.client.append_rule({
    rule = { class = "discord" },
    properties = { screen = 1, tag = "4" },
  })
end)
