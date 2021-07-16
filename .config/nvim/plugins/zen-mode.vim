"===============================================================================
" # Plug 'folke/zen-mode.nvim'
"===============================================================================

nnoremap <leader>z :ZenMode<CR>

lua << EOF
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
EOF

