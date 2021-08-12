-- https://github.com/mhinz/vim-startify

vim.g.startify_padding_left = 3
vim.g.webdevicons_enable_startify = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_session_sort = 1
vim.g.startify_update_oldfiles = 1
vim.g.startify_change_to_dir = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_custom_header = ''

-- Keymap
vim.api.nvim_set_keymap('n', '<Leader>h', ':Startify<CR>', {noremap = true, silent = false})

