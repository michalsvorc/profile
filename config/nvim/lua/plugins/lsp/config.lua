-- https://github.com/neovim/nvim-lspconfig

local lspconfig = require('lspconfig')
local servers = {}

-- Bash
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
table.insert(servers, 'bashls')
lspconfig.bashls.setup{}

-- TypeScript
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver
--table.insert(servers, 'tsserver')
--lspconfig.tsserver.setup{}

-- Use an on_attach function to only map other functions
-- after the language server attaches to the current buffer.
local on_attach = function(client, bufnr)
  local keymap = require('plugins.lsp.keymap')(client, bufnr)
  local lightbulb = require('plugins.lsp.lightbulb')
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
