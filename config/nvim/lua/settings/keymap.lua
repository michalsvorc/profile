-- Leader key
vim.g.mapleader = ','
local opts = {noremap = true, silent = false}

-- Prevent CTRL+Z suspending the instance.
vim.api.nvim_set_keymap('n', '<c-z>', '<nop', opts)

-- Toggle spelling
vim.api.nvim_set_keymap('n', '<F7>', ':setlocal spell!<CR>', opts)

