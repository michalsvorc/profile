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

vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>lua require("telescope.builtin").commands()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>lua require("telescope.builtin").file_browser()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").oldfiles()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>lua require("telescope.builtin").loclist()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>lua require("telescope.builtin").marks()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>lua require("telescope.builtin").search_history()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fp', '<cmd>lua require("telescope.builtin").spell_suggest()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fq', '<cmd>lua require("telescope.builtin").quickfix()<cr>', opt)
