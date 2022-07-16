set nocompatible
set encoding=utf-8
set noshowmode
filetype off
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-ruby
set rtp+=~/.fzf
set termguicolors
"call vundle#begin()
call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'preservim/nerdtree'
Plug  'vim-airline/vim-airline'
Plug  'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim' ,{'branch': 'release'}
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-rails'
Plug 'SirVer/ultisnips'
Plug 'iamcco/markdown-preview.nvim'
Plug 'Einenlum/yaml-revealer'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate' } 
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'liuchengxu/graphviz.vim' 
Plug 'embark-theme/vim'
Plug 'RRethy/vim-hexokinase'
call plug#end()
"call vundle#end()
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
colorscheme embark
set showtabline=2

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
"let $FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
let $FZF_DEFAULT_COMMAND='rg -l ""'
let g:fzf_preview_window = ''
set tags=tags;
let g:airlineextensions#tabline#enabled = 1
"nnoremap <C-n> <cmd>CHADopen<CR>
nnoremap <C-n> <cmd>NERDTreeToggle<CR>
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
"let g:livepreview_previewer = 'mupdf'
let g:livepreview_cursorhold_recompile = 0
let g:coc_global_extensions = ['coc-solargraph']
set updatetime=50
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Lint :call CocAction('format')<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader><Tab> :call coc#util#float_hide()<CR>
set hidden
let g:Hexokinase_highlighers = [ 'backgroundfull' ]
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <leader>p <Plug>MarkdownPreviewToggle
let g:vimspector_enable_mappings = 'HUMAN'
"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"
"
"
"autocmd User CocOpenFloat call nvim_win_set_config(g:coc_last_float_win, {'relative': 'editor', 'row': 0, 'col': 0})
"autocmd User CocOpenFloat call nvim_win_set_width(g:coc_last_float_win, 9999)
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" , 'javascript', 'ruby','python','go'},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
		-- additional_vim_regex_highlighting = false,
  },
}
EOF
