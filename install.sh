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
ln -s "$PWD/vim/snippets" $SNIPPETSDIR


echo ""
echo "Linking zsh custom config..."
echo ""

mkdir -p "$PWD/zsh/oh-my-zsh/custom/plugins"

ZSH_CUSTOMS="plugins/zsh-syntax-highlighting shaf.zsh-theme"

for CUSTOM in $ZSH_CUSTOMS
do
    SRC="$PWD/zsh/oh-my-zsh-custom/$CUSTOM"
    DEST="$PWD/zsh/oh-my-zsh/custom/$CUSTOM"
    if [ -f $DEST -o -d $DEST ]; then
        echo "> Removing $DEST"
        rm -rf $DEST
    fi
    echo "> Creating symlink $DEST"
    ln -s $SRC $DEST
done
