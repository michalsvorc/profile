-- Engine: https://github.com/L3MON4D3/LuaSnip

local languages = require('languages').snippets
local loader = require("luasnip/loaders/from_vscode")

loader.load({
  include = languages
})

loader.lazy_load()

