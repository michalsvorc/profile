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

local keymap = require('plugins.lsp.keymap')

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches.
-- Use an on_attach function to only map the keymap
-- after the language server attaches to the current buffer.
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = keymap,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

