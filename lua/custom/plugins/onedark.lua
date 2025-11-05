return {
  -- Disable the kickstart colorscheme
  { 'folke/tokyonight.nvim', enabled = false },

  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
      require('onedark').load()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
