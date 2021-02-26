#!/bin/bash

# Install "vim-plug" plugin manager
# https://github.com/junegunn/vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install build files to youcompleteme
sudo apt install cmake python3-dev build-essential golang

# Copying files

cp .vimrc ~/.vimrc

# ftplugin folder
# FTPF=~/.vim/ftplugin
# mkdir -p $FTPF

# cp ftplugin/typescriptreact.vim $FTPF/typescriptreact.vim
# cp ftplugin/typescript.vim $FTPF/typescript.vim
# cp ftplugin/javascript.vim $FTPF/javascript.vim

# Installing
vim +PlugInstall +qall

# Installing youcompleteme completers
~/.vim/plugged/youcompleteme/install.py --go-completer --ts-completer

# vim +Source ~/.vimrc
