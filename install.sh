#!/bin/bash
# echo 'Please select your vim type:'
PS3="Please select your vim type: "
options=(vim neovim)
selected=""
select menu in "${options[@]}"; do
    selected=$menu
    break
done

echo -e "\npicked ($selected)"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Install build files to youcompleteme
    sudo apt install cmake python3-dev build-essential golang
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install cmake python go
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Not supported!"
    exit 3
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "Not supported!"
    exit 3
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "Not supported!"
    exit 3
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "Not supported!"
    exit 1
else
    echo "Not supported!"
    exit 3
fi

# Copying vim config file
cp .vimrc ~/.vimrc

vimpath=""
# if [ "$selected" == "vim" ]; then
#   vimpath="$HOME/.vimrc"
if [ "$selected" == "neovim" ]; then
    vimpath="$HOME/.config/nvim"
    mkdir -p "$vimpath"
    cp nvim.vim "$vimpath/init.vim"
fi

# Install "nvim-plug" plugin manager
if [ "$selected" == "vim" ]; then
    vim +PlugInstall +qall
elif [ "$selected" == "neovim" ]; then
    nvim +PlugInstall +qall
fi

# Installing youcompleteme completers
# ~/.vim/plugged/youcompleteme/install.py --go-completer --ts-completer
echo -e "\n\n\n\n===========================================\n"
echo -e "Disclaimers: \n"
echo -e "Run \":Copilot setup\" to login copilot with your github account (neovim only)"
