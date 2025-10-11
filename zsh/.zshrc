# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#toga
export TERM="xterm-256color"

PATH=$PATH:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	export ZSH="${HOME}/.oh-my-zsh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	export ZSH="${HOME}/.oh-my-zsh"
	export PATH=$PATH:/opt/homebrew/bin

fi

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

set -o vi

bindkey -v
bindkey '^R' history-incremental-search-backward

HISTSIZE=10000
SAVEHIST=10000

export GOINSTALL=/usr/local/go

# OS-specific PATH additions
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	GOPLS_PATH=/home/${USER}/go/bin
elif [[ "$OSTYPE" == "darwin"* ]]; then
	GOPLS_PATH=/Users/${USER}/go/bin
	LIMELIGHT_PATH=/usr/local/bin
fi


export PATH=$PATH:~/.emacs.d/bin:~/appimages:$GOINSTALL/bin:$GOPLS_PATH:$LIMELIGHT_PATH

if command -v emacslient >/dev/null 2>&1; then
SERVICE="emacs"
if pgrep -x "$SERVICE" >/dev/null
then
else
    export PATH=$PATH:~/.emacs.d/bin
    echo "Starting $SERVICE stopped"
    emacs --daemon
    alias emacs='emacsclient'
fi
fi

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export QMK_HOME='~/Documents/projects/toga_split/qmk_firmware'


alias plex="GIT_SSH_COMMAND='ssh -i ~/.ssh/id_plexian -o IdentitiesOnly=yes'"
alias gobtell="cd $HOME/Documents/projects/bt_migrate"
alias gojo="cd $HOME/Documents/projects/jotojo"
alias gokeeb="cd $HOME/Documents/projects/toga_split/wireless/togasplit_ble_fw/zmk"
alias gozephyr="cd $HOME/Documents/lab/zephyr/zephyr"
alias gog='cd ~/Documents/projects/assignments/gunnebo'
alias vv=nvim
alias e=nvim
alias gs='git status'
alias glp="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit | tee"
alias gib='git branch -v --color | tee'
alias gab='git branch -vvv --color | tee'
alias gd='git diff --color | tee'
alias emacs='emacs -nw'

# gerrit
alias gerritpush='git push origin HEAD:refs/for/master'

# talos
alias t=talosctl

# kubernetes
alias k=kubectl

# Tmux
alias dev="tmux-dev-session.sh"

# Java stuff
DEV_TOOLS="/home/$USER/JavaInstall"
JAVA_HOME="$DEV_TOOLS/JDK/jdk-11.0.13+8"
export JAVA_HOME
PATH="$JAVA_HOME/bin:$PATH"

# React Native Development environment
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$HOME/.local/bin
export PATH=${HOME}/gn:"$PATH"
export PATH=$PATH:${HOME}/.local/share/nvim/lsp_servers/clangd/clangd/bin/
# Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/toga/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# kubectl autocomplete
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi
