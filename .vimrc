" Activate hybrid line numbering
set nu rnu

let g:NERDTreeWinPos = "right"

set showcmd

" Enable interactive search (using the spacebar) with highlighting
set is hls
nnoremap <Space> /

" Change the leader to , (comma)
let mapleader=","

" ,eaw to equalize window sizes
nnoremap <Leader>eaw <C-w>=

" ,nn to toggle NERDTree
nnoremap <Leader>nn :NERDTreeToggle<CR>

" ,tgn
nnoremap <Leader>tgn :set nornu!<CR> :set nonu!<CR>

" ,ev to open my .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" ,evr to reload my .vimrc
nnoremap <leader>evr :source $MYVIMRC

" easier navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" moving lines and selections
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" default theme
syntax enable
colorscheme monokai

" file-based auto indentation
filetype plugin indent on
