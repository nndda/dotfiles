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

alias serve='python3 -m http.server'

alias warm='redshift -v -P -O 3415'

alias venv='source ./bin/activate'

# Godot

alias godot=~/Developments/Godot/bin/godot
alias gd=godot
alias gde='c && godot -e .'

# Compressing stuff

function targz() {
	tar -cf - "$1" | 7zz a -tGZip -mx=9 -mfb=258 -mpass=15 -si "$1.tar.gz"
}

function zip_gud() {
	7zz a -tzip -mx=9 -mm=LZMA "$1.zip" "$1"
}

function zip_meh() {
	7zz a -tzip -mx=0 "$1.zip" "$1"
}