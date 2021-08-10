local icons = require('icons')

-- Diagnostics
local diagnostics_signs = {
  Error = icons.diagnostics.error,
  Warning = icons.diagnostics.warning,
  Hint = icons.diagnostics.hint,
  Information = icons.diagnostics.information
}

for type, icon in pairs(diagnostics_signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Autocomplete
local autocomplete_signs = {
  Class = icons.class ..' (Class)',
  Color = icons.color ..' (Color)',
  Constant = icons.constant ..' (Constant)',
  Constructor = icons.constructor ..' (Constructor)',
  Enum = icons.enum ..' (Enum)',
  EnumMember = icons.enum_member ..' (EnumMember)',
  Field = icons.field ..' (Field)',
  File = icons.file.default ..' (File)',
  Folder = icons.folder.default ..' (Folder)',
  Function = icons.function_fn ..' (Function)',
  Interface = icons.interface ..' (Interface)',
  Keyword = icons.keyword ..' (Keyword)',
  Method = icons.method ..' (Method)',
  Module = icons.module ..' (Module)',
  Property = icons.property ..' (Property)',
  Snippet = icons.snippet ..' (Snippet)',
  Struct = icons.struct ..' (Struct)',
  Text = icons.text ..' (Text) ',
  Unit = icons.unit ..' (Unit)',
  Value = icons.value ..' (Value)',
  Variable = icons.variable ..'[(Variable)',
  Reference = icons.reference ..' (Reference)',
  Event = icons.event ..' (Event)',
  Operator = icons.operator ..' (Operator)',
  TypeParameter = icons.type_parameter ..' (TypeParameter)',
}

for kind, symbol in pairs(autocomplete_signs) do
  local kinds = vim.lsp.protocol.CompletionItemKind
  local index = kinds[kind]

  if index ~= nil then
    kinds[index] = symbol
  end
end

