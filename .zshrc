export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fwalch"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

source $HOME/.dronerc

#Alias para abrir el explorador de archivos en una carpeta a la MacOS Style
alias open='explorer.exe'

# Mejores colores de folders
LS_COLORS='ow=01;36;40'

# permite usar control + s y control + q para otras cosas
stty -ixon

# para el FZF dentro de VIM
FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'

# path de deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# lazy load de nvm
if [ -s "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() { 
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR/nvm.sh"
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
