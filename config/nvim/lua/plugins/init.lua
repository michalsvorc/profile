-- Plugins
require('plugins.autopairs')
require('plugins.bufferline')
require('plugins.compe')
require('plugins.gitblame')
require('plugins.floatterm')
require('plugins.indent-blankline')
require('plugins.keymap')
require('plugins.lf')
require('plugins.lualine')
require('plugins.luasnip')
require('plugins.nvim-tree')
require('plugins.rest-nvim')
require('plugins.scalpel')
require('plugins.telescope')
require('plugins.trouble')
require('plugins.treesitter')

-- Loading order is important
require('plugins.colorscheme')
require('plugins.zenmode')

-- Imperative setup
require('gitsigns').setup()
require('numb').setup()

