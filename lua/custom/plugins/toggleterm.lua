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

    function _G.toggle_lazygit()
      if not lazygit:is_open() then
        lazygit:shutdown()
      end

      lazygit:toggle()
    end

    vim.keymap.set('n', '<leader>g', _G.toggle_lazygit, { desc = 'Toggle Lazygit', noremap = true, silent = true })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
