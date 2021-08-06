-- https://github.com/nvim-telescope/telescope.nvim

require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.95,
      }
    },
  },
})

-- Keymap
local opt = {noremap = true, silent = false}

vim.api.nvim_set_keymap('', '<F2>', '<cmd>lua require("telescope.builtin").find_files()<cr>', opt)
vim.api.nvim_set_keymap('', '<F3>', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opt)
vim.api.nvim_set_keymap('', '<F4>', '<cmd>lua require("telescope.builtin").buffers()<cr>', opt)
