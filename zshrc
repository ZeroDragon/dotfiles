export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="zero"

# source $HOME/sites/personal/spotify-dl/.envrc
# source $HOME/.dronerc

alias git-prune='git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d'

D=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DIR="$D/dotfiles"
# permite usar control + s y control + q para otras cosas
stty -ixon

# para el FZF dentro de VIM
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'

if [[ `uname` == "Linux" ]]; then
  source $DIR/zshrcWsl
else
  source ~/dotfiles/zshrcMac
fi

eval "$(zoxide init --cmd cd zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Bat instalar en https://github.com/sharkdp/bat
# less a bat
command -v bat > /dev/null && alias less='bat'
# cat a bat
command -v bat > /dev/null && alias cat='bat --pager=never'

# LSD instalar en https://github.com/Peltoche/lsd
# Mejores colores de folders
command -v lsd > /dev/null && alias ls='lsd --group-dirs first'
