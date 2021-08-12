-- https://github.com/ray-x/lsp_signature.nvim

local icons = require('icons')

local config = {
  hint_prefix = icons.symbols.variable ..' ',
  use_lspsaga = false,
}

return config
