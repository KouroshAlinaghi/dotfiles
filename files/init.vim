autocmd!
set nowrap
set nocompatible
set noshowmode
set termguicolors
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1
syntax on             " Enable syntax highlighting
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set hidden
filetype plugin on
filetype indent on
set exrc
:set number
:set ls=2 " This makes Vim show a status line even when only one window is shown
:filetype plugin on " This line enables loading the plugin files for specific file types
:set tabstop=2 " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide.
:set expandtab " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
:set softtabstop=2 " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
:set shiftwidth=2 " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation. 
:setlocal foldmethod=indent " Set folding method
:set t_Co=256 " makes Vim use 256 colors
:set nocp " This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
:set clipboard=unnamed
:set clipboard=unnamedplus
:set autoindent " Automatic indentation
:set cindent " This turns on C style indentation
:set si " Smart indent
:syntax enable " syntax highlighting
:set hlsearch " Highlight in search
:set noswapfile " Avoid swap files
:set mouse=a " Mouse Integration

" vim-plug
call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'arcticicestudio/nord-vim'
Plug 'stjernstrom/vim-ruby-run'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'scrooloose/nerdtree'
Plug 'pope/vim-rails' 
Plug 'tpope/vim-rails'
Plug 'wincent/command-t'
Plug 'tpope/vim-rake'
Plug 'cespare/vim-toml'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'pncborgar/vim-parkour-theme'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-cucumber'
Plug 'connorholyday/vim-snazzy'
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" siwtching between buffers with TAB
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Ruby run
nmap <F7> :w<CR>:call RubyRun()<CR>

" auto complete for ( , " , ' , [ , { , |
:inoremap        (  ()<Left>
:inoremap        "  ""<Left>
:inoremap        `  ``<Left>
:inoremap        '  ''<Left>
:inoremap        [  []<Left>
:inoremap      {  {}<Left>
" Commenting
" Commenting blocks of code.
:autocmd FileType c,cpp,java,scala,vlang let b:comment_leader = '// '
:autocmd FileType sh,ruby,python   let b:comment_leader = '# '
:autocmd FileType conf,fstab       let b:comment_leader = '# '
:autocmd FileType tex              let b:comment_leader = '% '
:autocmd FileType mail             let b:comment_leader = '> '
:autocmd FileType vim              let b:comment_leader = '" '
:noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
:noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


:map <F8> :setlocal spell! spelllang=en_us<CR> " check spelling with F8
:set pastetoggle=<F2> " Paste mode toggle with F2 Pastemode disable auto-indent and bracket auto-compelation and it helps you to paste code fro elsewhere .

" plugins
"indentLine
:let g:indentLine_char = '.'

" autocomplpop setting
:set omnifunc=syntaxcomplete " This is necessary for acp plugin
:let g:acp_behaviorKeywordLength = 1 "  Length of keyword characters before the cursor, which are needed to attempt keyword completion

" airline plugin setting
:let g:airline_theme='violet' " set airline plugin theme
:let g:airline#extensions#tabline#enabled = 1 " showing tabs
:let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

 " unicode symbols
  let g:airline_left_sep = '??'
  let g:airline_left_sep = '???'
  let g:airline_right_sep = '??'
  let g:airline_right_sep = '???'

"vim-airline-clock
:let g:airline#extensions#clock#format = '%c'

" NERDTree plugin setting

"toggle showing NERDTree with F1
:map <F1> :NERDTreeToggle<CR>


colorscheme parkour
highlight clear LineNr


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <C-P> :Files<CR>
