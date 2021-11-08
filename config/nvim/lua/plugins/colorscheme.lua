-- Colorspace setup
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- https://github.com/EdenEast/nightfox.nvim

local nightfox = require('nightfox')

nightfox.setup({
  fox = "nordfox",
  styles = {
    comments = "italic",
    keywords = "italic",
  },
  hlgroups = {
    TSVariable = { fg = '#cc887c' },
    Comment = { fg = '#918ba1' },
  },
})

nightfox.load()
