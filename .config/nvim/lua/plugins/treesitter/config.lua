-- https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  ensure_installed = require('languages').treesitter,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  context_commentstring = { -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    enable = true
  },
  matchup = {
    enable = true -- https://github.com/andymass/vim-matchup
  },
  autopairs = {
    enable = true -- https://github.com/windwp/nvim-autopairs
  },
  autotag = {
    enable = true, -- https://github.com/windwp/nvim-ts-autotag
  }
}
