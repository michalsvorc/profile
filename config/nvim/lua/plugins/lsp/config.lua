-- https://github.com/neovim/nvim-lspconfig

local lsp_config = require('lspconfig')
local servers = require('languages').lsp()

-- Use an on_attach function to only map other functions
-- after the language server attaches to the current buffer.
local on_attach = function(client, bufnr)
  local keymap = require('plugins.lsp.on_attach.keymap')(client, bufnr)
  local signs = require('plugins.lsp.on_attach.signs')
  local lightbulb = require('plugins.lsp.on_attach.lightbulb')
  local borders = require('plugins.lsp.on_attach.borders')
  local illuminate = require('illuminate').on_attach(client)
  local lsp_signature = require('lsp_signature').on_attach(
    require('plugins.lsp.on_attach.signature')
  )
end

for _, server in ipairs(servers) do
  lsp_config[server].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- efm language server
local efm_config = require('plugins.efm.config')

lsp_config.efm.setup(efm_config)
