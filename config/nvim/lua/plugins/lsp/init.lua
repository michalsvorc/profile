-- https://github.com/neovim/nvim-lspconfig

local lspconfig = require('lspconfig')
local languages_lsp = require('languages').lsp()
local on_attach = require('plugins/lsp/on_attach')

for _, server in ipairs(languages_lsp) do
  lspconfig[server].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

