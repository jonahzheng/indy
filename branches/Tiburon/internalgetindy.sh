#!/bin/sh
FILENAMES=$(cat /mnt/hgfs/IndyTiburon/lib/RTFileList.txt | dos2unix | tr '\\' '/') 
for i in $FILENAMES
do
#i=$(echo $i|tr '\\' '/') 
  echo $i
  cp /mnt/hgfs/IndyTiburon/lib/$i indy
done
cp /mnt/hgfs/IndyTiburon/lib/System/IdCompilerDefines.inc indy
cp /mnt/hgfs/IndyTiburon/lib/System/IdVers.inc indy
cp /mnt/hgfs/IndyTiburon/lib/System/indysystemfpc.pas indy
cp /mnt/hgfs/IndyTiburon/lib/Core/indycorefpc.pas indy
cp /mnt/hgfs/IndyTiburon/lib/Protocols/indyprotocolsfpc.pas indy
cp -r /mnt/hgfs/IndyTiburon/lib/Examples indy/examples
cp /mnt/hgfs/IndyTiburon/lib/indymaster-Makefile.fpc indy/Makefile.fpc
cd indy
FPCDIR=/usr/share/fpcsrc/2.2.4;export FPCDIR
echo $FPCDIR
cp /etc/fpc.cfg .
mkdir fakeinstall
fpcmake
echo -FU$HOME/indy/fakeinstall >> fpc.cfg
make install INSTALL_PREFIX=$HOME/indy/fakeinstall
fpcmake -rTall
cd ..

