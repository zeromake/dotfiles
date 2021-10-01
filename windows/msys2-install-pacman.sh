#!/bin/sh

set -e

curl -o pacman.pkg.tar.zst -L https://mirror.msys2.org/msys/x86_64/pacman-6.0.1-3-x86_64.pkg.tar.zst
curl -o pacman-mirrors.pkg.tar.zst -L https://mirror.msys2.org/msys/x86_64/pacman-mirrors-20210902-1-any.pkg.tar.zst
curl -o msys2-keyring.pkg.tar.zst -L https://mirror.msys2.org/msys/x86_64/msys2-keyring-1~20210904-1-any.pkg.tar.zst
# 正常来说只需要上面三个包但是由于缺少 zstd 解压工具还需要 zstd 包
curl -o zstd.pkg.tar.zst -L https://mirror.msys2.org/msys/x86_64/zstd-1.5.0-1-x86_64.pkg.tar.zst
# 但是又因为 zstd 包也是 zstd 打包又需要另一个不是 zstd 打包的解压工具来解压
curl -o zstd.zip -L https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-v1.5.0-win64.zip

unzip ./zstd.zip "zstd-v1.5.0-win64/zstd.exe" -d .
./zstd-v1.5.0-win64/zstd.exe -d -o zstd.pkg.tar zstd.pkg.tar.zst
tar -xvf zstd.pkg.tar -C /
tar -xvf msys2-keyring.pkg.tar.zst -C /
tar -xvf pacman-mirrors.pkg.tar.zst -C /
tar -xvf pacman.pkg.tar.zst -C /

