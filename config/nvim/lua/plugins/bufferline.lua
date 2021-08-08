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

vim.api.nvim_set_keymap('n', '<A-k>', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-j>', ':BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-A-k>', ':BufferLineMoveNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-A-j>', ':BufferLineMovePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-w>', ':bdelete!<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-s>', ':BufferLinePick<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-x>', ':BufferLinePickClose<CR>', opts)
