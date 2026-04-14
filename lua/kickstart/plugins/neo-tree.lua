-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    {
      '<leader>pv',
      '<cmd>Neotree filesystem toggle position=current<CR>',
      desc = 'Project view pane',
    },

    {
      '\\',
      '<cmd>Neotree filesystem toggle position=current<CR>',
      desc = 'Project view pane',
      silent = true,
    },
  },
  opts = {
    filesystem = {
      close_if_last_window = true,
      window = {
        width = 30,
        mappings = {
          ['\\'] = 'close_window',
          ['h'] = 'navigate_up',
          ['l'] = 'open',
        },
      },
    },
  },
}
