-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
-- https://neovim.io/doc/user/api.html#nvim_open_win()

local bg = '#383d47'
local border = 'single'

vim.cmd('highlight NormalFloat ctermfg=fg ctermbg=bg guifg=fg guibg='..bg)
vim.cmd('highlight FloatBorder ctermfg=fg ctermbg=bg guifg=fg guibg='..bg)
vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
