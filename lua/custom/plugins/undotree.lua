-- undotree.nvim
return {
  'jiaoshijie/undotree',
  dependencies = { 'nvim-lua/plenary.nvim' },
  ---@module 'undotree.collector'
  ---@type UndoTreeCollector.Opts
  opts = {
    -- your options
  },
  keys = {
    {
      '<leader>u',
      function() require('undotree').toggle() end,
      desc = 'Open UndoTree',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
