-- leetcode.nvim
return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    lang = "python3",
    -- picker = "telescope",
  },
}
-- vim: ts=2 sts=2 sw=2 et
