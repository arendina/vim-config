" ********
" Vimplug
" ********
call plug#begin()

Plug 'kien/ctrlp.vim'           " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'scrooloose/nerdtree'      " A tree explorer plugin for Vim
Plug 'tpope/vim-fugitive'       " the premier Vim plugin for Git
Plug 'Thyrum/vim-stabs'         " Tabs for indentation, spaces for alignment
Plug 'tmhedberg/simpylfold'     " No-BS Python code folding for Vim
Plug 'vim-syntastic/syntastic'  " a syntax checking plugin for Vim created by Martin Grenfell.
Plug 'vim-airline/vim-airline'  " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'  " A collection of themes for vim-airline

" colorschemes
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'          " Retro groove colorscheme for Vim
Plug 'sjl/badwolf'              " A color scheme for Vim, pieced together by Steve Losh.

call plug#end()

" *******
" General
" *******
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=79	" Line wrap (number of cols)
set fileformat=unix 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" ******
" Colors
" ******
colorscheme gruvbox

" Make the gutters darker than the background.
" 0: off, 1: on
" default: 0
" let g:badwolf_darkgutter = 0

" Make the tab line darker than the background. From 0 (darker) to 3 (lighter)
" default: 1
" let g:badwolf_tabline = 1

" Turn off HTML link underlining (0 = off)
" default: 1
" let g:badwolf_html_link_underline = 1
"
" Turn on CSS properties highlighting (default 0 = off)
" default: 0
" let g:badwolf_css_props_highlight = 0

syntax enable   " Enable syntax highlighting

" ************************
" Indentation, Space, Tabs
" ************************
set noexpandtab	    " Use tabs for indentation
set copyindent
set preserveindent
set softtabstop=0	" Number of spaces per Tab when editing
set shiftwidth=4	" Number of auto-indent spaces
set tabstop=4       " Number of visual spaces per tab
set autoindent	    " Auto-indent new lines
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs

" *********
" UI Config
" *********
set number	        " Shows line numbers
set showcmd         " Show command line in bottom bar
set cursorline      " highlight current line
filetype indent on  " load filetype specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when needed
set showmatch       " highlight matching {[()]}
set ruler	        " Show row and column ruler information
set splitbelow      " when horizontal split open a window below
set splitright      " when vertical split open a window at right

" ******
" Search
" ******
set incsearch	" Searches for strings incrementally
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive

" *******
" Folding
" *******
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open close folds
set foldmethod=indent   " fold based on indent level

" ****************
" Leader shortcuts
" ****************
let mapleader=","       " leader is comma

" Buffers
nnoremap <leader>q :bprev<CR><CR>
nnoremap <leader>w :bnext<CR><CR>

" save session
nnoremap <leader>s :mksession<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Fugitive
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>

" ************
" Key Mappings
" ************


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fold/unfold with space
nnoremap <space> za

" highlight last inserted text
nnoremap gV `[v`]

" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" **********
" Autogroups
" **********
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Omnicompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" *******
" Plugins
" *******

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0   " do not load loc_list, it's annoying
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" SimpylFold
let g:SimpylFold_docstring_preview=1

" airline
let g:airline#extensions#tabline#enabled = 1 " enable tabs
let g:airline_theme='gruvbox'
