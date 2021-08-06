-- Diagnostics
local diagnostics_signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(diagnostics_signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Autocomplete
local autocomplete_signs = {
    Class = "   (Class)",
    Color = "   (Color)",
    Constant = "   (Constant)",
    Constructor = "   (Constructor)",
    Enum = " 練 (Enum)",
    EnumMember = "   (EnumMember)",
    Field = " ﴲ  (Field)",
    File = "   (File)",
    Folder = "   (Folder)",
    Function = "   (Function)",
    Interface = " ﰮ  (Interface)",
    Keyword = "   (Keyword)",
    Method = "   (Method)",
    Module = "   (Module)",
    Property = " 襁 (Property)",
    Snippet = " ﬌  (Snippet)",
    Struct = " ﳤ  (Struct)",
    Text = "   (Text) ",
    Unit = "   (Unit)",
    Value = "   (Value)",
    Variable = "[] (Variable)",
    Reference = "   (Reference)",
    Event = "   (Event)",
    Operator = "   (Operator)",
    TypeParameter = "   (TypeParameter)",
}

for kind, symbol in pairs(autocomplete_signs) do
    local kinds = vim.lsp.protocol.CompletionItemKind
    local index = kinds[kind]

    if index ~= nil then
        kinds[index] = symbol
    end
end

