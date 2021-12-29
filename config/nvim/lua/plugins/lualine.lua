-- https://github.com/hoob3rt/lualine.nvim

local lsp_status = require('lsp-status')
local icons = require('icons')

lsp_status.config {
  indicator_info = icons.diagnostics.info,
  indicator_errors = icons.diagnostics.error,
  indicator_hint= icons.diagnostics.hint,
  status_symbol= '',
}

local colors = require('nightfox.colors').load('nordfox')

require('lualine').setup {
  options = {
    theme = "nightfox",
    component_separators = {nil, nil},
    section_separators = {nil, nil},
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {
      "filename",
      {
        "diff",
        diff_color = {
          added = { fg = colors.green_br },
          modified = { fg = colors.blue_br },
          removed = { fg = colors.red_br },
        }
      },
      {"diagnostics", sources = {"nvim_diagnostic"}}
    },
    lualine_x = {
      "filetype",
      "encoding",
      "fileformat",
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  extensions = {'nvim-tree', 'quickfix'},
  lsp_status.status
}
