" edit .vimrc easily
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" my bundles
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
call vundle#end()            " required
filetype plugin indent on    " required

" NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
nmap <silent> <C-P> :NERDTreeToggle<CR>

" solarized
syntax enable
set background=dark
colorscheme gruvbox

" indent
set ts=2 sts=2 sw=2
autocmd Filetype vim setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4

" other options
set number
set expandtab
set nowrap
set autoindent
set t_Co=256
