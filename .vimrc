"===============================================================================
" Initial settings
"===============================================================================

" Use VIM settings rather than Vi settings
if &compatible
  set nocompatible
endif

" Ask before unsafe actions
set confirm

" Prevent CTRL+Z suspending the instance
nnoremap <c-z> <nop

" Leader key
let mapleader=","

"===============================================================================
" Buffers
"===============================================================================

" Acces buffer by number
map <Leader>1 :b1<CR>
map <Leader>2 :b2<CR>
map <Leader>3 :b3<CR>
map <Leader>4 :b4<CR>
map <Leader>5 :b5<CR>
map <Leader>6 :b6<CR>
map <Leader>7 :b7<CR>
map <Leader>8 :b8<CR>
map <Leader>9 :b9<CR>
map <Leader>0 :b0<CR>

"===============================================================================
" Key bindings
"===============================================================================

" Disable arrow keys in Normal mode to enforce vim navigation
noremap <silent> <Up>    <Nop>
noremap <silent> <Down>  <Nop>
noremap <silent> <Left>  <Nop>
noremap <silent> <Right> <Nop>

" Cycling through listed buffers
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

"===============================================================================
" General
"===============================================================================

" Show line numbers
set number

" Wrap lines
set wrap

" Prevent unsaved buffer warning when switching buffers
set hidden

" Code folding
set foldenable

" Open splits in more natural locations
set splitbelow
set splitright

" Disable startup message
set shortmess+=I

" Having longer updatetime (default is 4000 ms) leads to noticeable
" delays and poor user experience.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

"===============================================================================
" Indentation
"===============================================================================

" show existing tab with N spaces width
set tabstop=2

" when indenting with '>', use N spaces width
set shiftwidth=2

" On pressing tab, insert N spaces
set expandtab

"===============================================================================
" Syntax
"===============================================================================

" Disable syntax highlighting in vimdiff for better readability
if &diff
  syntax off
endif

"===============================================================================
" Spelling
"===============================================================================

"set spell
set spelllang=en

"===============================================================================
" Search
"===============================================================================

set hlsearch    " Highlight found searches
set ignorecase  " Search case insensitive...
set smartcase   " ...but not when search pattern contains upper case characters

"===============================================================================
" Invisible characters
"===============================================================================

set list
set linebreak

"===============================================================================
" Swap files
"===============================================================================

"set nobackup
"set nowb
"set noswapfile

"===============================================================================
" Vimdiff
"===============================================================================

" Prevent opening files as RO in vimdiff
set noro

"===============================================================================
" Cursor
" block cursor for normal mode
" bar cursor for insert mode
"===============================================================================

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

"===============================================================================
" Cursor line
"===============================================================================
set cursorline

" Disable cursor line highlighting in Insert mode
augroup aug_cursor_line
  au!
  au InsertEnter * setlocal nocursorline
  au InsertLeave * setlocal cursorline
augroup END

"===============================================================================
" Theme
"===============================================================================
set background=dark

"===============================================================================
" Vim-sensible plugin
" Link: https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
" License: Copyright © Tim Pope. Distributed under the same terms as Vim itself.
"===============================================================================

" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.2

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if &laststatus < 2
  set laststatus=2
endif
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" vim:set ft=vim et sw=2:
