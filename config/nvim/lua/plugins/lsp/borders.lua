-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
-- https://neovim.io/doc/user/api.html#nvim_open_win()

local border = 'single'

vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
