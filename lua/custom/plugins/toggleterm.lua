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
  end,
}
-- vim: ts=2 sts=2 sw=2 et
