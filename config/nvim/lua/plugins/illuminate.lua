-- https://github.com/RRethy/vim-illuminate

vim.g.Illuminate_delay = 1000
vim.g.Illuminate_highlightUnderCursor = 0

-- Keymap
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})

