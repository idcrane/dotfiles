" .vimrc
"
"
" Parts taken from Amir Salihefendic's vimrc under MIT License
" https://github.com/amix/vimrc
"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions

" source files only if file exists
" https://devel.tech/snippets/n/vIIMz8vZ/load-vim-source-files-only-if-they-exist/ 
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General

" set runtime path
set runtimepath+=~/.vim

" enable all the new stuff not in vi
set nocompatible

" set runtime directory
set runtimepath+=~/.vim

" enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" change leader from default "/"
let mapleader = ","
let g:mapleader = ","

" set lines of history to remember
set history=500

" disable alerts
set noerrorbells
set belloff=all

" load custom language configurations
call SourceIfExists("~/.vim/languages.vim")



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File IO

" hide unsaved buffer changes when opening new file instead of
" closing the buffer (which will prompt for unsaved changes)
set hidden

" notice when file has been changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" disable vim backups
set nobackup
set nowb
set noswapfile

" ignore certain files
set wildignore=*.o,*+,*.pyc
set wildignore+=*/.git/*,*/.DS_Store

" use UTF8 by default
set encoding=utf8

" use Unix as standard file type
set ffs=unix,dos,mac



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI

" use color terminal
set t_Co=256

" show what mode we're in
set showmode

" enable syntax highlighting
syntax on

" enable completion wildmenu
set wildmenu
set wildmode=longest:full,full

" set command bar height
set cmdheight=2

" always show status line
set laststatus=2

" don't update display when running macros
set lazyredraw

" show line numbers
" set number

" speed up mode switching
set timeoutlen=1000 ttimeoutlen=0

" move cursor 5 lines at a time with j/k
set so=7

" show current position
set ruler

" highlight search results
set hlsearch

" make search behave as expected
set incsearch

" show matching brackets for 2 tenths of second when hovering
set showmatch
set mat=2

" increase margin on left
" set foldcolumn=1

" wrap lines, but only cut on whitespace
set wrap
set lbr

" allow mouse use
set mouse=a



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Data entry

" enable regular expressions using grep meanings
set magic

" replace tabs with 4 spaces
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" after inserting spaces on TAB, have single backspace delete all 4
set softtabstop=4

" make backspace behave as expected
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" ignore case when searching
set ignorecase

" be smart with cases when searching
set smartcase

" use autoindent, in smart manner
set autoindent
set smartindent



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aliases and custom mappings

" toggle spell check with ",ss" 
map <leader>ss :setlocal spell!<cr>

" toggle paste / nopaste with <F2> key
set pastetoggle=<F2>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins and Executables

" load plugins (via vim-plug)
call SourceIfExists("~/.vim/plugins.vim")

" use The Silver Searcher if installed
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
