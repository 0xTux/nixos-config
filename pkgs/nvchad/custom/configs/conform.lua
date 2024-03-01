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
  },
}

require("conform").setup(options)
