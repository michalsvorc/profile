-- https://github.com/neovim/nvim-lspconfig

local lsp_config = require('lspconfig')
local servers = require('languages').lsp()
local on_attach = require("plugins.lsp.on_attach")

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
