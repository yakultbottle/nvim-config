-- jupytext.nvim
return {
  'GCBallesteros/jupytext.nvim',
  lazy = false,

  opts = {
    style = 'markdown',
    output_extension = 'md',
    force_ft = 'markdown',
  },

  config = function()
    local jupytext = require 'jupytext'
    jupytext.setup {
      style = 'markdown',
      output_extension = 'md',
      force_ft = 'markdown',
    }

    -- function to initialize molten buffer and import outputs
    local imb = function(e) -- init molten buffer
      vim.schedule(function()
        local kernels = vim.fn.MoltenAvailableKernels()
        local try_kernel_name = function()
          local metadata = vim.json.decode(io.open(e.file, 'r'):read 'a')['metadata']
          return metadata.kernelspec.name
        end
        local ok, kernel_name = pcall(try_kernel_name)
        if not ok or not vim.tbl_contains(kernels, kernel_name) then
          kernel_name = nil
          local venv = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX'
          if venv ~= nil then
            kernel_name = string.match(venv, '/.+/(.+)')
          end
        end
        if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
          vim.cmd(('MoltenInit %s'):format(kernel_name))
        end
        vim.cmd(("MoltenImportOutput %s"):format(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.' )))
      end)
    end

    vim.api.nvim_create_autocmd('BufAdd', {
      pattern = { '*.ipynb' },
      callback = imb,
    })

    -- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = { '*.ipynb' },
      callback = function(e)
        if vim.api.nvim_get_vvar 'vim_did_enter' ~= 1 then
          imb(e)
        end
      end,
    })

    -- autocmd to export outputs on save
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = { '*.ipynb' },
      callback = function()
        if require('molten.status').initialized() == 'Molten' then
          vim.cmd(("MoltenExportOutput! %s"):format(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.' )))
        end
      end,
    })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
