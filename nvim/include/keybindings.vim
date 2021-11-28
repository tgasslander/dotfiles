" *** Key mappings ***
" Change the leader to SPACE
let mapleader=" "
nnoremap <leader>s /

nnoremap <leader>g :Grepper -tool ag<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" ,eaw to equalize window sizes
nnoremap <Leader>eaw <C-w>=
" ,nn to toggle NERDTree
" nnoremap <Leader>nn :NERDTreeToggle<CR>
" ,tgn
nnoremap <Leader>tgn :set nornu!<CR> :set nonu!<CR>
" ,tn to nohl
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
