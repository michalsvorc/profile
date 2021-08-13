-- Link: https://github.com/folke/zen-mode.nvim

require("zen-mode").setup {
  window = {
    width = 1,
    height = 1,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
      list = false,
    },
  },
}

-- Keymap
vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<CR>', {noremap=false, silent=false})
