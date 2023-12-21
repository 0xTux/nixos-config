return {
   {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.3',
      lazy = true,
      keys = {
         { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find Files' },
         { '<leader>ft', '<cmd>Telescope live_grep<CR>',  desc = 'Search Text in Files' },
         { '<leader>fb', '<cmd>Telescope buffers<CR>',    desc = 'List Buffers' },
         { '<M-x>',      '<cmd>Telescope commands<CR>',   desc = 'Run Command' },
      },
      dependencies = { 'nvim-lua/plenary.nvim' },
   },
   {
      'nvim-telescope/telescope-media-files.nvim',
      config = function()
         require('telescope').load_extension 'media_files'
      end,
   },
}
