-- https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true -- NOTE: This is an experimental feature.
  },
}
