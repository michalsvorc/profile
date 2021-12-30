local languages = {}
local lsp_servers = {}

-- LSP language servers

-- Bash
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
table.insert(lsp_servers, 'bashls')

-- CSS
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
-- table.insert(lsp_servers, 'cssls')

-- Docker
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
require('plugins/lsp/servers/dockerls')

-- HTML
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#htmtsserverl
-- table.insert(lsp_servers, 'html')

-- TypeScript
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
-- require('plugins/lsp/servers/tsserver')

-- Initialize LSP servers with default configuration
require('plugins/lsp/servers/default')(lsp_servers)

-- Treesitter language parsers
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
languages.treesitter = {
  'bash',
  -- 'css',
  'dockerfile',
  -- 'html',
  'json',
  'lua',
  -- 'scss',
  -- 'tsx',
  -- 'typescript',
  'yaml',
}

-- Language snippets
-- https://github.com/rafamadriz/friendly-snippets/wiki
languages.snippets = {
  -- 'css',
  -- 'html',
  -- 'sass',
  'shell',
  -- 'typescript',
  -- 'typescriptreact'
}

return languages
