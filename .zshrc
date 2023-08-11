# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#toga
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	export ZSH="/home/toga/.oh-my-zsh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	export ZSH="/Users/toga/.oh-my-zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
	GOPLS_PATH=/home/toga/go/bin
elif [[ "$OSTYPE" == "darwin"* ]]; then
	GOPLS_PATH=/Users/toga/go/bin
	LIMELIGHT_PATH=/usr/local/bin
fi


export PATH=$PATH:~/.emacs.d/bin:$HOME/.local/bin:~/appimages:$GOINSTALL/bin:$GOPLS_PATH:$LIMELIGHT_PATH

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export QMK_HOME='~/Documents/projects/toga_split/qmk_firmware'


alias plex="GIT_SSH_COMMAND='ssh -i ~/.ssh/id_plexian -o IdentitiesOnly=yes'"
alias gobtell="cd $HOME/Documents/projects/bt_migrate"
alias gojo="cd $HOME/Documents/projects/jotojo"
alias gokeeb="cd $HOME/Documents/projects/toga_split/wireless/togasplit_ble_fw/zmk"
alias gozephyr="cd $HOME/Documents/lab/zephyr/zephyr"
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

# Python
export PATH=$PATH:$HOME/.local/bin
export PATH=${HOME}/gn:"$PATH"
export PATH=$PATH:${HOME}/.local/share/nvim/lsp_servers/clangd/clangd/bin/
