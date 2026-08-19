" plugins.vim
" 
" Install plugins and configure using vim-plug
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cheatsheet

" :PlugInstall                                       " install all
" :PlugUpdate                                        " update all

" Plugins installed in .vim/Plugged, which is git-ignored
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" register plugins

call plug#begin()

" Plug 'ctrlpvim/ctrlp.vim'                            " Ctrl P
Plug 'scrooloose/nerdtree'                           " NerdTree
Plug 'vim-airline/vim-airline'                       " Airline

" Plug 'arcticicestudio/nord-vim'                      " Nord Color
Plug 'cocopon/iceberg.vim'                           " Iceberg Color
Plug 'vim-airline/vim-airline-themes'                " Airline Themes

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin config
" also look at the end of .vimrc for try catch statements

" NerdTree
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" Airline
let g:airline_theme='minimalist'
let g:airline_solarized_bg='dark'

