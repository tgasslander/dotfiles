" ** Vim native settings **
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
set nu rnu " relative line numbering
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

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

syntax enable
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
