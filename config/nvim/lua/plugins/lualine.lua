-- Link: https://github.com/hoob3rt/lualine.nvim

local lsp_status = require('lsp-status')
local icons = require('icons')

lsp_status.config {
    indicator_info = icons.Information,
    indicator_errors = icons.Error,
    indicator_hint= icons.Hint,
    status_symbol= '',
}

require('lualine').setup {
  options = {
    theme = 'codedark',
    component_separators = {nil, nil},
    section_separators = {nil, nil},
  },
  sections = {
    lualine_c = {
      'filename',
      lsp_status.status
    }
  },
  extensions = {'nvim-tree', 'quickfix'},
}
