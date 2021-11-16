local languages = {}

-- LSP language servers
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations

-- Servers with default configuration
local lsp_servers = {}

-- Bash
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
table.insert(lsp_servers, 'bashls')

-- CSS
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
-- table.insert(lsp_servers, 'cssls')

-- HTML
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#htmtsserverl
table.insert(lsp_servers, 'html')

-- Initialize default configuration for lsp_servers
require('plugins/lsp/servers/default')(lsp_servers)

-- LSP servers with custom configuration

-- Docker
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
require('plugins/lsp/servers/dockerls')

-- TypeScript
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
-- require('plugins/lsp/servers/tsserver')

-- Markdown
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#zeta_note
require('plugins/lsp/servers/zeta-note')

-- Treesitter language parsers
--- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
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
--- https://github.com/rafamadriz/friendly-snippets#snippets-for
languages.snippets = {
  -- 'css',
  -- 'html',
  -- 'sass',
  'shell',
  -- 'typescript',
  -- 'typescriptreact'
}

return languages
