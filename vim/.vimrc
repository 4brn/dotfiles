set nocompatible          " Don't try to be vi compatible
set history=100           " Number of commands to remember
set encoding=utf-8        " Use UTF-8 encoding

set number                " Show line numbers
" set ruler                 " Show cursor position
set cmdheight=1           " Command line height
set laststatus=2          " Always show status line
set showcmd               " Show partial command
set showmode              " Show mode in command line
set scrolloff=8           " Minimum lines above/below cursor
" set wrap                  " Wrap long lines
" set linebreak             " Break lines at word boundaries
set textwidth=500         " Set line break at 500 chars
" set lbr                   " Line break
set ttyfast               " Faster redrawing
set lazyredraw            " Don't redraw during macros
set matchpairs+=<:>       " Match angle brackets
set showmatch             " Show matching brackets
set mat=2                 " Match time
set visualbell            " Use visual bell
set noerrorbells
set novisualbell

" =========================
" File Handling
" =========================

set hidden                " Allow hidden buffers
set nobackup              " No backup files
set nowritebackup         " No write backup
set noswapfile            " No swap file
set modelines=0           " Disable modelines for security

" =========================
" Tabs & Indentation
" =========================

set expandtab             " Use spaces instead of tabs
set tabstop=4             " Tab width
set shiftwidth=4
set softtabstop=4
set smarttab              " Smart tab behavior
set ai                    " Auto indent
set si                    " Smart indent
set noshiftround          " Don't round indent
set backspace=indent,eol,start

" =========================
" Searching
" =========================

set ignorecase            " Ignore case...
set smartcase             " ...unless search includes uppercase
set hlsearch              " Highlight search results
set incsearch             " Incremental search
set showmatch             " Highlight matching parens

" =========================
" Language / Syntax
" =========================

syntax enable

" =========================
" Colors
" =========================

set background=dark
set t_Co=256

try
    colorscheme habamax   " Change to solarized if needed
catch
endtry

" Smart window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move by display lines instead of real lines
nnoremap j gj
nnoremap k gk

