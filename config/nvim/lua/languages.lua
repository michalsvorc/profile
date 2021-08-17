local languages = {}

-- LSP language servers
function languages.lsp()
  local lsp_config = require('lspconfig')
  local servers = {}

  -- Bash
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
  --- Execute: npm install -g bash-language-server
  table.insert(servers, 'bashls')
  lsp_config.bashls.setup{}

  -- CSS
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#cssls
  --- Execute: npm install -g vscode-langservers-extracted
  -- table.insert(servers, 'cssls')
  -- lsp_config.cssls.setup{}

  -- Docker
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
  --- Execute: npm install -g dockerfile-language-server-nodejs
  table.insert(servers, 'dockerls')
  lsp_config.dockerls.setup{}

  -- Go
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#gopls
  --- For the most part, you should not need to install or update gopls.
  -- table.insert(servers, 'gopls')
  -- lsp_config.gopls.setup{}

  -- HTML
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html
  --- Execute: npm install -g vscode-langservers-extracted
  -- table.insert(servers, 'html')
  -- lsp_config.html.setup{}

  -- TypeScript
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver
  --- Execute: npm install -g typescript typescript-language-server
  -- table.insert(servers, 'tsserver')
  -- lsp_config.tsserver.setup{}

  return servers
end

-- Treesitter language parsers
--- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
languages.treesitter = {
  'bash',
  -- 'css',
  -- 'dockerfile',
  -- 'go',
  -- 'html',
  'json',
  'lua',
  -- 'scss',
  -- 'tsx',
  -- 'typescript',
  -- 'yaml',
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

-- efm language server
-- https://github.com/mattn/efm-langserver
-- https://github.com/mattn/efm-langserver/releases
-- Dependencies: Have efm-langserver binary available on your $PATH.

-- Dependencies: Have Prettier installed as a node module in your project.
local prettier = require("plugins.efm.prettier")
-- Execute: npm install -g eslint_d
local eslint = require("plugins.efm.eslint")

languages.efm = {
  -- typescript = {prettier, eslint},
  -- javascript = {prettier, eslint},
  -- typescriptreact = {prettier, eslint},
  -- javascriptreact = {prettier, eslint},
  json = {prettier},
  -- html = {prettier},
  -- scss = {prettier},
  markdown = {prettier},
}

return languages
