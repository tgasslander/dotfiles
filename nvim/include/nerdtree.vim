Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Nerdtree settings
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1

nnoremap <Leader>nn :NERDTreeToggle<CR>
nnoremap <expr> <leader>nm g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>nf :NERDTreeFind<CR>

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif


" Make sure to not have unmatched folder symbols and names painted in the same
" color. The settings below should default to a green folder icon and a blue
" label
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

