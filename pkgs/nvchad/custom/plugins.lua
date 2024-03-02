local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },
  -- Need to setup properly
  -- {
  -- 	"stevearc/conform.nvim",
  -- 	event = "BufWritePre",
  -- 	config = function()
  -- 		require("custom.configs.conform")
  -- 	end,
  -- },
  -- {
  -- 	"mfussenegger/nvim-lint",
  -- 	lazy = true,
  -- 	event = { "BufReadPre", "BufNewFile" },
  -- 	config = function()
  -- 		require("custom.configs.nvim-lint")
  -- 	end,
  -- },
  {
    "Shatur/neovim-session-manager",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    event = "BufWritePost",
    cmd = "SessionManager",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = function()
      return require("custom.configs.noice")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
}

return plugins
