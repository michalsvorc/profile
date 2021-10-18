-- https://github.com/neovim/nvim-lspconfig

local lsp_config = require('lspconfig')
local servers = require('languages').lsp()

-- Initialize plugins after the language server attaches to the current buffer.
local on_attach = function(client, bufnr)
  local keymap = require('plugins.lsp.keymap')(client, bufnr)
  local signs = require('plugins.lsp.signs')
  local lightbulb = require('plugins.lsp.lightbulb')
  local borders = require('plugins.lsp.borders')
  local illuminate = require('illuminate').on_attach(client)
  local lsp_signature = require('lsp_signature').on_attach(
    require('plugins.lsp.signature')
  )
  require('plugins.lsp.symbols_outline')

  -- Language servers
  --- TypeScript
  if client.name == 'tsserver' then
    -- Use efm language server for document formatting
    client.resolved_capabilities.document_formatting = false

    local ts_utils = require('nvim-lsp-ts-utils')

    ts_utils.setup {
      update_imports_on_move = true,
      require_confirmation_on_move = true,
      watch_dir = nil,
    }

    ts_utils.setup_client(client)
  end
end

-- efm language server
lsp_config.efm.setup(require('plugins.efm.config'))

for _, server in ipairs(servers) do
  lsp_config[server].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

