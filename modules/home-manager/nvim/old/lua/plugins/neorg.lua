return {
   "nvim-neorg/neorg",
   build = ":Neorg sync-parsers",
   dependencies = { "nvim-lua/plenary.nvim" },
   config = function()
      require("neorg").setup {
         load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
               config = {
                  workspaces = {
                     snippets = string.format("%s/Projects/notes/snippets", os.getenv("HOME"))
                  },
                  default_workspace = "snippets",
               },
            }
         },
      }
   end,
}
