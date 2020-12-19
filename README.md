# dotfiles
Well. My dotfiles.
Only tested on Kubuntu 20.04

## Dependencies
- i3wm
- i3blocks
- fontawesome
- xterm
- zsh
- oh-my-szh

## vim
Some essential plugins
### NerdTree
Install:
```
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
```
### Monokai colorscheme
Clone the colorscheme to somewhere and symlink the `monokai.vim` to ~/.vim/colors
```
git clone https://github.com/sickill/vim-monokai.git ~/.vim/colors/monokai
ln -s ~/.vim/colors/monokai/colors/monokai.vim  ~/.vim/colors/
