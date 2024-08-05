local map = vim.keymap.set
local g = vim.g

if g.neovide then
  -- options
  g.neovide_scale_factor = 0.7
  g.neovide_transparency = 0.9
  g.neovide_refresh_rate = 144

  -- bindings
  local zoomInNeovide = function()
    g.neovide_scale_factor = g.neovide_scale_factor + 0.1
  end

  local zoomOutNeovide = function()
    g.neovide_scale_factor = g.neovide_scale_factor - 0.1
  end

  map("n", "<C-=>", zoomInNeovide, { desc = "Zoom In (Neovide)" })
  map("n", "<C-->", zoomOutNeovide, { desc = "Zoom Out (Neovide)" })
end
