#!/bin/sh

cd ~/dotfiles

echo ""
echo "Fetching latest dotfiles..."
echo ""

git pull
git submodule init
git submodule update

echo ""
echo "Creating symlinks for dotfiles"
echo ""

FILES="vimrc bashrc bash_profile zshrc"

for FILE in $FILES
do
    SRC="$PWD/$FILE"
    DEST="$HOME/.$FILE"
    if [ -f $DEST ]; then
        if [ ! -L $DEST]; then
            echo "fatal: $DEST already exists"
            exit 1
        else
            echo "> Removing old symlink $DEST"
            rm $DEST
        fi
    fi
    echo "> Creating symlink $DEST"
    ln -s $SRC $DEST
done

mkdir -p "$PWD/oh-my-zsh/custom/plugins"

ZSH_CUSTOMS="plugins/zsh-syntax-highlighting shaf.zsh-theme"

for CUSTOM in $ZSH_CUSTOMS
do
    SRC="$PWD/oh-my-zsh-custom/$CUSTOM"
    DEST="$PWD/oh-my-zsh/custom/$CUSTOM"
    if [ -f $DEST -o -d $DEST ]; then
        echo "> Removing $DEST"
        rm -rf $DEST
    fi
    echo "> Creating symlink $DEST"
    ln -s $SRC $DEST
done
