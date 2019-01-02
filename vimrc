set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'jmcantrell/vim-virtualenv'
Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fireplace'
Plugin 'sophacles/vim-processing'
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()
filetype plugin indent on 
filetype on

" Set text encoding to UTF-8
set encoding=utf-8

" vim-airline config
set t_Co=256
set laststatus=2
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'

" nerdtree config
let g:NERDCustomDelimiters = { 'python': { 'left': '#', 'leftAlt': '"""', 'rightAlt': '"""' } }

" snipmate config
let g:snips_author = 'Tomás Infante'
let g:snips_email = 'tomasinfante@gmail.com'
let g:snips_github = 'https://github.com/tinfante/'

" syntastic config
let g:syntastic_python_checkers = ['bandit', 'flake8', 'pylint']
let g:syntastic_aggregate_errors = 1

" markdown-previe config
let vim_markdown_preview_github=1

" Make backspace and del behave
set bs=2

" Mouse works in (a)ll modes (normal, insert, visual)
set mouse=a

" Enable using system clipboard
set clipboard=unnamedplus

" disable swap files
set noswapfile

" GUI options
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=c
if has("gui_running")
    set lines=30 columns=87
endif

" Display current command (key combo) in lower right screen
set showcmd

" Command line auto-completion (with Tab)
set wildmenu

" Can change/open buffers without having'g to save current buffer
set hidden

" Asks for confirmation if trying to exit with unsaved buffers
set confirm

" Show line numbers
set number

" Indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" set smarttab

" Disable wrapping
set nowrap

" Search settings.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Command line history size
set history=999

" Set amount of undoes remembered
set undolevels=999

" Folding settings
set foldmethod=indent
set foldlevel=99

" We have a fast terminal.
set ttyfast

" highlight line limit
set colorcolumn=80
highlight ColorColumn ctermbg=233

" show cursor line
set cursorline

" Disable F1 help mapping.
nmap <F1> <nop>
imap <F1> <nop>
vmap <F1> <nop>

" Disable arrow keys.
nmap <Up> <nop>
nmap <Down> <nop>
nmap <Left> <nop>
nmap <Right> <nop>
vmap <Up> <nop>
vmap <Down> <nop>
vmap <Left> <nop>
vmap <Right> <nop>

" Function to toggle Syntastic's error window
let g:errlist_is_open = 1
function! ErrorListToggle()
    if g:errlist_is_open
        execute "Errors"
        let g:errlist_is_open = 0
    else
        lclose
        let g:errlist_is_open = 1
    endif
endfunction

" Key bindings
let mapleader=","
map Y y$
vnoremap < <gv
vnoremap > >gv
nnoremap <C-j> :m+<CR>==
vnoremap <C-j> :m'>+<CR>gv=gv
nnoremap <C-k> :m-2<CR>==
vnoremap <C-k> :m-2<CR>gv=gv
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :GundoToggle<CR>
nmap <F4> :TagbarToggle<CR>
nmap <F6> :SyntasticCheck<CR>
nmap <F7> :call ErrorListToggle()<CR>
nmap <F8> :SyntasticToggleMode<CR>
set pastetoggle=<F9>

" Filetype specific <F5> mapping
au FileType python nmap <F5> :!python -i %<CR>
au FileType clojure nmap <F5> :Require!<CR>
au FileType processing nmap <F5> :make<CR>
au FileType c nmap <F5> :!gcc % -o %<<CR>
au FileType markdown nmap <F5> :call Vim_Markdown_Preview()<CR>

syntax on
colorscheme jellybeans
