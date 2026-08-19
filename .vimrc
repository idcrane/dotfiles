" .vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic functionality and QOL improvements "

set runtimepath+=~/.vim
set history=500

set t_Co=256
set showmode
set ruler                                     " show current position
set number                                    " show line numbers
set cmdheight=2                               " command bar height
set laststatus=2                              " always show status
set timeoutlen=1000 ttimeoutlen=0             " faster mode switching
set lazyredraw                                " update screen at end of macro
set noerrorbells
set belloff=all

set nobackup                                  " no temp or backup files
set nowb
set noswapfile
set hidden                                    " hide unsaved buffer changes

set expandtab
set smarttab
set tabstop=4
set softtabstop=4

set wrap                                      " wrap lines
set lbr                                       " wrap only on whitespace
set whichwrap+=<,>,h,l                        " move to next line w/ j,k
set backspace=indent,eol,start                " sane backspace behavior
set so=7                                      " j/k move cursor more

set showmatch                                 " show matching brackets ...
set mat=2                                     " ... for n tenths of second

set hlsearch                                  " highlight search results
set incsearch                                 " improved search behavior

set ignorecase
set smartcase

set autoindent
set smartindent
set shiftwidth=4

set magic                                     " regex w/ grep syntax

set wildmenu                                  " completion wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*+,*.pyc
set wildignore+=*/.git/*,*/.DS_Store

let mapleader = ","                           " change leader from default "/"
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dealing with file and language types "

set encoding=utf8

syntax on
filetype on 
filetype plugin on
filetype indent on


set autoread                                  " notice external file change
au FocusGained,BufEnter * checktime


"'"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other "

" <leader>ss does spellcheck
map <leader>ss :setlocal spell!<cr>           


source ~/.vim/languages.vim                 " load custom language configs
source ~/.vim/plugins.vim                   " load plugins with Plug


try                                         " set color depending on plugins
    color nord
catch  
    color slate
endtry

