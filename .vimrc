set nocompatible
set encoding=utf-8
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+="~/.vim/bundle/vim-ruby"
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Plugin  'vim-airline/vim-airline'
Plugin  'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
"Plugin 'neoclide/coc.nvim' ,{'branch': 'release'}
Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on
syntax on
set bs=2
set wildmenu
set wildignore+="node_modules"
set autoread
set tabstop=2 
set softtabstop=2
set shiftwidth=2
set hlsearch
set ignorecase
set background=dark
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
colorscheme torte
set showtabline=2
let g:airlineextensions#tabline#enabled = 1
map <C-n> :NERDTreeToggle<CR>
map <C-\> :TagbarToggle<CR>
set cmdheight=2
let g:ale_set_hightlights = 0
  let g:ale_fixers = {
  \   'javascript': [
  \       'eslint',
  \       {buffer, lines -> filter(lines, 'v:val !~ ''^\s*//''')},
  \   ],
  \}
