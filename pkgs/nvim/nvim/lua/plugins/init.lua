local overrides = require("configs.overrides")

local plugins = {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("configs.conform")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        winblend = 0,
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "make",
    opts = function()
      return require("configs.avante")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
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
      return require("configs.noice")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("configs.null-ls")
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
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
  },
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle" },
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    opts = {},
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    config = true,
  },
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = function()
      require("neodev").setup({
        library = {
          plugins = { "nvim-dap-ui" },
          types = true,
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("configs.dap")
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "nat-418/boole.nvim",
    event = "VeryLazy",
    config = function()
      require("boole").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require("colorizer").setup()
    end,
  },
  -- Language specific plugins
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("configs.ts")
    end,
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    event = { "CmdlineEnter" },
    config = function()
      require("configs.go")
    end,
    ft = {
      "go",
      "gomod",
      "gosum",
      "gowork",
      "gotmpl",
    },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    "mrcjkb/rustaceanvim",
    config = function()
      require("configs.rust")
    end,
    version = "^4",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    ft = { "rust" },
  },
  {
    "OXY2DEV/markview.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "ibhagwan/smartyank.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.smart-yank")
    end,
  },
}
return plugins
