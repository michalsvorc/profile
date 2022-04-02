-- Colorspace setup

if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- https://github.com/EdenEast/nightfox.nvim

local options = {
  styles = {
    comments = "italic",
    functions = "italic",
  },
}

require("nightfox").setup({ options = options })

vim.cmd("colorscheme nordfox")
