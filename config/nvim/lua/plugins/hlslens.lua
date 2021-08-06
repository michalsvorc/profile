-- https://github.com/kevinhwang91/nvim-hlslens

-- Keymap
local optsTT = {noremap=true, silent=true}
local optsT = {noremap = true}

vim.api.nvim_set_keymap('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", optsTT)
vim.api.nvim_set_keymap('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", optsTT)
vim.api.nvim_set_keymap('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", optsT)
vim.api.nvim_set_keymap('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", optsT)
vim.api.nvim_set_keymap('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", optsT)
vim.api.nvim_set_keymap('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", optsT)

