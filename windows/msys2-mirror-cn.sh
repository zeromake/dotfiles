#!/bin/bash

set -e

cp $1 $1.bak

echo "" > $1
cat $1.bak | grep 'edu.cn' >> $1

sed -e '/edu.cn/d' $1.bak >> $1
