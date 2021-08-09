local icons = require('icons')

-- Diagnostics
local diagnostics_signs = {
  Error = icons.Error,
  Warning = icons.Warning,
  Hint = icons.Hint,
  Information = icons.Information
}

for type, icon in pairs(diagnostics_signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Autocomplete
local autocomplete_signs = {
  Class = icons.Class ..' (Class)',
  Color = icons.Color ..' (Color)',
  Constant = icons.Constant ..' (Constant)',
  Constructor = icons.Constructor ..' (Constructor)',
  Enum = icons.Enum ..' (Enum)',
  EnumMember = icons.EnumMember ..' (EnumMember)',
  Field = icons.Field ..' (Field)',
  File = icons.File ..' (File)',
  Folder = icons.Folder ..' (Folder)',
  Function = icons.Function ..' (Function)',
  Interface = icons.Interface ..' (Interface)',
  Keyword = icons.Keyword ..' (Keyword)',
  Method = icons.Method ..' (Method)',
  Module = icons.Module ..' (Module)',
  Property = icons.Property ..' (Property)',
  Snippet = icons.Snippet ..' (Snippet)',
  Struct = icons.Struct ..' (Struct)',
  Text = icons.Text ..' (Text) ',
  Unit = icons.Unit ..' (Unit)',
  Value = icons.Value ..' (Value)',
  Variable = icons.Variable ..'[(Variable)',
  Reference = icons.Reference ..' (Reference)',
  Event = icons.Event ..' (Event)',
  Operator = icons.Operator ..' (Operator)',
  TypeParameter = icons.TypeParameter ..' (TypeParameter)',
}

for kind, symbol in pairs(autocomplete_signs) do
  local kinds = vim.lsp.protocol.CompletionItemKind
  local index = kinds[kind]

  if index ~= nil then
    kinds[index] = symbol
  end
end

