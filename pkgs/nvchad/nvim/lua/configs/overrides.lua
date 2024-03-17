local M = {}

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",

    -- web dev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",

    -- nix
    "nix",

    -- go
    "go",
    "gomod",
    "gowork",
    "gosum",

    -- rust
    "rust",
  },
}

M.mason = {
  ensure_installed = {
    -- defaults
    "lua-language-server",
    "stylua",
    "luacheck",

    -- web dev
    "css-lsp",
    "html-lsp",
    "prettierd",
    "eslint-lsp",
    "eslint_d",
    "typescript-language-server",
    "tailwindcss-language-server",

    -- nix
    "nil",

    -- rust
    "rust-analyzer",
    "rustfmt",
    "codelldb",
  },
}

M.telescope = {
  defaults = {
    winblend = 40,
    pumblend = 40,
  },
}

return M
