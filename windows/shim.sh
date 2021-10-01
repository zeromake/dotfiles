#!/bin/sh

set -e

SHIM_VERSION_URL=https://hub.fastgit.org/zeromake/shim/releases
SHIM_RELEASE_URL=https://download.fastgit.org/zeromake/shim/releases
# SHIM_VERSION_URL=https://github.com/zeromake/shim/releases
# SHIM_RELEASE_URL=https://github.com/zeromake/shim/releases
if [ ! -d ~/bin ]; then
    mkdir -p ~/bin
fi
if [ ! -f ~/bin/shim.bin ]; then
    VERSION=$(curl -w '%{url_effective}' -I -L -s -S ${SHIM_VERSION_URL}/latest -o /dev/null | sed -e 's|.*/||')
    curl -L -o ~/bin/shim.bin ${SHIM_RELEASE_URL}/download/${VERSION}/shim-x86-64.exe
fi

if [ "$1" != "" ]; then
    cp ~/bin/shim.bin $1
fi
