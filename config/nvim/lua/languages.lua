local languages = {}
local lsp_servers = {}

-- LSP language servers

-- Bash
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
table.insert(lsp_servers, 'bashls')

-- Docker
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
require('plugins/lsp/servers/dockerls')

-- Initialize LSP servers with default configuration
require('plugins/lsp/servers/default')(lsp_servers)

-- Treesitter language parsers
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
languages.treesitter = {
  'bash',
  'dockerfile',
  'json',
  'lua',
  'yaml',
}

-- Language snippets
-- https://github.com/rafamadriz/friendly-snippets/wiki
languages.snippets = {
  'shell',
}

return languages
