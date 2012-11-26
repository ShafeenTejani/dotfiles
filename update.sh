
cd ~/dotfiles

echo ""
echo "Fetching latest dotfiles..."
echo ""

git pull
git submodule init
git submodule update
