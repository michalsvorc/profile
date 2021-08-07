local languages = {}

-- LSP language servers
function languages.lsp()
  local lspconfig = require('lspconfig')
  local servers = {}

  -- Bash
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
  --- Execute: npm install -g bash-language-server
  table.insert(servers, 'bashls')
  lspconfig.bashls.setup{}

  -- CSS
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#cssls
  --- Execute: npm install -g vscode-langservers-extracted
  -- table.insert(servers, 'cssls')
  -- lspconfig.cssls.setup{}

  -- Docker
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
  --- Execute: npm install -g dockerfile-language-server-nodejs
  table.insert(servers, 'dockerls')
  lspconfig.dockerls.setup{}

  -- Go
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#gopls
  --- For the most part, you should not need to install or update gopls.
  -- table.insert(servers, 'gopls')
  -- lspconfig.gopls.setup{}

  -- HTML
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html
  --- Execute: npm install -g vscode-langservers-extracted
  -- table.insert(servers, 'html')
  -- lspconfig.html.setup{}

  -- TypeScript
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver
  --- Execute: npm install -g typescript typescript-language-server
  -- table.insert(servers, 'tsserver')
  -- lspconfig.tsserver.setup{}

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

return languages
