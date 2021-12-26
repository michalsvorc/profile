-- https://github.com/simrat39/symbols-outline.nvim

local icons = require('icons')

vim.g.symbols_outline = {
  width = 35,
  show_numbers = true,
  symbols = {
    File = {icon = icons.file.default, hl = "TSURI"},
    Module = {icon = icons.symbols.module, hl = "TSNamespace"},
    Namespace = {icon = icons.symbols.namespace, hl = "TSNamespace"},
    Package = {icon = icons.symbols.package, hl = "TSNamespace"},
    Class = {icon = icons.symbols.class, hl = "TSType"},
    Method = {icon = icons.symbols.method, hl = "TSMethod"},
    Property = {icon = icons.symbols.property, hl = "TSMethod"},
    Field = {icon = icons.symbols.field, hl = "TSField"},
    Constructor = {icon = icons.symbols.constructor, hl = "TSConstructor"},
    Enum = {icon = icons.symbols.enum, hl = "TSType"},
    Interface = {icon = icons.symbols.interface, hl = "TSType"},
    Function = {icon = icons.symbols.function_fn, hl = "TSFunction"},
    Variable = {icon = icons.symbols.variable, hl = "TSConstant"},
    Constant = {icon = icons.symbols.constant, hl = "TSConstant"},
    String = {icon = icons.symbols.string, hl = "TSString"},
    Number = {icon = icons.symbols.number, hl = "TSNumber"},
    Boolean = {icon = icons.symbols.boolean, hl = "TSBoolean"},
    Array = {icon = icons.symbols.array, hl = "TSConstant"},
    Object = {icon = icons.symbols.object, hl = "TSType"},
    Key = {icon = icons.symbols.key, hl = "TSType"},
    Null = {icon = icons.symbols.null, hl = "TSType"},
    EnumMember = {icon = icons.symbols.enum_member, hl = "TSField"},
    Struct = {icon = icons.symbols.struct, hl = "TSType"},
    Event = {icon = icons.symbols.event, hl = "TSType"},
    Operator = {icon = icons.symbols.operator, hl = "TSOperator"},
    TypeParameter = {icon = icons.symbols.type_parameter, hl = "TSParameter"}
  }
}
