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
  cp /mnt/hgfs/IndyTiburon/lib/fpcnotes/* $INDYDIR
  cp /mnt/hgfs/IndyTiburon/lib/makeindyrpm.sh $INDYDIR
  cp /mnt/hgfs/IndyTiburon/lib/indy-fpc.spec.template $INDYDIR
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
  cp /mnt/hgfs/IndyTiburon/lib/indymaster-Makefile.fpc $FPCINDYDIR/Makefile.fpc
  mkdir $FPCINDYDIR/examples
  cp -r /mnt/hgfs/IndyTiburon/lib/Examples/* $FPCINDYDIR/examples 
  find $FPCINDYDIR/examples -type d -name ".svn" -exec rm -rf '{}' \;
  mkdir $FPCINDYDIR/debian
  cp -r /mnt/hgfs/IndyTiburon/lib/debian/* $FPCINDYDIR/debian
  find $FPCINDYDIR/debian -type d -name ".svn" -exec rm -rf '{}' \;
fi
make
FPCSRC=/usr/share/fpcsrc/$(fpc -iV)
if [ ! -d $FPCSRC ]
then
  FPCSRC=/usr/share/fpcsrc
fi
FPCDIR=$FPCSRC;export FPCDIR
cd $FPCINDYDIR
echo $(pwd)
fpcmake -rTall
make
cd examples
fpcmake -rTall
cd ..




