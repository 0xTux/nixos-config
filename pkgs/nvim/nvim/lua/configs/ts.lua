local on_attach = require("nvchad.configs.lspconfig").on_attach

require("typescript-tools").setup({
  on_attach = on_attach,
})
