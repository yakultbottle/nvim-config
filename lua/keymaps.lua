-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to clipboard' })
vim.keymap.set('n', '<leader>d', '"_d', { desc = 'Delete to void' })
vim.keymap.set('v', '<leader>d', '"_d', { desc = 'Delete to void' })
vim.keymap.set('n', '<leader>D', '"_D', { desc = 'Delete line to void' })
vim.keymap.set('n', '<leader>c', '"_c', { desc = 'Change to void' })
vim.keymap.set('v', '<leader>c', '"_c', { desc = 'Change to void' })
vim.keymap.set('n', '<leader>C', '"_C', { desc = 'Change line to void' })
-- vim.keymap.set('v', '<leader>p', '_dP', { desc = 'Paste without overwriting clipboard' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.bo.buftype ~= '' then
      return
    end

    local dir = vim.fn.expand '%:p:h'
    if dir == '' then
      return
    end

    vim.cmd('lcd ' .. vim.fn.fnameescape(dir))
  end,
})

-- vim: ts=2 sts=2 sw=2 et
