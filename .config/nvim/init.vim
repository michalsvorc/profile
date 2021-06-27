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

runtime! partials/plugins.vim

runtime! partials/core.vim
runtime! partials/theme.vim
runtime! partials/statusline.vim
runtime! partials/plugins/ranger.vim

