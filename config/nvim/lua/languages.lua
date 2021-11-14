local lspconfig = require('lspconfig')
local on_attach = require('plugins/lsp/on_attach')
local languages = {}

-- LSP language servers
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations
function languages.lsp()
  local servers = {}

  -- Bash
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
  table.insert(servers, 'bashls')

  -- CSS
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
  -- table.insert(servers, 'cssls')

  -- Docker
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
  table.insert(servers, 'dockerls')

  -- Go
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
  -- table.insert(servers, 'gopls')

  -- HTML
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#htmtsserverl
  -- table.insert(servers, 'html')

  -- TypeScript
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
  -- table.insert(servers, 'tsserver')

  return servers
end

-- Treesitter language parsers
--- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
languages.treesitter = {
  'bash',
  -- 'css',
  'dockerfile',
  -- 'go',
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
  -- 'go',
  -- 'html',
  -- 'sass',
  'shell',
  -- 'typescript',
  -- 'typescriptreact'
}

return languages
