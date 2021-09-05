-- Plugins
require('plugins.autopairs')
require('plugins.autosession')
require('plugins.bufferline')
require('plugins.compe')
require('plugins.diffview')
require('plugins.gitblame')
require('plugins.illuminate')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.luasnip')
require('plugins.telescope')
require('plugins.trouble')
require('plugins.treesitter')
require('plugins.zenmode')

-- Direct plugin setup
require('gitsigns').setup()
require('numb').setup()

