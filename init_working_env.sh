#!/bin/bash
# Init a working environment with my.config repository
# Repository: https://github.com/a3linux/my.config

if [[ ! -d $HOME/my.config ]]; then
    cd $HOME
    git clone git@github.com:a3linux/my.config.git
fi

if [[ ! -L $HOME/.bash_aliases ]]; then
    ln -s $HOME/my.config/bash/bash_aliases $HOME/.bash_aliases
fi

if [[ ! -L $HOME/.vimrc ]]; then
    ln -s $HOME/my.config/vim/vimrc $HOME/.vimrc
fi

if [[ ! -L $HOME/.tmux.conf ]]; then
    ln -s $HOME/my.config/tmux/tmux.conf $HOME/.tmux.conf
fi

if [[ ! -L $HOME/.gitconfig ]]; then
    ln -s $HOME/my.config/git/gitconfig $HOME/.gitconfig
fi

if [[ ! -L $HOME/.git_env.sh ]]; then
    ln -s $HOME/my.config/git/git_env.sh $HOME/.git_env.sh
fi

if [ -f $HOME/.bashrc ]; then
    if grep -q A3LINUXBASHRCCONFIGSTAMP $HOME/.bashrc; then
        exit 0
    else
        cat $HOME/my.config/bash/bashrc >> $HOME/.bashrc
    fi
fi

