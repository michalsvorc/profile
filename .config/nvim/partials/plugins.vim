"===============================================================================
" # Plugins
" https://github.com/junegunn/vim-plug#neovim
" Dependencies: git
"===============================================================================

filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')

"===============================================================================
" ## Theme
"===============================================================================
" https://github.com/rakr/vim-one
Plug 'rakr/vim-one'

"===============================================================================
" ## General
"===============================================================================

Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ap/vim-buftabline'
Plug 'wincent/ferret'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'

"===============================================================================
" ## Syntax
"===============================================================================

" Docker
Plug 'ekalinin/Dockerfile.vim'

"===============================================================================
" ## Git
" Dependencies: git
"===============================================================================

Plug 'mhinz/vim-signify'

"===============================================================================
" ## Ranger file manager
" Dependencies: ranger
"===============================================================================

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

"===============================================================================
" ## LSP integration
" Dependencies: nodejs
"===============================================================================

" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

