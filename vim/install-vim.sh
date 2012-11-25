#!/bin/sh

cd ~/dotfiles/vim

echo ""
echo "Creating symlinks for vim dotfiles"
echo ""

FILES="vimrc"

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
echo "Linking custom snipmate snippets..."
echo ""

DOTVIMDIR="$HOME/.vim"
SNIPPETSDIR="$DOTVIMDIR/snippets"

if [ ! -d $DOTVIMDIR ]; then
    echo "fatal: ~/.vim does not exist yet - install pathogen"
    exit 1
fi
if [ -d $SNIPPETSDIR ]; then
    echo "> Removing $SNIPPETSDIR"
    rm  $SNIPPETSDIR
fi

echo "> Creating symlink $SNIPPETSDIR"
ln -s "$PWD/snippets" $SNIPPETSDIR

