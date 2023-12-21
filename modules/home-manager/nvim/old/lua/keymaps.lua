local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function defaultOpts(desc)
   if desc == nil then
      return { noremap = true, silent = true }
   else
      return { noremap = true, silent = true, desc = desc }
   end
end

-- Buffer Navigation
keymap.set("n", "<leader>bn", "bnext", defaultOpts("Next Buffer"))
keymap.set("n", "<leader>bp", "bprevious", defaultOpts("Prev Buffer"))
keymap.set("n", "<leader>bb", "e #", defaultOpts("Switch Buffer"))

-- Directory Navigation
keymap.set("n", "<leader>of", ":Neotree toggle<CR>", defaultOpts("Neotree"))

-- Pane and Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", defaultOpts("Navigate Left"))
keymap.set("n", "<C-j>", "<C-w>j", defaultOpts("Navigate Down"))
keymap.set("n", "<C-k>", "<C-w>k", defaultOpts("Navigate Up"))
keymap.set("n", "<C-l>", "<C-w>l", defaultOpts("Navigate Right"))

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", defaultOpts("Split Vertically"))
keymap.set("n", "<leader>sh", ":split<CR>", defaultOpts("Split Horizontally"))

-- Comments
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })
