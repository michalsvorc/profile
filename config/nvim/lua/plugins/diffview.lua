-- https://github.com/sindrets/diffview.nvim

-- Keymap
vim.api.nvim_set_keymap('n', '<Leader>dd', ':DiffviewOpen<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Leader>dc', ':DiffviewClose<CR>', {noremap = true, silent = false})
