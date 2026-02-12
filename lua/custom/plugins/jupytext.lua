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
    local jupytext = require("jupytext")
    jupytext.setup({
      style = 'markdown',
      output_extension = 'md',
      force_ft = 'markdown',
    })

    -- function to initialize molten buffer and import outputs
    local function imb(e)
      vim.schedule(function()
        local kernels = vim.fn.MoltenAvailableKernels()
        local try_kernel_name = function()
          local f = io.open(e.file, "r")
          if not f then return nil end
          local metadata = vim.json.decode(f:read("a"))
          f:close()
          return metadata and metadata.metadata and metadata.metadata.kernelspec and metadata.metadata.kernelspec.name
        end

        local ok, kernel_name = pcall(try_kernel_name)
        if not ok or not vim.tbl_contains(kernels, kernel_name) then
          kernel_name = nil
          local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
          if venv then
            kernel_name = string.match(venv, "/.+/(.+)")
          end
        end

        if kernel_name and vim.tbl_contains(kernels, kernel_name) then
          vim.cmd(("MoltenInit %s"):format(kernel_name))
        end

        vim.cmd("MoltenImportOutput")
      end)
    end

    -- autocmd to import outputs when opening ipynb
    vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter" }, {
      pattern = "*.ipynb",
      callback = function(e)
        if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 or e.event == "BufAdd" then
          imb(e)
        end
      end,
    })

    -- autocmd to export outputs on save
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.ipynb",
      callback = function()
        if require("molten.status").initialized() == "Molten" then
          vim.cmd("MoltenExportOutput!")
        end
      end,
    })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
