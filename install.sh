#!/bin/sh

cd ~/dotfiles

echo ""
echo "Fetching latest dotfiles..."
echo ""

git pull
git submodule init
git submodule update

./vim/install-vim.sh
./zsh/install-zsh.sh
./bash/install-bash.sh
./git/install-git.sh
