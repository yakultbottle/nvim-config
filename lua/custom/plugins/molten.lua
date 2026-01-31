-- molten.nvim
return {
  'benlubas/molten-nvim',
  version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
  dependencies = { '3rd/image.nvim' },
  build = ':UpdateRemotePlugins',

  init = function()
    vim.g.molten_auto_open_output = false
    vim.g.molten_image_provider = 'image.nvim'
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_wrap_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
  end,

  config = function()
    vim.keymap.set('n', '<leader>mi', ':MoltenInit<CR>', { silent = true, desc = 'Initialize Molten' })
    -- vim.keymap.set('n', '<leader>e', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'Run operator selection' })

    vim.keymap.set('n', '<leader>rl', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'Evaluate line' })
    vim.keymap.set('n', '<leader>rr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 'Re-evaluate cell' })
    vim.keymap.set('v', '<leader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'Evaluate visual selection' })
    vim.keymap.set('n', '<leader>rd', ':MoltenDelete<CR>', { silent = true, desc = 'molten delete cell' })

    vim.keymap.set('n', '<leader>oh', ':MoltenHideOutput<CR>', { silent = true, desc = 'hide output' })
    vim.keymap.set('n', '<leader>os', ':noautocmd MoltenEnterOutput<CR>', { silent = true, desc = 'show/enter output' })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
