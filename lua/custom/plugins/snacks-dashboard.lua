-- snacks-dashboard.nvim

art = [[
██╗   ██╗ █████╗ ██╗  ██╗██╗   ██╗██╗  ████████╗██████╗  ██████╗ ████████╗████████╗██╗     ███████╗
╚██╗ ██╔╝██╔══██╗██║ ██╔╝██║   ██║██║  ╚══██╔══╝██╔══██╗██╔═══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
 ╚████╔╝ ███████║█████╔╝ ██║   ██║██║     ██║   ██████╔╝██║   ██║   ██║      ██║   ██║     █████╗  
  ╚██╔╝  ██╔══██║██╔═██╗ ██║   ██║██║     ██║   ██╔══██╗██║   ██║   ██║      ██║   ██║     ██╔══╝  
   ██║   ██║  ██║██║  ██╗╚██████╔╝███████╗██║   ██████╔╝╚██████╔╝   ██║      ██║   ███████╗███████╗
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═════╝  ╚═════╝    ╚═╝      ╚═╝   ╚══════╝╚══════╝
]]

local function open_project(path)
  vim.cmd('cd ' .. path)
  vim.cmd 'Neotree filesystem reveal current'
end

local function open_neotree()
  vim.cmd 'bd'
  vim.cmd 'Neotree filesystem toggle position=current'
end

return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      preset = {
        header = art,
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = ' ', key = 'p', desc = 'Browse files', action = open_neotree },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header', padding = 1 },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1, action = open_project },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
