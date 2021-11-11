-- https://github.com/neovim/nvim-lspconfig

local lspconfig = require('lspconfig')
local languages_lsp = require('languages').lsp()
local on_attach = require('plugins/lsp/on_attach')

local flags = {
  debounce_text_changes = 150,
}

for _, server in ipairs(languages_lsp) do

  -- TypeScript
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
  if (server == 'tsserver') then
    lspconfig[server].setup{
      init_options = {
        preferences = {
          importModuleSpecifierPreference = "relative", -- "shortest" | "project-relative" | "relative" | "non-relative"
        }
      },
      flags = flags,
      on_attach = function(client, buffer)
        on_attach(client, buffer)

        -- Use efm language server for document formatting
        client.resolved_capabilities.document_formatting = false

        -- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
        local ts_utils = require('nvim-lsp-ts-utils')

        ts_utils.setup {
          enable_import_on_completion = true,
          import_all_select_source = true,
        }

        ts_utils.setup_client(client)

      end
    }

    do break end
  end

  -- Default
  lspconfig[server].setup{
    on_attach = on_attach,
    flags = flags
  }
end

