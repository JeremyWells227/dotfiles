set nocompatible
set encoding=utf-8
set noshowmode
filetype off
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-ruby
"set rtp+=~/.fzf
set termguicolors
call plug#begin()
Plug 'vim-ruby/vim-ruby'
Plug 'preservim/nerdtree'
Plug  'vim-airline/vim-airline'
Plug  'vim-airline/vim-airline-themes'
"Plug 'neoclide/coc.nvim' ,{'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
"Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-rails'
Plug 'iamcco/markdown-preview.nvim'
Plug 'Einenlum/yaml-revealer'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate' } 
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch' : '0.1.x' } 
Plug 'liuchengxu/graphviz.vim' 
Plug 'embark-theme/vim'
Plug 'RRethy/vim-hexokinase'
call plug#end()
filetype plugin indent on
syntax on 
let mapleader=" "
nnoremap <SPACE> <nop>
set guicursor=
set background=dark
set bs=2
set nohlsearch
set wildmenu
set wildignore+="node_modules"
set autoread
set tabstop=2 
set softtabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set background=dark
set cursorline
set noswapfile
set shortmess+=c
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
colorscheme embark
set showtabline=2
"Some change
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
"let $FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
let $FZF_DEFAULT_COMMAND='rg -l ""'
let g:fzf_preview_window = ''
set tags=tags;
let g:airlineextensions#tabline#enabled = 1
"nnoremap <C-n> <cmd>CHADopen<CR>
nnoremap <C-n> <cmd>NERDTreeToggle<CR>
" FZF
"nnoremap <C-\> :BTags<CR>
"nnoremap <C-p> :Files<CR>
"nnoremap <C-t> :Tags<CR>
"	
" Telescope
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-t> :Telescope tags<CR>
nnoremap <C-\> :Telescope current_buffer_tags<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
set cmdheight=2
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
"let g:coc_global_extensions = ['coc-solargraph']
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
require('telescope').setup()
require('lspconfig').pyright.setup{}


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
		settings = {
			["rust-analyzer"] = {
				imports = {
					granularity = {
						group = "module",
						},
					prefix = "self",
					},
				cargo = {
					buildScripts = {
						enable = true,
						},
					},
				procMacro = {
					enable = true
					},
				}
			}
}


EOF
