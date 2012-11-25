#!/bin/sh

cd ~/dotfiles/bash

echo ""
echo "Creating symlinks for bash dotfiles"
echo ""

FILES="bashrc bash_profile"

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

