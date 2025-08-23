Mis Dot Files
=============

La idea de este repo es que sea drop-in replacement

```bash
cd
git clone git@github.com:ZeroDragon/dotfiles.git

rm .vimrc
ln -s dotfiles/.vimrc .vimrc

rm .zshrc
ln -s dotfiles/.zshrc .zshrc

rm .tmux.conf
ln -a dotfiles/tmux.conf .tmux.conf

rm .gitconfig
ln -a dotfiles/gitconfig .gitconfig

rm .hammerspoon/init.lua
ln -a dotfiles/init.lua .hammerspoon/init.lua
```

Finalmente el tema zero.zsh-theme debe ir en ~/.oh-my-zsh/custom-themes/

enjoy


