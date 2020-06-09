export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fwalch"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

source $HOME/.dronerc

#Alias para abrir el explorador de archivos en una carpeta a la MacOS Style
alias open='explorer.exe'

# Bat instalar en https://github.com/sharkdp/bat
# less a bat
command -v bat > /dev/null && alias less='bat'
# cat a bat
command -v bat > /dev/null && alias cat='bat --pager=never'

# LSD instalar en https://github.com/Peltoche/lsd
# Mejores colores de folders
command -v lsd > /dev/null && alias ls='lsd --group-dirs first'

# LS_Colors instalar en https://github.com/trapd00r/LS_COLORS
. "/home/zero/.local/share/lscolors.sh"

# permite usar control + s y control + q para otras cosas
stty -ixon

# para el FZF dentro de VIM
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'

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
