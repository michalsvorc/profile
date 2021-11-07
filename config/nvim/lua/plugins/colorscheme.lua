-- Colorspace setup
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- https://github.com/EdenEast/nightfox.nvim

local nightfox = require('nightfox')

nightfox.setup({
  fox = "nightfox",
  styles = {
    comments = "italic",
    keywords = "italic",
  },
  colors = {
    bg = '#2f2f2f',
  },
  hlgroups = {
    TSVariable = { fg = '#cc887c' },
    Comment = { fg = '#918ba1' },
  },
})

nightfox.load()
