-- Link: https://github.com/hoob3rt/lualine.nvim

local lsp_status = require('lsp-status')
local icons = require('icons')

lsp_status.config {
  indicator_info = icons.diagnostics.information,
  indicator_errors = icons.diagnostics.error,
  indicator_hint= icons.diagnostics.hint,
  status_symbol= '',
}

require('lualine').setup {
  options = {
    theme = 'codedark',
    component_separators = {nil, nil},
    section_separators = {nil, nil},
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}},
      "encoding",
      "fileformat",
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  extensions = {'nvim-tree', 'quickfix'},
lsp_status.status
}
