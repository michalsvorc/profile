-- Initialize plugins after the language server attaches to the current buffer.

local icons = require('icons')

return function (client, bufnr)
  require('plugins.lsp.on_attach.borders')
  require('plugins.lsp.on_attach.signs')
  require('plugins.lsp.on_attach.lightbulb')
  require('keymap').on_attach.lsp(client, bufnr)
  require('illuminate').on_attach(client)

  require('lsp_signature').on_attach({
    bind = true,
    hint_prefix = icons.symbols.variable ..' ',
    handler_opts = {
      border = "single"
    }
  }, bufnr)
end
