-- Initialize plugins after the language server attaches to the current buffer.
return function (client, bufnr)
  require('plugins.lsp.keymap')(client, bufnr)
  require('plugins.lsp.signs')
  require('plugins.lsp.lightbulb')
  require('plugins.lsp.borders')
  require('illuminate').on_attach(client)
  require('lsp_signature').on_attach(
    require('plugins.lsp.signature')
  )
end
