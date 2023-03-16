syntax on
set ruler
set number
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent
set laststatus=2
set nowrap
set termguicolors
set nocompatible
set noshowmode
set ls=2
set hlsearch
set exrc
set noswapfile
set encoding=utf-8
set signcolumn=yes

filetype on
filetype plugin indent on

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>

" vim-plug
call plug#begin()

    Plug 'connorholyday/vim-snazzy'
    Plug 'mhartington/oceanic-next'
    Plug 'tpope/vim-endwise'
    Plug 'vim-airline/vim-airline'
    Plug 'pncborgar/vim-parkour-theme'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'arcticicestudio/nord-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'voldikss/vim-floaterm'
    Plug 'ptzz/lf.vim'
    Plug 'numToStr/Comment.nvim'

call plug#end()

colorscheme catppuccin-frappe
highlight clear LineNr

" siwtching between buffers with TAB
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" airline plugin setting
let g:airline_theme='violet'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" toggle showing NERDTree with F1
map <F1> :NERDTreeToggle<CR>

" Ctrl+p to open fzf
nmap <C-P> :Files<CR>

" enter for confirming coc.nvim suggestion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"

" make nvim use xsel as clipboard manager
set clipboard^=unnamed,unnamedplus
let g:clipboard = {
            \    'name': 'xsel - bin',
            \    'copy': {
            \        '+': '/usr/bin/xsel -i -b',
            \        '*': '/usr/bin/xsel -i -p',
            \    },
            \    'paste': {
            \        '+': '/usr/bin/xsel -b',
            \        '*': '/usr/bin/xsel -p',
            \    },
            \    'cache_enabled': 0,
            \}

lua require('Comment').setup()
