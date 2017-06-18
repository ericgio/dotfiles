""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme monokai       " set colorscheme

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=DarkGray
else
  highlight OverLength ctermbg=DarkGray ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " Enable line numbers
if exists("&relativenumber")
  set norelativenumber    " Don't use relative line numbers
  au BufReadPost * set norelativenumber
endif

set cursorline            " Highlight current line
set hlsearch              " Highlight searches
set ignorecase            " Ignore case of searches
set incsearch             " Highlight dynamically as pattern is typed
set numberwidth=6         " make the number gutter 6 characters wide
set list                  " Specify whether or not to show invisible chars

" Specify which invisible chars to show
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_

set laststatus=2          " Always show status line
set mouse=a               " Enable mouse in all modes
set noerrorbells          " Disable error bells
set nostartofline         " Don’t reset cursor to start of line when moving around.
set ruler                 " Show the cursor position
set scrolloff=3           " Start scrolling three lines before the top/bottom
set shortmess=atI         " Don’t show the intro message when starting Vim
set showmode              " Show the current mode
set title                 " Show the filename in the window titlebar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed     " Use the OS clipboard by default
set wildmenu              " Enhance command-line completion
set esckeys               " Allow cursor keys in insert mode

" Allow backspace in insert mode
set backspace=indent,eol,start

set ttyfast               " Optimize for fast terminal connections
set gdefault              " Add the g flag to search/replace by default
set encoding=utf-8 nobomb " Use UTF-8 without BOM

let mapleader=","         " Change mapleader

" Add empty newlines at the end of files
set binary
set eol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Show the (partial) command as it’s being typed
set showcmd

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

