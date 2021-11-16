  -- Docker
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls

local lspconfig = require('lspconfig')
local flags = require('plugins/lsp/flags')
local on_attach = require('plugins/lsp/on_attach')

lspconfig['dockerls'].setup{
  filetypes = { "dockerfile", "Dockerfile" },
  root_dir = lspconfig.util.root_pattern('Dockerfile', '.git'),
  flags = flags,
  on_attach = on_attach
}

