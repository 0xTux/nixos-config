return {
   'nvim-neo-tree/neo-tree.nvim',
   lazy = false,
   cmd = 'Neotree',
   branch = 'v3.x',

   dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
   },
   config = {
      filesystem = {
         follow_current_file = { enabled = true },
         hijack_netrw_behavior = 'open_default',
         filtered_items = { visible = true },
         use_libuv_file_watcher = true,
      },
      git_status = {
         symbols = {
            -- Change type
            added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = '✖', -- this can only be used in the git_status source
            renamed = '󰁕', -- this can only be used in the git_status source
            -- Status type
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
         },
      },
   },
}
