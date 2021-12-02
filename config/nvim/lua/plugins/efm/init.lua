-- efm language server
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#efm

local lspconfig = require("lspconfig")

-- Formatters
-- Dependencies: prettier
local prettier = require("plugins.efm.prettier")

-- Linters
-- Dependencies: eslint
local eslint = require("plugins.efm.eslint")

-- Filetypes
local efm_filetypes = {
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  json = {prettier},
  html = {prettier},
  -- scss = {prettier},
  markdown = {prettier},
}

-- Setup
lspconfig.efm.setup{
  root_dir = function(fname)
    return lspconfig.util.root_pattern("tsconfig.json", ".git")(fname);
  end,
  filetypes = vim.tbl_keys(efm_filetypes),
  init_options = {
    documentFormatting = true,
    codeAction = true,
  },
  settings = {
    rootMarkers = {".eslintrc.json", ".eslintrc.js", ".eslintrc", ".git/", 'yarn.lock', '.profile'},
    languages = efm_filetypes,
    log_level = 1,
  },
}

