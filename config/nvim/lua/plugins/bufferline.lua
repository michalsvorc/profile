-- https://github.com/akinsho/nvim-bufferline.lua

-- You need to be using termguicolors for this plugin to work,
-- as it reads the hex gui color values of various highlight groups.

require('bufferline').setup {
  options = {
    numbers = "ordinal",
    number_style = "none",
    diagnostics = "nvim_lsp",
    right_mouse_command = nil,
    left_mouse_command = nil,
    middle_mouse_command = nil,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = false,
    always_show_bufferline = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
  }
}

-- Keymap
local opts = {noremap=false, silent=false}

--- Move to previous/next.
vim.api.nvim_set_keymap('n', '<A-k>', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-j>', ':BufferLineCyclePrev<CR>', opts)

--- Re-order to previous/next.
vim.api.nvim_set_keymap('n', '<C-A-k>', ':BufferLineMoveNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-A-j>', ':BufferLineMovePrev<CR>', opts)

--- Close buffer.
vim.api.nvim_set_keymap('n', '<A-w>', ':bdelete!<CR>', opts)

--- Goto buffer in position.
vim.api.nvim_set_keymap('n', '<A-1>', ':buffer 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-2>', ':buffer 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-3>', ':buffer 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-4>', ':buffer 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-5>', ':buffer 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-6>', ':buffer 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-7>', ':buffer 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-8>', ':buffer 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-9>', ':buffer 9<CR>', opts)
