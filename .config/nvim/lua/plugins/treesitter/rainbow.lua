-- https://github.com/p00f/nvim-ts-rainbow

require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean.
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int.
  }
}
