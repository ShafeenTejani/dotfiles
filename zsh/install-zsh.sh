#!/bin/sh

cd ~/dotfiles/zsh

echo ""
echo "Creating symlinks for zsh dotfiles"
echo ""

FILES="zshrc"

for FILE in $FILES
do
    SRC="$PWD/$FILE"
    DEST="$HOME/.$FILE"
    if [ -f $DEST ]; then
        if [ ! -L $DEST ]; then
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


echo ""
echo "Linking zsh custom config..."
echo ""

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
