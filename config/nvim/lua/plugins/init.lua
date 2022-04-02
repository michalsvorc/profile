-- Loading order is important
require('plugins.colorscheme')

-- Plugins
require('plugins.autopairs')
require('plugins.bufferline')
require('plugins.floatterm')
require('plugins.gitsigns')
require('plugins.indent-blankline')
require('plugins.lf')
require('plugins.lualine')
require('plugins.luasnip')
require('plugins.nvim-cmp')
require('plugins.nvim-tree')
require('plugins.rest-nvim')
require('plugins.scalpel')
require('plugins.telescope')
require('plugins.trouble')
require('plugins.treesitter')

-- Loading order is important
require('plugins.zenmode')

-- Imperative setup
require('numb').setup()

-- LSP
require('plugins.lsp.null-ls')
require('plugins.lsp.symbols-outline')

