#!/bin/sh
DOTFILES=".alias .bashrc .profile .screenrc .vim .vimrc .zsh .zshrc"

for x in $DOTFILES; do
  test -L ~/$x && rm ~/$x
  test -f ~/$x && rm -f ~/$x.bak && mv ~/$x ~/$x.bak
  test -d ~/$x && rm -rf ~/$x.bak && mv ~/$x ~/$x.bak
  ln -sr $PWD/$x ~/$x
done

test ! -d ~/tmp && mkdir ~/tmp
