-- https://github.com/rmagatti/auto-session
-- https://github.com/rmagatti/session-lens

require('auto-session').setup {
    pre_save_cmds = {"tabdo NvimTreeClose"}
}

require('session-lens').setup {
  path_display = {'shorten'},
}

-- Keymap
vim.api.nvim_set_keymap('n', '<F3>', ':SearchSession<CR>', {noremap = true, silent = false})

