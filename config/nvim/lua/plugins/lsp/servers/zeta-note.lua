-- Markdown
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#zeta_note

local lspconfig = require('lspconfig')
local flags = require('plugins/lsp/options/flags')
local capabilities = require('plugins/lsp/options/capabilities')
local on_attach = require('plugins/lsp/on_attach')
local bin_root = '/usr/local/bin'

lspconfig['zeta_note'].setup{
  cmd = {bin_root .. '/zeta-note'},
  filetypes = { 'markdown' },
  root_dir = lspconfig.util.root_pattern('.git', '.profile'),
  flags = flags,
  capabilities = capabilities,
  on_attach = on_attach
}

