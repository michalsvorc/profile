-- LSP signs

local icons = require('icons')

-- Change diagnostic symbols in the sign column (gutter)
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter
local diagnostics_signs = {
  Error = icons.diagnostics.error,
  Warn = icons.diagnostics.warning,
  Hint = icons.diagnostics.hint,
  Info = icons.diagnostics.info,
}

for type, icon in pairs(diagnostics_signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Completion signs
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#completion-kinds
local autocomplete_signs = {
  Class = icons.symbols.class ..' Class',
  Color = icons.symbols.color ..' Color',
  Constant = icons.symbols.constant ..' Constant',
  Constructor = icons.symbols.constructor ..' Constructor',
  Enum = icons.symbols.enum ..' Enum',
  EnumMember = icons.symbols.enum_member ..' EnumMember',
  Field = icons.symbols.field ..' Field',
  File = icons.file.default ..' File',
  Folder = icons.folder.default ..' Folder',
  Function = icons.symbols.function_fn ..' Function',
  Interface = icons.symbols.interface ..' Interface',
  Keyword = icons.symbols.keyword ..' Keyword',
  Method = icons.symbols.method ..' Method',
  Module = icons.symbols.module ..' Module',
  Property = icons.symbols.property ..' Property',
  Snippet = icons.symbols.snippet ..' Snippet',
  Struct = icons.symbols.struct ..' Struct',
  Text = icons.symbols.string ..' Text ',
  Unit = icons.symbols.unit ..' Unit',
  Value = icons.symbols.value ..' Value',
  Variable = icons.symbols.variable ..' Variable',
  Reference = icons.symbols.reference ..' Reference',
  Event = icons.symbols.event ..' Event',
  Operator = icons.symbols.operator ..' Operator',
  TypeParameter = icons.symbols.type_parameter ..' TypeParameter',
}

for kind, symbol in pairs(autocomplete_signs) do
  local kinds = vim.lsp.protocol.CompletionItemKind
  local index = kinds[kind]

  if index ~= nil then
    kinds[index] = symbol
  end
end

