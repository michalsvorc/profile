-- https://github.com/TimUntersberger/neogit

vim.api.nvim_set_keymap('n', '<leader>g', ':Neogit<CR>', {noremap = false, silent = false})

local neogit = require("neogit")

neogit.setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
  },
}

-- Keymap
vim.api.nvim_set_keymap('n', '<leader>g', ':Neogit<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>d', ':DiffviewOpen<CR>', {noremap = false, silent = false})

