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
" # Terminal emulator
"===============================================================================

" Map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>
