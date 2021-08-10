-- https://github.com/kosayoda/nvim-lightbulb

local icons = require('icons')

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
vim.fn.sign_define('LightBulbSign', { text = icons.lightbulb })
