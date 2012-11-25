#!/bin/sh

cd ~/dotfiles/git

echo ""
echo "Creating symlinks for git dotfiles"
echo ""

FILES="gitconfig"

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

