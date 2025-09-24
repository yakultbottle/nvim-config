-- snacks-dashboard.nvim

art = [[
██╗   ██╗ █████╗ ██╗  ██╗██╗   ██╗██╗  ████████╗██████╗  ██████╗ ████████╗████████╗██╗     ███████╗
╚██╗ ██╔╝██╔══██╗██║ ██╔╝██║   ██║██║  ╚══██╔══╝██╔══██╗██╔═══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
 ╚████╔╝ ███████║█████╔╝ ██║   ██║██║     ██║   ██████╔╝██║   ██║   ██║      ██║   ██║     █████╗  
  ╚██╔╝  ██╔══██║██╔═██╗ ██║   ██║██║     ██║   ██╔══██╗██║   ██║   ██║      ██║   ██║     ██╔══╝  
   ██║   ██║  ██║██║  ██╗╚██████╔╝███████╗██║   ██████╔╝╚██████╔╝   ██║      ██║   ███████╗███████╗
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═════╝  ╚═════╝    ╚═╝      ╚═╝   ╚══════╝╚══════╝
]]

return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      preset = {
        header = art,
      },
      sections = {
        { section = 'header', padding = 1 },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
