local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- symbols for autocomplete
local lsp_symbols = {
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

for kind, symbol in pairs(lsp_symbols) do
    local kinds = vim.lsp.protocol.CompletionItemKind
    local index = kinds[kind]

    if index ~= nil then
        kinds[index] = symbol
    end
end

