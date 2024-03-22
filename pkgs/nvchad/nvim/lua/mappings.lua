require("nvchad.mappings")

local map = vim.keymap.set

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

local closeAllBuffer = function()
  require("nvchad.tabufline").closeAllBufs()
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
map("n", "<leader>o", "<cmd>Outline<cr>", { desc = "Toggle Outline" })
map("n", "<leader>tn", "<cmd>Boole increment<cr>", { desc = "Increase value" })
map("n", "<leader>tp", "<cmd>Boole decrement<cr>", { desc = "Decrease value" })
map("n", "<leader>X", closeAllBuffer, { desc = "Close all buffers" })

-- DAP
map("n", "<C-b>", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle break point" })
map("n", "<C-c>", "<cmd>DapContinue<cr>", { desc = "Continue" })
map("n", "<C-x>", "<cmd>DapTerminate<cr>", { desc = "Terminate" })
map("n", "<C-o>", "<cmd>DapStepOver<cr>", { desc = "Step over" })

-- Go To Tab
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end
