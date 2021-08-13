-- https://github.com/windwp/nvim-autopairs

require('nvim-autopairs').setup({
  check_ts = true, --  Use treesitter to check pair.
  disable_filetype = {"TelescopePrompt"},
  enable_check_bracket_line = true,
})

-- Nvim compe integration.
require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true,
  auto_select = false,
})

