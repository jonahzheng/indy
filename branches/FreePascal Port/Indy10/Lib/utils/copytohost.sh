#!/bin/bash
if [ ! -d $HOME/indy ]; then
  echo "VMWare guest folders do not contain Indy"
  exit -1
fi
echo "Cleaning $HOME"
./cleanindy.sh /mnt/hgfs
cp -urpf $HOME/indy/* /mnt/hgfs/indy 



