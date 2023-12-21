return {
   {
      "EdenEast/nightfox.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         require('nightfox').setup {
            options = {
               transparent = true,
            }
         }
         vim.cmd.colorscheme "carbonfox"
      end,
   },
   {
      'olivercederborg/poimandres.nvim',
      lazy = false,
      priority = 1000,
      config = function()
         require('poimandres').setup {
            disable_background = true,
         }
      end,
   }
}
