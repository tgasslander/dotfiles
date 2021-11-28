Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" If fzf installed using git
set rtp+=~/.fzf

" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<CR>
" Map fzf + ag search to CTRL P
nnoremap <C-g> :Ag <CR>
" Map fzf + files to Ctrl s
nnoremap <C-s> :Files<CR>
