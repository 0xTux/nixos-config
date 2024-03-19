local prettier = { "prettierd", "prettier" }

local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { prettier },
    typescript = { prettier },
    javascriptreact = { prettier },
    typescriptreact = { prettier },
    json = { prettier },
    jsonc = { prettier },
    css = { prettier },
    html = { prettier },
    markdown = { prettier },
    nix = { "alejandra" },
    go = { "goimports", "gofumpt" },
    rust = { "rust_analyzer" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
}

require("conform").setup(options)
