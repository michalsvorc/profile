-- LSP servers with default configuration
--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations

return function (servers)
  local lspconfig = require('lspconfig')
  local flags = require('plugins/lsp/flags')
  local on_attach = require('plugins/lsp/on_attach')

  for _, server in ipairs(servers) do
    lspconfig[server].setup{
      flags = flags,
      on_attach = on_attach
    }
  end
end

