-- https://github.com/f-person/git-blame.nvim

local separator= ' | '

vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = '<summary>'..separator..'<date>'..separator..'<author>'..separator..'<sha>'
vim.g.gitblame_date_format = '%r'..separator..'%d.%m.%y %H:%M'

