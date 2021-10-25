-- Initialize plugins after the language server attaches to the current buffer.
 function on_attach(client, bufnr)
  require('plugins.lsp.keymap')(client, bufnr)
  require('plugins.lsp.signs')
  require('plugins.lsp.lightbulb')
  require('plugins.lsp.borders')
  require('illuminate').on_attach(client)
  require('lsp_signature').on_attach(
    require('plugins.lsp.signature')
  )
  require('plugins.lsp.symbols_outline')

  -- Defined here because it doesn't wor in tsserver.setup
  if client.name == 'tsserver' then
    -- Use efm language server for document formatting
    client.resolved_capabilities.document_formatting = false
  end
end

return on_attach
