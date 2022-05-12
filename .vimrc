set nocompatible
set encoding=utf-8
set noshowmode
filetype off
"let g:python3_host_prog = '/usr/bin/python3.7'
let g:python3_host_prog = '/usr/bin/python3'
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-ruby
set rtp+=~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plugin 'preservim/nerdtree'
Plugin  'vim-airline/vim-airline'
Plugin  'vim-airline/vim-airline-themes'
"Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'neoclide/coc.nvim' ,{'branch': 'release'}
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-rails'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors' 
Plugin 'iamcco/markdown-preview.nvim'
call vundle#end()
filetype plugin indent on
syntax on 
source ~/.vim/coc_config
let mapleader=" "
nnoremap <SPACE> <nop>
set guicursor=
set background=dark
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
set cursorline
set shortmess+=c
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "gruvbox"
colorscheme gruvbox
set showtabline=2

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
let g:fzf_preview_window = ''
set tags=tags;
let g:airlineextensions#tabline#enabled = 1
"nnoremap <C-n> <cmd>CHADopen<CR>
"nnoremap <C-n> <cmd>NERDTreeToggle<CR>
nnoremap <C-\> :BTags<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-t> :Tags<CR>
set cmdheight=2
let g:ale_set_hightlights = 0
  let g:ale_fixers = {
  \   'javascript': [
  \       'eslint',
  \       {buffer, lines -> filter(lines, 'v:val !~ ''^\s*//''')},
  \   ],
  \}
set incsearch
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l
"nnoremap <c-S-h> 5<C-w><
"nnoremap <c-S-J> 5<C-w>+
"nnoremap <c-S-K> 5<C-w>-
"nnoremap <c-S-L> 5<C-w>>
let g:coc_global_extensions = ['coc-solargraph']
set updatetime=50
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Lint :call CocAction('format')<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader><Tab> :call coc#util#float_hide()<CR>
set hidden
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <leader>p <Plug>MarkdownPreviewToggle
"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
