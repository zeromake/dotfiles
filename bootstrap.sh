#!/usr/bin/env bash

dir="$(dirname "${BASH_SOURCE}")";

# echo $dir

cd $dir 

# git pull;

function doIt() {
	rsync -av -b --backup-dir ${PWD}/backup --no-perms ./files/ ~;
}

if [ ! -d "~/.vim/autoload/plug.vim" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.staticdn.net/junegunn/vim-plug/master/plug.vim
fi

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
