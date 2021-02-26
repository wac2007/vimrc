set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

set rtp+=~/.vim/autoload

" -----------------------------------------
"  ALE
"  ----------------------------------------
"
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'
"

let g:ale_linters = {
\ 'typescript': ['eslint', 'tsserver', 'typecheck'],
\ 'typescriptreact': ['eslint', 'tsserver', 'typecheck'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}

let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 1

" Completion
let g:ale_completion_enabled = 1

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_completion_tsserver_autoimport = 1

let g:airline#extensions#ale#enabled = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" Init plugin manager
call plug#begin('~/.vim/plugged')

" https://github.com/preservim/nerdtree
Plug 'scrooloose/nerdtree'

" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

" vim-gutter
" https://vimawesome.com/plugin/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" tagbar
" https://vimawesome.com/plugin/tagbar
Plug 'majutsushi/tagbar'

" editor-config
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" MatchTagAlways
" https://github.com/Valloric/MatchTagAlways
Plug 'Valloric/MatchTagAlways'

" vim-commentary
" gcc command
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" fugitive.vim
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" gitgutter
" https://vimawesome.com/plugin/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" vim-multiple-cursors
" https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" Polyglot
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" vim-swaplines
" https://github.com/skammer/vim-swaplines
Plug 'skammer/vim-swaplines'

" vim-airline
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" youcompleteme
" https://vimawesome.com/plugin/youcompleteme
Plug 'valloric/youcompleteme'

" Vim surrond
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" Ctrlp
" https://github.com/kien/ctrlp.vim
Plug 'kien/ctrlp.vim'

" Ale (Lint)
" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

" Emmet
" https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim'

call plug#end()

" End of plugins
"---------------------------------------------------------------
"---------------------------------------------------------------
" Configs

" For plugins to load correctly
filetype plugin indent on

" Set default enconding to UTF-8
set encoding=UTF-8

" Allow to use mouse
set mouse=a

" Copy and paste infinity times
xnoremap p pgvy

" Blink cursor on error instead of beeping (grr)
set visualbell

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor Config
set scrolloff=5
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

"---------------------------------------------------------------
" NerdTree configuration
"---------------------------------------------------------------

" Open and Close with Control + b
noremap <C-b> :NERDTreeToggle<CR>

" Ignore folders
let NERDTreeIgnore=['\.git$', '\.DS_Store$']

" Open file on new tab with Control + t
let NERDTreeMapOpenInTab='<C-t>'

" Quit when open file
let NERDTreeQuitOnOpen = 1

" Delete the buffer when delete file
let NERDTreeAutoDeleteBuffer = 1

" List dot files
let NERDTreeShowHidden=1

" Open with current directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Close when is only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open when is directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p |
     \ene | exe 'cd '.argv()[0] | endif

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Start automatically
"autocmd vimenter * NERDTree

"-----------------------------
" THEME
"-----------------------------
" One Dark Theme
try
  colorscheme onedark
   let g:airline_theme = 'onedark'
 catch
endtry


" Use TrueColor
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" Turn on syntax highlighting
syntax on

" Create folders when path don't exists

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" ----------------------------------------
"  Tagbar
"  --------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_autoclose = 1

"
" CTRLP

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Vim Swaplines
" Line up
map <C-k> :SwapUp<CR>
map <C-j> :SwapDown<CR>

" vim-commentary
" Ctrl + /
map <C-_> gcc
