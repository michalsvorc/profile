-- https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  ensure_installed = require('languages').treesitter,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true -- NOTE: This is an experimental feature.
  },
  context_commentstring = { -- JoosepAlviste/nvim-ts-context-commentstring
    enable = true
  },
  matchup = {
    enable = true, -- andymass/vim-matchup
  },
}
