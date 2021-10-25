local lspconfig = require('lspconfig')
local on_attach = require('plugins/lsp/on_attach')
local languages = {}

-- Global dependency: Yarn
--- Link: https://github.com/yarnpkg/yarn
--- Execute: npm install --global yarn

-- LSP language servers
--- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#configurations
function languages.lsp()
  local servers = {}

  -- Bash
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
  --- Dependencies: https://github.com/bash-lsp/bash-language-server
  --- Setup:
  table.insert(servers, 'bashls')
  lspconfig.bashls.setup{}

  -- CSS
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#cssls
  --- Dependencies: https://github.com/hrsh7th/vscode-langservers-extracted
  --- Setup:
  -- table.insert(servers, 'cssls')
  -- lspconfig.cssls.setup{}

  -- Docker
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
  --- Dependencies: https://github.com/rcjsuen/dockerfile-language-server-nodejs
  --- Setup:
  table.insert(servers, 'dockerls')
  lspconfig.dockerls.setup{}

  -- Go
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#gopls
  --- Setup:
  -- table.insert(servers, 'gopls')
  -- lspconfig.gopls.setup{}

  -- HTML
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#htmtsserverl
  --- Dependencies: https://github.com/hrsh7th/vscode-langservers-extracted
  --- Setup:
  -- table.insert(servers, 'html')
  -- lspconfig.html.setup{}

  -- TypeScript
  --- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver
  --- Dependencies: https://github.com/theia-ide/typescript-language-server
  --- Setup:
  -- table.insert(servers, 'tsserver')
  -- lspconfig.tsserver.setup{
  --   on_attach = function(client, bufnr)
  --     on_attach(client, bufnr)

  --     local ts_utils = require('nvim-lsp-ts-utils')

  --     ts_utils.setup {
  --       update_imports_on_move = true,
  --       require_confirmation_on_move = true,
  --       watch_dir = nil,
  --     }

  --     ts_utils.setup_client(client)
  --   end
  -- }

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

-- efm language server
--- Link: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#efm
--- Dependencies: https://github.com/mattn/efm-langserver

--- Formatters
---- Dependencies: prettier
local prettier = require("plugins.efm.prettier")

--- Linters
---- Dependencies: eslint_d
local eslint = require("plugins.efm.eslint")

--- Filetypes
local efm_filetypes = {
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  json = {prettier},
  html = {prettier},
  -- scss = {prettier},
  markdown = {prettier},
}

--- Setup:
-- lspconfig.efm.setup{
--   root_dir = require('lspconfig').util.root_pattern('.git', 'yarn.lock'),
--   filetypes = vim.tbl_keys(efm_filetypes),
--   init_options = {
--     documentFormatting = true,
--     codeAction = true,
--   },
--   settings = {
--     languages = efm_filetypes,
--     log_level = 1,
--   },
-- }

return languages
