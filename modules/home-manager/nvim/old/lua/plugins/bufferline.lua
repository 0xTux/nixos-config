return {
   'akinsho/bufferline.nvim',
   version = 'v3.*',
   dependencies = 'nvim-tree/nvim-web-devicons',
   config = {
      options = {
         offsets = {
            {
               filetype = 'neo-tree',
               text = 'NeoTree',
               text_align = 'left',
               separator = true,
            },
         },
      },
   },
}
