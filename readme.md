Mis Dot Files
=============

La idea de este repo es que sea drop-in replacement

```bash
cd
git clone git@github.com:ZeroDragon/dotfiles.git

rm -rf .byobu
ln -s dotfiles/.byobu .byobu

rm .vimrc
ln -s dotfiles/.vimrc .vimrc

rm .zshrc
ln -s dotfiles/.zshrc .zshrc
```

wTerminal.json sirve para configurar la windows terminal.  
Abre la terminal de windows y dale `control+,` para ver los settings

alacritty.yml es el archivo para configurar el alacritty. Busca donde está el original y reemplazalo

Finalmente el tema zero.zsh-theme debe ir en ~/.oh-my-zsh/custom-themes/

enjoy


