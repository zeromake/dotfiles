#!/usr/bin/env bash

set -e

dir="$(dirname "${BASH_SOURCE}")";

# echo $dir

is_wsl() {
    case "$(uname -r)" in
    *microsoft* ) true ;; # WSL 2
    *Microsoft* ) true ;; # WSL 1
    * ) false;;
    esac
}

is_darwin() {
    case "$(uname -s)" in
    *darwin* ) true ;;
    *Darwin* ) true ;;
    * ) false;;
    esac
}

get_distribution() {
    lsb_dist=""
    if [ -r /etc/os-release ]; then
        lsb_dist="$(. /etc/os-release && echo "$ID")" | tr '[:upper:]' '[:lower:]'
    fi
    lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"
    echo "$lsb_dist"
}

os="linux"
if is_darwin; then
    os="darwin"
fi

cd $dir 

# git pull;

function doIt() {
    rsync -av -b --backup-dir ${PWD}/backup --no-perms ./files/ ~;
}

if [ ! -d "~/.vim/autoload/plug.vim" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.staticdn.net/junegunn/vim-plug/master/plug.vim
fi

if type tmux >/dev/null 2>&1; then
    echo "has tmux bin"
else
    case "$os" in
        darwin)
            brew install tmux
        ;;
        linux)
            echo "not support"
        ;;
    esac
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
