" Auto install Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()

Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'tpope/vim-fugitive'         " :Gblame
Plug 'tpope/vim-rhubarb'          " :GBrowse
Plug 'tpope/vim-commentary'

Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'styled-components/vim-styled-components'

Plug 'vim-airline/vim-airline'    " Vim powerline

Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'editorconfig/editorconfig-vim'

Plug 'cespare/vim-toml'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'

" All of your Plugins must be added before the following line
call plug#end()              " required

" Vim fundamentals
set timeout ttimeoutlen=50
set nocompatible " be iMproved, required
filetype off
set nobackup
set nowritebackup
set noswapfile
set completeopt=menuone
set shortmess+=c
set undofile " Maintain undo history between sessions
if has('nvim')
  set undodir=~/.vim/nvim-undodir
else 
  set undodir=~/.vim/vim-undodir
endif
" Activate hybrid line numbering
set nu rnu
" file-based auto indentation
filetype plugin indent on
" Handle ALT key in non 8bit terminals
if !has('nvim')
	let c='a'
	while c <= 'z'
		exec "set <A-".c.">=\e".c
		exec "imap \e".c." <A-".c.">"
		let c = nr2char(1+char2nr(c))
	endw
	set encoding=utf8
endif

" If fzf installed using git
set rtp+=~/.fzf

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	let g:coc_global_extensions += ['coc-eslint']
endif

" let buffers be clickable
let g:lightline#bufferline#clickable=1
let g:lightline#bufferline#shorten_path=1
let g:lightline#bufferline#min_buffer_count=1

let g:lightline = {
\  'colorscheme': 'codedark',
\  'active': {
\    'left': [ [], [], [ 'relativepath' ] ],
\    'right': [ [], [], [ 'lineinfo', 'percent' ] ]
\  },
\  'inactive': {
\    'left': [ [], [], [ 'relativepath' ] ],
\    'right': [ [], [], [ 'lineinfo', 'percent' ] ]
\  },
\  'subseparator': {
\    'left': '', 'right': ''
\  },
\  'tabline': {
\    'left': [ ['buffers'] ],
\    'right': [ [] ]
\  },
\  'tabline_separator': {
\    'left': "", 'right': ""
\  },
\  'tabline_subseparator': {
\    'left': "", 'right': ""
\  },
\  'component_expand': {
\    'buffers': 'lightline#bufferline#buffers'
\  },
\  'component_raw': {
\    'buffers': 1
\  },
\  'component_type': {
\    'buffers': 'tabsel'
\  }
\}

" Nerdtree settings
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
" Look and feel
let g:airline_powerline_fonts = 1
set guifont=Hack 
" Disable all bells and whistles
set noerrorbells visualbell t_vb=

syntax enable
colorscheme codedark
set background=dark
" let g:airline_theme = 'codedark'
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set showcmd
" Use smartcase for searches. Ie use only lowercase for case insensitive
" search
set ignorecase
set smartcase
" Enable interactive search (using the spacebar) with highlighting
set is hls
" nnoremap <Space> /

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
"let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0
" Change the leader to SPACE
let mapleader=" "


" *** Key mappings ***
nnoremap <leader>s /

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

nnoremap <leader>g :Grepper -tool ag<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" ,eaw to equalize window sizes
nnoremap <Leader>eaw <C-w>=
" ,nn to toggle NERDTree
nnoremap <Leader>nn :NERDTreeToggle<CR>
" ,tgn
nnoremap <Leader>tgn :set nornu!<CR> :set nonu!<CR>
" , nt to nohl
nnoremap <Leader>tn :nohl<CR>
" ,ev to open my .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
" ,evr to reload my .vimrc
nnoremap <leader>evr :source $MYVIMRC \| :PlugInstall<CR>
" ,ff to toggle fold
nnoremap <leader>ff zi
" Easier navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Open Buffer
nnoremap <silent><leader>l :Buffers<CR>
" Vertically split screen
nnoremap <silent><leader>sv :vs<CR>
" Split screen
nnoremap <silent><leader>sh :split<CR>
" moving lines and selections
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Treat long lines as break lines
map j gj
map k gk

" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<CR>
" Map fzf + ag search to CTRL P
nnoremap <C-g> :Ag <CR>
" Map fzf + files to Ctrl s
nnoremap <C-s> :Files<CR>

" CoC actions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Format
nmap <leader>f   :CocCommand prettier.formatFile<CR>
" Formatting selected code
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" yaml specifics
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
