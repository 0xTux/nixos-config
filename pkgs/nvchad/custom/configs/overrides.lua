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

    -- web dev
    "css-lsp",
    "html-lsp",
    "prettierd",
    "eslint-lsp",
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

return M
