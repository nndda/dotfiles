export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
HIST_STAMPS="dd-mm-yyyy"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8


# NVM

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NODE_PATH=$NODE_PATH:`npm root -g`


# Personal aliases

alias zshrc='source ~/.zshrc'

alias c='clear'

alias warm='redshift -v -P -O 3415'

alias godot=~/Developments/Godot/bin/godot
alias gd=godot

alias serve='python3 -m http.server'

alias venv='source ./bin/activate'