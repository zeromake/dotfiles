#!/usr/bin/env bash

set -e
dir="$(dirname "${BASH_SOURCE}")";

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

os="linux"
if is_darwin; then
    os="darwin"
fi

rm -rf $dir/files/rime/*

RIME_USER_DIR=~/.config/fcitx/rime
if [ "$os" == "darwin" ]; then
RIME_USER_DIR=~/Library/Rime
elif [ "$os" == "linux" ] || [ "$XIM" == "ibus" ]; then
RIME_USER_DIR=~/.config/ibus/rime
fi

installation_id=$(cat $RIME_USER_DIR/installation.yaml | grep 'installation_id' | cut -d '"' -f 2)

cp -r $RIME_USER_DIR/sync/$installation_id/*.custom.yaml $dir/files/rime/
cp -r $RIME_USER_DIR/sync/$installation_id/*.userdb.txt $dir/files/rime/
