-- toggleterm.nvim
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<C-`>]],
    direction = 'horizontal',
  },

  config = function(_, opts)
    require('toggleterm').setup(opts)

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      displayname = 'lazygit',
      direction = 'tab',
    }

    vim.keymap.set('n', '<leader>g', function()
      lazygit:toggle()
    end, { desc = 'Toggle Lazygit', noremap = true, silent = true })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
