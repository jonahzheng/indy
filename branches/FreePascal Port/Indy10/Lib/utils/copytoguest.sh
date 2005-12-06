#!/bin/bash
if [ ! -d /mnt/hgfs/indy ]; then
  echo "VMWare shared folders do not contain Indy"
  exit -1
fi
echo "Removing all indy files and folders from $HOME
rm -rf $HOME/indy 2> /dev/null
rmdir $HOME/indy 2> /dev/null
echo "Cleaning /mnt/hgfs"
./cleanindy.sh /mnt/hgfs
echo "Copying Indy to $HOME/indy
cp -rpf /mnt/hgfs/indy/* $HOME/indy

