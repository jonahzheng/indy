#!/bin/bash

#set -x
set -e
echo "Extracting Program and RPM Values:"
# You actually should use three version values.
# FPCVer is for the value reported by fpc for some path specs.
# FPCRPMVER is used for our "Requires section so that this is
# tied to the EXACT version of the fpc RPM you used to build
# this.
# FPCSRCRPMVER is used for our "Requires section so that this
# is tied to the EXACT version of the fpc-src RPM you used 
# you have to prevent errors.
FPCVER=`fpc -iV`
FPCRPMVER=`rpm -qa | grep 'fpc-[[:digit:]]'`
FPCRPMVER=${FPCRPMVER:4}
FPCSRCRPMVER=`rpm -qa | grep 'fpc-src-[[:digit:]]'`
FPCSRCRPMVER=${FPCSRCRPMVER:8}
echo "$FPCVER"
echo "$FPCRPMVER"
echo "$FPCSRCRPMVER"
  cat indy-fpc.spec.template| \
    sed -e 's/^%define _FPC_Version .*/%define _FPC_Version '"$FPCVER/" \
        -e 's/^%define _FPC_RPM_Ver .*/%define _FPC_RPM_Ver '"$FPCRPMVER/" \
        -e 's/^%define _FPC_SRC_RPM_Ver .*/%define _FPC_SRC_RPM_Ver '"$FPCSRCRPMVER/" \
    > indy-fpc.spec
rpmbuild -ba indy-fpc.spec
