-- https://github.com/windwp/nvim-autopairs

require('nvim-autopairs').setup({
  check_ts = true, --  Use treesitter to check pair.
  disable_filetype = {"TelescopePrompt"},
  enable_check_bracket_line = true,
})
