-- Link: https://github.com/hoob3rt/lualine.nvim

require('lualine').setup {
  options = {
    theme = 'codedark',
    component_separators = {nil, nil},
    section_separators = {nil, nil},
    },
  extensions = {'fugitive', 'nvim-tree'},
}
