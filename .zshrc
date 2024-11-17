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

# General utilities

alias zshrc='source ~/.zshrc'

alias c='clear'

alias serve='python3 -m http.server'

alias warm='redshift -v -P -O 3415'

alias venv='source ./bin/activate'

mkvenv() {
  python3 -m venv "$1"
}

# Godot

alias godot=~/Developments/Godot/bin/godot
alias gd=godot
alias gdh='gd --no-header --display-driver headless --audio-driver Dummy -s'
alias gde='c && godot -e .'
alias gdex='gdh ~/dotfiles/godot/gdex.gd'

# Compressing stuff

mktargz() {
	tar -cf - "$1" | 7zz a -tGZip -mx=9 -mfb=258 -mpass=15 -si "$1.tar.gz"
}

zip_gud() {
	7zz a -tzip -mx=9 -mm=LZMA "$1.zip" "$1"
}

zip_meh() {
	7zz a -tzip -mx=0 "$1.zip" "$1"
}

7zbak() {
	7zz a -t7z -mx=9 "$(date +%Y%m%d)_$(date +%H%M%S)-$1.7z" "$1"
}

log_files_to_clean=(
  ~/.bash_history
  ~/huion.log
  ~/.node_repl_history
  ~/.python_history
  ~/.zsh_history
)

cache_dir_to_clean=(
  # ~/.cache/godot/
  ~/.cache/google-chrome/
  ~/.cache/krita/
  ~/.cache/vlc/
)

cwean_uwu() {
  sudo -v

  apt autoremove
  apt autopurge
  apt autoclean

  # Verify npm cache
  npm cache verify

  # Delete thumbnails
  rm -r ~/.cache/thumbnails

  # Empty log files
  for logfile in $log_files_to_clean; do
    truncate -s 0 "$logfile"
  done
}
