"===============================================================================
" Version: NVIM v0.5.0-dev+1444-gc1120ad0e
" Releases: https://github.com/neovim/neovim/releases
"===============================================================================

" Use VIM settings rather than Vi settings
if &compatible
  set nocompatible
endif

set encoding=utf-8

" Ask before unsafe actions
set confirm

" Only set syntax highlighting once
if !exists("g:syntax_on")
  syntax enable
endif

" Prevent CTRL+Z suspending the instance
nnoremap <c-z> <nop

" Leader key
let mapleader=","

"===============================================================================
" # Plugin manager
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
Plug 'folke/zen-mode.nvim'

"===============================================================================
" ## Syntax
"===============================================================================

" Docker
Plug 'ekalinin/Dockerfile.vim'

"===============================================================================
" ## Git
" Dependencies: git
"===============================================================================

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"===============================================================================
" ## File icons
" Dependencies: A patched font
"===============================================================================
Plug 'kyazdani42/nvim-web-devicons'

"===============================================================================
" ## File explorers
"===============================================================================
Plug 'kyazdani42/nvim-tree.lua'

"===============================================================================
" ## LSP integration
" Dependencies: nodejs
"===============================================================================

" Initialize plugin system
call plug#end()

"===============================================================================
" # Load partials
"===============================================================================

runtime! partials/core.vim
runtime! partials/theme.vim
runtime! partials/statusline.vim
runtime! partials/plugins/nvim-tree-lua.vim
runtime! partials/plugins/zen-mode.vim
