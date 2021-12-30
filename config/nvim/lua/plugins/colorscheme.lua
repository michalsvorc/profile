-- Colorspace setup

if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- https://github.com/EdenEast/nightfox.nvim

local fox = 'nordfox'
local colors = require('nightfox.colors').load(fox)

colors.custom = {
  cursorline = '#39404c',
  comment = '#918ba1'
}

local nightfox = require('nightfox')

nightfox.setup({
  fox = fox,
  styles = {
    comments = "italic",
    functions = "italic",
  },
  colors = {
    gitSigns = {
      add    = colors.green_br,
      change = colors.blue_br,
      delete = colors.red_br,
    },
  },
  hlgroups = {
    Comment = { fg = colors.custom.comment },
    CursorLine = { bg = colors.custom.cursorline },
    NormalFloat = {bg = colors.bg },
    Pmenu = {bg = colors.bg },
    TSVariable = { fg = colors.red_br },
    TSProperty = { fg = colors.blue },
  },
})

nightfox.load()
