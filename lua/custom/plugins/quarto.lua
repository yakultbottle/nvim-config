-- quarto.nvim
return {
  'quarto-dev/quarto-nvim',
  dependencies = {
    'jmbuhr/otter.nvim',
    'nvim-treesitter/nvim-treesitter',
  },

  ft = { 'quarto', 'markdown' },

  -- Attempt to solve python issues
  init = function()
    local cwd = vim.fn.getcwd()

    local venv_path = nil
    if vim.fn.isdirectory(cwd .. '/.venv') == 1 then
      venv_path = cwd .. '/.venv/bin/python3'
    elseif vim.fn.isdirectory(cwd .. '/venv') == 1 then
      venv_path = cwd .. '/venv/bin/python3'
    elseif vim.env.VIRTUAL_ENV then
      venv_path = vim.env.VIRTUAL_ENV .. '/bin/python3'
    end

    vim.g.python3_host_prog = venv_path or vim.fn.exepath 'python3'
  end,

  opts = {
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      chunks = 'curly',
      languages = { 'python' },
      diagnostics = {
        enabled = true,
        triggers = { 'BufWritePost' },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = 'molten',
      ft_runners = {},
      never_run = { 'yaml' },
    },
  },

  config = function(_, opts)
    local quarto = require 'quarto'
    quarto.setup(opts)

    local runner = require 'quarto.runner'

    vim.keymap.set('n', '<localleader>rc', runner.run_cell, { desc = 'run cell', silent = true })
    vim.keymap.set('n', '<localleader>ra', runner.run_above, { desc = 'run cell and above', silent = true })
    vim.keymap.set('n', '<localleader>rA', runner.run_all, { desc = 'run all cells', silent = true })
    vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'run line', silent = true })
    vim.keymap.set('v', '<localleader>r', runner.run_range, { desc = 'run visual range', silent = true })
    vim.keymap.set('n', '<localleader>RA', function()
      runner.run_all(true)
    end, { desc = 'run all cells of all languages', silent = true })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
