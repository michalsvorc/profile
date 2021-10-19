-- https://github.com/folke/zen-mode.nvim

require("zen-mode").setup {
  window = {
    width = 1,
    height = 1,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      cursorline = true,
      cursorcolumn = false,
      foldcolumn = "0",
      list = false,
    },
  },
}

