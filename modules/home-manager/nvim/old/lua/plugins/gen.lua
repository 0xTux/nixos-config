return {
   'David-Kunz/gen.nvim',
   config = function()
      vim.keymap.set('v', '<leader>ai', ':Gen<CR>')
      vim.keymap.set('n', '<leader>ai', ':Gen<CR>')
      require('gen').setup({
         model = "zephyr",
         display_mode = "float",
         show_prompt = true,
         show_model = true,
         no_auto_close = false,
         init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
         debug = false 
      })
   end,
}
