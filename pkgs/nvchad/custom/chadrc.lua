local M = {}

M.ui = {
  theme = "oxocarbon",
  transparency = true,
  nvdash = {
    load_on_startup = true,

    header = {
      "|------------------------|",
      "|   NOBODY FUX WITH TUX  |",
      "|------------------------|",
      "        \\ (•◡•) /         ",
      "         \\     /          ",
    },
  },
}

M.mappings = require("custom.mappings")
M.plugins = "custom.plugins"

return M
