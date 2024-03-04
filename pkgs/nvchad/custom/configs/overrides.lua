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
  },
}

M.nvterm = {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = "editor",
        row = 0.23,
        col = 0.15,
        width = 0.7,
        height = 0.5,
        border = "single",
      },
    },
  },
}

M.telescope = {
  defaults = {
    winblend = 40,
    pumblend = 40,
  },
}

return M
