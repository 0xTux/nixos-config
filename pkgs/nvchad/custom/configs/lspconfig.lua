local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"

local servers = { "tsserver", "tailwindcss", "eslint" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.gopls.setup {
--    on_attach = on_attach,
--    capabilities = capabilities,
--    cmd = { "gopls" },
--    filetypes = { "go", "gomod", "gowork", "gotmpl" },
--    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--    settings = {
--       gopls = {
--          completeUnimported = true,
--          usePlaceholders = true,
--          analyses = {
--             unusedparams = true,
--          },
--       },
--    },
-- }
