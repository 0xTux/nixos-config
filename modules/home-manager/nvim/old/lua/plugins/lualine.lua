return {
   "nvim-lualine/lualine.nvim",
   lazy = false,
   config = function()
      local theme = require("lualine.themes.carbonfox")

      require("lualine").setup({
         options = {
            theme = theme,
            globalstatus = true,
         },
      })
   end
}
