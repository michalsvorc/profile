-- Link: https://github.com/hoob3rt/lualine.nvim

local lsp_status = require('lsp-status')
local icons = require('icons')

lsp_status.config {
  indicator_info = icons.diagnostics.info,
  indicator_errors = icons.diagnostics.error,
  indicator_hint= icons.diagnostics.hint,
  status_symbol= '',
}

require('lualine').setup {
  options = {
    theme = 'jellybeans',
    component_separators = {nil, nil},
    section_separators = {nil, nil},
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {
      "filename",
      "diff",
      {"diagnostics", sources = {"nvim_lsp"}}
    },
    lualine_x = {
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

-- Custom diff status colors
vim.cmd[[highlight DiffAdd ctermfg=28 guifg=#9aaf6a]]
vim.cmd[[highlight DiffChange ctermfg=31 guifg=#8298c0]]
vim.cmd[[highlight DiffDelete ctermfg=124 guifg=#d06a4b]]
