return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      exclude = {
        filetypes = {
          'alpha',
          'dashboard',
          'help',
          'packer',
          'TelescopePrompt',
          'TelescopeResults',
          '',
        },
        buftypes = {
          'terminal',
          'nofile',
          'prompt',
          'quickfix',
        },
      },
    },
  },
}
