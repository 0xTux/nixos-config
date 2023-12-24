local M = {}

M.opt = {
	guifont = "FiraCode Nerd Font:h8",
	neovide_scale_factor = 0.6,
}

M.colorscheme = "gruvbox-baby" --"carbonfox"
M.icons = {
	VimIcon = "",
	ScrollText = "",
	GitBranch = "",
	GitAdd = "",
	GitChange = "",
	GitDelete = "",
}
M.heirline = {
	separators = {
		left = { "", " " },
		right = { " ", "" },
		tab = { "", "" },
	},
	colors = function(hl)
		local get_hlgroup = require("astronvim.utils").get_hlgroup
		local comment_fg = get_hlgroup("Comment").fg
		hl.git_branch_fg = comment_fg
		hl.git_added = comment_fg
		hl.git_changed = comment_fg
		hl.git_removed = comment_fg
		hl.blank_bg = get_hlgroup("Folded").fg
		hl.file_info_bg = get_hlgroup("Visual").bg
		hl.nav_icon_bg = get_hlgroup("String").fg
		hl.nav_fg = hl.nav_icon_bg
		hl.folder_icon_bg = get_hlgroup("Error").fg
		return hl
	end,
	attributes = {
		mode = { bold = true },
	},
	icon_highlights = {
		file_icon = {
			statusline = false,
		},
	},
}
M.plugins = {
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			opts.section.header.val = {
				"██████████████████████████████████████████████████",
				"█░░░░░░░░░░░░░░█░░░░░░██░░░░░░█░░░░░░░░██░░░░░░░░█",
				"█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀▄▀░░██░░▄▀▄▀░░█",
				"█░░░░░░▄▀░░░░░░█░░▄▀░░██░░▄▀░░█░░░░▄▀░░██░░▄▀░░░░█",
				"█████░░▄▀░░█████░░▄▀░░██░░▄▀░░███░░░░▄▀▄▀▄▀░░░░███",
				"█████░░▄▀░░█████░░▄▀░░██░░▄▀░░█████░░▄▀▄▀▄▀░░█████",
				"█████░░▄▀░░█████░░▄▀░░██░░▄▀░░███░░░░▄▀▄▀▄▀░░░░███",
				"█████░░▄▀░░█████░░▄▀░░░░░░▄▀░░█░░░░▄▀░░██░░▄▀░░░░█",
				"█████░░▄▀░░█████░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀░░██░░▄▀▄▀░░█",
				"█████░░░░░░█████░░░░░░░░░░░░░░█░░░░░░░░██░░░░░░░░█",
				"██████████████████████████████████████████████████",
			}
		end,
	},
	{ "wakatime/vim-wakatime" },
	{ "eandrju/cellular-automaton.nvim", event = "VeryLazy" },
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.utility.noice-nvim" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.nix" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.prisma" },
	{ import = "astrocommunity.colorscheme.nightfox-nvim" },
	{ import = "astrocommunity.colorscheme.gruvbox-baby" },
	{
		"gruvbox-baby",
		config = function()
			vim.g.gruvbox_baby_background_color = "dark"
			vim.g.gruvbox_baby_color_overrides = {
				background = "#0f0f0f",
			}
		end,
	},
	{
		"nightfox.nvim",
		opts = {
			options = {
				-- transparent = function()
				-- 	if vim.g.neovide then
				-- 		return false
				-- 	end
				-- 	return true
				-- end,
			},
		},
	},
	{
		"David-Kunz/gen.nvim",
		config = function()
			require("gen").setup({
				model = "zephyr",
				display_mode = "float",
				show_prompt = true,
				show_model = true,
				no_auto_close = false,
				init = function()
					pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
				end,
				debug = false,
			})
		end,
	},
	{
		"rebelot/heirline.nvim",
		opts = function(_, opts)
			local status = require("astronvim.utils.status")
			opts.statusline = {
				hl = { fg = "fg", bg = "bg" },
				status.component.mode({
					mode_text = { icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
					surround = {
						separator = "left",
						color = function()
							return { main = status.hl.mode_bg(), right = "blank_bg" }
						end,
					},
				}),
				status.component.builder({
					{ provider = "" },
					surround = { separator = "left", color = { main = "blank_bg", right = "file_info_bg" } },
				}),
				status.component.file_info({
					file_icon = { padding = { left = 0 } },
					filename = { fallback = "Empty" },
					padding = { right = 1 },
					surround = { separator = "left", condition = false },
				}),
				status.component.git_branch({ surround = { separator = "none" } }),
				status.component.git_diff({ padding = { left = 1 }, surround = { separator = "none" } }),
				status.component.fill(),
				status.component.lsp({ lsp_client_names = false, surround = { separator = "none", color = "bg" } }),
				status.component.fill(),
				status.component.diagnostics({ surround = { separator = "right" } }),
				status.component.lsp({ lsp_progress = false, surround = { separator = "right" } }),
				{
					status.component.builder({
						{ provider = require("astronvim.utils").get_icon("FolderClosed") },
						padding = { right = 1 },
						hl = { fg = "bg" },
						surround = { separator = "right", color = "folder_icon_bg" },
					}),
					status.component.file_info({
						filename = {
							fname = function(nr)
								return vim.fn.getcwd(nr)
							end,
							padding = { left = 1 },
						},
						file_icon = false,
						file_modified = false,
						file_read_only = false,
						surround = { separator = "none", color = "file_info_bg", condition = false },
					}),
				},
				{
					status.component.builder({
						{ provider = require("astronvim.utils").get_icon("ScrollText") },
						padding = { right = 1 },
						hl = { fg = "bg" },
						surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
					}),
					status.component.nav({
						percentage = { padding = { right = 1 } },
						ruler = false,
						scrollbar = false,
						surround = { separator = "none", color = "file_info_bg" },
					}),
				},
			}
			return opts
		end,
	},
}
M.lsp = {
	config = {
		lua_ls = function()
			return {
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
					},
				},
			}
		end,
	},
}
return M
