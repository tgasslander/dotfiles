# dotfiles
Well. My dotfiles.
Only tested on Kubuntu 20.04 in i3wm.
Being tested on MacOS.

## Dependencies
- i3wm
- i3blocks
- fontawesome
- zsh
- oh-my-szh

## vim
No longer being actively used so the .vimrc is gonna stay as is.

## nvim
A bunch of plugins and settings that makes an IDE of nvim in `nvim/`.

### Prerequisites
Gotta install a patched font to work with the devicons.
```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
````

#### Install the Powerlevel ZSH theme
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
