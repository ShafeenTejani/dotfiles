Shaf's Dotfiles
===============

Dependencies
-------------

Requires [pathogen.vim](https://github.com/tpope/vim-pathogen) to be installed.

The tagbar plugin for vim requires a version of ctags that is not installed by default on OSX. To install it run `brew install ctags`.


Installation
------------

To install all the dotfiles:

    cd ~
    git clone https://github.com/ShafeenTejani/dotfiles.git
    cd dotfiles
    ./install.sh

To just install a specific set of dotfiles run the install script from within that directory, e.g:

    cd ~/dotfiles/vim
    ./install-vim.sh


Vim
---

To add new vim plugins, add them as a submodule inside the `dotfiles/vim/bundle` directory.

Zsh
---

To add new zsh plugins, add them to `dotfiles/zsh/oh-my-zsh-custom/plugins` and run the `./install-zsh.sh` script.
