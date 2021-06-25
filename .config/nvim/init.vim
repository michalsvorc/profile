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

" LSP integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

"===============================================================================
" # Plug 'neoclide/coc.nvim'
" Link: https://github.com/neoclide/coc.nvim
"===============================================================================

" Give more space for displaying messages.
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
