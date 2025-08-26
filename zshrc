export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="zero"

alias git-prune='git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d'

D=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DIR="$D/dotfiles"
# permite usar control + s y control + q para otras cosas
stty -ixon

alias vim="nvim"

if [[ `uname` == "Linux" ]]; then
  source ~/dotfiles/zshrcWsl
else
  source ~/dotfiles/zshrcMac
fi

# Activate Mise before its plugins
eval "$($HOME/.local/bin/mise activate zsh)"

eval "$(zoxide init --cmd cd zsh)"

# Bat instalar con mise use bat
# less a bat
command -v bat > /dev/null && alias less='bat'
# cat a bat
command -v bat > /dev/null && alias cat='bat --pager=never'

# LSD instalar con mise use lsd
# Mejores colores de folders
command -v lsd > /dev/null && alias ls='lsd --group-dirs first'
