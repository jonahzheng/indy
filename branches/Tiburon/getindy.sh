#!/bin/sh
INDYVERSION=`cat /mnt/hgfs/IndyTiburon/lib/System/IdVers.inc | grep ' *gsIdVersion *=.*;' | sed -e 's/[^0-9.]//g'` 
INDYDIR=indy-$INDYVERSION
FPCINDYDIR=$INDYDIR/fpc
LAZINDYDIR=$INDYDIR/lazarus

echo parameter 1 = $1
if [ "$1" != "buildonly" ]
then
  rm -rf $INDYDIR
  mkdir -p $INDYDIR/fpc 
  FILENAMES=$(cat /mnt/hgfs/IndyTiburon/lib/RTFileList.txt | dos2unix | tr '\\' '/') 
  for i in $FILENAMES
  do
    cp /mnt/hgfs/IndyTiburon/lib/$i $FPCINDYDIR
  done
  cp /mnt/hgfs/IndyTiburon/lib/System/IdCompilerDefines.inc $FPCINDYDIR
  cp /mnt/hgfs/IndyTiburon/lib/System/IdVers.inc $FPCINDYDIR
  cp /mnt/hgfs/IndyTiburon/lib/System/indysystemfpc.pas $FPCINDYDIR
  cp /mnt/hgfs/IndyTiburon/lib/Core/indycorefpc.pas $FPCINDYDIR
  cp /mnt/hgfs/IndyTiburon/lib/Protocols/indyprotocolsfpc.pas $FPCINDYDIR
  cp -r /mnt/hgfs/IndyTiburon/lib/Examples $FPCINDYDIR/examples 
  cp /mnt/hgfs/IndyTiburon/lib/indymaster-Makefile.fpc $FPCINDYDIR/Makefile.fpc
fi
FPCSRC=/usr/share/fpcsrc/$(fpc -iV)
if [ ! -d $FPCSRC ]
then
  FPCSRC=/usr/share/fpcsrc
fi

FPCDIR=$FPCSRC;export FPCDIR
echo $FPCDIR
cp /etc/fpc.cfg $FPCINDYDIR
cd $FPCINDYDIR
echo $(pwd)
mkdir fakeinstall
fpcmake
echo -Fu$HOME/$FPCINDYDIR/fakeinstall >> fpc.cfg
make install INSTALL_PREFIX=$HOME/$FPCINDYDIR/fakeinstall
fpcmake -rTall
cd ../..
rm $FPCINDYDIR/fpc.cfg


