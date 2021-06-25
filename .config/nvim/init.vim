"===============================================================================
" # Initial settings
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
" # Plugins
" Link: https://github.com/junegunn/vim-plug#neovim
"
" # System dependencies
" Required: -
" Optional: ripgrep
"===============================================================================

filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'rakr/vim-one'             "https://github.com/rakr/vim-one

" General
Plug 'alvan/vim-closetag'       " https://github.com/alvan/vim-closetag
Plug 'jiangmiao/auto-pairs'     " https://github.com/jiangmiao/auto-pairs
Plug 'tpope/vim-surround'       " https://github.com/tpope/vim-surround
Plug 'tpope/vim-repeat'         " https://github.com/tpope/vim-repeat
Plug 'ap/vim-buftabline'        " https://github.com/ap/vim-buftabline
Plug 'wincent/ferret'           " https://github.com/wincent/ferret
Plug 'tpope/vim-commentary'     " https://github.com/tpope/vim-commentary
Plug 'editorconfig/editorconfig-vim'
  "https://github.com/editorconfig/editorconfig-vim

" Git
Plug 'mhinz/vim-signify'   " https://github.com/mhinz/vim-signify

" Syntax
" - Docker
Plug 'ekalinin/Dockerfile.vim'  " https://github.com/ekalinin/Dockerfile.vim

" Ranger file manager
Plug 'francoiscabrol/ranger.vim'  " https://github.com/francoiscabrol/ranger.vim
Plug 'rbgrouleff/bclose.vim'      " https://github.com/rbgrouleff/bclose.vim

" Initialize plugin system
call plug#end()

"===============================================================================
" # Buffers
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
" # Key bindings
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
" # General
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

" Always show status line, even when 1 window is opened
set laststatus=2

" Disable startup message
set shortmess+=I

" Having longer updatetime (default is 4000 ms) leads to noticeable
" delays and poor user experience.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

"===============================================================================
" # Indentation
"===============================================================================

" Indent
filetype plugin indent on

" show existing tab with N spaces width
set tabstop=2

" when indenting with '>', use N spaces width
set shiftwidth=2

" On pressing tab, insert N spaces
set expandtab

"===============================================================================
" # Syntax
"===============================================================================

" Disable syntax highlighting in vimdiff for better readability
if &diff
  syntax off
endif

"===============================================================================
" # Spelling
"===============================================================================

"set spell
set spelllang=en

"===============================================================================
" # Search
"===============================================================================

set incsearch   " Shows the match while typing
set hlsearch    " Highlight found searches
set ignorecase  " Search case insensitive...
set smartcase   " ...but not when search pattern contains upper case characters

"===============================================================================
" # Scrolling
"===============================================================================

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

"===============================================================================
" # Invisible characters
" "extends" and "precedes" is when long lines are not wrapped
"===============================================================================

set list
set listchars=tab:→\ ,extends:>,precedes:<
set showbreak=↪
set linebreak

"===============================================================================
" # Backup and swap files
"===============================================================================

set nobackup
set nowb
set noswapfile
set nowritebackup

"===============================================================================
" # Vimdiff
"===============================================================================

" Prevent opening files as RO in vimdiff
set noro

"===============================================================================
" # Cursor line
"===============================================================================

set cursorline

" Disable cursor line highlighting in Insert mode
augroup aug_cursor_line
  au!
  au InsertEnter * setlocal nocursorline
  au InsertLeave * setlocal cursorline
augroup END

"===============================================================================
" # Theme
"===============================================================================

" Credit joshdick
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" Link: https://github.com/rakr/vim-one#true-color-support
if (has("nvim"))
  " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
let g:one_allow_italics = 1
colorscheme one

"===============================================================================
" # Status line
"===============================================================================

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
"set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

"===============================================================================
" # Terminal emulator
"===============================================================================

" Map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

"===============================================================================
" # Plug 'francoiscabrol/ranger.vim'
" Link: https://github.com/francoiscabrol/ranger.vim
"===============================================================================

" open ranger when vim open a directory
let g:ranger_replace_netrw = 1
