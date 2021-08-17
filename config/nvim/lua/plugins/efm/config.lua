-- https://github.com/mattn/efm-langserver
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#efm
-- https://github.com/tomaskallup/dotfiles/blob/master/nvim/lua/plugins/nvim-lspconfig.lua
local languages = require('languages').efm

return {
  root_dir = require('lspconfig').util.root_pattern('.git', 'yarn.lock'),
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
    codeAction = true,
  },
  settings = {
    languages = languages,
    log_level = 1,
  },
}

