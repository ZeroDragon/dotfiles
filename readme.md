Mis Dot Files
=============

La idea de este repo es que sea drop-in replacement

```bash
cd
git clone git@github.com:ZeroDragon/dotfiles.git

rm .vimrc
ln -s dotfiles/vimrc .vimrc

rm .zshrc
ln -s dotfiles/zshrc .zshrc

rm .tmux.conf
ln -s dotfiles/tmux.conf .tmux.conf

rm .gitconfig
ln -s dotfiles/gitconfig .gitconfig

rm .hammerspoon/init.lua
ln -s dotfiles/init.lua .hammerspoon/init.lua

# Theme (important to use full address)
ln -s ~/dotfiles/zero.zsh-theme .oh-my-zsh/custom/themes

# Mise
ln -s ~/dotfiles/mise-toml ~/.config/mise/config.toml
```

enjoy
