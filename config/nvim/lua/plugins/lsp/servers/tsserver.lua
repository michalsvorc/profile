-- TypeScript
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

local lspconfig = require('lspconfig')
local flags = require('plugins/lsp/flags')
local on_attach = require('plugins/lsp/on_attach')

lspconfig['tsserver'].setup{
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative", -- "shortest" | "project-relative" | "relative" | "non-relative"
    }
  },
  on_attach = function(client, buffer)
    on_attach(client, buffer)

    -- Use efm language server for document formatting
    client.resolved_capabilities.document_formatting = false

    -- Utilities to improve the TypeScript development experience.
    --- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
    local ts_utils = require('nvim-lsp-ts-utils')

    ts_utils.setup {
      enable_import_on_completion = true,
      import_all_select_source = true,
    }

    ts_utils.setup_client(client)

  end
}

