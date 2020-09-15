" plugins.vim
" 
" Install plugins and configure using vim-plug
"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Begin Setup

call plug#begin('~/.vim.plugged')




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl P

Plug 'ctrlpvim/ctrlp.vim'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND = 'find . -type f -not -iname "*.pyc" -not -path "*/\.git/*"'
nnoremap <C-p> :FZF<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree

Plug 'scrooloose/nerdtree'

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nord Vim

Plug 'arcticicestudio/nord-vim'

try
    colorscheme nord
catch
endtry



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='minimalist'
let g:airline_solarized_bg='dark'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialize Plugins

call plug#end()
