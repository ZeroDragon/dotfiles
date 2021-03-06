export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="zero"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

source $HOME/.dronerc
eval "$(direnv hook zsh)"

Dashboard.init() {
  cd ~/Sites/personal/myDashboard
  ./start
}
Dashboard.end() {
  cd ~/Sites/personal/myDashboard
  ./end
}


# Bat instalar en https://github.com/sharkdp/bat
# less a bat
command -v bat > /dev/null && alias less='bat'
# cat a bat
command -v bat > /dev/null && alias cat='bat --pager=never'

# LSD instalar en https://github.com/Peltoche/lsd
# Mejores colores de folders
command -v lsd > /dev/null && alias ls='lsd --group-dirs first'

# LS colors (referencia al mismo path donde está este archivo)
. "/Users/carlosflores/dotfiles/lscolors.sh"

# permite usar control + s y control + q para otras cosas
stty -ixon

# para el FZF dentro de VIM
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'

# lazy load de node
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/bash_completion"
function __init_nvm() { 
  unalias node
  . "$NVM_DIR/nvm.sh"
  unset -f __init_nvm
}
alias node='__init_nvm &&'node

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/carlosflores/Documents/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/carlosflores/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/carlosflores/Documents/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/carlosflores/Documents/google-cloud-sdk/completion.zsh.inc'; fi
