local M = {}

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
    "regex",
    "bash",
    "markdown",
    "markdown_inline",

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
    "templ",

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
    "htmx-lsp",
    "prettier",
    "prettierd",
    "eslint-lsp",
    "eslint_d",
    "tailwindcss-language-server",

    -- nix
    "nil",

    -- go
    "gopls",
    "templ",

    -- rust
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
