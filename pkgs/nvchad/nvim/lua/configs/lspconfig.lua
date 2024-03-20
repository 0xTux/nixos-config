local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

local servers = { "tailwindcss", "eslint", "gopls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.nil_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "nil" },
	settings = {
		["nil"] = {
			flake = {
				autoArchive = true,
			},
		},
	},
})
