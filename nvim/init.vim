set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" source ~/.vimrc

" --------------------------------------------------------------------------------
"  Bootstrap
" --------------------------------------------------------------------------------

" Auto install Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" --------------------------------------------------------------------------------
"  Native vim settings
" --------------------------------------------------------------------------------
source ~/dotfiles/nvim/include/vimsettings.vim
source ~/dotfiles/nvim/include/vimkeymaps.vim
source ~/dotfiles/nvim/include/keybindings.vim

" --------------------------------------------------------------------------------
"  Includes
" -------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
source ~/dotfiles/nvim/include/nerdtree.vim
source ~/dotfiles/nvim/include/vim-gitgutter.vim
source ~/dotfiles/nvim/include/vim-fugitive.vim
source ~/dotfiles/nvim/include/vim-rhubarb.vim
source ~/dotfiles/nvim/include/vim-grepper.vim
source ~/dotfiles/nvim/include/vim-javascript.vim
source ~/dotfiles/nvim/include/vim-jsx-pretty.vim
source ~/dotfiles/nvim/include/vim-graphql.vim
source ~/dotfiles/nvim/include/styled-components.vim
source ~/dotfiles/nvim/include/fzf.vim
" source ~/dotfiles/nvim/include/coc.vim
source ~/dotfiles/nvim/include/editorconfig.vim
source ~/dotfiles/nvim/include/vim-toml.vim
source ~/dotfiles/nvim/include/vim-easy-align.vim
source ~/dotfiles/nvim/include/nerdcommenter.vim
" source ~/dotfiles/nvim/include/filetypespecifics.vim
source ~/dotfiles/nvim/include/lookandfeel.vim
source ~/dotfiles/nvim/include/markdown-preview.vim
source ~/dotfiles/nvim/include/nvim-treesitter.vim
source ~/dotfiles/nvim/include/nvim-lsp-installer.vim
source ~/dotfiles/nvim/include/vim-lspconfig.vim
" lua require('lspconfig')
source ~/dotfiles/nvim/include/completion-vim.vim

" source ~/dotfiles/nvim/include/vim-go.vim
source ~/dotfiles/nvim/include/vim-surround.vim

call plug#end()

" Call plugin configs that need to run after the plugins have loaded
doautocmd User PlugLoaded

colorscheme codedark

" move to separate config
" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'vim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
" End - Move to

sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢

" Documentation on hover
" augroup hover
" 	autocmd!
" 	autocmd CursorHold * silent if ! coc#util#has_float()
" 		\| call CocActionAsync('doHover')
" 	\| endif
" 	autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')
" augroup end

set tabstop=2
set shiftwidth=0

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

