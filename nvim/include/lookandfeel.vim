Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'vim-airline/vim-airline'    " Vim powerline
Plug 'tomasiser/vim-code-dark'

" ** Look and feel **
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'codedark'
set guifont=Hack 
" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" colorscheme codedark
set background=dark

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


