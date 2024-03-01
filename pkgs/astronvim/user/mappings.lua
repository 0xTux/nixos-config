return {
	n = {
		["<C-=>"] = {
			function()
				vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
			end,
			desc = "Zoom In (Neovide)",
		},
		["<C-->"] = {
			function()
				vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
			end,
			desc = "Zoom Out (Neovide)",
		},
		["<leader>ai"] = { ":Gen<CR>", desc = "Run Ollama" },
		["<leader>fml"] = { ":CellularAutomaton make_it_rain<CR>", desc = "FML" },
	},
}
