require("nvchad.mappings")

local map = vim.keymap.set
local g = vim.g

local float_opts = {
  relative = "editor",
  row = 0.13,
  col = 0.14,
  width = 0.7,
  height = 0.7,
  border = "single",
}

local toggleTerm = function()
  require("nvchad.term").toggle({ pos = "float", id = "float", float_opts = float_opts })
end

local toggleLazygit = function()
  require("nvchad.term").toggle({ pos = "float", id = "lazygit", float_opts = float_opts, cmd = "lazygit" })
end

local toggleTreesj = function()
  require("treesj").toggle()
end

map({ "n", "t" }, "<F7>", toggleTerm, { desc = "Toggle Floating Terminal" })
map({ "n", "t" }, "<F8>", toggleLazygit, { desc = "Toggle Lazygit" })
map("n", "<leader>Sl", "<cmd>SessionManager! load_last_session<cr>", { desc = "Load last session" })
map("n", "<leader>Ss", "<cmd>SessionManager! save_current_session<cr>", { desc = "Save this session" })
map("n", "<leader>Sd", "<cmd>SessionManager! delete_session<cr>", { desc = "Delete session" })
map("n", "<leader>Sf", "<cmd>SessionManager! load_session<cr>", { desc = "Search sessions" })
map("n", "<leader>S.", "<cmd>SessionManager! load_current_dir_session<cr>", { desc = "Load current directory session" })
map("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { desc = "Toggle diagnostics" })
map("n", "<leader>td", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<cr>", { desc = "Todo/Fix/Fixme" })
map("n", "<leader>m", toggleTreesj, { desc = "Toggle Treesitter Join" })

if g.neovide then
  local zoomInNeovide = function()
    g.neovide_scale_factor = g.neovide_scale_factor + 0.1
  end

  local zoomOutNeovide = function()
    g.neovide_scale_factor = g.neovide_scale_factor - 0.1
  end

  map("n", "<C-=>", zoomInNeovide, { desc = "Zoom In (Neovide)" })
  map("n", "<C-->", zoomOutNeovide, { desc = "Zoom Out (Neovide)" })
end
