#!/bin/bash
if [ "$1" = "" ]; then
  Usage="Usage: $0 <MainFolderForIndyClean>"
  echo $Usage
  exit -1
else
  MainDir=$1

  if [ ! -d $MainDir/indy ]; then
      echo "The directory, $MainDir does not contain an indy folder."
      exit -1;
  fi
fi
rm -rf $MainDir/indy/System/lib 2>/dev/null
rm -rf $MainDir/indy/System/__history 2>/dev/null
rm $MainDir/indy/System/indysystemlaz.pas 2>/dev/null
rm -rf $MainDir/indy/Core/lib 2>/dev/null
rm -rf $MainDir/indy/Core/__history 2>/dev/null
rm $MainDir/indy/Core/indycorelaz.pas 2>/dev/null
rm $MainDir/indy/Core/dclindycorelaz.pas 2>/dev/null
rm -rf $MainDir/indy/Protocols/lib 2>/dev/null
rm -rf $MainDir/indy/Protocols/__history 2>/dev/null
rm $MainDir/indy/Protocols/indyprotocolslaz.pas 2>/dev/null
rm $MainDir/indy/Protocols/dclindyprotocolslaz.pas 2>/dev/null
find $MainDir/indy -name "*.bak" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.~*" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.ppu" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.o" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.dcu" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.dcuil" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.dcp" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.dcpil" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.bpl" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.dll" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.cfg" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.map" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.local" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.rsp" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.identcache" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.drc" -print | xargs rm -f 2>/dev/null
find $MainDir/indy -name "*.pdb" -print | xargs rm -f 2>/dev/null
