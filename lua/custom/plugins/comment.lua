-- comment.nvim
return {
  'numToStr/Comment.nvim',
  opts = {
    mappings = {
      basic = false,
      extra = false,
    },
    ignore = '^$',
  },

  config = function(_, opts)
    require('Comment').setup(opts)

    local api = require 'Comment.api'

    vim.keymap.set('n', '<C-_>', function()
      api.toggle.linewise.current()
    end)

    vim.keymap.set('x', '<C-_>', function()
      local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.locked 'toggle.linewise'(vim.fn.visualmode())
      vim.cmd 'normal! gv'
    end)
  end,
}
-- vim: ts=2 sts=2 sw=2 et
