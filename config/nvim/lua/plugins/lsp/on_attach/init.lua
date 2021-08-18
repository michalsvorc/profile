-- Use an on_attach function to only map other functions
-- after the language server attaches to the current buffer.
return function(client, bufnr)
  local keymap = require('plugins.lsp.on_attach.keymap')(client, bufnr)
  local signs = require('plugins.lsp.on_attach.signs')
  local lightbulb = require('plugins.lsp.on_attach.lightbulb')
  local borders = require('plugins.lsp.on_attach.borders')
  local illuminate = require('illuminate').on_attach(client)
  local lsp_signature = require('lsp_signature').on_attach(
    require('plugins.lsp.on_attach.signature')
  )

  -- Use efm language server for document formatting
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
end


