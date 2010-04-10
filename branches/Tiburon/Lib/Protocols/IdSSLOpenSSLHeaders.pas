{
  $Project$
  $Workfile$
  $Revision$
  $DateUTC$
  $Id$

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log$
}
{
  Rev 1.8    28.09.2004 21:38:44  Andreas Hausladen
  commented out unused function ErrMsg

  Rev 1.7    2004-05-07 16:52:50  Mattias
  Minor cleanup

  Rev 1.6    2004-05-07 16:34:36  Mattias
  Implemented  OpenSSL locking callbacks

  Rev 1.5    10/16/03 11:16:44 PM  RLebeau
  Updated to better support C++Builder by adding an $EXTERNSYM define to
  'time_t' so that it won't be included in the auto-generated HPP file.  The
  native time.h header file is used instead.

  Rev 1.4    10/17/2003 1:08:12 AM  DSiders
  Added localization comments.

  Rev 1.3    12/9/2002 12:48:42 PM  JPMugaas
  Fixed stupid compile error for the moment.  The Macros in err.h have to be
  sorted out later.

  Rev 1.1    12/8/2002 07:25:52 PM  JPMugaas
  Added published host and port properties.

  Rev 1.0    11/13/2002 08:01:32 AM  JPMugaas
}
unit IdSSLOpenSSLHeaders;

{
  Author: Gregor Ibic (gregor.ibic@intelicom.si)
  Copyright: (c) Gregor Ibic, Intelicom d.o.o and Indy Working Group.
}
{
Note to self::
===== Win32 with mingw32 ====
Configuring for mingw
    no-camellia     [default]  OPENSSL_NO_CAMELLIA (skip dir)
    no-capieng      [default]  OPENSSL_NO_CAPIENG (skip dir)
    no-cms          [default]  OPENSSL_NO_CMS (skip dir)
    no-gmp          [default]  OPENSSL_NO_GMP (skip dir)
    no-jpake        [experimental] OPENSSL_NO_JPAKE (skip dir)
    no-krb5         [krb5-flavor not specified] OPENSSL_NO_KRB5
    no-mdc2         [default]  OPENSSL_NO_MDC2 (skip dir)
    no-montasm      [default] 
    no-rc5          [default]  OPENSSL_NO_RC5 (skip dir)
    no-rfc3779      [default]  OPENSSL_NO_RFC3779 (skip dir)
    no-seed         [default]  OPENSSL_NO_SEED (skip dir)
    no-shared       [default] 
    no-zlib         [default] 
    no-zlib-dynamic [default] 
IsMK1MF=1
CC            =gcc
CFLAG         =-DOPENSSL_THREADS  -DDSO_WIN32 -mno-cygwin -DL_ENDIAN -fomit-frame-pointer -O3 -march=i486 -Wall -D_WIN32_WINNT=0x333 -DOPENSSL_BN_ASM_PART_WORDS -DOPENSSL_IA32_SSE2 -DSHA1_ASM -DMD5_ASM -DRMD160_ASM -DAES_ASM
EX_LIBS       =-lwsock32 -lgdi32
CPUID_OBJ     =x86cpuid-cof.o
BN_ASM        =bn86-cof.o co86-cof.o 
DES_ENC       =dx86-cof.o yx86-cof.o
AES_ASM_OBJ   =ax86-cof.o
BF_ENC        =bx86-cof.o
CAST_ENC      =cx86-cof.o
RC4_ENC       =rx86-cof.o rc4_skey.o
RC5_ENC       =r586-cof.o
MD5_OBJ_ASM   =mx86-cof.o
SHA1_OBJ_ASM  =sx86-cof.o s512sse2-cof.o
RMD160_OBJ_ASM=rm86-cof.o
PROCESSOR     =
RANLIB        =true
ARFLAGS       =
PERL          =perl
THIRTY_TWO_BIT mode
DES_PTR used
DES_RISC1 used
DES_UNROLL used
BN_LLONG mode
RC4_INDEX mode
RC4_CHUNK is undefined

Configured for mingw.
Generating x86 for GNU assember
Bignum
DES
crypt
Blowfish
CAST5
RC4
MD5
SHA1
RIPEMD160
RC5\32
CPUID
Generating makefile
Generating DLL definition files
Building the libraries
Building OpenSSL
===== Win64 ======
Targeting Windows Server 2003 X64 RETAIL

perl Configure VC-WIN64A

W:\openssl\openssl-0.9.8k>perl Configure VC-WIN64A
Configuring for VC-WIN64A
    no-camellia     [default]  OPENSSL_NO_CAMELLIA (skip dir)
    no-capieng      [default]  OPENSSL_NO_CAPIENG (skip dir)
    no-cms          [default]  OPENSSL_NO_CMS (skip dir)
    no-gmp          [default]  OPENSSL_NO_GMP (skip dir)
    no-jpake        [experimental] OPENSSL_NO_JPAKE (skip dir)
    no-krb5         [krb5-flavor not specified] OPENSSL_NO_KRB5
    no-mdc2         [default]  OPENSSL_NO_MDC2 (skip dir)
    no-montasm      [default]
    no-rc5          [default]  OPENSSL_NO_RC5 (skip dir)
    no-rfc3779      [default]  OPENSSL_NO_RFC3779 (skip dir)
    no-seed         [default]  OPENSSL_NO_SEED (skip dir)
    no-shared       [default]
    no-zlib         [default]
    no-zlib-dynamic [default]
IsMK1MF=1
CC            =cl
CFLAG         =-DOPENSSL_THREADS  -DDSO_WIN32
EX_LIBS       =
CPUID_OBJ     =
BN_ASM        =bn_asm.o
DES_ENC       =des_enc.o fcrypt_b.o
AES_ASM_OBJ   =aes_core.o aes_cbc.o
BF_ENC        =bf_enc.o
CAST_ENC      =c_enc.o
RC4_ENC       =rc4_enc.o rc4_skey.o
RC5_ENC       =rc5_enc.o
MD5_OBJ_ASM   =
SHA1_OBJ_ASM  =
RMD160_OBJ_ASM=
PROCESSOR     =
RANLIB        =true
ARFLAGS       =
PERL          =perl
SIXTY_FOUR_BIT mode
DES_INT used
RC4_CHUNK is unsigned long long

Configured for VC-WIN64A.

W:\openssl\openssl-0.9.8k>ms\do_win64a

W:\openssl\openssl-0.9.8k>perl util\mkfiles.pl  1>MINFO

W:\openssl\openssl-0.9.8k>perl ms\uplink.pl win64a  1>ms\uptable.asm

W:\openssl\openssl-0.9.8k>ml64 -c -Foms\uptable.obj ms\uptable.asm
Microsoft (R) Macro Assembler (AMD64) Version 8.00.40310.39
Copyright (C) Microsoft Corporation.  All rights reserved.

 Assembling: ms\uptable.asm

W:\openssl\openssl-0.9.8k>perl util\mk1mf.pl no-asm VC-WIN64A  1>ms\nt.mak

W:\openssl\openssl-0.9.8k>perl util\mk1mf.pl dll no-asm VC-WIN64A  1>ms\ntdll.ma
k

W:\openssl\openssl-0.9.8k>perl util\mkdef.pl 32 libeay  1>ms\libeay32.def

W:\openssl\openssl-0.9.8k>perl util\mkdef.pl 32 ssleay  1>ms\ssleay32.def

CFLAG= /MD /Ox /W3 /Gs0 /GF /Gy /nologo
-DWIN32_LEAN_AND_MEAN -DL_ENDIAN -DDSO_WIN32 -DOPENSSL_SYSNAME_WIN32
-DOPENSSL_SYSNAME_WINNT -DUNICODE -D_UNICODE -D_CRT_SECURE_NO_DEPRECATE
-D_CRT_NONSTDC_NO_DEPRECATE -DOPENSSL_USE_APPLINK -I. /Fdout32dll
-DOPENSSL_NO_CAMELLIA -DOPENSSL_NO_SEED -DOPENSSL_NO_RC5 -DOPENSSL_NO_MDC2
-DOPENSSL_NO_CMS -DOPENSSL_NO_JPAKE -DOPENSSL_NO_CAPIENG -DOPENSSL_NO_KRB5
-DOPENSSL_NO_DYNAMIC_ENGINE

}

interface

{$i IdCompilerDefines.inc}

{$IFNDEF USE_OPENSSL}
  {$message error Should not compile if USE_OPENSSL is not defined!!!}
{$ENDIF}
{$WRITEABLECONST OFF}

{$IFNDEF FPC}
  {$IFDEF WIN32}
    {$ALIGN OFF}
  {$ELSE}
    {$IFNDEF VCL_CROSS_COMPILE}
      {$message error alignment!}
    {$ENDIF}
  {$ENDIF}
{$ELSE}
  {$packrecords C}
{$ENDIF}

//THe OpenSSL developers use a IF 0 and an IF 1 convention for selectively
//enabling or disabling things.
{$DEFINE USE_THIS}
{.$DEFINE OMIT_THIS}
{
IMPORTANT!!!!

A lot of IFDEF's and defines have to used because OpenSSL has a number of options'
and those can effect the API.  The options are determined by a "configure" script
that generates apporpriate make files with the appropriate defines.  If you do
custom compiles of OpenSSL or if it's compiled differently that what I assume,
you will need to add or deactivate the defines.

my $x86_gcc_des="DES_PTR DES_RISC1 DES_UNROLL";

# MD2_CHAR slags pentium pros
my $x86_gcc_opts="RC4_INDEX MD2_INT";
...
# This is what $depflags will look like with the above defaults
# (we need this to see if we should advise the user to run "make depend"):
my $default_depflags = " -DOPENSSL_NO_CAMELLIA -DOPENSSL_NO_CAPIENG -DOPENSSL_NO_CMS -DOPENSSL_NO_GMP -DOPENSSL_NO_JPAKE -DOPENSSL_NO_MDC2 -DOPENSSL_NO_RC5 -DOPENSSL_NO_RFC3779 -DOPENSSL_NO_SEED";

}

// # Our development configs
// "purify",	"purify gcc:-g -DPURIFY -Wall::(unknown)::-lsocket -lnsl::::",
// "debug",	"gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM -ggdb -g2 -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror::(unknown)::-lefence::::",
// "debug-ben",	"gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown):::::bn86-elf.o co86-elf.o",
// "debug-ben-openbsd","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
// "debug-ben-openbsd-debug","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -g3 -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
// "debug-ben-debug",	"gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -g3 -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::::",
// "debug-ben-strict",	"gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DCONST_STRICT -O2 -Wall -Wshadow -Werror -Wpointer-arith -Wcast-qual -Wwrite-strings -pipe::(unknown)::::::",
// "debug-rse","cc:-DTERMIOS -DL_ENDIAN -pipe -O -g -ggdb3 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
// "debug-bodo",	"gcc:-DL_ENDIAN -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBIO_PAIR_DEBUG -DPEDANTIC -g -march=i486 -pedantic -Wshadow -Wall -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
// "debug-ulf", "gcc:-DTERMIOS -DL_ENDIAN -march=i486 -Wall -DBN_DEBUG -DBN_DEBUG_RAND -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations:::CYGWIN32:::${no_asm}:win32:cygwin-shared:::.dll",
// "debug-steve64", "gcc:-m64 -DL_ENDIAN -DTERMIO -DREF_CHECK -DCONF_DEBUG -DDEBUG_SAFESTACK -DCRYPTO_MDEBUG_ALL -DPEDANTIC -DOPENSSL_NO_DEPRECATED -g -pedantic -Wall -Werror -Wno-long-long -Wsign-compare -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-steve32", "gcc:-m32 -DL_ENDIAN -DREF_CHECK -DCONF_DEBUG -DDEBUG_SAFESTACK -DCRYPTO_MDEBUG_ALL -DPEDANTIC -DOPENSSL_NO_DEPRECATED -g -pedantic -Wno-long-long -Wall -Werror -Wshadow -pipe::-D_REENTRANT::-rdynamic -ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC:-m32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-steve",	"gcc:-DL_ENDIAN -DREF_CHECK -DCONF_DEBUG -DDEBUG_SAFESTACK -DCRYPTO_MDEBUG_ALL -DPEDANTIC -m32 -g -pedantic -Wno-long-long -Wall -Werror -Wshadow -pipe::-D_REENTRANT::-rdynamic -ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared",
// "debug-steve-opt",	"gcc:-DL_ENDIAN -DREF_CHECK -DCONF_DEBUG -DDEBUG_SAFESTACK -DCRYPTO_MDEBUG_ALL -DPEDANTIC -m32 -O3 -g -pedantic -Wno-long-long -Wall -Werror -Wshadow -pipe::-D_REENTRANT::-rdynamic -ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared",
// "debug-steve-linux-pseudo64",	"gcc:-DL_ENDIAN -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DDEBUG_SAFESTACK -DCRYPTO_MDEBUG_ALL -DOPENSSL_NO_ASM -g -mcpu=i486 -Wall -Werror -Wshadow -pipe::-D_REENTRANT::-rdynamic -ldl:SIXTY_FOUR_BIT:${no_asm}:dlfcn:linux-shared",
// "debug-levitte-linux-elf","gcc:-DLEVITTE_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_DEBUG -DBN_DEBUG_RAND -DCRYPTO_MDEBUG -DENGINE_CONF_DEBUG -DL_ENDIAN -DTERMIO -D_POSIX_SOURCE -DPEDANTIC -ggdb -g3 -mcpu=i486 -pedantic -ansi -Wall -Wshadow -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-levitte-linux-noasm","gcc:-DLEVITTE_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_DEBUG -DBN_DEBUG_RAND -DCRYPTO_MDEBUG -DENGINE_CONF_DEBUG -DOPENSSL_NO_ASM -DL_ENDIAN -DTERMIO -D_POSIX_SOURCE -DPEDANTIC -ggdb -g3 -mcpu=i486 -pedantic -ansi -Wall -Wshadow -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-levitte-linux-elf-extreme","gcc:-DLEVITTE_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_DEBUG -DBN_DEBUG_RAND -DCRYPTO_MDEBUG -DENGINE_CONF_DEBUG -DL_ENDIAN -DTERMIO -D_POSIX_SOURCE -DPEDANTIC -ggdb -g3 -mcpu=i486 -pedantic -ansi -Wall -W -Wundef -Wshadow -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-levitte-linux-noasm-extreme","gcc:-DLEVITTE_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_DEBUG -DBN_DEBUG_RAND -DCRYPTO_MDEBUG -DENGINE_CONF_DEBUG -DOPENSSL_NO_ASM -DL_ENDIAN -DTERMIO -D_POSIX_SOURCE -DPEDANTIC -ggdb -g3 -mcpu=i486 -pedantic -ansi -Wall -W -Wundef -Wshadow -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-geoff","gcc:-DBN_DEBUG -DBN_DEBUG_RAND -DBN_STRICT -DPURIFY -DOPENSSL_NO_DEPRECATED -DOPENSSL_NO_ASM -DOPENSSL_NO_INLINE_ASM -DL_ENDIAN -DTERMIO -DPEDANTIC -O1 -ggdb2 -Wall -Werror -Wundef -pedantic -Wshadow -Wpointer-arith -Wbad-function-cast -Wcast-align -Wsign-compare -Wmissing-prototypes -Wmissing-declarations -Wno-long-long::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-linux-pentium","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG -DL_ENDIAN -DTERMIO -g -mcpu=pentium -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn",
// "debug-linux-ppro","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG -DL_ENDIAN -DTERMIO -g -mcpu=pentiumpro -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn",
// "debug-linux-elf","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG -DL_ENDIAN -DTERMIO -g -march=i486 -Wall::-D_REENTRANT::-lefence -ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-linux-elf-noefence","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG -DL_ENDIAN -DTERMIO -g -march=i486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "dist",		"cc:-O::(unknown)::::::",

// # Basic configs that should work on any (32 and less bit) box
// "gcc",		"gcc:-O3::(unknown):::BN_LLONG:::",
// "cc",		"cc:-O::(unknown)::::::",

// ####VOS Configurations
// "vos-gcc","gcc:-O3 -Wall -D_POSIX_C_SOURCE=200112L -D_BSD -DB_ENDIAN::(unknown):VOS:-Wl,-map:BN_LLONG:${no_asm}:::::.so:",
// "debug-vos-gcc","gcc:-O0 -g -Wall -D_POSIX_C_SOURCE=200112L -D_BSD -DB_ENDIAN -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG::(unknown):VOS:-Wl,-map:BN_LLONG:${no_asm}:::::.so:",

// #### Solaris x86 with GNU C setups
// # -DOPENSSL_NO_INLINE_ASM switches off inline assembler. We have to do it
// # here because whenever GNU C instantiates an assembler template it
// # surrounds it with #APP #NO_APP comment pair which (at least Solaris
// # 7_x86) /usr/ccs/bin/as fails to assemble with "Illegal mnemonic"
// # error message.
// "solaris-x86-gcc","gcc:-O3 -fomit-frame-pointer -march=pentium -Wall -DL_ENDIAN -DOPENSSL_NO_INLINE_ASM::-D_REENTRANT::-lsocket -lnsl -ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:solaris-shared:-fPIC:-shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # -shared -static-libgcc might appear controversial, but modules taken
// # from static libgcc do not have relocations and linking them into our
// # shared objects doesn't have any negative side-effects. On the contrary,
// # doing so makes it possible to use gcc shared build with Sun C. Given
// # that gcc generates faster code [thanks to inline assembler], I would
// # actually recommend to consider using gcc shared build even with vendor
// # compiler:-)
// #						<appro@fy.chalmers.se>
// "solaris64-x86_64-gcc","gcc:-m64 -O3 -Wall -DL_ENDIAN -DMD32_REG_T=int::-D_REENTRANT::-lsocket -lnsl -ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:solaris-shared:-fPIC:-m64 -shared -static-libgcc:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
//
// #### Solaris x86 with Sun C setups
// "solaris-x86-cc","cc:-fast -O -Xa::-D_REENTRANT::-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_PTR DES_UNROLL BF_PTR:${no_asm}:dlfcn:solaris-shared:-KPIC:-G -dy -z text:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "solaris64-x86_64-cc","cc:-fast -xarch=amd64 -xstrconst -Xa -DL_ENDIAN::-D_REENTRANT::-lsocket -lnsl -ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:solaris-shared:-KPIC:-xarch=amd64 -G -dy -z text:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// #### SPARC Solaris with GNU C setups
// "solaris-sparcv7-gcc","gcc:-O3 -fomit-frame-pointer -Wall -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT::-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${no_asm}:dlfcn:solaris-shared:-fPIC:-shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "solaris-sparcv8-gcc","gcc:-mv8 -O3 -fomit-frame-pointer -Wall -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT::-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:solaris-shared:-fPIC:-shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # -m32 should be safe to add as long as driver recognizes -mcpu=ultrasparc
// "solaris-sparcv9-gcc","gcc:-m32 -mcpu=ultrasparc -O3 -fomit-frame-pointer -Wall -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT:ULTRASPARC:-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:solaris-shared:-fPIC:-shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "solaris64-sparcv9-gcc","gcc:-m64 -mcpu=ultrasparc -O3 -Wall -DB_ENDIAN::-D_REENTRANT:ULTRASPARC:-lsocket -lnsl -ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL BF_PTR:::des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:solaris-shared:-fPIC:-m64 -shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// ####
// "debug-solaris-sparcv8-gcc","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG_ALL -O -g -mv8 -Wall -DB_ENDIAN::-D_REENTRANT::-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8.o::::::::::dlfcn:solaris-shared:-fPIC:-shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-solaris-sparcv9-gcc","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG_ALL -DPEDANTIC -O -g -mcpu=ultrasparc -pedantic -ansi -Wall -Wshadow -Wno-long-long -D__EXTENSIONS__ -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT:ULTRASPARC:-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:solaris-shared:-fPIC:-shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// #### SPARC Solaris with Sun C setups
// # SC4.0 doesn't pass 'make test', upgrade to SC5.0 or SC4.2.
// # SC4.2 is ok, better than gcc even on bn as long as you tell it -xarch=v8
// # SC5.0 note: Compiler common patch 107357-01 or later is required!
// "solaris-sparcv7-cc","cc:-xO5 -xstrconst -xdepend -Xa -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT::-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_PTR DES_RISC1 DES_UNROLL BF_PTR:${no_asm}:dlfcn:solaris-shared:-KPIC:-G -dy -z text:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "solaris-sparcv8-cc","cc:-xarch=v8 -xO5 -xstrconst -xdepend -Xa -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT::-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_PTR DES_RISC1 DES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:solaris-shared:-KPIC:-G -dy -z text:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "solaris-sparcv9-cc","cc:-xtarget=ultra -xarch=v8plus -xO5 -xstrconst -xdepend -Xa -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT:ULTRASPARC:-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK_LL DES_PTR DES_RISC1 DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:solaris-shared:-KPIC:-G -dy -z text:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "solaris64-sparcv9-cc","cc:-xtarget=ultra -xarch=v9 -xO5 -xstrconst -xdepend -Xa -DB_ENDIAN::-D_REENTRANT:ULTRASPARC:-lsocket -lnsl -ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL BF_PTR:::des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:solaris-shared:-KPIC:-xarch=v9 -G -dy -z text:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):/usr/ccs/bin/ar rs",
// ####
// "debug-solaris-sparcv8-cc","cc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG_ALL -xarch=v8 -g -O -xstrconst -Xa -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT::-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_PTR DES_RISC1 DES_UNROLL BF_PTR::sparcv8.o::::::::::dlfcn:solaris-shared:-KPIC:-G -dy -z text:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-solaris-sparcv9-cc","cc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG_ALL -xtarget=ultra -xarch=v8plus -g -O -xstrconst -Xa -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT:ULTRASPARC:-lsocket -lnsl -ldl:BN_LLONG RC4_CHAR RC4_CHUNK_LL DES_PTR DES_RISC1 DES_UNROLL BF_PTR::sparcv8plus.o::::::::::dlfcn:solaris-shared:-KPIC:-G -dy -z text:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// #### SunOS configs, assuming sparc for the gcc one.
// #"sunos-cc", "cc:-O4 -DNOPROTO -DNOCONST::(unknown):SUNOS::DES_UNROLL:${no_asm}::",
// "sunos-gcc","gcc:-O3 -mv8 -Dssize_t=int::(unknown):SUNOS::BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL DES_PTR DES_RISC1:${no_asm}::",

// #### IRIX 5.x configs
// # -mips2 flag is added by ./config when appropriate.
// "irix-gcc","gcc:-O3 -DTERMIOS -DB_ENDIAN::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR RC4_CHUNK DES_UNROLL DES_RISC2 DES_PTR BF_PTR:${no_asm}:dlfcn:irix-shared:::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "irix-cc", "cc:-O2 -use_readonly_const -DTERMIOS -DB_ENDIAN::(unknown):::BN_LLONG RC4_CHAR RC4_CHUNK DES_PTR DES_RISC2 DES_UNROLL BF_PTR:${no_asm}:dlfcn:irix-shared:::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// #### IRIX 6.x configs
// # Only N32 and N64 ABIs are supported. If you need O32 ABI build, invoke
// # './Configure irix-cc -o32' manually.
// "irix-mips3-gcc","gcc:-mabi=n32 -O3 -DTERMIOS -DB_ENDIAN -DBN_DIV3W::-D_SGI_MP_SOURCE:::MD2_CHAR RC4_INDEX RC4_CHAR RC4_CHUNK_LL DES_UNROLL DES_RISC2 DES_PTR BF_PTR SIXTY_FOUR_BIT::bn-mips3.o::::::::::dlfcn:irix-shared::-mabi=n32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "irix-mips3-cc", "cc:-n32 -mips3 -O2 -use_readonly_const -G0 -rdata_shared -DTERMIOS -DB_ENDIAN -DBN_DIV3W::-D_SGI_MP_SOURCE:::DES_PTR RC4_CHAR RC4_CHUNK_LL DES_RISC2 DES_UNROLL BF_PTR SIXTY_FOUR_BIT::bn-mips3.o::::::::::dlfcn:irix-shared::-n32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # N64 ABI builds.
// "irix64-mips4-gcc","gcc:-mabi=64 -mips4 -O3 -DTERMIOS -DB_ENDIAN -DBN_DIV3W::-D_SGI_MP_SOURCE:::RC4_CHAR RC4_CHUNK DES_RISC2 DES_UNROLL SIXTY_FOUR_BIT_LONG::bn-mips3.o::::::::::dlfcn:irix-shared::-mabi=64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "irix64-mips4-cc", "cc:-64 -mips4 -O2 -use_readonly_const -G0 -rdata_shared -DTERMIOS -DB_ENDIAN -DBN_DIV3W::-D_SGI_MP_SOURCE:::RC4_CHAR RC4_CHUNK DES_RISC2 DES_UNROLL SIXTY_FOUR_BIT_LONG::bn-mips3.o::::::::::dlfcn:irix-shared::-64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// #### Unified HP-UX ANSI C configs.
// # Special notes:
// # - Originally we were optimizing at +O4 level. It should be noted
// #   that the only difference between +O3 and +O4 is global inter-
// #   procedural analysis. As it has to be performed during the link
// #   stage the compiler leaves behind certain pseudo-code in lib*.a
// #   which might be release or even patch level specific. Generating
// #   the machine code for and analyzing the *whole* program appears
// #   to be *extremely* memory demanding while the performance gain is
// #   actually questionable. The situation is intensified by the default
// #   HP-UX data set size limit (infamous 'maxdsiz' tunable) of 64MB
// #   which is way too low for +O4. In other words, doesn't +O3 make
// #   more sense?
// # - Keep in mind that the HP compiler by default generates code
// #   suitable for execution on the host you're currently compiling at.
// #   If the toolkit is ment to be used on various PA-RISC processors
// #   consider './config +DAportable'.
// # - +DD64 is chosen in favour of +DA2.0W because it's meant to be
// #   compatible with *future* releases.
// # - If you run ./Configure hpux-parisc-[g]cc manually don't forget to
// #   pass -D_REENTRANT on HP-UX 10 and later.
// # - -DMD32_XARRAY triggers workaround for compiler bug we ran into in
// #   32-bit message digests. (For the moment of this writing) HP C
// #   doesn't seem to "digest" too many local variables (they make "him"
// #   chew forever:-). For more details look-up MD32_XARRAY comment in
// #   crypto/sha/sha_lcl.h.
// #					<appro@fy.chalmers.se>
// #
// # Since there is mention of this in shlib/hpux10-cc.sh
// "hpux-parisc-cc-o4","cc:-Ae +O4 +ESlit -z -DB_ENDIAN -DBN_DIV2W -DMD32_XARRAY::-D_REENTRANT::-ldld:BN_LLONG DES_PTR DES_UNROLL DES_RISC1:${no_asm}:dl:hpux-shared:+Z:-b:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "hpux-parisc-gcc","gcc:-O3 -DB_ENDIAN -DBN_DIV2W::-D_REENTRANT::-Wl,+s -ldld:BN_LLONG DES_PTR DES_UNROLL DES_RISC1:${no_asm}:dl:hpux-shared:-fPIC:-shared:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "hpux-parisc2-gcc","gcc:-march=2.0 -O3 -DB_ENDIAN -D_REENTRANT::::-Wl,+s -ldld:SIXTY_FOUR_BIT RC4_CHAR RC4_CHUNK DES_PTR DES_UNROLL DES_RISC1::pa-risc2.o::::::::::dl:hpux-shared:-fPIC:-shared:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "hpux64-parisc2-gcc","gcc:-O3 -DB_ENDIAN -D_REENTRANT::::-ldl:SIXTY_FOUR_BIT_LONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC1 DES_INT::pa-risc2W.o::::::::::dlfcn:hpux-shared:-fpic:-shared:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// # More attempts at unified 10.X and 11.X targets for HP C compiler.
// #
// # Chris Ruemmler <ruemmler@cup.hp.com>
// # Kevin Steves <ks@hp.se>
// "hpux-parisc-cc","cc:+O3 +Optrs_strongly_typed -Ae +ESlit -DB_ENDIAN -DBN_DIV2W -DMD32_XARRAY::-D_REENTRANT::-Wl,+s -ldld:MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC1 DES_INT:${no_asm}:dl:hpux-shared:+Z:-b:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "hpux-parisc1_0-cc","cc:+DAportable +O3 +Optrs_strongly_typed -Ae +ESlit -DB_ENDIAN -DMD32_XARRAY::-D_REENTRANT::-Wl,+s -ldld:MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC1 DES_INT:${no_asm}:dl:hpux-shared:+Z:-b:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "hpux-parisc2-cc","cc:+DA2.0 +DS2.0 +O3 +Optrs_strongly_typed -Ae +ESlit -DB_ENDIAN -DMD32_XARRAY -D_REENTRANT::::-Wl,+s -ldld:SIXTY_FOUR_BIT MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC1 DES_INT::pa-risc2.o::::::::::dl:hpux-shared:+Z:-b:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "hpux64-parisc2-cc","cc:+DD64 +O3 +Optrs_strongly_typed -Ae +ESlit -DB_ENDIAN -DMD32_XARRAY -D_REENTRANT::::-ldl:SIXTY_FOUR_BIT_LONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC1 DES_INT::pa-risc2W.o::::::::::dlfcn:hpux-shared:+Z:+DD64 -b:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// # HP/UX IA-64 targets
// "hpux-ia64-cc","cc:-Ae +DD32 +O2 +Olit=all -z -DB_ENDIAN -D_REENTRANT::::-ldl:SIXTY_FOUR_BIT MD2_CHAR RC4_INDEX DES_UNROLL DES_RISC1 DES_INT:${ia64_asm}:dlfcn:hpux-shared:+Z:+DD32 -b:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # Frank Geurts <frank.geurts@nl.abnamro.com> has patiently assisted with
// # with debugging of the following config.
// "hpux64-ia64-cc","cc:-Ae +DD64 +O3 +Olit=all -z -DB_ENDIAN -D_REENTRANT::::-ldl:SIXTY_FOUR_BIT_LONG MD2_CHAR RC4_INDEX DES_UNROLL DES_RISC1 DES_INT:${ia64_asm}:dlfcn:hpux-shared:+Z:+DD64 -b:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # GCC builds...
// "hpux-ia64-gcc","gcc:-O3 -DB_ENDIAN -D_REENTRANT::::-ldl:SIXTY_FOUR_BIT MD2_CHAR RC4_INDEX DES_UNROLL DES_RISC1 DES_INT:${ia64_asm}:dlfcn:hpux-shared:-fpic:-shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "hpux64-ia64-gcc","gcc:-mlp64 -O3 -DB_ENDIAN -D_REENTRANT::::-ldl:SIXTY_FOUR_BIT_LONG MD2_CHAR RC4_INDEX DES_UNROLL DES_RISC1 DES_INT:${ia64_asm}:dlfcn:hpux-shared:-fpic:-mlp64 -shared:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// # Legacy HPUX 9.X configs...
// "hpux-cc",	"cc:-DB_ENDIAN -DBN_DIV2W -DMD32_XARRAY -Ae +ESlit +O2 -z::(unknown)::-Wl,+s -ldld:DES_PTR DES_UNROLL DES_RISC1:${no_asm}:dl:hpux-shared:+Z:-b:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "hpux-gcc",	"gcc:-DB_ENDIAN -DBN_DIV2W -O3::(unknown)::-Wl,+s -ldld:DES_PTR DES_UNROLL DES_RISC1:${no_asm}:dl:hpux-shared:-fPIC:-shared:.sl.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// #### HP MPE/iX http://jazz.external.hp.com/src/openssl/
// "MPE/iX-gcc",	"gcc:-D_ENDIAN -DBN_DIV2W -O3 -D_POSIX_SOURCE -D_SOCKET_SOURCE -I/SYSLOG/PUB::(unknown):MPE:-L/SYSLOG/PUB -lsyslog -lsocket -lcurses:BN_LLONG DES_PTR DES_UNROLL DES_RISC1:::",

// # DEC Alpha OSF/1/Tru64 targets.
// #
// #	"What's in a name? That which we call a rose
// #	 By any other word would smell as sweet."
// #
// # - William Shakespeare, "Romeo & Juliet", Act II, scene II.
// #
// # For gcc, the following gave a %50 speedup on a 164 over the 'DES_INT' version
// #
// "osf1-alpha-gcc", "gcc:-O3::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_UNROLL DES_RISC1:${no_asm}:dlfcn:alpha-osf1-shared:::.so",
// "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${no_asm}:dlfcn:alpha-osf1-shared:::.so",
// "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthread:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${no_asm}:dlfcn:alpha-osf1-shared::-msym:.so",

// ####
// #### Variety of LINUX:-)
// ####
// # *-generic* is endian-neutral target, but ./config is free to
// # throw in -D[BL]_ENDIAN, whichever appropriate...
// "linux-generic32","gcc:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-ppc",	"gcc:-DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL::linux_ppc32.o::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// #### IA-32 targets...
// "linux-ia32-icc",	"icc:-DL_ENDIAN -DTERMIO -O2 -no_cpprt::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-KPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-elf",	"gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-aout",	"gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -march=i486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_out_asm}",
// ####
// "linux-generic64","gcc:-DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-ppc64",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL::linux_ppc64.o::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-ia64",	"gcc:-DL_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-ia64-ecc","ecc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-ia64-icc","icc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// #### SPARC Linux setups
// # Ray Miller <ray.miller@computing-services.oxford.ac.uk> has patiently
// # assisted with debugging of following two configs.
// "linux-sparcv8","gcc:-mv8 -DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # it's a real mess with -mcpu=ultrasparc option under Linux, but
// # -Wa,-Av8plus should do the trick no matter what.
// "linux-sparcv9","gcc:-m32 -mcpu=ultrasparc -DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall -Wa,-Av8plus -DBN_DIV2W::-D_REENTRANT:ULTRASPARC:-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:linux-shared:-fPIC:-m32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # GCC 3.1 is a requirement
// "linux64-sparcv9","gcc:-m64 -mcpu=ultrasparc -DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT:ULTRASPARC:-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// #### Alpha Linux with GNU C and Compaq C setups
// # Special notes:
// # - linux-alpha+bwx-gcc is ment to be used from ./config only. If you
// #   ought to run './Configure linux-alpha+bwx-gcc' manually, do
// #   complement the command line with -mcpu=ev56, -mcpu=ev6 or whatever
// #   which is appropriate.
// # - If you use ccc keep in mind that -fast implies -arch host and the
// #   compiler is free to issue instructions which gonna make elder CPU
// #   choke. If you wish to build "blended" toolkit, add -arch generic
// #   *after* -fast and invoke './Configure linux-alpha-ccc' manually.
// #
// #					<appro@fy.chalmers.se>
// #
// "linux-alpha-gcc","gcc:-O3 -DL_ENDIAN -DTERMIO::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-alpha+bwx-gcc","gcc:-O3 -DL_ENDIAN -DTERMIO::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${no_asm}",
// "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${no_asm}",

// #### *BSD [do see comment about ${BSDthreads} above!]
// "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "BSD-x86",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_out_asm}:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "BSD-x86-elf",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "debug-BSD-x86-elf",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wall -g::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "BSD-sparcv8",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -mv8 -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL::sparcv8.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// "BSD-generic64","gcc:-DTERMIOS -O3 -Wall::${BSDthreads}:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # -DMD32_REG_T=int doesn't actually belong in sparc64 target, it
// # simply *happens* to work around a compiler bug in gcc 3.3.3,
// # triggered by RIPEMD160 code.
// "BSD-sparc64",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -DMD32_REG_T=int -Wall::${BSDthreads}:::SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC2 BF_PTR:::des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "BSD-ia64",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wall::${BSDthreads}:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${ia64_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "BSD-x86_64",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -DMD32_REG_T=int -Wall::${BSDthreads}:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// "bsdi-elf-gcc",     "gcc:-DPERL5 -DL_ENDIAN -fomit-frame-pointer -O3 -march=i486 -Wall::(unknown)::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// "nextstep",	"cc:-O -Wall:<libc.h>:(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::",
// "nextstep3.3",	"cc:-O3 -Wall:<libc.h>:(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::",

// # NCR MP-RAS UNIX ver 02.03.01
// "ncr-scde","cc:-O6 -Xa -Hoff=BEHAVED -686 -Hwide -Hiw::(unknown)::-lsocket -lnsl -lc89:${x86_gcc_des} ${x86_gcc_opts}:::",

// # QNX
// "qnx4",	"cc:-DL_ENDIAN -DTERMIO::(unknown):::${x86_gcc_des} ${x86_gcc_opts}:",
// "qnx6",	"cc:-DL_ENDIAN -DTERMIOS::(unknown)::-lsocket:${x86_gcc_des} ${x86_gcc_opts}:",

// #### SCO/Caldera targets.
// #
// # Originally we had like unixware-*, unixware-*-pentium, unixware-*-p6, etc.
// # Now we only have blended unixware-* as it's the only one used by ./config.
// # If you want to optimize for particular microarchitecture, bypass ./config
// # and './Configure unixware-7 -Kpentium_pro' or whatever appropriate.
// # Note that not all targets include assembler support. Mostly because of
// # lack of motivation to support out-of-date platforms with out-of-date
// # compiler drivers and assemblers. Tim Rice <tim@multitalents.net> has
// # patiently assisted to debug most of it.
// #
// # UnixWare 2.0x fails destest with -O.
// "unixware-2.0","cc:-DFILIO_H -DNO_STRINGS_H::-Kthread::-lsocket -lnsl -lresolv -lx:${x86_gcc_des} ${x86_gcc_opts}:::",
// "unixware-2.1","cc:-O -DFILIO_H::-Kthread::-lsocket -lnsl -lresolv -lx:${x86_gcc_des} ${x86_gcc_opts}:::",
// "unixware-7","cc:-O -DFILIO_H -Kalloca::-Kthread::-lsocket -lnsl:BN_LLONG MD2_CHAR RC4_INDEX ${x86_gcc_des}:${x86_elf_asm}:dlfcn:svr5-shared:-Kpic::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "unixware-7-gcc","gcc:-DL_ENDIAN -DFILIO_H -O3 -fomit-frame-pointer -march=pentium -Wall::-D_REENTRANT::-lsocket -lnsl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:gnu-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// # SCO 5 - Ben Laurie <ben@algroup.co.uk> says the -O breaks the SCO cc.
// "sco5-cc",  "cc:-belf::(unknown)::-lsocket -lnsl:${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:svr3-shared:-Kpic::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "sco5-gcc",  "gcc:-O3 -fomit-frame-pointer::(unknown)::-lsocket -lnsl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:svr3-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

// #### IBM's AIX.
// "aix3-cc",  "cc:-O -DB_ENDIAN -qmaxmem=16384::(unknown):AIX::BN_LLONG RC4_CHAR:::",
// "aix-gcc",  "gcc:-O -DB_ENDIAN::-pthread:AIX::BN_LLONG RC4_CHAR::aix_ppc32.o::::::::::dlfcn:aix-shared::-shared -Wl,-G:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)::-X 32",
// "aix64-gcc","gcc:-maix64 -O -DB_ENDIAN::-pthread:AIX::SIXTY_FOUR_BIT_LONG RC4_CHAR::aix_ppc64.o::::::::::dlfcn:aix-shared::-maix64 -shared -Wl,-G:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)::-X64",
// # Below targets assume AIX 5. Idea is to effectively disregard $OBJECT_MODE
// # at build time. $OBJECT_MODE is respected at ./config stage!
// "aix-cc",   "cc:-q32 -O -DB_ENDIAN -qmaxmem=16384 -qro -qroconst::-qthreaded:AIX::BN_LLONG RC4_CHAR::aix_ppc32.o::::::::::dlfcn:aix-shared::-q32 -G:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)::-X 32",
// "aix64-cc", "cc:-q64 -O -DB_ENDIAN -qmaxmem=16384 -qro -qroconst::-qthreaded:AIX::SIXTY_FOUR_BIT_LONG RC4_CHAR::aix_ppc64.o::::::::::dlfcn:aix-shared::-q64 -G:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)::-X 64",

// #
// # Cray T90 and similar (SDSC)
// # It's Big-endian, but the algorithms work properly when B_ENDIAN is NOT
// # defined.  The T90 ints and longs are 8 bytes long, and apparently the
// # B_ENDIAN code assumes 4 byte ints.  Fortunately, the non-B_ENDIAN and
// # non L_ENDIAN code aligns the bytes in each word correctly.
// #
// # The BIT_FIELD_LIMITS define is to avoid two fatal compiler errors:
// #'Taking the address of a bit field is not allowed. '
// #'An expression with bit field exists as the operand of "sizeof" '
// # (written by Wayne Schroeder <schroede@SDSC.EDU>)
// #
// # j90 is considered the base machine type for unicos machines,
// # so this configuration is now called "cray-j90" ...
// "cray-j90", "cc: -DBIT_FIELD_LIMITS -DTERMIOS::(unknown):CRAY::SIXTY_FOUR_BIT_LONG DES_INT:::",

// #
// # Cray T3E (Research Center Juelich, beckman@acl.lanl.gov)
// #
// # The BIT_FIELD_LIMITS define was written for the C90 (it seems).  I added
// # another use.  Basically, the problem is that the T3E uses some bit fields
// # for some st_addr stuff, and then sizeof and address-of fails
// # I could not use the ams/alpha.o option because the Cray assembler, 'cam'
// # did not like it.
// "cray-t3e", "cc: -DBIT_FIELD_LIMITS -DTERMIOS::(unknown):CRAY::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT:::",

// # DGUX, 88100.
// "dgux-R3-gcc",	"gcc:-O3 -fomit-frame-pointer::(unknown):::RC4_INDEX DES_UNROLL:::",
// "dgux-R4-gcc",	"gcc:-O3 -fomit-frame-pointer::(unknown)::-lnsl -lsocket:RC4_INDEX DES_UNROLL:::",
// "dgux-R4-x86-gcc",	"gcc:-O3 -fomit-frame-pointer -DL_ENDIAN::(unknown)::-lnsl -lsocket:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",

// # Sinix/ReliantUNIX RM400
// # NOTE: The CDS++ Compiler up to V2.0Bsomething has the IRIX_CC_BUG optimizer problem. Better use -g  */
// "ReliantUNIX","cc:-KPIC -g -DTERMIOS -DB_ENDIAN::-Kthread:SNI:-lsocket -lnsl -lc -L/usr/ucblib -lucb:BN_LLONG DES_PTR DES_RISC2 DES_UNROLL BF_PTR:${no_asm}:dlfcn:reliantunix-shared:::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
// "SINIX","cc:-O::(unknown):SNI:-lsocket -lnsl -lc -L/usr/ucblib -lucb:RC4_INDEX RC4_CHAR:::",
// "SINIX-N","/usr/ucb/cc:-O2 -misaligned::(unknown)::-lucb:RC4_INDEX RC4_CHAR:::",

// # SIEMENS BS2000/OSD: an EBCDIC-based mainframe
// "BS2000-OSD","c89:-O -XLLML -XLLMK -XL -DB_ENDIAN -DTERMIOS -DCHARSET_EBCDIC::(unknown)::-lsocket -lnsl:THIRTY_TWO_BIT DES_PTR DES_UNROLL MD2_CHAR RC4_INDEX RC4_CHAR BF_PTR:::",

// # OS/390 Unix an EBCDIC-based Unix system on IBM mainframe
// # You need to compile using the c89.sh wrapper in the tools directory, because the
// # IBM compiler does not like the -L switch after any object modules.
// #
// "OS390-Unix","c89.sh:-O -DB_ENDIAN -DCHARSET_EBCDIC -DNO_SYS_PARAM_H  -D_ALL_SOURCE::(unknown):::THIRTY_TWO_BIT DES_PTR DES_UNROLL MD2_CHAR RC4_INDEX RC4_CHAR BF_PTR:::",

// # Win64 targets, WIN64I denotes IA-64 and WIN64A - AMD64
// "VC-WIN64I","cl::::WIN64I::SIXTY_FOUR_BIT RC4_CHUNK_LL DES_INT EXPORT_VAR_AS_FN:${no_asm}:win32",
// "VC-WIN64A","cl::::WIN64A::SIXTY_FOUR_BIT RC4_CHUNK_LL DES_INT EXPORT_VAR_AS_FN:${no_asm}:win32",

// # Visual C targets
// "VC-NT","cl::::WINNT::BN_LLONG RC4_INDEX EXPORT_VAR_AS_FN ${x86_gcc_opts}:${no_asm}:win32",
// "VC-CE","cl::::WINCE::BN_LLONG RC4_INDEX EXPORT_VAR_AS_FN ${x86_gcc_opts}:${no_asm}:win32",
// "VC-WIN32","cl::::WIN32::BN_LLONG RC4_INDEX EXPORT_VAR_AS_FN ${x86_gcc_opts}:${no_asm}:win32",

// # Borland C++ 4.5
// "BC-32","bcc32::::WIN32::BN_LLONG DES_PTR RC4_INDEX EXPORT_VAR_AS_FN:${no_asm}:win32",

// # MinGW
// "mingw", "gcc:-mno-cygwin -DL_ENDIAN -fomit-frame-pointer -O3 -march=i486 -Wall -D_WIN32_WINNT=0x333:::MINGW32:-lwsock32 -lgdi32:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts} EXPORT_VAR_AS_FN:${x86_coff_asm}:win32:cygwin-shared:-D_WINDLL -DOPENSSL_USE_APPLINK:-mno-cygwin -shared:.dll.a",

// # UWIN
// "UWIN", "cc:-DTERMIOS -DL_ENDIAN -O -Wall:::UWIN::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:win32",

// # Cygwin
// "Cygwin-pre1.3", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m486 -Wall::(unknown):CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:win32",
// "Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -march=i486 -Wall:::CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_coff_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
// "debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=i486 -Wall -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror:::CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",

// # NetWare from David Ward (dsward@novell.com)
// # requires either MetroWerks NLM development tools, or gcc / nlmconv
// # NetWare defaults socket bio to WinSock sockets. However,
// # the builds can be configured to use BSD sockets instead.
// # netware-clib => legacy CLib c-runtime support
// "netware-clib", "mwccnlm::::::${x86_gcc_opts}::",
// "netware-clib-bsdsock", "mwccnlm::::::${x86_gcc_opts}::",
// "netware-clib-gcc", "i586-netware-gcc:-nostdinc -I/ndk/nwsdk/include/nlm -I/ndk/ws295sdk/include -DL_ENDIAN -DNETWARE_CLIB -DOPENSSL_SYSNAME_NETWARE -O2 -Wall:::::${x86_gcc_opts}::",
// "netware-clib-bsdsock-gcc", "i586-netware-gcc:-nostdinc -I/ndk/nwsdk/include/nlm -DNETWARE_BSDSOCK -DNETDB_USE_INTERNET -DL_ENDIAN -DNETWARE_CLIB -DOPENSSL_SYSNAME_NETWARE -O2 -Wall:::::${x86_gcc_opts}::",
// # netware-libc => LibC/NKS support
// "netware-libc", "mwccnlm::::::BN_LLONG ${x86_gcc_opts}::",
// "netware-libc-bsdsock", "mwccnlm::::::BN_LLONG ${x86_gcc_opts}::",
// "netware-libc-gcc", "i586-netware-gcc:-nostdinc -I/ndk/libc/include -I/ndk/libc/include/winsock -DL_ENDIAN -DNETWARE_LIBC -DOPENSSL_SYSNAME_NETWARE -DTERMIO -O2 -Wall:::::BN_LLONG ${x86_gcc_opts}::",
// "netware-libc-bsdsock-gcc", "i586-netware-gcc:-nostdinc -I/ndk/libc/include -DNETWARE_BSDSOCK -DL_ENDIAN -DNETWARE_LIBC -DOPENSSL_SYSNAME_NETWARE -DTERMIO -O2 -Wall:::::BN_LLONG ${x86_gcc_opts}::",

// # DJGPP
// "DJGPP", "gcc:-I/dev/env/WATT_ROOT/inc -DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O2 -Wall:::MSDOS:-L/dev/env/WATT_ROOT/lib -lwatt:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_out_asm}:",

// # Ultrix from Bernhard Simon <simon@zid.tuwien.ac.at>
// "ultrix-cc","cc:-std1 -O -Olimit 2500 -DL_ENDIAN::(unknown):::::::",
// "ultrix-gcc","gcc:-O3 -DL_ENDIAN::(unknown):::BN_LLONG::::",
// # K&R C is no longer supported; you need gcc on old Ultrix installations
// ##"ultrix","cc:-O2 -DNOPROTO -DNOCONST -DL_ENDIAN::(unknown):::::::",

// ##### MacOS X (a.k.a. Rhapsody or Darwin) setup
// "rhapsody-ppc-cc","cc:-O3 -DB_ENDIAN::(unknown):MACOSX_RHAPSODY::BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${no_asm}::",
// "darwin-ppc-cc","cc:-arch ppc -O3 -DB_ENDIAN::-D_REENTRANT:MACOSX:-Wl,-search_paths_first%:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::osx_ppc32.o::::::::::dlfcn:darwin-shared:-fPIC -fno-common:-arch ppc -dynamiclib:.\$(SHLIB_MAJOR).\$(SHLIB_MINOR).dylib",
// "darwin64-ppc-cc","cc:-arch ppc64 -O3 -DB_ENDIAN::-D_REENTRANT:MACOSX:-Wl,-search_paths_first%:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::osx_ppc64.o::::::::::dlfcn:darwin-shared:-fPIC -fno-common:-arch ppc64 -dynamiclib:.\$(SHLIB_MAJOR).\$(SHLIB_MINOR).dylib",
// "darwin-i386-cc","cc:-arch i386 -O3 -fomit-frame-pointer -DL_ENDIAN::-D_REENTRANT:MACOSX:-Wl,-search_paths_first%:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${no_asm}:dlfcn:darwin-shared:-fPIC -fno-common:-arch i386 -dynamiclib:.\$(SHLIB_MAJOR).\$(SHLIB_MINOR).dylib",
// "debug-darwin-i386-cc","cc:-arch i386 -g3 -DL_ENDIAN::-D_REENTRANT:MACOSX:-Wl,-search_paths_first%:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:${no_asm}:dlfcn:darwin-shared:-fPIC -fno-common:-arch i386 -dynamiclib:.\$(SHLIB_MAJOR).\$(SHLIB_MINOR).dylib",
// "darwin64-x86_64-cc","cc:-arch x86_64 -O3 -fomit-frame-pointer -DL_ENDIAN -DMD32_REG_T=int -Wall::-D_REENTRANT:MACOSX:-Wl,-search_paths_first%:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK BF_PTR2 DES_INT DES_UNROLL:${no_asm}:dlfcn:darwin-shared:-fPIC -fno-common:-arch x86_64 -dynamiclib:.\$(SHLIB_MAJOR).\$(SHLIB_MINOR).dylib",
// "debug-darwin-ppc-cc","cc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG -DB_ENDIAN -g -Wall -O::-D_REENTRANT:MACOSX::BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::osx_ppc32.o::::::::::dlfcn:darwin-shared:-fPIC -fno-common:-dynamiclib:.\$(SHLIB_MAJOR).\$(SHLIB_MINOR).dylib",

// ##### A/UX
// "aux3-gcc","gcc:-O2 -DTERMIO::(unknown):AUX:-lbsd:RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:::",

// ##### Sony NEWS-OS 4.x
// "newsos4-gcc","gcc:-O -DB_ENDIAN::(unknown):NEWS4:-lmld -liberty:BN_LLONG RC4_CHAR RC4_CHUNK DES_PTR DES_RISC1 DES_UNROLL BF_PTR::::",

// ##### GNU Hurd
// "hurd-x86",  "gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -march=i486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC",

// ##### OS/2 EMX
// "OS2-EMX", "gcc::::::::",

// ##### VxWorks for various targets
// "vxworks-ppc405","ccppc:-g -msoft-float -mlongcall -DCPU=PPC405 -I\$(WIND_BASE)/target/h:::VXWORKS:-r:::::",
// "vxworks-ppc750","ccppc:-ansi -nostdinc -DPPC750 -D_REENTRANT -fvolatile -fno-builtin -fno-for-scope -fsigned-char -Wall -msoft-float -mlongcall -DCPU=PPC604 -I\$(WIND_BASE)/target/h \$(DEBUG_FLAG):::VXWORKS:-r:::::",
// "vxworks-ppc750-debug","ccppc:-ansi -nostdinc -DPPC750 -D_REENTRANT -fvolatile -fno-builtin -fno-for-scope -fsigned-char -Wall -msoft-float -mlongcall -DCPU=PPC604 -I\$(WIND_BASE)/target/h -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DDEBUG -g:::VXWORKS:-r:::::",
// "vxworks-ppc860","ccppc:-nostdinc -msoft-float -DCPU=PPC860 -DNO_STRINGS_H -I\$(WIND_BASE)/target/h:::VXWORKS:-r:::::",
// "vxworks-mipsle","ccmips:-B\$(WIND_BASE)/host/\$(WIND_HOST_TYPE)/lib/gcc-lib/ -DL_ENDIAN -EL -Wl,-EL -mips2 -mno-branch-likely -G 0 -fno-builtin -msoft-float -DCPU=MIPS32 -DMIPSEL -DNO_STRINGS_H -I\$(WIND_BASE)/target/h:::VXWORKS:-r::${no_asm}::::::ranlibmips:",

// ##### Compaq Non-Stop Kernel (Tandem)
// "tandem-c89","c89:-Ww -D__TANDEM -D_XOPEN_SOURCE -D_XOPEN_SOURCE_EXTENDED=1 -D_TANDEM_SOURCE -DB_ENDIAN::(unknown):::THIRTY_TWO_BIT:::",

{enable if you want FIPS support and are using an openssl library with FIPS support compiled in.}
{$DEFINE OPENSSL_FIPS}

{$IFDEF WIN32}
  {$DEFINE OPENSSL_SYSNAME_WIN32}
  {$DEFINE OPENSSL_SYS_WIN32}
  {$DEFINE L_ENDIAN}
  {$DEFINE DSO_WIN32}

  {$DEFINE BN_LLONG}
  {$DEFINE RC4_INDEX}
  {$DEFINE EXPORT_VAR_AS_FN}
  {$DEFINE RC4_INDEX}
  {$DEFINE MD2_INT}

  {$DEFINE _CRT_SECURE_NO_DEPRECATE}
  {$DEFINE _CRT_NONSTDC_NO_DEPRECATE}
  {$DEFINE BN_ASM}
  {$DEFINE MD5_ASM}
  {$DEFINE SHA1_ASM}
  {$DEFINE RMD160_ASM}
  {$DEFINE OPENSSL_NO_CMS}
  {$DEFINE OPENSSL_NO_GMP}
  {$DEFINE OPENSSL_NO_CAMELLIA}
  {$DEFINE OPENSSL_NO_RC5}
  {$DEFINE OPENSSL_NO_MD2}
  {$DEFINE OPENSSL_NO_MDC2}
  {$DEFINE OPENSSL_NO_KRB5}
  {$DEFINE OPENSSL_NO_MDC}
  {$DEFINE OPENSSL_NO_DYNAMIC_ENGINE}
  {$DEFINE OPENSSL_NO_RFC3779}
  {$DEFINE OPENSSL_NO_SEED}

  {$DEFINE OPENSSL_NO_CAPIENG}
  {$DEFINE OPENSSL_NO_JPAKE}
{$ENDIF}

{$IFDEF WINCE}
  {$DEFINE BN_LLONG}
  {$DEFINE RC4_INDEX}
  {$DEFINE EXPORT_VAR_AS_FN}
  {$DEFINE RC4_INDEX}
  {$DEFINE MD2_INT}
  {$DEFINE OPENSSL_NO_CMS}
  {$DEFINE OPENSSL_NO_CAMELLIA}
  {$DEFINE OPENSSL_NO_RC5}
  {$DEFINE OPENSSL_NO_MD2}
  {$DEFINE OPENSSL_NO_MDC2}
  {$DEFINE OPENSSL_NO_KRB5}
  {$DEFINE OPENSSL_NO_DYNAMIC_ENGINE}

  {$DEFINE EXPORT_VAR_AS_FN}
  {$DEFINE OPENSSL_NO_RFC3779}
  {$DEFINE OPENSSL_NO_SEED}
  {$DEFINE OPENSSL_NO_CAPIENG}
  {$DEFINE OPENSSL_NO_JPAKE}
{$ENDIF}

{$IFDEF WIN64}
   //"VC-WIN64A","cl::::WIN64A::-SIXTY_FOUR_BIT RC4_CHUNK_LL DES_INT EXPORT_VAR_AS_FN:${no_asm}:win32",
  {$DEFINE SIXTY_FOUR_BIT}
  {$DEFINE RC4_CHUNK_LL}
  {$DEFINE DES_INT}
  {$DEFINE EXPORT_VAR_AS_FN}

  {$DEFINE L_ENDIAN}

  {$DEFINE DSO_WIN32}
  {$DEFINE OPENSSL_SYSNAME_WIN32}
  {$DEFINE OPENSSL_SYSNAME_WINNT}
  {$DEFINE UNICODE}
  {$DEFINE _UNICODE}
  {$DEFINE _CRT_SECURE_NO_DEPRECATE}
  {$DEFINE _CRT_NONSTDC_NO_DEPRECATE}
  {$DEFINE OPENSSL_NO_CAMELLIA}
  {$DEFINE OPENSSL_NO_RC5}
  {$DEFINE OPENSSL_NO_MD2}
  {$DEFINE OPENSSL_NO_MDC2}
  {$DEFINE OPENSSL_NO_KRB5}
  {$DEFINE OPENSSL_NO_DYNAMIC_ENGINE}

  {$DEFINE EXPORT_VAR_AS_FN}
  {$DEFINE OPENSSL_NO_GMP}
  {$DEFINE OPENSSL_NO_RFC3779}
  {$DEFINE OPENSSL_NO_SEED}
  {$DEFINE OPENSSL_NO_CAPIENG}
  {$DEFINE OPENSSL_NO_JPAKE}
{$ENDIF}

{$IFDEF UNIX}
//attempt to get this right from FreeBSD CVS
//Makefile compile options.  The file is located
//at http://www.freebsd.org/cgi/cvsweb.cgi/src/crypto/openssl/ .
  {$DEFINE OPENSSL_NO_CAMELLIA}
  {$DEFINE OPENSSL_NO_GMP}
  {$DEFINE OPENSSL_NO_MD2}
  {$DEFINE OPENSSL_NO_MDC2}
  {$DEFINE OPENSSL_NO_RC5}
  {$DEFINE OPENSSL_NO_SEED}
   {$DEFINE OPENSSL_NO_RFC3779}

  {$DEFINE OPENSSL_NO_CAPIENG}
  {$DEFINE OPENSSL_NO_JPAKE}
{$ENDIF}

//#if (defined(OPENSSL_NO_RSA) || defined(OPENSSL_NO_MD5)) && !defined(OPENSSL_NO_SSL2)
//#define OPENSSL_NO_SSL2
//#endif
{$IFDEF OPENSSL_NO_RSA}
  {$IFNDEF OPENSSL_NO_SSL2}
    {$DEFINE OPENSSL_NO_SSL2}
  {$ENDIF}
{$ENDIF}
{$IFDEF OPENSSL_NO_MD5}
  {$IFNDEF OPENSSL_NO_SSL2}
    {$DEFINE OPENSSL_NO_SSL2}
  {$ENDIF}
{$ENDIF}

{$IFDEF WIN64}
  {$DEFINE SYS_WIN}
{$ENDIF}
{$IFDEF WIN32}
  {$DEFINE SYS_WIN}
{$ENDIF}
{$IFDEF WINCE}
  {$DEFINE SYS_WIN}
{$ENDIF}

{$IFNDEF SIXTY_FOUR_BIT}
  {$IFNDEF SIXTY_FOUR_BIT_LONG}
//I've over simplified this because we don't support 8 or 16bit architectures
    {$DEFINE THIRTY_TWO_BIT}
  {$ENDIF}
{$ENDIF}

// the following emits are a workaround to a
// name conflict with Win32 API header files
(*$HPPEMIT '#include <time.h>'*)
{$IFDEF OPENSSL_SYS_WIN32}
(*$HPPEMIT '#undef X509_NAME'*)
(*$HPPEMIT '#undef X509_EXTENSIONS'*)
(*$HPPEMIT '#undef X509_CERT_PAIR'*)
(*$HPPEMIT '#undef PKCS7_ISSUER_AND_SERIAL'*)
(*$HPPEMIT '#undef OCSP_RESPONSE'*)
(*$HPPEMIT '#undef OCSP_REQUEST'*)
(*$HPPEMIT '#undef PKCS7_SIGNER_INFO'*)
(*$HPPEMIT '#undef OCSP_REQUEST'*)
(*$HPPEMIT '#undef OCSP_RESPONSE'*)
{$ENDIF}
uses
  IdException,
  IdGlobal,
  {$IFDEF KYLIXCOMPAT}
   libc,
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  IdWinsock2,
  {$ENDIF}
  {$IFDEF USE_VCL_POSIX}
  PosixSysSocket,
  PosixSysTime,
  {$ENDIF}
  {$IFDEF USE_BASEUNIX}
    baseunix,
  {$ENDIF}
  SysUtils, 
  IdCTypes;

//temp for compile tests
{.$DEFINE SSLEAY_MACROS}

const
  CONF_MFLAGS_IGNORE_ERRORS = $1;
  CONF_MFLAGS_IGNORE_RETURN_CODES = $2;
  CONF_MFLAGS_SILENT = $4;
  CONF_MFLAGS_NO_DSO = $8;
  CONF_MFLAGS_IGNORE_MISSING_FILE = $10;
  CONF_MFLAGS_DEFAULT_SECTION = $20;
  CONF_F_CONF_DUMP_FP = 104;
  CONF_F_CONF_LOAD = 100;
  CONF_F_CONF_LOAD_BIO = 102;
  CONF_F_CONF_LOAD_FP = 103;
  CONF_F_CONF_MODULES_LOAD = 116;
  CONF_F_DEF_LOAD = 120;
  CONF_F_DEF_LOAD_BIO = 121;
  CONF_F_MODULE_INIT = 115;
  CONF_F_MODULE_LOAD_DSO = 117;
  CONF_F_MODULE_RUN = 118;
  CONF_F_NCONF_DUMP_BIO = 105;
  CONF_F_NCONF_DUMP_FP = 106;
  CONF_F_NCONF_GET_NUMBER = 107;
  CONF_F_NCONF_GET_NUMBER_E = 112;
  CONF_F_NCONF_GET_SECTION = 108;
  CONF_F_NCONF_GET_STRING = 109;
  CONF_F_NCONF_LOAD = 113;
  CONF_F_NCONF_LOAD_BIO = 110;
  CONF_F_NCONF_LOAD_FP = 114;
  CONF_F_NCONF_NEW = 111;
  CONF_F_STR_COPY = 101;

//* Reason codes. */
  CONF_R_ERROR_LOADING_DSO = 110;
  CONF_R_MISSING_CLOSE_SQUARE_BRACKET = 100;
  CONF_R_MISSING_EQUAL_SIGN = 101;
  CONF_R_MISSING_FINISH_FUNCTION = 111;
  CONF_R_MISSING_INIT_FUNCTION = 112;
  CONF_R_MODULE_INITIALIZATION_ERROR = 109;
  CONF_R_NO_CLOSE_BRACE = 102;
  CONF_R_NO_CONF = 105;
  CONF_R_NO_CONF_OR_ENVIRONMENT_VARIABLE = 106;
  CONF_R_NO_SECTION = 107;
  CONF_R_NO_SUCH_FILE = 114;
  CONF_R_NO_VALUE = 108;
  CONF_R_UNABLE_TO_CREATE_NEW_SECTION = 103;
  CONF_R_UNKNOWN_MODULE_NAME = 113;
  CONF_R_VARIABLE_HAS_NO_VALUE = 104;

  ASN1_F_A2D_ASN1_OBJECT = 100;
  ASN1_F_A2I_ASN1_ENUMERATED = 236;
  ASN1_F_A2I_ASN1_INTEGER = 101;
  ASN1_F_A2I_ASN1_STRING = 102;
  ASN1_F_ASN1_COLLATE_PRIMITIVE = 103;
  ASN1_F_ASN1_D2I_BIO = 104;
  ASN1_F_ASN1_D2I_FP = 105;
  ASN1_F_ASN1_DUP = 106;
  ASN1_F_ASN1_ENUMERATED_SET = 232;
  ASN1_F_ASN1_ENUMERATED_TO_BN = 233;
  ASN1_F_ASN1_GENERALIZEDTIME_NEW = 222;
  ASN1_F_ASN1_GET_OBJECT = 107;
  ASN1_F_ASN1_HEADER_NEW = 108;
  ASN1_F_ASN1_I2D_BIO = 109;
  ASN1_F_ASN1_I2D_FP = 110;
  ASN1_F_ASN1_INTEGER_SET = 111;
  ASN1_F_ASN1_INTEGER_TO_BN = 112;
  ASN1_F_ASN1_OBJECT_NEW = 113;

  ASN1_F_ASN1_OUTPUT_DATA= 207;

  ASN1_F_ASN1_PACK_STRING = 245;
  ASN1_F_ASN1_PBE_SET = 253;
  ASN1_F_ASN1_SEQ_PACK = 246;
  ASN1_F_ASN1_SEQ_UNPACK = 247;
  ASN1_F_ASN1_SIGN = 114;
  ASN1_F_ASN1_STRING_NEW = 115;
  ASN1_F_ASN1_STRING_TYPE_NEW = 116;
  ASN1_F_ASN1_TYPE_GET_INT_OCTETSTRING = 117;
  ASN1_F_ASN1_TYPE_GET_OCTETSTRING = 118;
  ASN1_F_ASN1_TYPE_NEW = 119;
  ASN1_F_ASN1_UNPACK_STRING = 248;
  ASN1_F_ASN1_UTCTIME_NEW = 120;
  ASN1_F_ASN1_VERIFY = 121;
  ASN1_F_B64_READ_ASN1 = 208;
  ASN1_F_B64_WRITE_ASN1 = 209;
  ASN1_F_BIO_NEW_NDEF = 212;
  ASN1_F_BITSTR_CB = 180;
  ASN1_F_SMIME_READ_ASN1 = 210;
  ASN1_F_SMIME_TEXT = 211;


  ASN1_F_AUTHORITY_KEYID_NEW = 237;
  ASN1_F_BASIC_CONSTRAINTS_NEW = 226;
  ASN1_F_BN_TO_ASN1_ENUMERATED = 234;
  ASN1_F_BN_TO_ASN1_INTEGER = 122;
  ASN1_F_D2I_ASN1_BIT_STRING = 123;
  ASN1_F_D2I_ASN1_BMPSTRING = 124;
  ASN1_F_D2I_ASN1_BOOLEAN = 125;
  ASN1_F_D2I_ASN1_BYTES = 126;
  ASN1_F_D2I_ASN1_ENUMERATED = 235;
  ASN1_F_D2I_ASN1_GENERALIZEDTIME = 223;
  ASN1_F_D2I_ASN1_HEADER = 127;
  ASN1_F_D2I_ASN1_INTEGER = 128;
  ASN1_F_D2I_ASN1_OBJECT = 129;
  ASN1_F_D2I_ASN1_OCTET_STRING = 130;
  ASN1_F_D2I_ASN1_PRINT_TYPE = 131;
  ASN1_F_D2I_ASN1_SET = 132;
  ASN1_F_D2I_ASN1_TIME = 224;
  ASN1_F_D2I_ASN1_TYPE = 133;
  ASN1_F_D2I_ASN1_TYPE_BYTES = 134;
  ASN1_F_D2I_ASN1_UINTEGER = 280;
  ASN1_F_D2I_ASN1_UTCTIME = 135;
  ASN1_F_D2I_ASN1_UTF8STRING = 266;
  ASN1_F_D2I_ASN1_VISIBLESTRING = 267;
  ASN1_F_D2I_AUTHORITY_KEYID = 238;
  ASN1_F_D2I_BASIC_CONSTRAINTS = 227;
  ASN1_F_D2I_DHPARAMS = 136;
  ASN1_F_D2I_DIST_POINT = 276;
  ASN1_F_D2I_DIST_POINT_NAME = 277;
  ASN1_F_D2I_DSAPARAMS = 137;
  ASN1_F_D2I_DSAPRIVATEKEY = 138;
  ASN1_F_D2I_DSAPUBLICKEY = 139;
  ASN1_F_D2I_GENERAL_NAME = 230;
  ASN1_F_D2I_NETSCAPE_CERT_SEQUENCE = 228;
  ASN1_F_D2I_NETSCAPE_PKEY = 140;
  ASN1_F_D2I_NETSCAPE_RSA = 141;
  ASN1_F_D2I_NETSCAPE_RSA_2 = 142;
  ASN1_F_D2I_NETSCAPE_SPKAC = 143;
  ASN1_F_D2I_NETSCAPE_SPKI = 144;
  ASN1_F_D2I_NOTICEREF = 268;
  ASN1_F_D2I_PBE2PARAM = 262;
  ASN1_F_D2I_PBEPARAM = 249;
  ASN1_F_D2I_PBKDF2PARAM = 263;
  ASN1_F_D2I_PKCS12 = 254;
  ASN1_F_D2I_PKCS12_BAGS = 255;
  ASN1_F_D2I_PKCS12_MAC_DATA = 256;
  ASN1_F_D2I_PKCS12_SAFEBAG = 257;
  ASN1_F_D2I_PKCS7 = 145;
  ASN1_F_D2I_PKCS7_DIGEST = 146;
  ASN1_F_D2I_PKCS7_ENCRYPT = 147;
  ASN1_F_D2I_PKCS7_ENC_CONTENT = 148;
  ASN1_F_D2I_PKCS7_ENVELOPE = 149;
  ASN1_F_D2I_PKCS7_ISSUER_AND_SERIAL = 150;
  ASN1_F_D2I_PKCS7_RECIP_INFO = 151;
  ASN1_F_D2I_PKCS7_SIGNED = 152;
  ASN1_F_D2I_PKCS7_SIGNER_INFO = 153;
  ASN1_F_D2I_PKCS7_SIGN_ENVELOPE = 154;
  ASN1_F_D2I_PKCS8_PRIV_KEY_INFO = 250;
  ASN1_F_D2I_PKEY_USAGE_PERIOD = 239;
  ASN1_F_D2I_POLICYINFO = 269;
  ASN1_F_D2I_POLICYQUALINFO = 270;
  ASN1_F_D2I_PRIVATEKEY = 155;
  ASN1_F_D2I_PUBLICKEY = 156;
  ASN1_F_D2I_RSAPRIVATEKEY = 157;
  ASN1_F_D2I_RSAPUBLICKEY = 158;
  ASN1_F_D2I_SXNET = 241;
  ASN1_F_D2I_SXNETID = 243;
  ASN1_F_D2I_USERNOTICE = 271;
  ASN1_F_D2I_X509 = 159;
  ASN1_F_D2I_X509_ALGOR = 160;
  ASN1_F_D2I_X509_ATTRIBUTE = 161;
  ASN1_F_D2I_X509_CINF = 162;
  ASN1_F_D2I_X509_CRL = 163;
  ASN1_F_D2I_X509_CRL_INFO = 164;
  ASN1_F_D2I_X509_EXTENSION = 165;
  ASN1_F_D2I_X509_KEY = 166;
  ASN1_F_D2I_X509_NAME = 167;
  ASN1_F_D2I_X509_NAME_ENTRY = 168;
  ASN1_F_D2I_X509_PKEY = 169;
  ASN1_F_D2I_X509_PUBKEY = 170;
  ASN1_F_D2I_X509_REQ = 171;
  ASN1_F_D2I_X509_REQ_INFO = 172;
  ASN1_F_D2I_X509_REVOKED = 173;
  ASN1_F_D2I_X509_SIG = 174;
  ASN1_F_D2I_X509_VAL = 175;
  ASN1_F_DIST_POINT_NAME_NEW = 278;
  ASN1_F_DIST_POINT_NEW = 279;
  ASN1_F_GENERAL_NAME_NEW = 231;
  ASN1_F_I2D_ASN1_HEADER = 176;
  ASN1_F_I2D_ASN1_TIME = 225;
  ASN1_F_I2D_DHPARAMS = 177;
  ASN1_F_I2D_DSAPARAMS = 178;
  ASN1_F_I2D_DSAPRIVATEKEY = 179;
  ASN1_F_I2D_DSAPUBLICKEY = 180;
  ASN1_F_I2D_NETSCAPE_RSA = 181;
  ASN1_F_I2D_PKCS7 = 182;
  ASN1_F_I2D_PRIVATEKEY = 183;
  ASN1_F_I2D_PUBLICKEY = 184;
  ASN1_F_I2D_RSAPRIVATEKEY = 185;
  ASN1_F_I2D_RSAPUBLICKEY = 186;
  ASN1_F_I2D_X509_ATTRIBUTE = 187;
  ASN1_F_I2T_ASN1_OBJECT = 188;
  ASN1_F_NETSCAPE_CERT_SEQUENCE_NEW = 229;
  ASN1_F_NETSCAPE_PKEY_NEW = 189;
  ASN1_F_NETSCAPE_SPKAC_NEW = 190;
  ASN1_F_NETSCAPE_SPKI_NEW = 191;
  ASN1_F_NOTICEREF_NEW = 272;
  ASN1_F_PBE2PARAM_NEW = 264;
  ASN1_F_PBEPARAM_NEW = 251;
  ASN1_F_PBKDF2PARAM_NEW = 265;
  ASN1_F_PKCS12_BAGS_NEW = 258;
  ASN1_F_PKCS12_MAC_DATA_NEW = 259;
  ASN1_F_PKCS12_NEW = 260;
  ASN1_F_PKCS12_SAFEBAG_NEW = 261;
  ASN1_F_PKCS5_PBE2_SET = 281;
  ASN1_F_PKCS7_DIGEST_NEW = 192;
  ASN1_F_PKCS7_ENCRYPT_NEW = 193;
  ASN1_F_PKCS7_ENC_CONTENT_NEW = 194;
  ASN1_F_PKCS7_ENVELOPE_NEW = 195;
  ASN1_F_PKCS7_ISSUER_AND_SERIAL_NEW = 196;
  ASN1_F_PKCS7_NEW = 197;
  ASN1_F_PKCS7_RECIP_INFO_NEW = 198;
  ASN1_F_PKCS7_SIGNED_NEW = 199;
  ASN1_F_PKCS7_SIGNER_INFO_NEW = 200;
  ASN1_F_PKCS7_SIGN_ENVELOPE_NEW = 201;
  ASN1_F_PKCS8_PRIV_KEY_INFO_NEW = 252;
  ASN1_F_PKEY_USAGE_PERIOD_NEW = 240;
  ASN1_F_POLICYINFO_NEW = 273;
  ASN1_F_POLICYQUALINFO_NEW = 274;
  ASN1_F_SXNETID_NEW = 244;
  ASN1_F_SXNET_NEW = 242;
  ASN1_F_USERNOTICE_NEW = 275;
  ASN1_F_X509_ALGOR_NEW = 202;
  ASN1_F_X509_ATTRIBUTE_NEW = 203;
  ASN1_F_X509_CINF_NEW = 204;
  ASN1_F_X509_CRL_INFO_NEW = 205;
  ASN1_F_X509_CRL_NEW = 206;
  ASN1_F_X509_DHPARAMS_NEW = 207;
  ASN1_F_X509_EXTENSION_NEW = 208;
  ASN1_F_X509_INFO_NEW = 209;
  ASN1_F_X509_KEY_NEW = 210;
  ASN1_F_X509_NAME_ENTRY_NEW = 211;
  ASN1_F_X509_NAME_NEW = 212;
  ASN1_F_X509_NEW = 213;
  ASN1_F_X509_PKEY_NEW = 214;
  ASN1_F_X509_PUBKEY_NEW = 215;
  ASN1_F_X509_REQ_INFO_NEW = 216;
  ASN1_F_X509_REQ_NEW = 217;
  ASN1_F_X509_REVOKED_NEW = 218;
  ASN1_F_X509_SIG_NEW = 219;
  ASN1_F_X509_VAL_FREE = 220;
  ASN1_F_X509_VAL_NEW = 221;
  ASN1_OBJECT_FLAG_CRITICAL = $02;
  ASN1_OBJECT_FLAG_DYNAMIC = $01;
  ASN1_OBJECT_FLAG_DYNAMIC_DATA = $08;
  ASN1_OBJECT_FLAG_DYNAMIC_STRINGS = $04;
  ASN1_R_ADDING_OBJECT = 171;
  ASN1_R_ASN1_PARSE_ERROR= 198;
  ASN1_R_ASN1_SIG_PARSE_ERROR = 199;

  ASN1_R_AUX_ERROR = 100;
  ASN1_R_BAD_CLASS = 101;
  ASN1_R_BAD_OBJECT_HEADER = 102;
  ASN1_R_BAD_PASSWORD_READ = 103;
  ASN1_R_BAD_TAG = 104;
  ASN1_R_BMPSTRING_IS_WRONG_LENGTH = 210;
  ASN1_R_BN_LIB	= 105;
  ASN1_R_BOOLEAN_IS_WRONG_LENGTH = 106;
  ASN1_R_BUFFER_TOO_SMALL = 107;
  ASN1_R_CIPHER_HAS_NO_OBJECT_IDENTIFIER = 108;
  ASN1_R_DATA_IS_WRONG = 109;
  ASN1_R_DECODE_ERROR	= 110;
  ASN1_R_DECODING_ERROR = 111;
  ASN1_R_DEPTH_EXCEEDED	= 174;
  ASN1_R_ENCODE_ERROR = 112;
  ASN1_R_ERROR_GETTING_TIME	= 173;
  ASN1_R_ERROR_LOADING_SECTION = 172;
  ASN1_R_ERROR_PARSING_SET_ELEMENT = 113;
  ASN1_R_ERROR_SETTING_CIPHER_PARAMS = 114;
  ASN1_R_EXPECTING_AN_INTEGER = 115;
  ASN1_R_EXPECTING_AN_OBJECT = 116;
  ASN1_R_EXPECTING_A_BOOLEAN = 117;
  ASN1_R_EXPECTING_A_TIME	= 118;
  ASN1_R_EXPLICIT_LENGTH_MISMATCH = 119;
  ASN1_R_EXPLICIT_TAG_NOT_CONSTRUCTED	= 120;
  ASN1_R_FIELD_MISSING = 121;
  ASN1_R_FIRST_NUM_TOO_LARGE = 122;
  ASN1_R_HEADER_TOO_LONG = 123;
  ASN1_R_ILLEGAL_BITSTRING_FORMAT = 175;
  ASN1_R_ILLEGAL_BOOLEAN = 176;
  ASN1_R_ILLEGAL_CHARACTERS = 124;
  ASN1_R_ILLEGAL_FORMAT = 177;
  ASN1_R_ILLEGAL_HEX = 178;
  ASN1_R_ILLEGAL_IMPLICIT_TAG = 179;
  ASN1_R_ILLEGAL_INTEGER = 180;
  ASN1_R_ILLEGAL_NESTED_TAGGING	= 181;
  ASN1_R_ILLEGAL_NULL = 125;
  ASN1_R_ILLEGAL_NULL_VALUE	= 182;
  ASN1_R_ILLEGAL_OBJECT = 183;
  ASN1_R_ILLEGAL_OPTIONAL_ANY = 126;
  ASN1_R_ILLEGAL_OPTIONS_ON_ITEM_TEMPLATE = 170;
  ASN1_R_ILLEGAL_TAGGED_ANY = 127;
  ASN1_R_ILLEGAL_TIME_VALUE = 184;
  ASN1_R_INTEGER_NOT_ASCII_FORMAT = 185;
  ASN1_R_INTEGER_TOO_LARGE_FOR_LONG = 128;
  ASN1_R_INVALID_BMPSTRING_LENGTH = 129;
  ASN1_R_INVALID_DIGIT = 130;
  ASN1_R_INVALID_MIME_TYPE = 200;
  ASN1_R_INVALID_MODIFIER = 186;
  ASN1_R_INVALID_NUMBER = 187;
  ASN1_R_INVALID_OBJECT_ENCODING = 212;

  ASN1_R_INVALID_SEPARATOR = 131;
  ASN1_R_INVALID_TIME_FORMAT = 132;
  ASN1_R_INVALID_UNIVERSALSTRING_LENGTH	= 133;
  ASN1_R_INVALID_UTF8STRING	= 134;
  ASN1_R_IV_TOO_LARGE	= 135;
  ASN1_R_LENGTH_ERROR	= 136;
  ASN1_R_LIST_ERROR	= 188;
  ASN1_R_MIME_NO_CONTENT_TYPE	= 201;
  ASN1_R_MIME_PARSE_ERROR	= 202;
  ASN1_R_MIME_SIG_PARSE_ERROR	= 203;
  ASN1_R_MISSING_EOC = 137;
  ASN1_R_MISSING_SECOND_NUMBER = 138;
  ASN1_R_MISSING_VALUE = 189;
  ASN1_R_MSTRING_NOT_UNIVERSAL = 139;
  ASN1_R_MSTRING_WRONG_TAG = 140;
  ASN1_R_NESTED_ASN1_STRING	= 197;
  ASN1_R_NON_HEX_CHARACTERS = 141;
  ASN1_R_NOT_ASCII_FORMAT	= 190;
  ASN1_R_NOT_ENOUGH_DATA = 142;
  ASN1_R_NO_CONTENT_TYPE = 204;
  ASN1_R_NO_MATCHING_CHOICE_TYPE = 143;
  ASN1_R_NO_MULTIPART_BODY_FAILURE = 205;
  ASN1_R_NO_MULTIPART_BOUNDARY = 206;
  ASN1_R_NO_SIG_CONTENT_TYPE = 207;
  ASN1_R_NULL_IS_WRONG_LENGTH	= 144;
  ASN1_R_OBJECT_NOT_ASCII_FORMAT = 191;
  ASN1_R_ODD_NUMBER_OF_CHARS = 145;
  ASN1_R_PRIVATE_KEY_HEADER_MISSING = 146;
  ASN1_R_SECOND_NUMBER_TOO_LARGE = 147;
  ASN1_R_SEQUENCE_LENGTH_MISMATCH = 148;
  ASN1_R_SEQUENCE_NOT_CONSTRUCTED	= 149;
  ASN1_R_SEQUENCE_OR_SET_NEEDS_CONFIG = 192;
  ASN1_R_SHORT_LINE = 150;
  ASN1_R_SIG_INVALID_MIME_TYPE = 208;
  ASN1_R_STREAMING_NOT_SUPPORTED = 209;
  ASN1_R_STRING_TOO_LONG = 151;
  ASN1_R_STRING_TOO_SHORT	= 152;
  ASN1_R_TAG_VALUE_TOO_HIGH	= 153;
  ASN1_R_THE_ASN1_OBJECT_IDENTIFIER_IS_NOT_KNOWN_FOR_THIS_MD = 154;
  ASN1_R_TIME_NOT_ASCII_FORMAT = 193;
  ASN1_R_TOO_LONG = 155;
  ASN1_R_TYPE_NOT_CONSTRUCTED	= 156;
  ASN1_R_UNABLE_TO_DECODE_RSA_KEY	= 157;
  ASN1_R_UNABLE_TO_DECODE_RSA_PRIVATE_KEY	= 158;
  ASN1_R_UNEXPECTED_EOC	= 159;
  ASN1_R_UNIVERSALSTRING_IS_WRONG_LENGTH = 211;
  ASN1_R_UNKNOWN_FORMAT	= 160;
  ASN1_R_UNKNOWN_MESSAGE_DIGEST_ALGORITHM	= 161;
  ASN1_R_UNKNOWN_OBJECT_TYPE = 162;
  ASN1_R_UNKNOWN_PUBLIC_KEY_TYPE = 163;
  ASN1_R_UNKNOWN_TAG = 194;
  ASN1_R_UNKOWN_FORMAT = 195;
  ASN1_R_UNSUPPORTED_ANY_DEFINED_BY_TYPE = 164;
  ASN1_R_UNSUPPORTED_CIPHER = 165;
  ASN1_R_UNSUPPORTED_ENCRYPTION_ALGORITHM = 166;
  ASN1_R_UNSUPPORTED_PUBLIC_KEY_TYPE = 167;
  ASN1_R_UNSUPPORTED_TYPE = 196;
  ASN1_R_WRONG_TAG = 168;
  ASN1_R_WRONG_TYPE = 169;

  ASN1_STRING_FLAG_BITS_LEFT = $08;
  ASN1_STRING_FLAG_NDEF = $010;
//* This flag is used by the CMS code to indicate that a string is not
// * complete and is a place holder for content when it had all been
// * accessed. The flag will be reset when content has been written to it.
// */
  ASN1_STRING_FLAG_CONT = $020;
  ASN1_LONG_UNDEF = $7fffffff; //0x7fffffffL

  UB_NAME = 32768;
  UB_COMMON_NAME = 64;
  UB_LOCALITY_NAME = 128;
  UB_STATE_NAME  = 128;
  UB_ORGANIZATION_NAME = 64;
  UB_ORGANIZATION_UNIT_NAME = 64;
  UB_TITLE = 64;
  UB_EMAIL_ADDRESS = 128;

  ASN1_STRFLGS_ESC_2253 = 1;
  ASN1_STRFLGS_ESC_CTRL = 2;
  ASN1_STRFLGS_ESC_MSB = 4;
  ASN1_STRFLGS_ESC_QUOTE = 8;

  ASN1_STRFLGS_UTF8_CONVERT = $10;
  ASN1_STRFLGS_IGNORE_TYPE = $20;
  ASN1_STRFLGS_SHOW_TYPE = $40;
  ASN1_STRFLGS_DUMP_ALL = $80;
  ASN1_STRFLGS_DUMP_UNKNOWN = $100;
  ASN1_STRFLGS_DUMP_DER = $200;
  ASN1_STRFLGS_RFC2253  = ASN1_STRFLGS_ESC_2253 or
                                  ASN1_STRFLGS_ESC_CTRL or
                                  ASN1_STRFLGS_ESC_MSB or
                                  ASN1_STRFLGS_UTF8_CONVERT or
                                  ASN1_STRFLGS_DUMP_UNKNOWN or
                                  ASN1_STRFLGS_DUMP_DER;

  BIO_BIND_NORMAL = 0;
  BIO_BIND_REUSEADDR = 2;
  BIO_BIND_REUSEADDR_IF_UNUSED = 1;
  BIO_CB_CTRL = $06;
  BIO_CB_FREE = $01;
  BIO_CB_GETS = $05;
  BIO_CB_PUTS = $04;
  BIO_CB_READ = $02;
  BIO_CB_RETURN = $80;
  BIO_CB_WRITE = $03;
  BIO_CLOSE = $01;
  BIO_CONN_S_BEFORE = 1;
  BIO_CONN_S_BLOCKED_CONNECT = 7;
  BIO_CONN_S_CONNECT = 5;
  BIO_CONN_S_CREATE_SOCKET = 4;
  BIO_CONN_S_GET_IP = 2;
  BIO_CONN_S_GET_PORT = 3;
  BIO_CONN_S_NBIO = 8;
  BIO_CONN_S_OK = 6;
  BIO_CTRL_DUP = 12;
  BIO_CTRL_EOF = 2;
  BIO_CTRL_FLUSH = 11;
  BIO_CTRL_GET = 5;
  BIO_CTRL_GET_CALLBACK = 15;
  BIO_CTRL_GET_CLOSE = 8;
  BIO_CTRL_INFO = 3;
  BIO_CTRL_PENDING = 10;
  BIO_CTRL_POP = 7;
  BIO_CTRL_PUSH = 6;
  BIO_CTRL_RESET = 1;
  BIO_CTRL_SET = 4;
  BIO_CTRL_SET_CALLBACK = 14;
  BIO_CTRL_SET_CLOSE = 9;
  BIO_CTRL_SET_FILENAME = 30;
  //* dgram BIO stuff */
  BIO_CTRL_DGRAM_CONNECT = 31;  //* BIO dgram special */
  BIO_CTRL_DGRAM_SET_CONNECTED = 32;  //* allow for an externally
					                            //* connected socket to be
					                           //* passed in */
  BIO_CTRL_DGRAM_SET_RECV_TIMEOUT = 33; //* setsockopt, essentially */
  BIO_CTRL_DGRAM_GET_RECV_TIMEOUT = 34; //* getsockopt, essentially */
  BIO_CTRL_DGRAM_SET_SEND_TIMEOUT = 35; //* setsockopt, essentially */
  BIO_CTRL_DGRAM_GET_SEND_TIMEOUT = 36; //* getsockopt, essentially */

  BIO_CTRL_DGRAM_GET_RECV_TIMER_EXP = 37; //* flag whether the last */
  BIO_CTRL_DGRAM_GET_SEND_TIMER_EXP = 38; //* I/O operation tiemd out */


//* #ifdef IP_MTU_DISCOVER */
  BIO_CTRL_DGRAM_MTU_DISCOVER = 39; //* set DF bit on egress packets */
//* #endif */

  BIO_CTRL_DGRAM_QUERY_MTU    = 40; //* as kernel for current MTU */
  BIO_CTRL_DGRAM_GET_MTU      = 41; //* get cached value for MTU */
  BIO_CTRL_DGRAM_SET_MTU      = 42; //* set cached value for
					                          // * MTU. want to use this
				                            // * if asking the kernel
					                         // * fails */

  BIO_CTRL_DGRAM_MTU_EXCEEDED  = 43; //* check whether the MTU
					     // * was exceed in the
					     // * previous write
					     // * operation */
  BIO_CTRL_DGRAM_GET_PEER      = 46;

  BIO_CTRL_DGRAM_SET_PEER      = 44; //* Destination for the data */
  BIO_CTRL_DGRAM_SET_NEXT_TIMEOUT = 45; //* Next DTLS handshake timeout to

  BIO_CTRL_WPENDING = 13;
  BIO_C_DESTROY_BIO_PAIR = 139;
  BIO_C_DO_STATE_MACHINE = 101;
  BIO_C_FILE_SEEK = 128;
  BIO_C_FILE_TELL = 133;
  BIO_C_GET_ACCEPT = 124;
  BIO_C_GET_BIND_MODE = 132;
  BIO_C_GET_BUFF_NUM_LINES = 116;
  BIO_C_GET_BUF_MEM_PTR = 115;
  BIO_C_GET_CIPHER_CTX = 129;
  BIO_C_GET_CIPHER_STATUS = 113;
  BIO_C_GET_CONNECT = 123;
  BIO_C_GET_FD = 105;
  BIO_C_GET_FILE_PTR = 107;
  BIO_C_GET_MD = 112;
  BIO_C_GET_MD_CTX = 120;
  BIO_C_GET_PROXY_PARAM = 121;
  BIO_C_GET_READ_REQUEST = 141;
  BIO_C_GET_SOCKS = 134;
  BIO_C_GET_SSL = 110;
  BIO_C_GET_SSL_NUM_RENEGOTIATES = 126;
  BIO_C_GET_WRITE_BUF_SIZE = 137;
  BIO_C_GET_WRITE_GUARANTEE = 140;
  BIO_C_MAKE_BIO_PAIR = 138;
  BIO_C_SET_ACCEPT = 118;
  BIO_C_SET_BIND_MODE = 131;
  BIO_C_SET_BUFF_READ_DATA = 122;
  BIO_C_SET_BUFF_SIZE = 117;
  BIO_C_SET_BUF_MEM = 114;
  BIO_C_SET_BUF_MEM_EOF_RETURN = 130;
  BIO_C_SET_CONNECT = 100;
  BIO_C_SET_FD = 104;
  BIO_C_SET_FILENAME = 108;
  BIO_C_SET_FILE_PTR = 106;
  BIO_C_SET_MD = 111;
  BIO_C_SET_NBIO = 102;
  BIO_C_SET_PROXY_PARAM = 103;
  BIO_C_SET_SOCKS = 135;
  BIO_C_SET_SSL = 109;
  BIO_C_SET_SSL_RENEGOTIATE_BYTES = 125;
  BIO_C_SET_SSL_RENEGOTIATE_TIMEOUT = 127;
  BIO_C_SET_WRITE_BUF_SIZE = 136;
  BIO_C_SHUTDOWN_WR = 142;
  BIO_C_SSL_MODE = 119;
  BIO_FLAGS_BASE64_NO_NL = $100;
  BIO_FLAGS_IO_SPECIAL = $04;
  BIO_FLAGS_READ = $01;
  BIO_FLAGS_WRITE = $02;
  BIO_FLAGS_RWS = BIO_FLAGS_READ or
                          BIO_FLAGS_WRITE or
                          BIO_FLAGS_IO_SPECIAL;
  BIO_FLAGS_SHOULD_RETRY = $08;
  BIO_FP_APPEND = $08;
  BIO_FP_READ = $02;
  BIO_FP_TEXT = $10;
  BIO_FP_WRITE = $04;
  BIO_F_ACPT_STATE = 100;
  BIO_F_BIO_ACCEPT = 101;
  BIO_F_BIO_BER_GET_HEADER = 102;
  BIO_F_BIO_CTRL = 103;
  BIO_F_BIO_GETHOSTBYNAME = 120;
  BIO_F_BIO_GETS = 104;
  BIO_F_BIO_GET_ACCEPT_SOCKET = 105;
  BIO_F_BIO_GET_HOST_IP = 106;
  BIO_F_BIO_GET_PORT = 107;
  BIO_F_BIO_MAKE_PAIR = 121;
  BIO_F_BIO_NEW = 108;
  BIO_F_BIO_NEW_FILE = 109;
  BIO_F_BIO_PUTS = 110;
  BIO_F_BIO_READ = 111;
  BIO_F_BIO_SOCK_INIT = 112;
  BIO_F_BIO_WRITE = 113;
  BIO_F_BUFFER_CTRL = 114;
  BIO_F_CONN_STATE = 115;
  BIO_F_FILE_CTRL = 116;
  BIO_F_MEM_WRITE = 117;
  BIO_F_SSL_NEW = 118;
  BIO_F_WSASTARTUP = 119;
  BIO_GHBN_CTRL_CACHE_SIZE = 3;
  BIO_GHBN_CTRL_FLUSH = 5;
  BIO_GHBN_CTRL_GET_ENTRY = 4;
  BIO_GHBN_CTRL_HITS = 1;
  BIO_GHBN_CTRL_MISSES = 2;
  BIO_NOCLOSE = $00;
  BIO_RR_CONNECT = $02;
  BIO_RR_SSL_X509_LOOKUP = $01;
  BIO_R_ACCEPT_ERROR = 100;
  BIO_R_BAD_FOPEN_MODE = 101;
  BIO_R_BAD_HOSTNAME_LOOKUP = 102;
  BIO_R_BROKEN_PIPE = 124;
  BIO_R_CONNECT_ERROR = 103;
  BIO_R_ERROR_SETTING_NBIO = 104;
  BIO_R_ERROR_SETTING_NBIO_ON_ACCEPTED_SOCKET = 105;
  BIO_R_ERROR_SETTING_NBIO_ON_ACCEPT_SOCKET = 106;
  BIO_R_GETHOSTBYNAME_ADDR_IS_NOT_AF_INET = 107;
  BIO_R_INVALID_ARGUMENT = 125;
  BIO_R_INVALID_IP_ADDRESS = 108;
  BIO_R_IN_USE = 123;
  BIO_R_KEEPALIVE = 109;
  BIO_R_NBIO_CONNECT_ERROR = 110;
  BIO_R_NO_ACCEPT_PORT_SPECIFIED = 111;
  BIO_R_NO_HOSTNAME_SPECIFIED = 112;
  BIO_R_NO_PORT_DEFINED = 113;
  BIO_R_NO_PORT_SPECIFIED = 114;
  BIO_R_NULL_PARAMETER = 115;
  BIO_R_TAG_MISMATCH = 116;
  BIO_R_UNABLE_TO_BIND_SOCKET = 117;
  BIO_R_UNABLE_TO_CREATE_SOCKET = 118;
  BIO_R_UNABLE_TO_LISTEN_SOCKET = 119;
  BIO_R_UNINITIALIZED = 120;
  BIO_R_UNSUPPORTED_METHOD = 121;
  BIO_R_WSASTARTUP = 122;
  BIO_TYPE_ACCEPT = 13 or $0400 or $0100;
  BIO_TYPE_BASE64 = 11 or $0200;
  BIO_TYPE_BER = 18 or $0200;
  BIO_TYPE_BIO = 19 or $0400;
  BIO_TYPE_BUFFER = 9 or $0200;
  BIO_TYPE_CIPHER = 10 or $0200;
  BIO_TYPE_CONNECT = 12 or $0400 or $0100;
  BIO_TYPE_DESCRIPTOR = $0100;
  BIO_TYPE_FD = 4 or $0400 or $0100;
  BIO_TYPE_FILE = 2 or $0400;
  BIO_TYPE_FILTER = $0200;
  BIO_TYPE_MD = 8 or $0200;
  BIO_TYPE_MEM = 1 or $0400;
  BIO_TYPE_NBIO_TEST = 16 or $0200;
  BIO_TYPE_NONE = 0;
  BIO_TYPE_NULL = 6 or $0400;
  BIO_TYPE_NULL_FILTER = 17 or $0200;
  BIO_TYPE_PROXY_CLIENT = 14 or $0200;
  BIO_TYPE_PROXY_SERVER = 15 or $0200;
  BIO_TYPE_SOCKET = 5 or $0400 or $0100;
  BIO_TYPE_SOURCE_SINK = $0400;
  BIO_TYPE_SSL = 7 or $0200;
  BIO_TYPE_LINEBUFFER = 20 or $0200;
  BIO_TYPE_DGRAM = 21 or $0400 or $0100;
  BIO_TYPE_COMP = 23 or $0200;

  {$IFDEF SIXTY_FOUR_BIT_LONG}
  BN_BITS = 128;
  BN_BYTES = 8;
  BN_BITS2 = 64;
  BN_BITS4 = 32;
  BN_DEC_FMT1 = '%lu'; {Do not localize}
  BN_DEC_FMT2 = '%019lu'; {Do not localize}
  BN_DEC_NUM = 19;
  {$ENDIF}
  {$IFDEF SIXTY_FOUR_BIT}
    {$UNDEF BN_LLONG}
    {$UNDEF BN_ULLONG}
  OPENSSL_BN_BITS = 128;
  OPENSSL_BN_BYTES = 8;
  OPENSSL_BN_BITS2 = 64;
  OPENSSL_BN_BITS4 = 32;
  OPENSSL_BN_DEC_FMT1 = '%llu';  {Do not localize}
  OPENSSL_BN_DEC_FMT2 = '%019llu';  {Do not localize}
  OPENSSL_BN_DEC_NUM = 19;
  {$ENDIF}
  {$IFDEF THIRTY_TWO_BIT}
  BN_BITS = 64;
  BN_BYTES = 4;
  BN_BITS2 = 32;
  BN_BITS4 = 16;
  BN_DEC_FMT1 = '%lu';  {Do not localize}
  BN_DEC_FMT2 = '%09lu';  {Do not localize}
  BN_DEC_NUM = 9;
  {$ENDIF}
  BN_CTX_NUM = 12;
  {$IFNDEF OPENSSL_NO_DEPRECATED}
  BN_DEFAULT_BITS = 1280;
  {$ENDIF}
  BN_FLG_FREE = $8000;
  BN_FLG_MALLOCED = $01;
  BN_FLG_STATIC_DATA = $02;
  BN_FLG_CONSTTIME = $04;
  //* avoid leaking exponent information through timing,
  //* BN_mod_exp_mont() will call BN_mod_exp_mont_consttime,
  //* BN_div() will call BN_div_no_branch,
  // * BN_mod_inverse() will call BN_mod_inverse_no_branch.
  // */
  {$IFNDEF OPENSSL_NO_DEPRECATED}
  BN_FLG_EXP_CONSTTIME = BN_FLG_CONSTTIME; //* deprecated name for the flag */
                                      //* avoid leaking exponent information through timings
                                      //* (BN_mod_exp_mont() will call BN_mod_exp_mont_consttime) */
 {$ENDIF}
  BN_F_BN_BLINDING_CONVERT = 100;
  BN_F_BN_BLINDING_INVERT = 101;
  BN_F_BN_BLINDING_NEW = 102;
  BN_F_BN_BLINDING_UPDATE = 103;
  BN_F_BN_BN2DEC = 104;
  BN_F_BN_BN2HEX = 105;
  BN_F_BN_CTX_NEW = 106;
  BN_F_BN_DIV = 107;
  BN_F_BN_DIV_NO_BRANCH = 138;
  BN_F_BN_EXPAND2 = 108;
  BN_F_BN_MOD_EXP_MONT = 109;
  BN_F_BN_MOD_INVERSE = 110;
  BN_F_BN_MOD_INVERSE_NO_BRANCH = 139;
  BN_F_BN_MOD_MUL_RECIPROCAL = 111;
  BN_F_BN_MPI2BN = 112;
  BN_F_BN_NEW = 113;
  BN_F_BN_RAND = 114;
  BN_F_BN_USUB = 115;
  BN_MASK2 = $ffffffff;
  BN_MASK2h = $ffff0000;
  BN_MASK2h1 = $ffff8000;
  BN_MASK2l = $ffff;
  BN_R_ARG2_LT_ARG3 = 100;
  BN_R_BAD_RECIPROCAL = 101;
  BN_R_CALLED_WITH_EVEN_MODULUS = 102;
  BN_R_DIV_BY_ZERO = 103;
  BN_R_ENCODING_ERROR = 104;
  BN_R_EXPAND_ON_STATIC_BIGNUM_DATA = 105;
  BN_R_INVALID_LENGTH = 106;
  BN_R_NOT_INITIALIZED = 107;
  BN_R_NO_INVERSE = 108;
  BN_TBIT = $80000000;
  BUFSIZ = 1024;
  BUF_F_BUF_MEM_GROW = 100;
  BUF_F_BUF_MEM_NEW = 101;
  BUF_F_BUF_STRDUP = 102;

  //function codes
  RAND_F_ENG_RAND_GET_RAND_METHOD			= 108;
  RAND_F_FIPS_RAND				= 103;
  RAND_F_FIPS_RAND_BYTES				= 102;
  RAND_F_FIPS_RAND_GET_RAND_METHOD		= 109;
  RAND_F_FIPS_RAND_SET_DT				= 106;
  RAND_F_FIPS_SET_DT				 = 104;
  RAND_F_FIPS_SET_PRNG_SEED			 = 107;
  RAND_F_FIPS_SET_TEST_MODE			 = 105;
  RAND_F_RAND_GET_RAND_METHOD			= 101;
  RAND_F_SSLEAY_RAND_BYTES			= 100;

//* Reason codes. */
  RAND_R_NON_FIPS_METHOD			 = 105;
  RAND_R_NOT_IN_TEST_MODE				 = 106;
  RAND_R_NO_KEY_SET				 = 107;
  RAND_R_PRNG_ASKING_FOR_TOO_MUCH			 = 101;
  RAND_R_PRNG_ERROR				= 108;
  RAND_R_PRNG_KEYED				 = 109;
  RAND_R_PRNG_NOT_REKEYED				= 102;
  RAND_R_PRNG_NOT_RESEEDED			 = 103;
  RAND_R_PRNG_NOT_SEEDED				 = 100;
  RAND_R_PRNG_SEED_MUST_NOT_MATCH_KEY		 = 110;
  RAND_R_PRNG_STUCK				 = 104;

  B_ASN1_BIT_STRING = $0400;
  B_ASN1_BMPSTRING = $0800;
  B_ASN1_GENERALSTRING = $0080;
  B_ASN1_GRAPHICSTRING = $0020;
  B_ASN1_IA5STRING = $0010;
  B_ASN1_ISO64STRING = $0040;
  B_ASN1_NUMERICSTRING = $0001;
  B_ASN1_OCTET_STRING = $0200;
  B_ASN1_PRINTABLESTRING = $0002;
  B_ASN1_T61STRING = $0004;
  B_ASN1_TELETEXSTRING = $0008;
  B_ASN1_UNIVERSALSTRING = $0100;
  B_ASN1_UNKNOWN = $1000;
  B_ASN1_UTF8STRING = $2000;
  B_ASN1_VIDEOTEXSTRING = $0008;
  B_ASN1_VISIBLESTRING = $0040;
  B_ASN1_UTCTIME = $4000;
  B_ASN1_GENERALIZEDTIME = $8000;
  B_ASN1_SEQUENCE = $10000;
  B_ASN1_TIME = B_ASN1_UTCTIME or
                        B_ASN1_GENERALIZEDTIME;

  B_ASN1_PRINTABLE = B_ASN1_NUMERICSTRING or
        B_ASN1_PRINTABLESTRING or
        B_ASN1_T61STRING or
        B_ASN1_IA5STRING or
        B_ASN1_BIT_STRING or
        B_ASN1_UNIVERSALSTRING or
        B_ASN1_BMPSTRING or
        B_ASN1_UTF8STRING or
        B_ASN1_SEQUENCE or
        B_ASN1_UNKNOWN;
  B_ASN1_DIRECTORYSTRING = B_ASN1_PRINTABLESTRING or
              B_ASN1_TELETEXSTRING or
              B_ASN1_BMPSTRING or
              B_ASN1_UNIVERSALSTRING or
              B_ASN1_UTF8STRING;
  B_ASN1_DISPLAYTEXT = B_ASN1_IA5STRING or
          B_ASN1_VISIBLESTRING or
          B_ASN1_BMPSTRING or
          B_ASN1_UTF8STRING;
  MBSTRING_FLAG = $1000;
  MBSTRING_UTF8 = MBSTRING_FLAG;
  MBSTRING_ASC = MBSTRING_FLAG or 1;
  MBSTRING_BMP = MBSTRING_FLAG or 2;
  MBSTRING_UNIV = MBSTRING_FLAG or 4;
  SMIME_OLDMIME	= $400;
  SMIME_CRLFEOL	=	$800;
  SMIME_STREAM  =	$1000;

  _CLOCKS_PER_SEC_ = 1000;
  {$EXTERNALSYM _CLOCKS_PER_SEC_}
  CLOCKS_PER_SEC = _CLOCKS_PER_SEC_;
  {$EXTERNALSYM CLOCKS_PER_SEC}
  CLK_TCK = CLOCKS_PER_SEC;
  {$EXTERNALSYM CLK_TCK}
//* Function codes. */
  COMP_F_BIO_ZLIB_FLUSH = 99;
  COMP_F_BIO_ZLIB_NEW	= 100;
  COMP_F_BIO_ZLIB_READ = 101;
  COMP_F_BIO_ZLIB_WRITE	= 102;

//* Reason codes. */
  COMP_R_ZLIB_DEFLATE_ERROR = 99;
  COMP_R_ZLIB_INFLATE_ERROR = 100;
  COMP_R_ZLIB_NOT_SUPPORTED = 101;

  CRYPTO_EX_INDEX_BIO = 0;
  CRYPTO_EX_INDEX_SSL = 1;
  CRYPTO_EX_INDEX_SSL_CTX = 2;
  CRYPTO_EX_INDEX_SSL_SESSION = 3;
  CRYPTO_EX_INDEX_X509_STORE = 4;
  CRYPTO_EX_INDEX_X509_STORE_CTX = 5;
  CRYPTO_EX_INDEX_RSA = 6;
  CRYPTO_EX_INDEX_DSA	= 7;
  CRYPTO_EX_INDEX_DH = 8;
  CRYPTO_EX_INDEX_ENGINE = 9;
  CRYPTO_EX_INDEX_X509 = 10;
  CRYPTO_EX_INDEX_UI = 11;
  CRYPTO_EX_INDEX_ECDSA	= 12;
  CRYPTO_EX_INDEX_ECDH = 13;
  CRYPTO_EX_INDEX_COMP = 14;
  CRYPTO_EX_INDEX_STORE	= 15;
  CRYPTO_EX_INDEX_USER = 100;

  CRYPTO_F_CRYPTO_GET_EX_NEW_INDEX = 100;
  CRYPTO_F_CRYPTO_GET_NEW_DYNLOCKID	= 103;
  CRYPTO_F_CRYPTO_GET_NEW_LOCKID = 101;
  CRYPTO_F_CRYPTO_SET_EX_DATA = 102;
  CRYPTO_F_DEF_ADD_INDEX = 104;
  CRYPTO_F_DEF_GET_CLASS = 105;
  CRYPTO_F_INT_DUP_EX_DATA = 106;
  CRYPTO_F_INT_FREE_EX_DATA	= 107;
  CRYPTO_F_INT_NEW_EX_DATA = 108;
  CRYPTO_R_NO_DYNLOCK_CREATE_CALLBACK = 100;

  CRYPTO_LOCK = 1;
  CRYPTO_LOCK_ERR = 1;
  CRYPTO_LOCK_ERR_HASH = 2;
  CRYPTO_LOCK_X509 = 3;
  CRYPTO_LOCK_X509_INFO = 4;
  CRYPTO_LOCK_X509_PKEY = 5;
  CRYPTO_LOCK_X509_CRL = 6;
  CRYPTO_LOCK_X509_REQ = 7;
  CRYPTO_LOCK_DSA = 8;
  CRYPTO_LOCK_RSA = 9;
  CRYPTO_LOCK_EVP_PKEY = 10;
  CRYPTO_LOCK_X509_STORE = 11;
  CRYPTO_LOCK_SSL_CTX = 12;
  CRYPTO_LOCK_SSL_CERT = 13;
  CRYPTO_LOCK_SSL_SESSION = 14;
  CRYPTO_LOCK_SSL_SESS_CERT = 15;
  CRYPTO_LOCK_SSL = 16;
  CRYPTO_LOCK_SSL_METHOD = 17;
  CRYPTO_LOCK_RAND = 18;
//  CRYPTO_LOCK_RAND = 17;
  CRYPTO_LOCK_RAND2 = 19;
  CRYPTO_LOCK_MALLOC = 20;
//was CRYPTO_LOCK_MALLOC = 18;
  CRYPTO_LOCK_BIO	= 21;
//was   CRYPTO_LOCK_BIO = 19;
  CRYPTO_LOCK_GETHOSTBYNAME = 22;
//was  CRYPTO_LOCK_GETHOSTBYNAME = 20;
  CRYPTO_LOCK_GETSERVBYNAME = 23;
//was  CRYPTO_LOCK_GETSERVBYNAME = 21;
  CRYPTO_LOCK_READDIR = 24;
//was  CRYPTO_LOCK_READDIR = 22;
  CRYPTO_LOCK_RSA_BLINDING = 25;
//was  CRYPTO_LOCK_RSA_BLINDING = 23;
  CRYPTO_LOCK_DH = 26;
  CRYPTO_LOCK_MALLOC2 = 27;
  CRYPTO_LOCK_DSO = 28;
  CRYPTO_LOCK_DYNLOCK = 29;
  CRYPTO_LOCK_ENGINE = 30;
  CRYPTO_LOCK_UI = 31;
  CRYPTO_LOCK_ECDSA = 32;
  CRYPTO_LOCK_EC = 33;
  CRYPTO_LOCK_ECDH = 34;
  CRYPTO_LOCK_BN = 35;
  CRYPTO_LOCK_EC_PRE_COMP	= 36;
  CRYPTO_LOCK_STORE = 37;
  CRYPTO_LOCK_COMP = 38;
  {$IFNDEF OPENSSL_FIPS}
  CRYPTO_NUM_LOCKS = 39;
// was  OPENSSL_CRYPTO_NUM_LOCKS = 24;
  {$ELSE}
  CRYPTO_LOCK_FIPS = 39;
  CRYPTO_LOCK_FIPS2 = 40;
  CRYPTO_NUM_LOCKS = 41;
  {$ENDIF}
  CRYPTO_MEM_CHECK_DISABLE = $3;
  CRYPTO_MEM_CHECK_ENABLE = $2;
  CRYPTO_MEM_CHECK_OFF = $0;
  CRYPTO_MEM_CHECK_ON = $1;
  CRYPTO_READ = 4;
  CRYPTO_UNLOCK = 2;
  CRYPTO_WRITE = 8;
  V_CRYPTO_MDEBUG_TIME = $1;
  V_CRYPTO_MDEBUG_THREAD = $2;
  {$IFNDEF OPENSSL_NO_AES}
  AES_ENCRYPT = 1;
  AES_DECRYPT = 0;
  AES_MAXNR = 14;
  AES_BLOCK_SIZE = 16;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_CAST}
  CAST_BLOCK = 8;
  CAST_DECRYPT = 0;
  CAST_ENCRYPT = 1;
  CAST_KEY_LENGTH = 16;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DES}
  DES_CBC_MODE = 0;
  DES_DECRYPT = 0;
  DES_ENCRYPT = 1;
  DES_PCBC_MODE = 1;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DH}
  //the OpenSSL developers probably only wanted to make sure this was defined.
  DH_MAX_MODULUS_BITS = 10000;
  DH_FIPS_MIN_MODULUS_BITS = 1024;
  DH_FLAG_CACHE_MONT_P = $01;
  DH_FLAG_NO_EXP_CONSTTIME = $02;
  DH_GENERATOR_2 = 2;
  DH_GENERATOR_5 = 5;
  DH_CHECK_P_NOT_PRIME = $01;
  DH_CHECK_P_NOT_STRONG_PRIME = $02;
  DH_UNABLE_TO_CHECK_GENERATOR = $04;
  DH_NOT_SUITABLE_GENERATOR = $08;
  DH_CHECK_PUBKEY_TOO_SMALL = $01;
  DH_CHECK_PUBKEY_TOO_LARGE = $02;
  DH_CHECK_P_NOT_SAFE_PRIME = DH_CHECK_P_NOT_STRONG_PRIME;
  DH_F_DHPARAMS_PRINT = 100;
  DH_F_DHPARAMS_PRINT_FP = 101;
  DH_F_COMPUTE_KEY = 102;
  DH_F_GENERATE_KEY = 103;
  DH_F_GENERATE_PARAMETERS = 104;
  DH_F_DH_NEW_METHOD = 105;
  DH_F_DH_NEW = 105;
  DH_F_DH_BUILTIN_GENPARAMS = 106;
  DH_F_DH_COMPUTE_KEY	= 107;
  //was   DH_F_DH_COMPUTE_KEY = 102;
  DH_F_DH_GENERATE_KEY = 108;
  //was   DH_F_DH_GENERATE_KEY = 103;
  DH_F_DH_GENERATE_PARAMETERS	= 109;
  //was   DH_F_DH_GENERATE_PARAMETERS = 104;
  DH_R_NO_PRIVATE_VALUE = 100;
  DH_R_BAD_GENERATOR = 101;
  DH_R_INVALID_PUBKEY = 102;
  DH_R_MODULUS_TOO_LARGE = 103;
  DH_R_KEY_SIZE_TOO_SMALL	= 104;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DSA}
  //I think the OpenSSL developers wanted to make sure this was defined.
  DSA_MAX_MODULUS_BITS = 10000;
  DSA_FIPS_MIN_MODULUS_BITS = 1024;
  DSA_FLAG_CACHE_MONT_P = $01;
  DSA_FLAG_NO_EXP_CONSTTIME = $02; //* new with 0.9.7h; the built-in DSA
///* If this flag is set the DSA method is FIPS compliant and can be used
// * in FIPS mode. This is set in the validated module method. If an
// * application sets this flag in its own methods it is its reposibility
// * to ensure the result is compliant.
// */
  DSA_FLAG_FIPS_METHOD = $0400;
///* If this flag is set the operations normally disabled in FIPS mode are
// * permitted it is then the applications responsibility to ensure that the
// * usage is compliant.
// */
  DSA_FLAG_NON_FIPS_ALLOW	= $0400;
  DSA_F_D2I_DSA_SIG = 110;
  DSA_F_DSAPARAMS_PRINT = 100;
  DSA_F_DSAPARAMS_PRINT_FP = 101;
  DSA_F_DSA_BUILTIN_KEYGEN = 119;
  DSA_F_DSA_BUILTIN_PARAMGEN = 118;
  DSA_F_DSA_DO_SIGN = 112;
  DSA_F_DSA_DO_VERIFY = 113;
  DSA_F_DSA_IS_PRIME = 102;
  DSA_F_DSA_NEW = 103;
  DSA_F_DSA_PRINT = 104;
  DSA_F_DSA_PRINT_FP = 105;
  DSA_F_DSA_SIGN = 106;
  DSA_F_DSA_SIGN_SETUP = 107;
  DSA_F_DSA_SIG_NEW = 109;
  DSA_F_DSA_VERIFY = 108;
  DSA_F_DSA_GENERATE_PARAMETERS	= 117;
  DSA_F_I2D_DSA_SIG = 111;
  DSA_F_SIG_CB = 114;
  DSA_R_DATA_TOO_LARGE_FOR_KEY_SIZE = 100;
  DSA_R_MISSING_PARAMETERS = 101;
  DSA_R_BAD_Q_VALUE = 102;
  DSA_R_MODULUS_TOO_LARGE = 103;
  DSA_R_NON_FIPS_METHOD	= 104;
  DSA_R_OPERATION_NOT_ALLOWED_IN_FIPS_MODE = 105;
  DSA_R_KEY_SIZE_TOO_SMALL = 106;
  {$ENDIF}
  {$IFNDEF NO_EC}
  ECC_MAX_FIELD_BITS = 661;
  EC_NAMED_CURVE = $001;
  POINT_CONVERSION_COMPRESSED = 2;
  POINT_CONVERSION_UNCOMPRESSED = 4;
  POINT_CONVERSION_HYBRID = 6;
  EC_PKEY_NO_PARAMETERS = $001;
  EC_PKEY_NO_PUBKEY = $002;
//* Error codes for the EC functions. */
//* Function codes. */
  EC_F_COMPUTE_WNAF = 143;
  EC_F_D2I_ECPARAMETERS = 144;
  EC_F_D2I_ECPKPARAMETERS = 145;
  EC_F_D2I_ECPRIVATEKEY = 146;
  EC_F_ECPARAMETERS_PRINT = 147;
  EC_F_ECPARAMETERS_PRINT_FP = 148;
  EC_F_ECPKPARAMETERS_PRINT = 149;
  EC_F_ECPKPARAMETERS_PRINT_FP = 150;
  EC_F_ECP_NIST_MOD_192 = 203;
  EC_F_ECP_NIST_MOD_224 = 204;
  EC_F_ECP_NIST_MOD_256 = 205;
  EC_F_ECP_NIST_MOD_521 = 206;
  EC_F_EC_ASN1_GROUP2CURVE = 153;
  EC_F_EC_ASN1_GROUP2FIELDID = 154;
  EC_F_EC_ASN1_GROUP2PARAMETERS = 155;
  EC_F_EC_ASN1_GROUP2PKPARAMETERS = 156;
  EC_F_EC_ASN1_PARAMETERS2GROUP = 157;
  EC_F_EC_ASN1_PKPARAMETERS2GROUP = 158;
  EC_F_EC_EX_DATA_SET_DATA = 211;
  EC_F_EC_GF2M_MONTGOMERY_POINT_MULTIPLY = 208;
  EC_F_EC_GF2M_SIMPLE_GROUP_CHECK_DISCRIMINANT = 159;
  EC_F_EC_GF2M_SIMPLE_GROUP_SET_CURVE = 195;
  EC_F_EC_GF2M_SIMPLE_OCT2POINT = 160;
  EC_F_EC_GF2M_SIMPLE_POINT2OCT = 161;
  EC_F_EC_GF2M_SIMPLE_POINT_GET_AFFINE_COORDINATES = 162;
  EC_F_EC_GF2M_SIMPLE_POINT_SET_AFFINE_COORDINATES = 163;
  EC_F_EC_GF2M_SIMPLE_SET_COMPRESSED_COORDINATES = 164;
  EC_F_EC_GFP_MONT_FIELD_DECODE = 133;
  EC_F_EC_GFP_MONT_FIELD_ENCODE = 134;
  EC_F_EC_GFP_MONT_FIELD_MUL = 131;
  EC_F_EC_GFP_MONT_FIELD_SET_TO_ONE = 209;
  EC_F_EC_GFP_MONT_FIELD_SQR = 132;
  EC_F_EC_GFP_MONT_GROUP_SET_CURVE = 189;
  EC_F_EC_GFP_MONT_GROUP_SET_CURVE_GFP = 135;
  EC_F_EC_GFP_NIST_FIELD_MUL = 200;
  EC_F_EC_GFP_NIST_FIELD_SQR = 201;
  EC_F_EC_GFP_NIST_GROUP_SET_CURVE = 202;
  EC_F_EC_GFP_SIMPLE_GROUP_CHECK_DISCRIMINANT = 165;
  EC_F_EC_GFP_SIMPLE_GROUP_SET_CURVE = 166;
  EC_F_EC_GFP_SIMPLE_GROUP_SET_CURVE_GFP = 100;
  EC_F_EC_GFP_SIMPLE_GROUP_SET_GENERATOR = 101;
  EC_F_EC_GFP_SIMPLE_MAKE_AFFINE = 102;
  EC_F_EC_GFP_SIMPLE_OCT2POINT = 103;
  EC_F_EC_GFP_SIMPLE_POINT2OCT = 104;
  EC_F_EC_GFP_SIMPLE_POINTS_MAKE_AFFINE = 137;
  EC_F_EC_GFP_SIMPLE_POINT_GET_AFFINE_COORDINATES = 167;
  EC_F_EC_GFP_SIMPLE_POINT_GET_AFFINE_COORDINATES_GFP = 105;
  EC_F_EC_GFP_SIMPLE_POINT_SET_AFFINE_COORDINATES = 168;
  EC_F_EC_GFP_SIMPLE_POINT_SET_AFFINE_COORDINATES_GFP = 128;
  EC_F_EC_GFP_SIMPLE_SET_COMPRESSED_COORDINATES = 169;
  EC_F_EC_GFP_SIMPLE_SET_COMPRESSED_COORDINATES_GFP = 129;
  EC_F_EC_GROUP_CHECK = 170;
  EC_F_EC_GROUP_CHECK_DISCRIMINANT = 171;
  EC_F_EC_GROUP_COPY = 106;
  EC_F_EC_GROUP_GET0_GENERATOR = 139;
  EC_F_EC_GROUP_GET_COFACTOR = 140;
  EC_F_EC_GROUP_GET_CURVE_GF2M = 172;
  EC_F_EC_GROUP_GET_CURVE_GFP = 130;
  EC_F_EC_GROUP_GET_DEGREE = 173;
  EC_F_EC_GROUP_GET_ORDER = 141;
  EC_F_EC_GROUP_GET_PENTANOMIAL_BASIS = 193;
  EC_F_EC_GROUP_GET_TRINOMIAL_BASIS = 194;
  EC_F_EC_GROUP_NEW = 108;
  EC_F_EC_GROUP_NEW_BY_CURVE_NAME = 174;
  EC_F_EC_GROUP_NEW_FROM_DATA = 175;
  EC_F_EC_GROUP_PRECOMPUTE_MULT = 142;
  EC_F_EC_GROUP_SET_CURVE_GF2M = 176;
  EC_F_EC_GROUP_SET_CURVE_GFP = 109;
  EC_F_EC_GROUP_SET_EXTRA_DATA = 110;
  EC_F_EC_GROUP_SET_GENERATOR = 111;
  EC_F_EC_KEY_CHECK_KEY = 177;
  EC_F_EC_KEY_COPY = 178;
  EC_F_EC_KEY_GENERATE_KEY = 179;
  EC_F_EC_KEY_NEW = 182;
  EC_F_EC_KEY_PRINT = 180;
  EC_F_EC_KEY_PRINT_FP = 181;
  EC_F_EC_POINTS_MAKE_AFFINE = 136;
  EC_F_EC_POINTS_MUL = 138;
  EC_F_EC_POINT_ADD = 112;
  EC_F_EC_POINT_CMP = 113;
  EC_F_EC_POINT_COPY = 114;
  EC_F_EC_POINT_DBL = 115;
  EC_F_EC_POINT_GET_AFFINE_COORDINATES_GF2M = 183;
  EC_F_EC_POINT_GET_AFFINE_COORDINATES_GFP = 116;
  EC_F_EC_POINT_GET_JPROJECTIVE_COORDINATES_GFP = 117;
  EC_F_EC_POINT_INVERT = 210;
  EC_F_EC_POINT_IS_AT_INFINITY = 118;
  EC_F_EC_POINT_IS_ON_CURVE = 119;
  EC_F_EC_POINT_MAKE_AFFINE = 120;
  EC_F_EC_POINT_MUL = 184;
  EC_F_EC_POINT_NEW = 121;
  EC_F_EC_POINT_OCT2POINT = 122;
  EC_F_EC_POINT_POINT2OCT = 123;
  EC_F_EC_POINT_SET_AFFINE_COORDINATES_GF2M = 185;
  EC_F_EC_POINT_SET_AFFINE_COORDINATES_GFP = 124;
  EC_F_EC_POINT_SET_COMPRESSED_COORDINATES_GF2M = 186;
  EC_F_EC_POINT_SET_COMPRESSED_COORDINATES_GFP = 125;
  EC_F_EC_POINT_SET_JPROJECTIVE_COORDINATES_GFP = 126;
  EC_F_EC_POINT_SET_TO_INFINITY = 127;
  EC_F_EC_PRE_COMP_DUP = 207;
  EC_F_EC_PRE_COMP_NEW = 196;
  EC_F_EC_WNAF_MUL = 187;
  EC_F_EC_WNAF_PRECOMPUTE_MULT = 188;
  EC_F_I2D_ECPARAMETERS = 190;
  EC_F_I2D_ECPKPARAMETERS = 191;
  EC_F_I2D_ECPRIVATEKEY = 192;
  EC_F_I2O_ECPUBLICKEY = 151;
  EC_F_O2I_ECPUBLICKEY = 152;
//* Reason codes. */
  EC_R_ASN1_ERROR = 115;
  EC_R_ASN1_UNKNOWN_FIELD = 116;
  EC_R_BUFFER_TOO_SMALL = 100;
  EC_R_D2I_ECPKPARAMETERS_FAILURE = 117;
  EC_R_DISCRIMINANT_IS_ZERO = 118;
  EC_R_EC_GROUP_NEW_BY_NAME_FAILURE = 119;
  EC_R_FIELD_TOO_LARGE = 138;
  EC_R_GROUP2PKPARAMETERS_FAILURE = 120;
  EC_R_I2D_ECPKPARAMETERS_FAILURE = 121;
  EC_R_INCOMPATIBLE_OBJECTS = 101;
  EC_R_INVALID_ARGUMENT = 112;
  EC_R_INVALID_COMPRESSED_POINT = 110;
  EC_R_INVALID_COMPRESSION_BIT = 109;
  EC_R_INVALID_ENCODING = 102;
  EC_R_INVALID_FIELD = 103;
  EC_R_INVALID_FORM = 104;
  EC_R_INVALID_GROUP_ORDER = 122;
  EC_R_INVALID_PENTANOMIAL_BASIS = 132;
  EC_R_INVALID_PRIVATE_KEY = 123;
  EC_R_INVALID_TRINOMIAL_BASIS = 137;
  EC_R_MISSING_PARAMETERS = 124;
  EC_R_MISSING_PRIVATE_KEY = 125;
  EC_R_NOT_A_NIST_PRIME = 135;
  EC_R_NOT_A_SUPPORTED_NIST_PRIME = 136;
  EC_R_NOT_IMPLEMENTED = 126;
  EC_R_NOT_INITIALIZED = 111;
  EC_R_NO_FIELD_MOD = 133;
  EC_R_PASSED_NULL_PARAMETER = 134;
  EC_R_PKPARAMETERS2GROUP_FAILURE = 127;
  EC_R_POINT_AT_INFINITY = 106;
  EC_R_POINT_IS_NOT_ON_CURVE = 107;
  EC_R_SLOT_FULL = 108;
  EC_R_UNDEFINED_GENERATOR = 113;
  EC_R_UNDEFINED_ORDER = 128;
  EC_R_UNKNOWN_GROUP = 129;
  EC_R_UNKNOWN_ORDER = 114;
  EC_R_UNSUPPORTED_FIELD = 131;
  EC_R_WRONG_ORDER = 130;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_ECDSA}
  ECDSA_F_ECDSA_DATA_NEW_METHOD = 100;
  ECDSA_F_ECDSA_DO_SIGN = 101;
  ECDSA_F_ECDSA_DO_VERIFY = 102;
  ECDSA_F_ECDSA_SIGN_SETUP = 103;
  ECDSA_R_BAD_SIGNATURE = 100;
  ECDSA_R_DATA_TOO_LARGE_FOR_KEY_SIZE = 101;
  ECDSA_R_ERR_EC_LIB = 102;
  ECDSA_R_MISSING_PARAMETERS = 103;
  ECDSA_R_RANDOM_NUMBER_GENERATION_FAILED = 104;
  ECDSA_R_SIGNATURE_MALLOC_FAILED = 105;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_ECDH}
  ECDH_F_ECDH_COMPUTE_KEY = 100;
  ECDH_F_ECDH_DATA_NEW_METHOD = 101;
  ECDH_R_KDF_FAILED = 102;
  ECDH_R_NO_PRIVATE_VALUE = 100;
  ECDH_R_POINT_ARITHMETIC_FAILURE = 101;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_BF}
  BF_BLOCK = 8;
  BF_DECRYPT = 0;
  BF_ENCRYPT = 1;
  BF_ROUNDS = 16;
  {$ENDIF}
  EVP_MAX_MD_SIZE = 64; //* longest known is SHA512 */  - value I found, 16+20;
  EVP_MAX_KEY_LENGTH = 32; //value I found, 24;
  EVP_MAX_IV_LENGTH = 16; //value I found, 8;
  EVP_MAX_BLOCK_LENGTH=32;
  NID_dhKeyAgreement = 28;

  NID_dsa = 116;

  NID_dsa_2 = 67;

  NID_dsaWithSHA = 66;

  NID_dsaWithSHA1 = 113;

  NID_dsaWithSHA1_2 = 70;

  EVP_PKEY_MO_SIGN = $0001;
  EVP_PKEY_MO_VERIFY = $0002;
  EVP_PKEY_MO_ENCRYPT = $0004;
  EVP_PKEY_MO_DECRYPT = $0008;

  EVP_MD_FLAG_FIPS = $0400;
  //* Note if suitable for use in FIPS mode */
  EVP_MD_FLAG_SVCTX	= $0800;
  //* pass EVP_MD_SVCTX to sign/verify */
  NID_undef = 0;
  NID_rsaEncryption = 6;
  NID_rsa = 19;
  NID_X9_62_id_ecPublicKey = 408;

  EVP_PKEY_NONE = NID_undef;
  EVP_PKEY_RSA = NID_rsaEncryption;
  EVP_PKEY_RSA2 = NID_rsa;
  EVP_PKEY_DSA = NID_dsa;
  EVP_PKEY_DSA1 = NID_dsa_2;
  EVP_PKEY_DSA2 = NID_dsaWithSHA;
  EVP_PKEY_DSA3 = NID_dsaWithSHA1;
  EVP_PKEY_DSA4 = NID_dsaWithSHA1_2;

  EVP_PKEY_DH = NID_dhKeyAgreement;
  EVP_PKEY_EC = NID_X9_62_id_ecPublicKey;

  EVP_PKT_SIGN = $0010;
  EVP_PKT_ENC = $0020;
  EVP_PKT_EXCH = $0040;
  EVP_PKT_EXP = $1000;

  EVP_PKS_RSA = $0100;
  EVP_PKS_DSA = $0200;
  EVP_PKS_EC	= $0400;

  EVP_PK_RSA = $0001;
  EVP_PK_DSA = $0002;
  EVP_PK_DH = $0004;
  EVP_PK_EC = $0008;

  EVP_BLOWFISH_KEY_SIZE = 16;
  EVP_CAST5_KEY_SIZE = 16;
  EVP_RC2_KEY_SIZE = 16;
  EVP_RC4_KEY_SIZE = 16;
  EVP_RC5_32_12_16_KEY_SIZE = 16;
  EVP_MD_CTX_FLAG_ONESHOT = $0001;
  //* digest update will be called
	//* once only */
  EVP_MD_CTX_FLAG_CLEANED	= $0002;
  //* context has already been
	//* cleaned */
  EVP_MD_CTX_FLAG_REUSE	=	$0004;
  //* Don't free up ctx->md_data
	//* in EVP_MD_CTX_cleanup */
  EVP_MD_CTX_FLAG_NON_FIPS_ALLOW = $0008;
  //* Allow use of non FIPS digest
	// * in FIPS mode */
  EVP_MD_CTX_FLAG_PAD_MASK = $F0;	//* RSA mode to use */
  EVP_MD_CTX_FLAG_PAD_PKCS1 = $00;	//* PKCS#1 v1.5 mode */
  EVP_MD_CTX_FLAG_PAD_X931 = $10;	//* X9.31 mode */
  EVP_MD_CTX_FLAG_PAD_PSS = $20;	//* PSS mode */
//#define M_EVP_MD_CTX_FLAG_PSS_SALT(ctx) \
//		((ctx->flags>>16) &0xFFFF) /* seed length */
  EVP_MD_CTX_FLAG_PSS_MDLEN = $FFFF;	//* salt len same as digest */
  EVP_MD_CTX_FLAG_PSS_MREC = $FFFE;	//* salt max or auto recovered */
//* Modes for ciphers */
  EVP_CIPH_STREAM_CIPHER = $0;
  EVP_CIPH_ECB_MODE	= $1;
  EVP_CIPH_CBC_MODE	= $2;
  EVP_CIPH_CFB_MODE	= $3;
  EVP_CIPH_OFB_MODE	= $4;
  EVP_CIPH_MODE	= $7;
//* Set if variable length cipher */
  EVP_CIPH_VARIABLE_LENGTH = $8;
//* Set if the iv handling should be done by the cipher itself */
  EVP_CIPH_CUSTOM_IV = $10;
//* Set if the cipher's init() function should be called if key is NULL */
  EVP_CIPH_ALWAYS_CALL_INIT	= $20;
//* Call ctrl() to init cipher parameters */
  EVP_CIPH_CTRL_INIT = $40;
//* Don't use standard key length function */
  EVP_CIPH_CUSTOM_KEY_LENGTH = $80;
//* Don't use standard block padding */
  EVP_CIPH_NO_PADDING	= $100;
//* cipher handles random key generation */
  EVP_CIPH_RAND_KEY	= $200;
//* Note if suitable for use in FIPS mode */
  EVP_CIPH_FLAG_FIPS = $400;
//* Allow non FIPS cipher in FIPS mode */
  EVP_CIPH_FLAG_NON_FIPS_ALLOW = $800;
//* Allow use default ASN1 get/set iv */
  EVP_CIPH_FLAG_DEFAULT_ASN1 = $1000;
//* Buffer length in bits not bytes: CFB1 mode only */
  EVP_CIPH_FLAG_LENGTH_BITS	= $2000;
  EVP_CTRL_INIT	= $0;
  EVP_CTRL_SET_KEY_LENGTH = $1;
  EVP_CTRL_GET_RC2_KEY_BITS	= $2;
  EVP_CTRL_SET_RC2_KEY_BITS = $3;
  EVP_CTRL_GET_RC5_ROUNDS	= $4;
  EVP_CTRL_SET_RC5_ROUNDS = $5;
  EVP_CTRL_RAND_KEY	= $6;
  EVP_F_AES_INIT_KEY = 133;
  EVP_F_ALG_MODULE_INIT	= 138;
  EVP_F_CAMELLIA_INIT_KEY = 159;
  EVP_F_D2I_PKEY = 100;
  EVP_F_DO_EVP_ENC_ENGINE = 140;
  EVP_F_DO_EVP_ENC_ENGINE_FULL = 141;
  EVP_F_DO_EVP_MD_ENGINE = 139;
  EVP_F_DO_EVP_MD_ENGINE_FULL	= 142;
  EVP_F_DSAPKEY2PKCS8	= 134;
  EVP_F_DSA_PKEY2PKCS8 = 135;
  EVP_F_ECDSA_PKEY2PKCS8 = 129;
  EVP_F_ECKEY_PKEY2PKCS8 = 132;
  EVP_F_EVP_CIPHERINIT = 137;
  EVP_F_EVP_CIPHERINIT_EX	= 123;
  EVP_F_EVP_CIPHER_CTX_CTRL	= 124;
  EVP_F_EVP_CIPHER_CTX_SET_KEY_LENGTH	= 122;
  EVP_F_EVP_DECRYPTFINAL_EX	= 101;
  //was EVP_F_EVP_DECRYPTFINAL = 101;
  EVP_F_EVP_DIGESTINIT = 136;
  EVP_F_EVP_DIGESTINIT_EX	= 128;
  EVP_F_EVP_ENCRYPTFINAL_EX	= 127;
  EVP_F_EVP_MD_CTX_COPY_EX = 110;
  //was EVP_F_EVP_MD_CTX_COPY = 110;
  EVP_F_EVP_OPENINIT = 102;
  EVP_F_EVP_PBE_ALG_ADD	= 115;
  EVP_F_EVP_PBE_CIPHERINIT = 116;
  EVP_F_EVP_PKCS82PKEY = 111;
  EVP_F_EVP_PKEY2PKCS8_BROKEN	= 113;
  //was  EVP_F_EVP_PKEY2PKCS8 = 113;
  EVP_F_EVP_PKEY_COPY_PARAMETERS = 103;
  EVP_F_EVP_PKEY_DECRYPT = 104;
  EVP_F_EVP_PKEY_ENCRYPT = 105;
  EVP_F_EVP_PKEY_GET1_DH = 119;
  EVP_F_EVP_PKEY_GET1_DSA	= 120;
  EVP_F_EVP_PKEY_GET1_ECDSA	= 130;
  EVP_F_EVP_PKEY_GET1_EC_KEY = 131;
  EVP_F_EVP_PKEY_GET1_RSA	= 121;
  EVP_F_EVP_PKEY_NEW = 106;
  EVP_F_EVP_RIJNDAEL = 126;
  EVP_F_EVP_SIGNFINAL = 107;
  EVP_F_EVP_VERIFYFINAL = 108;
  EVP_F_PKCS5_PBE_KEYIVGEN = 117;
  EVP_F_PKCS5_V2_PBE_KEYIVGEN	= 118;
  EVP_F_PKCS8_SET_BROKEN = 112;
  //was EVP_F_EVP_PKCS8_SET_BROKEN = 112;
  EVP_F_RC2_MAGIC_TO_METH	= 109;
  EVP_F_RC5_CTRL = 125;
  EVP_R_BAD_DECRYPT = 100;
  EVP_R_BN_DECODE_ERROR = 112;
  EVP_R_BN_PUBKEY_ERROR = 113;
  EVP_R_CIPHER_PARAMETER_ERROR = 122;
  EVP_R_DECODE_ERROR = 114;
  EVP_R_DIFFERENT_KEY_TYPES = 101;
  EVP_R_DISABLED_FOR_FIPS	= 144;
  EVP_R_ENCODE_ERROR = 115;
  EVP_R_ERROR_LOADING_SECTION	= 145;
  EVP_R_ERROR_SETTING_FIPS_MODE	= 146;
  EVP_R_EVP_PBE_CIPHERINIT_ERROR = 119;
  EVP_R_EXPECTING_AN_RSA_KEY = 127;
  EVP_R_EXPECTING_A_DH_KEY = 128;
  EVP_R_EXPECTING_A_DSA_KEY	= 129;
  EVP_R_EXPECTING_A_ECDSA_KEY	= 141;
  EVP_R_EXPECTING_A_EC_KEY = 142;
  EVP_R_FIPS_MODE_NOT_SUPPORTED	= 147;
  EVP_R_INITIALIZATION_ERROR = 134;
  EVP_R_INPUT_NOT_INITIALIZED = 111;
  EVP_R_INVALID_FIPS_MODE	= 148;
  EVP_R_IV_TOO_LARGE = 102;
  EVP_R_KEYGEN_FAILURE = 120;
  EVP_R_MISSING_PARMATERS = 103;
  EVP_R_NO_DSA_PARAMETERS = 116;
  EVP_R_NO_SIGN_FUNCTION_CONFIGURED = 104;
  EVP_R_NO_VERIFY_FUNCTION_CONFIGURED = 105;
  EVP_R_PKCS8_UNKNOWN_BROKEN_TYPE = 117;
  EVP_R_PUBLIC_KEY_NOT_RSA = 106;
  EVP_R_UNKNOWN_OPTION				= 149;
  EVP_R_UNKNOWN_PBE_ALGORITHM = 121;
  EVP_R_UNSUPPORTED_CIPHER = 107;
  EVP_R_UNSUPPORTED_KEYLENGTH = 123;
  EVP_R_UNSUPPORTED_KEY_DERIVATION_FUNCTION = 124;
  EVP_R_UNSUPPORTED_KEY_SIZE = 108;
  EVP_R_UNSUPPORTED_PRF = 125;
  EVP_R_UNSUPPORTED_PRIVATE_KEY_ALGORITHM = 118;
  EVP_R_UNSUPPORTED_SALT_TYPE = 126;
  EVP_R_WRONG_FINAL_BLOCK_LENGTH = 109;
  EVP_R_WRONG_PUBLIC_KEY_TYPE = 110;
  EVP_R_SEED_KEY_SETUP_FAILED = 162;
  {$IFDEF OPENSSL_FIPS}
//* Function codes. */
  FIPS_F_DH_BUILTIN_GENPARAMS	= 100;
  FIPS_F_DSA_BUILTIN_PARAMGEN	  = 101;
  FIPS_F_DSA_DO_SIGN				= 102;
  FIPS_F_DSA_DO_VERIFY				= 103;
  FIPS_F_EVP_CIPHERINIT_EX		= 124;
  FIPS_F_EVP_DIGESTINIT_EX			= 125;
  FIPS_F_FIPS_CHECK_DSA				 = 104;
  FIPS_F_FIPS_CHECK_INCORE_FINGERPRINT		= 105;
  FIPS_F_FIPS_CHECK_RSA				= 106;
  FIPS_F_FIPS_DSA_CHECK				= 107;
  FIPS_F_FIPS_MODE_SET				 = 108;
  FIPS_F_FIPS_PKEY_SIGNATURE_TEST			= 109;
  FIPS_F_FIPS_SELFTEST_AES			= 110;
  FIPS_F_FIPS_SELFTEST_DES			= 111;
  FIPS_F_FIPS_SELFTEST_DSA			 = 112;
  FIPS_F_FIPS_SELFTEST_HMAC			 = 113;
  FIPS_F_FIPS_SELFTEST_RNG			 = 114;
  FIPS_F_FIPS_SELFTEST_SHA1			 = 115;
  FIPS_F_HASH_FINAL				= 123;
  FIPS_F_RSA_BUILTIN_KEYGEN			= 116;
  FIPS_F_RSA_EAY_PRIVATE_DECRYPT			= 117;
  FIPS_F_RSA_EAY_PRIVATE_ENCRYPT			= 118;
  FIPS_F_RSA_EAY_PUBLIC_DECRYPT			 = 119;
  FIPS_F_RSA_EAY_PUBLIC_ENCRYPT			 = 120;
  FIPS_F_RSA_X931_GENERATE_KEY_EX			= 121;
  FIPS_F_SSLEAY_RAND_BYTES		 = 122;
//* Reason codes. */
  FIPS_R_CANNOT_READ_EXE			   = 103;
  FIPS_R_CANNOT_READ_EXE_DIGEST			= 104;
  FIPS_R_CONTRADICTING_EVIDENCE			 = 114;
  FIPS_R_EXE_DIGEST_DOES_NOT_MATCH		 = 105;
  FIPS_R_FINGERPRINT_DOES_NOT_MATCH		 = 110;
  FIPS_R_FINGERPRINT_DOES_NOT_MATCH_NONPIC_RELOCATED = 111;
  FIPS_R_FINGERPRINT_DOES_NOT_MATCH_SEGMENT_ALIASING = 112;
  FIPS_R_FIPS_MODE_ALREADY_SET			 = 102;
  FIPS_R_FIPS_SELFTEST_FAILED			 = 106;
  FIPS_R_INVALID_KEY_LENGTH			 = 109;
  FIPS_R_KEY_TOO_SHORT				 = 108;
  FIPS_R_NON_FIPS_METHOD				 = 100;
  FIPS_R_PAIRWISE_TEST_FAILED			 = 107;
  FIPS_R_RSA_DECRYPT_ERROR			 = 115;
  FIPS_R_RSA_ENCRYPT_ERROR			 = 116;
  FIPS_R_SELFTEST_FAILED				 = 101;
  FIPS_R_TEST_FAILURE				 = 117;
  FIPS_R_UNSUPPORTED_PLATFORM			 = 113;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_ENGINE}
//* These flags are used to control combinations of algorithm (methods)
// * by bitwise "OR"ing. */
  ENGINE_METHOD_RSA : TIdC_UINT = $0001;
  ENGINE_METHOD_DSA	: TIdC_UINT = $0002;
  ENGINE_METHOD_DH : TIdC_UINT = $0004;
  ENGINE_METHOD_RAND : TIdC_UINT = $0008;
  ENGINE_METHOD_ECDH : TIdC_UINT = $0010;
  ENGINE_METHOD_ECDSA	: TIdC_UINT = $0020;
  ENGINE_METHOD_CIPHERS	: TIdC_UINT = $0040;
  ENGINE_METHOD_DIGESTS	: TIdC_UINT = $0080;
  ENGINE_METHOD_STORE	: TIdC_UINT = $0100;
//* Obvious all-or-nothing cases. */
  ENGINE_METHOD_ALL	: TIdC_UINT = $FFFF;
  ENGINE_METHOD_NONE : TIdC_UINT = $0000;
  ENGINE_TABLE_FLAG_NOINIT : TIdC_UINT = $0001;

  ENGINE_FLAGS_MANUAL_CMD_CTRL : TIdC_INT = $0002;
  ENGINE_FLAGS_BY_ID_COPY	: TIdC_INT = $0004;
  ENGINE_CMD_FLAG_NUMERIC	: TIdC_UINT = $0001;
  ENGINE_CMD_FLAG_STRING : TIdC_UINT = $0002;
  ENGINE_CMD_FLAG_NO_INPUT : TIdC_UINT = $0004;
  ENGINE_CMD_FLAG_INTERNAL : TIdC_UINT = $0008;

  ENGINE_CTRL_SET_LOGSTREAM	= 1;
  ENGINE_CTRL_SET_PASSWORD_CALLBACK = 2;
  ENGINE_CTRL_HUP	= 3;
  //* Close and reinitialise any
	// handles/connections etc. */
  ENGINE_CTRL_SET_USER_INTERFACE = 4; //* Alternative to callback */
  _CALLBACK_DATA = 5;
  //* User-specific data, used
	//  when calling the password
	//  callback and the user
	//  interface */
  D_CONFIGURATION	= 6;
  //* Load a configuration, given
	//a string that represents a
	//file name or so */
  D_SECTION	= 7;
  ///* Load data from a given
	//section in the already loaded
	//configuration */

////* Returns non-zero if the supplied ENGINE has a ctrl() handler. If "not", then
// * all the remaining control commands will return failure, so it is worth
// * checking this first if the caller is trying to "discover" the engine's
// * capabilities and doesn't want errors generated unnecessarily. */
  ENGINE_CTRL_HAS_CTRL_FUNCTION	= 10;
///* Returns a positive command number for the first command supported by the
// * engine. Returns zero if no ctrl commands are supported. */
  ENGINE_CTRL_GET_FIRST_CMD_TYPE = 11;
///* The 'long' argument specifies a command implemented by the engine, and the
// * return value is the next command supported, or zero if there are no more. */
  ENGINE_CTRL_GET_NEXT_CMD_TYPE = 12;
///* The 'void*' argument is a command name (cast from 'const char *'), and the
// * return value is the command that corresponds to it. */
  ENGINE_CTRL_GET_CMD_FROM_NAME = 13;
///* The next two allow a command to be converted into its corresponding string
// * form. In each case, the 'long' argument supplies the command. In the NAME_LEN
// * case, the return value is the length of the command name (not counting a
// * trailing EOL). In the NAME case, the 'void*' argument must be a string buffer
// * large enough, and it will be populated with the name of the command (WITH a
// * trailing EOL). */
  ENGINE_CTRL_GET_NAME_LEN_FROM_CMD = 14;
  ENGINE_CTRL_GET_NAME_FROM_CMD	= 15;
//* The next two are similar but give a "short description" of a command. */
  ENGINE_CTRL_GET_DESC_LEN_FROM_CMD	= 16;
  ENGINE_CTRL_GET_DESC_FROM_CMD = 17;
///* With this command, the return value is the OR'd combination of
// * ENGINE_CMD_FLAG_*** values that indicate what kind of input a given
// * engine-specific ctrl command expects. */
  ENGINE_CTRL_GET_CMD_FLAGS	= 18;

///* ENGINE implementations should start the numbering of their own control
// * commands from this value. (ie. ENGINE_CMD_BASE, ENGINE_CMD_BASE + 1, etc). */
  ENGINE_CMD_BASE = 200;

///* NB: These 2 nCipher "chil" control commands are deprecated, and their
// * functionality is now available through ENGINE-specific control commands
// * (exposed through the above-mentioned 'CMD'-handling). Code using these 2
// * commands should be migrated to the more general command handling before these
// * are removed. */

//* Flags specific to the nCipher "chil" engine */
  ENGINE_CTRL_CHIL_SET_FORKCHECK = 100;
///* Depending on the value of the (long)i argument, this sets or
// * unsets the SimpleForkCheck flag in the CHIL API to enable or
// * disable checking and workarounds for applications that fork().
// */
  ENGINE_CTRL_CHIL_NO_LOCKING	=	101;
///* This prevents the initialisation function from providing mutex
// * callbacks to the nCipher library. */

///* Binary/behaviour compatibility levels */
  OSSL_DYNAMIC_VERSION	: TIdC_UINT = $00020000;
///* Binary versions older than this are too old for us (whether we're a loader or
// * a loadee) */
  OSSL_DYNAMIC_OLDEST	: TIdC_UINT = $00020000;
//* Function codes. */
  ENGINE_F_DYNAMIC_CTRL	= 180;
  ENGINE_F_DYNAMIC_GET_DATA_CTX = 181;
  ENGINE_F_DYNAMIC_LOAD = 182;
  ENGINE_F_DYNAMIC_SET_DATA_CTX	= 183;
  ENGINE_F_ENGINE_ADD	= 105;
  ENGINE_F_ENGINE_BY_ID	= 106;
  ENGINE_F_ENGINE_CMD_IS_EXECUTABLE	= 170;
  ENGINE_F_ENGINE_CTRL = 142;
  ENGINE_F_ENGINE_CTRL_CMD = 178;
  ENGINE_F_ENGINE_CTRL_CMD_STRING	= 171;
  ENGINE_F_ENGINE_FINISH = 107;
  ENGINE_F_ENGINE_FREE_UTIL	= 108;
  ENGINE_F_ENGINE_GET_CIPHER = 185;
  ENGINE_F_ENGINE_GET_DEFAULT_TYPE = 177;
  ENGINE_F_ENGINE_GET_DIGEST = 186;
  ENGINE_F_ENGINE_GET_NEXT = 115;
  ENGINE_F_ENGINE_GET_PREV = 116;
  ENGINE_F_ENGINE_INIT = 119;
  ENGINE_F_ENGINE_LIST_ADD = 120;
  ENGINE_F_ENGINE_LIST_REMOVE	= 121;
  ENGINE_F_ENGINE_LOAD_PRIVATE_KEY = 150;
  ENGINE_F_ENGINE_LOAD_PUBLIC_KEY	= 151;
  ENGINE_F_ENGINE_LOAD_SSL_CLIENT_CERT = 192;
  ENGINE_F_ENGINE_NEW	= 122;
  ENGINE_F_ENGINE_REMOVE = 123;
  ENGINE_F_ENGINE_SET_DEFAULT_STRING = 189;
  ENGINE_F_ENGINE_SET_DEFAULT_TYPE = 126;
  ENGINE_F_ENGINE_SET_ID = 129;
  ENGINE_F_ENGINE_SET_NAME = 130;
  ENGINE_F_ENGINE_TABLE_REGISTER = 184;
  ENGINE_F_ENGINE_UNLOAD_KEY = 152;
  ENGINE_F_ENGINE_UNLOCKED_FINISH	= 191;
  ENGINE_F_ENGINE_UP_REF = 190;
  ENGINE_F_INT_CTRL_HELPER = 172;
  ENGINE_F_INT_ENGINE_CONFIGURE	= 188;
  ENGINE_F_INT_ENGINE_MODULE_INIT	= 187;
  ENGINE_F_LOG_MESSAGE = 141;
//* Reason codes. */
  ENGINE_R_ALREADY_LOADED	= 100;
  ENGINE_R_ARGUMENT_IS_NOT_A_NUMBER	= 133;
  ENGINE_R_CMD_NOT_EXECUTABLE	= 134;
  ENGINE_R_COMMAND_TAKES_INPUT = 135;
  ENGINE_R_COMMAND_TAKES_NO_INPUT	= 136;
  ENGINE_R_CONFLICTING_ENGINE_ID = 103;
  ENGINE_R_CTRL_COMMAND_NOT_IMPLEMENTED = 119;
  ENGINE_R_DH_NOT_IMPLEMENTED	= 139;
  ENGINE_R_DSA_NOT_IMPLEMENTED = 140;
  ENGINE_R_DSO_FAILURE = 104;
  ENGINE_R_DSO_NOT_FOUND = 132;
  ENGINE_R_ENGINES_SECTION_ERROR = 148;
  ENGINE_R_ENGINE_CONFIGURATION_ERROR = 101;

  ENGINE_R_ENGINE_IS_NOT_IN_LIST = 105;
  ENGINE_R_ENGINE_SECTION_ERROR	= 149;
  ENGINE_R_FAILED_LOADING_PRIVATE_KEY	= 128;
  ENGINE_R_FAILED_LOADING_PUBLIC_KEY = 129;
  ENGINE_R_FINISH_FAILED = 106;
  ENGINE_R_GET_HANDLE_FAILED = 107;
  ENGINE_R_ID_OR_NAME_MISSING	= 108;
  ENGINE_R_INIT_FAILED = 109;
  ENGINE_R_INTERNAL_LIST_ERROR = 110;
  ENGINE_R_INVALID_ARGUMENT = 143;
  ENGINE_R_INVALID_CMD_NAME	= 137;
  ENGINE_R_INVALID_CMD_NUMBER	= 138;
  ENGINE_R_INVALID_INIT_VALUE	= 151;
  ENGINE_R_INVALID_STRING	= 150;
  ENGINE_R_NOT_INITIALISED = 117;
  ENGINE_R_NOT_LOADED	= 112;
  ENGINE_R_NO_CONTROL_FUNCTION = 120;
  ENGINE_R_NO_INDEX	= 144;
  ENGINE_R_NO_LOAD_FUNCTION	= 125;
  ENGINE_R_NO_REFERENCE	= 130;
  ENGINE_R_NO_SUCH_ENGINE	= 116;
  ENGINE_R_NO_UNLOAD_FUNCTION	= 126;
  ENGINE_R_PROVIDE_PARAMETERS	= 113;
  ENGINE_R_RSA_NOT_IMPLEMENTED = 141;
  ENGINE_R_UNIMPLEMENTED_CIPHER	= 146;
  ENGINE_R_UNIMPLEMENTED_DIGEST	= 147;
  ENGINE_R_VERSION_INCOMPATIBILITY = 145;
{$ENDIF}
  MSS_EXIT_FAILURE = 1;
  MSS_EXIT_SUCCESS = 0;
  FILENAME_MAX = 1024;
  FOPEN_MAX = 20;
  {$IFNDEF OPENSSL_NO_IDEA}
  IDEA_BLOCK = 8;
  IDEA_DECRYPT = 0;
  IDEA_ENCRYPT = 1;
  IDEA_KEY_LENGTH = 16;
  {$ENDIF}
  IS_SEQUENCE = 0;
  IS_SET = 1;
  KRBDES_DECRYPT = DES_DECRYPT;
  KRBDES_ENCRYPT = DES_ENCRYPT;
  LH_LOAD_MULT = 256;
  L_ctermid = 16;
  L_cuserid = 9;
  L_tmpnam = 1024;
  {$IFNDEF OPENSSL_NO_MD2}
  MD2_BLOCK = 16;
  MD2_DIGEST_LENGTH = 16;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD4}
  MD4_CBLOCK  = 64;
  MD4_LBLOCK = (MD4_CBLOCK div 4);
  MD4_DIGEST_LENGTH = 16;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD5}
  MD5_CBLOCK = 64;
  MD5_LBLOCK = 16; //(MD5_CBLOCK/4);
  MD5_DIGEST_LENGTH = 16;
  {$ENDIF}
   {$IFNDEF OPENSSL_NO_MDC2}
  OPENSSL_MDC2_BLOCK = 8;
  OPENSSL_MDC2_DIGEST_LENGTH = 16;
  {$ENDIF}  
  {$IFNDEF OPENSSL_NO_SHA}
  SHA_LBLOCK = 16;
  SHA_CBLOCK = 64; //(SHA_LBLOCK * 4);
  SHA_DIGEST_LENGTH = 20;
  SHA_LAST_BLOCK = ( SHA_CBLOCK -8);
  SHA256_CBLOCK = ( SHA_LBLOCK * 4);
  SHA224_DIGEST_LENGTH = 28;
  SHA256_DIGEST_LENGTH = 32;
  SHA384_DIGEST_LENGTH = 48;
  SHA512_DIGEST_LENGTH = 64;
    {$IFNDEF OPENSSL_NO_SHA512}
  SHA512_CBLOCK = (SHA_LBLOCK*8);
    {$ENDIF}
  {$ENDIF}
  LN_SMIMECapabilities = 'S/MIME Capabilities';  {Do not localize}
  LN_X500 = 'X500';  {Do not localize}
  LN_X509 = 'X509';  {Do not localize}
  LN_algorithm = 'algorithm';  {Do not localize}
  LN_authority_key_identifier = 'X509v3 Authority Key Identifier';  {Do not localize}
  LN_basic_constraints = 'X509v3 Basic Constraints';  {Do not localize}
  LN_bf_cbc = 'bf-cbc';  {Do not localize}
  LN_bf_cfb64 = 'bf-cfb';  {Do not localize}
  LN_bf_ecb = 'bf-ecb';  {Do not localize}
  LN_bf_ofb64 = 'bf-ofb';  {Do not localize}
  LN_cast5_cbc = 'cast5-cbc';  {Do not localize}
  LN_cast5_cfb64 = 'cast5-cfb';  {Do not localize}
  LN_cast5_ecb = 'cast5-ecb';  {Do not localize}
  LN_cast5_ofb64 = 'cast5-ofb';  {Do not localize}
  LN_certBag = 'certBag';  {Do not localize}
  LN_certificate_policies = 'X509v3 Certificate Policies';  {Do not localize}
  LN_client_auth = 'TLS Web Client Authentication';  {Do not localize}
  LN_code_sign = 'Code Signing';  {Do not localize}
  LN_commonName = 'commonName';  {Do not localize}
  LN_countryName = 'countryName';  {Do not localize}
  LN_crlBag = 'crlBag';  {Do not localize}
  LN_crl_distribution_points = 'X509v3 CRL Distribution Points';  {Do not localize}
  LN_crl_number = 'X509v3 CRL Number';  {Do not localize}
  LN_crl_reason = 'CRL Reason Code';  {Do not localize}
  LN_delta_crl = 'X509v3 Delta CRL Indicator';  {Do not localize}
  LN_des_cbc = 'des-cbc';  {Do not localize}
  LN_des_cfb64 = 'des-cfb';  {Do not localize}
  LN_des_ecb = 'des-ecb';  {Do not localize}
  LN_des_ede = 'des-ede';  {Do not localize}
  LN_des_ede3 = 'des-ede3';  {Do not localize}
  LN_des_ede3_cbc = 'des-ede3-cbc';  {Do not localize}
  LN_des_ede3_cfb64 = 'des-ede3-cfb';  {Do not localize}
  LN_des_ede3_ofb64 = 'des-ede3-ofb';  {Do not localize}
  LN_des_ede_cbc = 'des-ede-cbc';  {Do not localize}
  LN_des_ede_cfb64 = 'des-ede-cfb';  {Do not localize}
  LN_des_ede_ofb64 = 'des-ede-ofb';  {Do not localize}
  LN_des_ofb64 = 'des-ofb';  {Do not localize}
  LN_description = 'description';  {Do not localize}
  LN_desx_cbc = 'desx-cbc';  {Do not localize}
  LN_dhKeyAgreement = 'dhKeyAgreement';  {Do not localize}
  LN_dsa = 'dsaEncryption';  {Do not localize}
  LN_dsaWithSHA = 'dsaWithSHA';  {Do not localize}
  LN_dsaWithSHA1 = 'dsaWithSHA1';  {Do not localize}
  LN_dsaWithSHA1_2 = 'dsaWithSHA1-old';  {Do not localize}
  LN_dsa_2 = 'dsaEncryption-old';  {Do not localize}
  LN_email_protect = 'E-mail Protection';  {Do not localize}
  LN_ext_key_usage = 'X509v3 Extended Key Usage';  {Do not localize}
  LN_friendlyName = 'friendlyName';  {Do not localize}
  LN_givenName = 'givenName';  {Do not localize}
  LN_hmacWithSHA1 = 'hmacWithSHA1';  {Do not localize}
  LN_id_pbkdf2 = 'PBKDF2';  {Do not localize}
  LN_id_qt_cps = 'Policy Qualifier CPS';  {Do not localize}
  LN_id_qt_unotice = 'Policy Qualifier User Notice';  {Do not localize}
  LN_idea_cbc = 'idea-cbc';  {Do not localize}
  LN_idea_cfb64 = 'idea-cfb';  {Do not localize}
  LN_idea_ecb = 'idea-ecb';  {Do not localize}
  LN_idea_ofb64 = 'idea-ofb';  {Do not localize}
  LN_initials = 'initials';  {Do not localize}
  LN_invalidity_date = 'Invalidity Date';  {Do not localize}
  LN_issuer_alt_name = 'X509v3 Issuer Alternative Name';  {Do not localize}
  LN_keyBag = 'keyBag';  {Do not localize}
  LN_key_usage = 'X509v3 Key Usage';  {Do not localize}
  LN_localKeyID = 'localKeyID';  {Do not localize}
  LN_localityName = 'localityName';  {Do not localize}
  LN_md2 = 'md2';  {Do not localize}
  LN_md2WithRSAEncryption = 'md2WithRSAEncryption';  {Do not localize}
  LN_md4 = 'md4'; {Do not localize}
  LN_md5 = 'md5';  {Do not localize}
  LN_md5WithRSA = 'md5WithRSA';  {Do not localize}
  LN_md5WithRSAEncryption = 'md5WithRSAEncryption';  {Do not localize}
  LN_md5_sha1 = 'md5-sha1';  {Do not localize}
  LN_mdc2 = 'mdc2';  {Do not localize}
  LN_mdc2WithRSA = 'mdc2withRSA';  {Do not localize}
  LN_ms_code_com = 'Microsoft Commercial Code Signing';  {Do not localize}
  LN_ms_code_ind = 'Microsoft Individual Code Signing';  {Do not localize}
  LN_ms_ctl_sign = 'Microsoft Trust List Signing';  {Do not localize}
  LN_ms_efs = 'Microsoft Encrypted File System';  {Do not localize}
  LN_ms_sgc = 'Microsoft Server Gated Crypto';  {Do not localize}
  LN_netscape = 'Netscape Communications Corp.';  {Do not localize}
  LN_netscape_base_url = 'Netscape Base Url';  {Do not localize}
  LN_netscape_ca_policy_url = 'Netscape CA Policy Url';  {Do not localize}
  LN_netscape_ca_revocation_url = 'Netscape CA Revocation Url';  {Do not localize}
  LN_netscape_cert_extension = 'Netscape Certificate Extension';  {Do not localize}
  LN_netscape_cert_sequence = 'Netscape Certificate Sequence';  {Do not localize}
  LN_netscape_cert_type = 'Netscape Cert Type';  {Do not localize}
  LN_netscape_comment = 'Netscape Comment';  {Do not localize}
  LN_netscape_data_type = 'Netscape Data Type';  {Do not localize}
  LN_netscape_renewal_url = 'Netscape Renewal Url';  {Do not localize}
  LN_netscape_revocation_url = 'Netscape Revocation Url';  {Do not localize}
  LN_netscape_ssl_server_name = 'Netscape SSL Server Name';  {Do not localize}
  LN_ns_sgc = 'Netscape Server Gated Crypto';  {Do not localize}
  LN_organizationName = 'organizationName';  {Do not localize}
  LN_organizationalUnitName = 'organizationalUnitName';  {Do not localize}
  LN_pbeWithMD2AndDES_CBC = 'pbeWithMD2AndDES-CBC';  {Do not localize}
  LN_pbeWithMD2AndRC2_CBC = 'pbeWithMD2AndRC2-CBC';  {Do not localize}
  LN_pbeWithMD5AndCast5_CBC = 'pbeWithMD5AndCast5CBC';  {Do not localize}
  LN_pbeWithMD5AndDES_CBC = 'pbeWithMD5AndDES-CBC';  {Do not localize}
  LN_pbeWithMD5AndRC2_CBC = 'pbeWithMD5AndRC2-CBC';  {Do not localize}
  LN_pbeWithSHA1AndDES_CBC = 'pbeWithSHA1AndDES-CBC';  {Do not localize}
  LN_pbeWithSHA1AndRC2_CBC = 'pbeWithSHA1AndRC2-CBC';  {Do not localize}
  LN_pbe_WithSHA1And128BitRC2_CBC = 'pbeWithSHA1And128BitRC2-CBC';  {Do not localize}
  LN_pbe_WithSHA1And128BitRC4 = 'pbeWithSHA1And128BitRC4';  {Do not localize}
  LN_pbe_WithSHA1And2_Key_TripleDES_CBC = 'pbeWithSHA1And2-KeyTripleDES-CBC';  {Do not localize}
  LN_pbe_WithSHA1And3_Key_TripleDES_CBC = 'pbeWithSHA1And3-KeyTripleDES-CBC';  {Do not localize}
  LN_pbe_WithSHA1And40BitRC2_CBC = 'pbeWithSHA1And40BitRC2-CBC';  {Do not localize}
  LN_pbe_WithSHA1And40BitRC4 = 'pbeWithSHA1And40BitRC4';  {Do not localize}
  LN_pbes2 = 'PBES2';  {Do not localize}
  LN_pbmac1 = 'PBMAC1';  {Do not localize}
  LN_pkcs = 'pkcs';  {Do not localize}
  LN_pkcs3 = 'pkcs3';  {Do not localize}
  LN_pkcs7 = 'pkcs7';  {Do not localize}
  LN_pkcs7_data = 'pkcs7-data';  {Do not localize}
  LN_pkcs7_digest = 'pkcs7-digestData';  {Do not localize}
  LN_pkcs7_encrypted = 'pkcs7-encryptedData';  {Do not localize}
  LN_pkcs7_enveloped = 'pkcs7-envelopedData';  {Do not localize}
  LN_pkcs7_signed = 'pkcs7-signedData';  {Do not localize}
  LN_pkcs7_signedAndEnveloped = 'pkcs7-signedAndEnvelopedData';  {Do not localize}
  LN_pkcs8ShroudedKeyBag = 'pkcs8ShroudedKeyBag';  {Do not localize}
  LN_pkcs9 = 'pkcs9';  {Do not localize}
  LN_pkcs9_challengePassword = 'challengePassword';  {Do not localize}
  LN_pkcs9_contentType = 'contentType';  {Do not localize}
  LN_pkcs9_countersignature = 'countersignature';  {Do not localize}
  LN_pkcs9_emailAddress = 'emailAddress';  {Do not localize}
  LN_pkcs9_extCertAttributes = 'extendedCertificateAttributes';  {Do not localize}
  LN_pkcs9_messageDigest = 'messageDigest';  {Do not localize}
  LN_pkcs9_signingTime = 'signingTime';  {Do not localize}
  LN_pkcs9_unstructuredAddress = 'unstructuredAddress';  {Do not localize}
  LN_pkcs9_unstructuredName = 'unstructuredName';  {Do not localize}
  LN_private_key_usage_period = 'X509v3 Private Key Usage Period';  {Do not localize}
  LN_rc2_40_cbc = 'rc2-40-cbc';  {Do not localize}
  LN_rc2_64_cbc = 'rc2-64-cbc';  {Do not localize}
  LN_rc2_cbc = 'rc2-cbc';  {Do not localize}
  LN_rc2_cfb64 = 'rc2-cfb';  {Do not localize}
  LN_rc2_ecb = 'rc2-ecb';  {Do not localize}
  LN_rc2_ofb64 = 'rc2-ofb';  {Do not localize}
  LN_rc4 = 'rc4';  {Do not localize}
  LN_rc4_40 = 'rc4-40';  {Do not localize}
  LN_rc5_cbc = 'rc5-cbc';  {Do not localize}
  LN_rc5_cfb64 = 'rc5-cfb';  {Do not localize}
  LN_rc5_ecb = 'rc5-ecb';  {Do not localize}
  LN_rc5_ofb64 = 'rc5-ofb';  {Do not localize}
  LN_ripemd160 = 'ripemd160';  {Do not localize}
  LN_ripemd160WithRSA = 'ripemd160WithRSA';  {Do not localize}
  LN_rle_compression = 'run length compression';  {Do not localize}
  LN_rsa = 'rsa';  {Do not localize}
  LN_rsaEncryption = 'rsaEncryption';  {Do not localize}
  LN_rsadsi = 'rsadsi';  {Do not localize}
  LN_safeContentsBag = 'safeContentsBag';  {Do not localize}
  LN_sdsiCertificate = 'sdsiCertificate';  {Do not localize}
  LN_secretBag = 'secretBag';  {Do not localize}
  LN_serialNumber = 'serialNumber';  {Do not localize}
  LN_server_auth = 'TLS Web Server Authentication';  {Do not localize}
  LN_sha = 'sha';  {Do not localize}
  LN_sha1 = 'sha1';  {Do not localize}
  LN_sha1WithRSA = 'sha1WithRSA';  {Do not localize}
  LN_sha1WithRSAEncryption = 'sha1WithRSAEncryption';  {Do not localize}
  LN_shaWithRSAEncryption = 'shaWithRSAEncryption';  {Do not localize}
  LN_sha256WithRSAEncryption = 'sha256WithRSAEncryption'; {Do not localize}
  LN_sha384WithRSAEncryption = 'sha384WithRSAEncryption'; {Do not localize}
  LN_sha512WithRSAEncryption = 'sha512WithRSAEncryption'; {do not localize}
  LN_sha224WithRSAEncryption = 'sha224WithRSAEncryption'; {Do not localize}
  LN_stateOrProvinceName = 'stateOrProvinceName';  {Do not localize}
  LN_subject_alt_name = 'X509v3 Subject Alternative Name';  {Do not localize}
  LN_subject_key_identifier = 'X509v3 Subject Key Identifier';  {Do not localize}
  LN_surname = 'surname';  {Do not localize}
  LN_sxnet = 'Strong Extranet ID';  {Do not localize}
  LN_time_stamp = 'Time Stamping';  {Do not localize}
  LN_title = 'title';  {Do not localize}
  LN_undef = 'undefined';  {Do not localize}
  LN_uniqueIdentifier = 'uniqueIdentifier';  {Do not localize}
  LN_x509Certificate = 'x509Certificate';  {Do not localize}
  LN_x509Crl = 'x509Crl';  {Do not localize}
  LN_zlib_compression = 'zlib compression';  {Do not localize}
  NID_SMIMECapabilities = 167;
  NID_X500 = 11;
  NID_X509 = 12;
  NID_algorithm = 38;
  NID_authority_key_identifier = 90;
  NID_basic_constraints = 87;
  NID_bf_cbc = 91;
  NID_bf_cfb64 = 93;
  NID_bf_ecb = 92;
  NID_bf_ofb64 = 94;
  NID_cast5_cbc = 108;
  NID_cast5_cfb64 = 110;
  NID_cast5_ecb = 109;
  NID_cast5_ofb64 = 111;
  NID_certBag = 152;
  NID_certificate_policies = 89;
  NID_client_auth = 130;
  NID_code_sign = 131;
  NID_commonName = 13;
  NID_countryName = 14;
  NID_crlBag = 153;
  NID_crl_distribution_points = 103;
  NID_crl_number = 88;
  NID_crl_reason = 141;
  NID_delta_crl = 140;
  NID_des_cbc = 31;
  NID_des_cfb64 = 30;
  NID_des_ecb = 29;
  NID_des_ede = 32;
  NID_des_ede3 = 33;
  NID_des_ede3_cbc = 44;
  NID_des_ede3_cfb64 = 61;
  NID_des_ede3_ofb64 = 63;
  NID_des_ede_cbc = 43;
  NID_des_ede_cfb64 = 60;
  NID_des_ede_ofb64 = 62;
  NID_des_ofb64 = 45;
  NID_description = 107;
  NID_desx_cbc = 80;
  NID_email_protect = 132;
  NID_ext_key_usage = 126;
  NID_friendlyName = 156;
  NID_givenName = 99;
  NID_hmacWithSHA1 = 163;
  NID_id_kp = 128;
  NID_id_pbkdf2 = 69;
  NID_id_pkix = 127;
  NID_id_qt_cps = 164;
  NID_id_qt_unotice = 165;
  NID_idea_cbc = 34;
  NID_idea_cfb64 = 35;
  NID_idea_ecb = 36;
  NID_idea_ofb64 = 46;
  NID_initials = 101;
  NID_invalidity_date = 142;
  NID_issuer_alt_name = 86;
  NID_keyBag = 150;
  NID_key_usage = 83;
  NID_ld_ce = 81;
  NID_localKeyID = 157;
  NID_localityName = 15;
  NID_md2 = 3;
  NID_md2WithRSAEncryption = 7;
  NID_md4 = 257;
  NID_md4WithRSAEncryption = 396;
  NID_md5 = 4;
  NID_md5WithRSA = 104;
  NID_md5WithRSAEncryption = 8;
  NID_md5_sha1 = 114;
  NID_mdc2 = 95;
  NID_mdc2WithRSA = 96;
  NID_ms_code_com = 135;
  NID_ms_code_ind = 134;
  NID_ms_ctl_sign = 136;
  NID_ms_efs = 138;
  NID_ms_sgc = 137;
  NID_netscape = 57;
  NID_netscape_base_url = 72;
  NID_netscape_ca_policy_url = 76;
  NID_netscape_ca_revocation_url = 74;
  NID_netscape_cert_extension = 58;
  NID_netscape_cert_sequence = 79;
  NID_netscape_cert_type = 71;
  NID_netscape_comment = 78;
  NID_netscape_data_type = 59;
  NID_netscape_renewal_url = 75;
  NID_netscape_revocation_url = 73;
  NID_netscape_ssl_server_name = 77;
  NID_ns_sgc = 139;
  NID_organizationName = 17;
  NID_organizationalUnitName = 18;
  NID_pbeWithMD2AndDES_CBC = 9;
  NID_pbeWithMD2AndRC2_CBC = 168;
  NID_pbeWithMD5AndCast5_CBC = 112;
  NID_pbeWithMD5AndDES_CBC = 10;
  NID_pbeWithMD5AndRC2_CBC = 169;
  NID_pbeWithSHA1AndDES_CBC = 170;
  NID_pbeWithSHA1AndRC2_CBC = 68;
  NID_pbe_WithSHA1And128BitRC2_CBC = 148;
  NID_pbe_WithSHA1And128BitRC4 = 144;
  NID_pbe_WithSHA1And2_Key_TripleDES_CBC = 147;
  NID_pbe_WithSHA1And3_Key_TripleDES_CBC = 146;
  NID_pbe_WithSHA1And40BitRC2_CBC = 149;
  NID_pbe_WithSHA1And40BitRC4 = 145;
  NID_pbes2 = 161;
  NID_pbmac1 = 162;
  NID_pkcs = 2;
  NID_pkcs3 = 27;
  NID_pkcs7 = 20;
  NID_pkcs7_data = 21;
  NID_pkcs7_digest = 25;
  NID_pkcs7_encrypted = 26;
  NID_pkcs7_enveloped = 23;
  NID_pkcs7_signed = 22;
  NID_pkcs7_signedAndEnveloped = 24;
  NID_pkcs8ShroudedKeyBag = 151;
  NID_pkcs9 = 47;
  NID_pkcs9_challengePassword = 54;
  NID_pkcs9_contentType = 50;
  NID_pkcs9_countersignature = 53;
  NID_pkcs9_emailAddress = 48;
  NID_pkcs9_extCertAttributes = 56;
  NID_pkcs9_messageDigest = 51;
  NID_pkcs9_signingTime = 52;
  NID_pkcs9_unstructuredAddress = 55;
  NID_pkcs9_unstructuredName = 49;
  NID_private_key_usage_period = 84;
  NID_rc2_40_cbc = 98;
  NID_rc2_64_cbc = 166;
  NID_rc2_cbc = 37;
  NID_rc2_cfb64 = 39;
  NID_rc2_ecb = 38;
  NID_rc2_ofb64 = 40;
  NID_rc4 = 5;
  NID_rc4_40 = 97;
  NID_rc5_cbc = 120;
  NID_rc5_cfb64 = 122;
  NID_rc5_ecb = 121;
  NID_rc5_ofb64 = 123;
  NID_ripemd160 = 117;
  NID_ripemd160WithRSA = 119;
  NID_rle_compression = 124;
  NID_rsadsi = 1;
  NID_safeContentsBag = 155;
  NID_sdsiCertificate = 159;
  NID_secretBag = 154;
  NID_serialNumber = 105;
  NID_server_auth = 129;
  NID_sha = 41;
  NID_sha1 = 64;
  NID_sha1WithRSA = 115;
  NID_sha1WithRSAEncryption = 65;
  NID_sha256WithRSAEncryption = 668;
  NID_sha384WithRSAEncryption = 669;
  NID_sha512WithRSAEncryption = 670;
  NID_sha224WithRSAEncryption = 671;
  NID_shaWithRSAEncryption = 42;
  NID_stateOrProvinceName = 16;
  NID_subject_alt_name = 85;
  NID_subject_key_identifier = 82;
  NID_surname = 100;
  NID_sxnet = 143;
  NID_time_stamp = 133;
  NID_title = 106;
  NID_uniqueIdentifier = 102;
  NID_x509Certificate = 158;
  NID_x509Crl = 160;
  NID_zlib_compression = 125;
  OBJ_F_OBJ_CREATE = 100;
  OBJ_F_OBJ_DUP = 101;
  OBJ_F_OBJ_NID2LN = 102;
  OBJ_F_OBJ_NID2OBJ = 103;
  OBJ_F_OBJ_NID2SN = 104;
  OBJ_NAME_ALIAS = $8000;
  OBJ_NAME_TYPE_CIPHER_METH = $02;
  OBJ_NAME_TYPE_COMP_METH = $04;
  OBJ_NAME_TYPE_MD_METH = $01;
  OBJ_NAME_TYPE_NUM = $05;
  OBJ_NAME_TYPE_PKEY_METH = $03;
  OBJ_NAME_TYPE_UNDEF = $00;
  OBJ_R_MALLOC_FAILURE = 100;
  OBJ_R_UNKNOWN_NID = 101;
  OPENSSL_VERSION_NUMBER	= $1000000f; // MMNNFFPPS Major, Minor, Fix, Patch, Status
{$IFDEF OPENSSL_FIPS}
  OPENSSL_VERSION_TEXT	= 'OpenSSL 1.0.0-fips 29 Mar 2010'; {Do not localize}
{$ELSE}
  OPENSSL_VERSION_TEXT = 'OpenSSL 1.0.0 29 Mar 2010';  {Do not localize}
{$ENDIF}
  OPENSSL_VERSION_PTEXT = ' part of '+ OPENSSL_VERSION_TEXT;  {Do not localize}
  PEM_BUFSIZE = 1024;
  PEM_DEK_DES_CBC = 40;
  PEM_DEK_DES_ECB = 60;
  PEM_DEK_DES_EDE = 50;
  PEM_DEK_IDEA_CBC = 45;
  PEM_DEK_RSA = 70;
  PEM_DEK_RSA_MD2 = 80;
  PEM_DEK_RSA_MD5 = 90;
  PEM_ERROR = 30;
  PEM_F_DEF_CALLBACK = 100;
  PEM_F_LOAD_IV = 101;
  PEM_F_PEM_ASN1_READ = 102;
  PEM_F_PEM_ASN1_READ_BIO = 103;
  PEM_F_PEM_ASN1_WRITE = 104;
  PEM_F_PEM_ASN1_WRITE_BIO = 105;
  PEM_F_PEM_DO_HEADER = 106;
  PEM_F_PEM_F_PEM_WRITE_PKCS8PRIVATEKEY = 118;
  PEM_F_PEM_GET_EVP_CIPHER_INFO = 107;
  PEM_F_PEM_READ = 108;
  PEM_F_PEM_READ_BIO = 109;
  PEM_F_PEM_SEALFINAL = 110;
  PEM_F_PEM_SEALINIT = 111;
  PEM_F_PEM_SIGNFINAL = 112;
  PEM_F_PEM_WRITE = 113;
  PEM_F_PEM_WRITE_BIO = 114;
  PEM_F_PEM_WRITE_BIO_PKCS8PRIVATEKEY = 119;
  PEM_F_PEM_X509_INFO_READ = 115;
  PEM_F_PEM_X509_INFO_READ_BIO = 116;
  PEM_F_PEM_X509_INFO_WRITE_BIO = 117;
  PEM_MD_MD2 = NID_md2;
  PEM_MD_MD2_RSA = NID_md2WithRSAEncryption;
  PEM_MD_MD5 = NID_md5;
  PEM_MD_MD5_RSA = NID_md5WithRSAEncryption;
  PEM_MD_SHA = NID_sha;
  PEM_MD_SHA_RSA = NID_sha1WithRSAEncryption;
  PEM_OBJ_UNDEF = 0;
  PEM_OBJ_X509 = 1;
  PEM_OBJ_X509_REQ = 2;
  PEM_OBJ_CRL = 3;
  PEM_OBJ_SSL_SESSION = 4;
  PEM_OBJ_PRIV_KEY = 10;
  PEM_OBJ_PRIV_RSA = 11;
  PEM_OBJ_PRIV_DSA = 12;
  PEM_OBJ_PRIV_DH = 13;
  PEM_OBJ_PUB_RSA = 14;
  PEM_OBJ_PUB_DSA = 15;
  PEM_OBJ_PUB_DH =	16;
  PEM_OBJ_DHPARAMS = 17;
  PEM_OBJ_DSAPARAMS = 18;
  PEM_OBJ_PRIV_RSA_PUBLIC = 19;
  PEM_OBJ_PRIV_ECDSA = 20;
  PEM_OBJ_PUB_ECDSA	= 21;
  PEM_OBJ_ECPARAMETERS = 22;
  PEM_R_BAD_BASE64_DECODE = 100;
  PEM_R_BAD_DECRYPT = 101;
  PEM_R_BAD_END_LINE = 102;
  PEM_R_BAD_IV_CHARS = 103;
  PEM_R_BAD_PASSWORD_READ = 104;
  PEM_R_ERROR_CONVERTING_PRIVATE_KEY = 115;
  PEM_R_NOT_DEK_INFO = 105;
  PEM_R_NOT_ENCRYPTED = 106;
  PEM_R_NOT_PROC_TYPE = 107;
  PEM_R_NO_START_LINE = 108;
  PEM_R_PROBLEMS_GETTING_PASSWORD = 109;
  PEM_R_PUBLIC_KEY_NO_RSA = 110;
  PEM_R_READ_KEY = 111;
  PEM_R_SHORT_HEADER = 112;
  PEM_R_UNSUPPORTED_CIPHER = 113;
  PEM_R_UNSUPPORTED_ENCRYPTION = 114;
  PEM_STRING_EVP_PKEY = 'ANY PRIVATE KEY';  {Do not localize}
  PEM_STRING_X509_OLD = 'X509 CERTIFICATE';  {Do not localize}
  PEM_STRING_X509 = 'CERTIFICATE';  {Do not localize}
  PEM_STRING_X509_PAIR = 'CERTIFICATE PAIR'; {Do not localize}
  PEM_STRING_X509_TRUSTED = 'TRUSTED CERTIFICATE'; {Do not localize}
  PEM_STRING_X509_REQ_OLD = 'NEW CERTIFICATE REQUEST';  {Do not localize}
  PEM_STRING_X509_REQ = 'CERTIFICATE REQUEST';  {Do not localize}
  PEM_STRING_X509_CRL = 'X509 CRL';  {Do not localize}
  PEM_STRING_PUBLIC	= 'PUBLIC KEY';  {Do not localize}
  PEM_STRING_RSA = 'RSA PRIVATE KEY';  {Do not localize}
  PEM_STRING_RSA_PUBLIC = 'RSA PUBLIC KEY';  {Do not localize}
  PEM_STRING_DSA = 'DSA PRIVATE KEY';  {Do not localize}
  PEM_STRING_DSA_PUBLIC	 = 'DSA PUBLIC KEY'; {Do not localize}
  PEM_STRING_PKCS7 = 'PKCS7';  {Do not localize}
  PEM_STRING_PKCS7_SIGNED ='PKCS #7 SIGNED DATA'; {Do not localize}
  PEM_STRING_PKCS8 = 'ENCRYPTED PRIVATE KEY';  {Do not localize}
  PEM_STRING_PKCS8INF = 'PRIVATE KEY';  {Do not localize}
  PEM_STRING_DHPARAMS = 'DH PARAMETERS';  {Do not localize}
  PEM_STRING_SSL_SESSION = 'SSL SESSION PARAMETERS';  {Do not localize}
  PEM_STRING_DSAPARAMS = 'DSA PARAMETERS';  {Do not localize}
  PEM_STRING_ECDSA_PUBLIC = 'ECDSA PUBLIC KEY'; {Do not localize}
  PEM_STRING_ECPARAMETERS = 'EC PARAMETERS'; {Do not localize}
  PEM_STRING_ECPRIVATEKEY	= 'EC PRIVATE KEY'; {Do not localize}
  PEM_STRING_CMS = 'CMS'; {Do not localize}
  PEM_TYPE_CLEAR = 40;
  PEM_TYPE_ENCRYPTED = 10;
  PEM_TYPE_MIC_CLEAR = 30;
  PEM_TYPE_MIC_ONLY = 20;
  PKCS5_DEFAULT_ITER = 2048;
  PKCS5_SALT_LEN = 8;
  PKCS7_F_PKCS7_ADD_CERTIFICATE = 100;
  PKCS7_F_PKCS7_ADD_CRL = 101;
  PKCS7_F_PKCS7_ADD_RECIPIENT_INFO = 102;
  PKCS7_F_PKCS7_ADD_SIGNER = 103;
  PKCS7_F_PKCS7_CTRL = 104;
  PKCS7_F_PKCS7_DATADECODE = 112;
  PKCS7_F_PKCS7_DATAINIT = 105;
  PKCS7_F_PKCS7_DATASIGN = 106;
  PKCS7_F_PKCS7_DATAVERIFY = 107;
  PKCS7_F_PKCS7_SET_CIPHER = 108;
  PKCS7_F_PKCS7_SET_CONTENT = 109;
  PKCS7_F_PKCS7_SET_TYPE = 110;
  PKCS7_F_PKCS7_SIGNATUREVERIFY = 113;
  PKCS7_OP_GET_DETACHED_SIGNATURE = 2;
  PKCS7_OP_SET_DETACHED_SIGNATURE = 1;
  PKCS7_R_CIPHER_NOT_INITIALIZED = 116;
  PKCS7_R_DECRYPTED_KEY_IS_WRONG_LENGTH = 100;
  PKCS7_R_DIGEST_FAILURE = 101;
  PKCS7_R_INTERNAL_ERROR = 102;
  PKCS7_R_MISSING_CERIPEND_INFO = 103;
  PKCS7_R_NO_RECIPIENT_MATCHES_CERTIFICATE = 115;
  PKCS7_R_OPERATION_NOT_SUPPORTED_ON_THIS_TYPE = 104;
  PKCS7_R_SIGNATURE_FAILURE = 105;
  PKCS7_R_UNABLE_TO_FIND_CERTIFICATE = 106;
  PKCS7_R_UNABLE_TO_FIND_MEM_BIO = 107;
  PKCS7_R_UNABLE_TO_FIND_MESSAGE_DIGEST = 108;
  PKCS7_R_UNKNOWN_DIGEST_TYPE = 109;
  PKCS7_R_UNKNOWN_OPERATION = 110;
  PKCS7_R_UNSUPPORTED_CIPHER_TYPE = 111;
  PKCS7_R_UNSUPPORTED_CONTENT_TYPE = 112;
  PKCS7_R_WRONG_CONTENT_TYPE = 113;
  PKCS7_R_WRONG_PKCS7_TYPE = 114;
  PKCS7_S_BODY = 1;
  PKCS7_S_HEADER = 0;
  PKCS7_S_TAIL = 2;
  PKCS8_NS_DB = 3;
  PKCS8_EMBEDDED_PARAM = 2;
  PKCS8_NO_OCTET = 1;
  PKCS8_OK = 0;
  P_tmpdir = '/tmp';  {Do not localize}
  MSS_RAND_MAX = $7fffffff;
  {$IFNDEF OPENSSL_NO_RC2}
  RC2_BLOCK = 8;
  RC2_DECRYPT = 0;
  RC2_ENCRYPT = 1;
  RC2_KEY_LENGTH = 16;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC5}
  RC5_12_ROUNDS = 12;
  RC5_16_ROUNDS = 16;
  RC5_32_BLOCK = 8;
  RC5_32_KEY_LENGTH = 16;
  RC5_8_ROUNDS = 8;
  RC5_DECRYPT = 0;
  RC5_ENCRYPT = 1;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_HMAC}
  HMAC_MAX_MD_CBLOCK = 128; //* largest known is SHA512 */
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RIPEMD}
  RIPEMD160_BLOCK = 16;
  RIPEMD160_CBLOCK = 64;
  RIPEMD160_DIGEST_LENGTH = 20;
  RIPEMD160_LAST_BLOCK = 56;
  RIPEMD160_LBLOCK = 16;
  RIPEMD160_LENGTH_BLOCK = 8;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RSA}
///* If this flag is set the RSA method is FIPS compliant and can be used
// * in FIPS mode. This is set in the validated module method. If an
// * application sets this flag in its own methods it is its reposibility
// * to ensure the result is compliant.
// */

  RSA_FLAG_FIPS_METHOD			= $0400;

///* If this flag is set the operations normally disabled in FIPS mode are
// * permitted it is then the applications responsibility to ensure that the
// * usage is compliant.
// */

  RSA_FLAG_NON_FIPS_ALLOW		 = $0400;

  RSA_3 = $3;
  RSA_F4 = $10001;
  RSA_FLAG_BLINDING = $08;
  RSA_FLAG_CACHE_PRIVATE = $04;
  RSA_FLAG_CACHE_PUBLIC = $02;
  RSA_FLAG_EXT_PKEY = $20;
  RSA_FLAG_SIGN_VER = $0040;
  RSA_FLAG_NO_BLINDING =$0080; //* new with 0.9.6j and 0.9.7b; the built-in
                                       //* RSA implementation now uses blinding by
                                       //* default (ignoring RSA_FLAG_BLINDING),
                                       //* but other engines might not need it
                                       //*/
  RSA_FLAG_NO_CONSTTIME = $0100; //* new with 0.9.8f; the built-in RSA
                                      //* implementation now uses constant time
                                      //* operations by default in private key operations,
                                      //* e.g., constant time modular exponentiation, 
                                      //* modular inverse without leaking branches, 
                                      //* division without leaking branches. This 
                                      //* flag disables these constant time 
                                      //* operations and results in faster RSA 
                                      //* private key operations.
                                      //*/ 
{$IFNDEF OPENSSL_NO_DEPRECATED}
  RSA_FLAG_NO_EXP_CONSTTIME = RSA_FLAG_NO_CONSTTIME; //* deprecated name for the flag*/
                                                //* new with 0.9.7h; the built-in RSA
                                                //* implementation now uses constant time
                                                //* modular exponentiation for secret exponents
                                                //* by default. This flag causes the
                                                //* faster variable sliding window method to
                                                //* be used for all exponents.
                                                //*/
{$ENDIF}
  //the openssl developers probably only wanted to define this if it was not already defined.
  RSA_MAX_MODULUS_BITS	= 16384;
  RSA_FIPS_MIN_MODULUS_BITS = 1024;
  //the openssl developers probably only wanted to define this if it was not already defined.
  RSA_SMALL_MODULUS_BITS  =	3072;
  //the openssl developers probably only wanted to define this if it was not already defined.
  RSA_MAX_PUBEXP_BITS	= 64; //* exponent limit enforced for "large" modulus only */

  RSA_FLAG_THREAD_SAFE = $10;
  //* function codes */
  RSA_F_FIPS_RSA_SIGN				= 140;
  RSA_F_FIPS_RSA_VERIFY				= 141;
  RSA_F_MEMORY_LOCK = 100;
  RSA_F_RSA_CHECK_KEY = 123;
  RSA_F_RSA_EAY_PRIVATE_DECRYPT = 101;
  RSA_F_RSA_EAY_PRIVATE_ENCRYPT = 102;
  RSA_F_RSA_EAY_PUBLIC_DECRYPT = 103;
  RSA_F_RSA_EAY_PUBLIC_ENCRYPT = 104;
  RSA_F_RSA_GENERATE_KEY = 105;
  RSA_F_RSA_NEW_METHOD = 106;
  RSA_F_RSA_PADDING_ADD_NONE = 107;
  RSA_F_RSA_PADDING_ADD_PKCS1_OAEP = 121;
  RSA_F_RSA_PADDING_ADD_PKCS1_TYPE_1 = 108;
  RSA_F_RSA_PADDING_ADD_PKCS1_TYPE_2 = 109;
  RSA_F_RSA_PADDING_ADD_SSLV23 = 110;
  RSA_F_RSA_PADDING_CHECK_NONE = 111;
  RSA_F_RSA_PADDING_CHECK_PKCS1_OAEP = 122;
  RSA_F_RSA_PADDING_CHECK_PKCS1_TYPE_1 = 112;
  RSA_F_RSA_PADDING_CHECK_PKCS1_TYPE_2 = 113;
  RSA_F_RSA_PADDING_CHECK_SSLV23 = 114;
  RSA_F_RSA_PRINT = 115;
  RSA_F_RSA_PRINT_FP = 116;
  RSA_F_RSA_PRIVATE_ENCRYPT			 = 137;
  RSA_F_RSA_PUBLIC_DECRYPT			 = 138;
  RSA_F_RSA_SETUP_BLINDING			 = 136;
  RSA_F_RSA_SET_DEFAULT_METHOD		 = 139;
  RSA_F_RSA_SET_METHOD				 = 142;
  RSA_F_RSA_SIGN = 117;
  RSA_F_RSA_SIGN_ASN1_OCTET_STRING = 118;
  RSA_F_RSA_VERIFY = 119;
  RSA_F_RSA_VERIFY_ASN1_OCTET_STRING = 120;
  RSA_F_RSA_VERIFY_PKCS1_PSS			= 126;
  RSA_METHOD_FLAG_NO_CHECK = $01;
  RSA_NO_PADDING = 3;
  RSA_PKCS1_OAEP_PADDING = 4;
  RSA_PKCS1_PADDING = 1;
  RSA_R_ALGORITHM_MISMATCH = 100;
  RSA_R_BAD_E_VALUE = 101;
  RSA_R_BAD_FIXED_HEADER_DECRYPT = 102;
  RSA_R_BAD_PAD_BYTE_COUNT = 103;
  RSA_R_BAD_SIGNATURE = 104;
  RSA_R_BLOCK_TYPE_IS_NOT_01 = 106;
  RSA_R_BLOCK_TYPE_IS_NOT_02 = 107;
  RSA_R_DATA_GREATER_THAN_MOD_LEN = 108;
  RSA_R_DATA_TOO_LARGE = 109;
  RSA_R_DATA_TOO_LARGE_FOR_KEY_SIZE = 110;
  RSA_R_DATA_TOO_SMALL = 111;
  RSA_R_DATA_TOO_SMALL_FOR_KEY_SIZE = 122;
  RSA_R_DIGEST_TOO_BIG_FOR_RSA_KEY = 112;
  RSA_R_DMP1_NOT_CONGRUENT_TO_D = 124;
  RSA_R_DMQ1_NOT_CONGRUENT_TO_D = 125;
  RSA_R_D_E_NOT_CONGRUENT_TO_1 = 123;
  RSA_R_IQMP_NOT_INVERSE_OF_Q = 126;
  RSA_R_KEY_SIZE_TOO_SMALL = 120;
  RSA_R_LAST_OCTET_INVALID			= 134;
  RSA_R_MODULUS_TOO_LARGE				= 105;
  RSA_R_NON_FIPS_METHOD				= 141;
  RSA_R_NO_PUBLIC_EXPONENT			= 140;
  RSA_R_NULL_BEFORE_BLOCK_MISSING = 113;
  RSA_R_N_DOES_NOT_EQUAL_P_Q = 127;
  RSA_R_OAEP_DECODING_ERROR = 121;
  RSA_R_OPERATION_NOT_ALLOWED_IN_FIPS_MODE	 = 142;
  RSA_R_PADDING_CHECK_FAILED = 114;
  RSA_R_P_NOT_PRIME = 128;
  RSA_R_Q_NOT_PRIME = 129;
  RSA_R_SLEN_CHECK_FAILED				= 136;
  RSA_R_SLEN_RECOVERY_FAILED			= 135;
  RSA_R_SSLV3_ROLLBACK_ATTACK = 115;
  RSA_R_THE_ASN1_OBJECT_IDENTIFIER_IS_NOT_KNOWN_FOR_THIS_MD = 116;
  RSA_R_UNKNOWN_ALGORITHM_TYPE = 117;
  RSA_R_UNKNOWN_PADDING_TYPE = 118;
  RSA_R_WRONG_SIGNATURE_LENGTH = 119;
  RSA_SSLV23_PADDING = 2;
  {$ENDIF}
  SEEK_CUR = 1;
  SEEK_END = 2;
  SEEK_SET = 0;
  SN_Algorithm = 'Algorithm';  {Do not localize}
  SN_SMIMECapabilities = 'SMIME-CAPS';  {Do not localize}
  SN_authority_key_identifier = 'authorityKeyIdentifier';  {Do not localize}
  SN_basic_constraints = 'basicConstraints';  {Do not localize}
  SN_bf_cbc = 'BF-CBC';  {Do not localize}
  SN_bf_cfb64 = 'BF-CFB';  {Do not localize}
  SN_bf_ecb = 'BF-ECB';  {Do not localize}
  SN_bf_ofb64 = 'BF-OFB';  {Do not localize}
  SN_cast5_cbc = 'CAST5-CBC';  {Do not localize}
  SN_cast5_cfb64 = 'CAST5-CFB';  {Do not localize}
  SN_cast5_ecb = 'CAST5-ECB';  {Do not localize}
  SN_cast5_ofb64 = 'CAST5-OFB';  {Do not localize}
  SN_certificate_policies = 'certificatePolicies';  {Do not localize}
  SN_client_auth = 'clientAuth';  {Do not localize}
  SN_code_sign = 'codeSigning';  {Do not localize}
  SN_commonName = 'CN';  {Do not localize}
  SN_countryName = 'C';  {Do not localize}
  SN_crl_distribution_points = 'crlDistributionPoints';  {Do not localize}
  SN_crl_number = 'crlNumber';  {Do not localize}
  SN_crl_reason = 'CRLReason';  {Do not localize}
  SN_delta_crl = 'deltaCRL';  {Do not localize}
  SN_des_cbc = 'DES-CBC';  {Do not localize}
  SN_des_cfb64 = 'DES-CFB';  {Do not localize}
  SN_des_ecb = 'DES-ECB';  {Do not localize}
  SN_des_ede = 'DES-EDE';  {Do not localize}
  SN_des_ede3 = 'DES-EDE3';  {Do not localize}
  SN_des_ede3_cbc = 'DES-EDE3-CBC';  {Do not localize}
  SN_des_ede3_cfb64 = 'DES-EDE3-CFB';  {Do not localize}
  SN_des_ede3_ofb64 = 'DES-EDE3-OFB';  {Do not localize}
  SN_des_ede_cbc = 'DES-EDE-CBC';  {Do not localize}
  SN_des_ede_cfb64 = 'DES-EDE-CFB';  {Do not localize}
  SN_des_ede_ofb64 = 'DES-EDE-OFB';  {Do not localize}
  SN_des_ofb64 = 'DES-OFB';  {Do not localize}
  SN_description = 'D';  {Do not localize}
  SN_desx_cbc = 'DESX-CBC';  {Do not localize}
  SN_dsa = 'DSA';  {Do not localize}
  SN_dsaWithSHA = 'DSA-SHA';  {Do not localize}
  SN_dsaWithSHA1 = 'DSA-SHA1';  {Do not localize}
  SN_dsaWithSHA1_2 = 'DSA-SHA1-old';  {Do not localize}
  SN_dsa_2 = 'DSA-old';  {Do not localize}
  SN_X9_62_id_ecPublicKey = 'id-ecPublicKey';  {Do not localize}
  SN_email_protect = 'emailProtection';  {Do not localize}
  SN_ext_key_usage = 'extendedKeyUsage';  {Do not localize}
  SN_givenName = 'G';  {Do not localize}
  SN_id_kp = 'id-kp';  {Do not localize}
  SN_id_pkix = 'PKIX';  {Do not localize}
  SN_id_qt_cps = 'id-qt-cps';  {Do not localize}
  SN_id_qt_unotice = 'id-qt-unotice';  {Do not localize}
  SN_idea_cbc = 'IDEA-CBC';  {Do not localize}
  SN_idea_cfb64 = 'IDEA-CFB';  {Do not localize}
  SN_idea_ecb = 'IDEA-ECB';  {Do not localize}
  SN_idea_ofb64 = 'IDEA-OFB';  {Do not localize}
  SN_identified_organization = 'identified-organization'; {Do not localize}
  SN_initials = 'I';  {Do not localize}
  SN_invalidity_date = 'invalidityDate';  {Do not localize}
  SN_iso = 'ISO'; {Do not localize}
  SN_issuer_alt_name = 'issuerAltName';  {Do not localize}
  SN_itu_t = 'ITU-T'; {Do not localize}
  SN_joint_iso_itu_t = 'JOINT-ISO-ITU-T'; {Do not localize}
  SN_key_usage = 'keyUsage';  {Do not localize}
  SN_ld_ce = 'ld-ce';  {Do not localize}
  SN_localityName = 'L';  {Do not localize}
  SN_md2 = 'MD2';  {Do not localize}
  SN_md2WithRSAEncryption = 'RSA-MD2';  {Do not localize}
  SN_md5 = 'MD5';  {Do not localize}
  SN_md5WithRSA = 'RSA-NP-MD5';  {Do not localize}
  SN_md5WithRSAEncryption = 'RSA-MD5';  {Do not localize}
  SN_md5_sha1 = 'MD5-SHA1';  {Do not localize}
  SN_mdc2 = 'MDC2';  {Do not localize}
  SN_mdc2WithRSA = 'RSA-MDC2';  {Do not localize}
  SN_member_body	='member-body'; {Do not localize}
  SN_ms_code_com = 'msCodeCom';  {Do not localize}
  SN_ms_code_ind = 'msCodeInd';  {Do not localize}
  SN_ms_ctl_sign = 'msCTLSign';  {Do not localize}
  SN_ms_efs = 'msEFS';  {Do not localize}
  SN_ms_sgc = 'msSGC';  {Do not localize}
  SN_netscape = 'Netscape';  {Do not localize}
  SN_netscape_base_url = 'nsBaseUrl';  {Do not localize}
  SN_netscape_ca_policy_url = 'nsCaPolicyUrl';  {Do not localize}
  SN_netscape_ca_revocation_url = 'nsCaRevocationUrl';  {Do not localize}
  SN_netscape_cert_extension = 'nsCertExt';  {Do not localize}
  SN_netscape_cert_sequence = 'nsCertSequence';  {Do not localize}
  SN_netscape_cert_type = 'nsCertType';  {Do not localize}
  SN_netscape_comment = 'nsComment';  {Do not localize}
  SN_netscape_data_type = 'nsDataType';  {Do not localize}
  SN_netscape_renewal_url = 'nsRenewalUrl';  {Do not localize}
  SN_netscape_revocation_url = 'nsRevocationUrl';  {Do not localize}
  SN_netscape_ssl_server_name = 'nsSslServerName';  {Do not localize}
  SN_ns_sgc = 'nsSGC';  {Do not localize}
  SN_organizationName = 'O';  {Do not localize}
  SN_organizationalUnitName = 'OU';  {Do not localize}
  SN_pkcs9_emailAddress = 'Email';  {Do not localize}
  SN_private_key_usage_period = 'privateKeyUsagePeriod';  {Do not localize}
  SN_rc2_40_cbc = 'RC2-40-CBC';  {Do not localize}
  SN_rc2_64_cbc = 'RC2-64-CBC';  {Do not localize}
  SN_rc2_cbc = 'RC2-CBC';  {Do not localize}
  SN_rc2_cfb64 = 'RC2-CFB';  {Do not localize}
  SN_rc2_ecb = 'RC2-ECB';  {Do not localize}
  SN_rc2_ofb64 = 'RC2-OFB';  {Do not localize}
  SN_rc4 = 'RC4';  {Do not localize}
  SN_rc4_40 = 'RC4-40';  {Do not localize}
  SN_rc5_cbc = 'RC5-CBC';  {Do not localize}
  SN_rc5_cfb64 = 'RC5-CFB';  {Do not localize}
  SN_rc5_ecb = 'RC5-ECB';  {Do not localize}
  SN_rc5_ofb64 = 'RC5-OFB';  {Do not localize}
  SN_ripemd160 = 'RIPEMD160';  {Do not localize}
  SN_ripemd160WithRSA = 'RSA-RIPEMD160';  {Do not localize}
  SN_rle_compression = 'RLE';  {Do not localize}
  SN_rsa = 'RSA';  {Do not localize}
  SN_serialNumber = 'SN';  {Do not localize}
  SN_server_auth = 'serverAuth';  {Do not localize}
  SN_sha = 'SHA';  {Do not localize}
  SN_sha1 = 'SHA1';  {Do not localize}
  SN_sha1WithRSA = 'RSA-SHA1-2';  {Do not localize}
  SN_sha1WithRSAEncryption = 'RSA-SHA1';  {Do not localize}
  SN_shaWithRSAEncryption = 'RSA-SHA';  {Do not localize}
  SN_stateOrProvinceName = 'ST';  {Do not localize}
  SN_subject_alt_name = 'subjectAltName';  {Do not localize}
  SN_subject_key_identifier = 'subjectKeyIdentifier';  {Do not localize}
  SN_surname = 'S';  {Do not localize}
  SN_sxnet = 'SXNetID';  {Do not localize}
  SN_time_stamp = 'timeStamping';  {Do not localize}
  SN_title = 'T';  {Do not localize}
  SN_undef = 'UNDEF';  {Do not localize}
  SN_uniqueIdentifier = 'UID';  {Do not localize}
  SN_zlib_compression = 'ZLIB';  {Do not localize}
  OCSP_DEFAULT_NONCE_LENGTH	= 16;
  OCSP_NOCERTS = $1;
  OCSP_NOINTERN	= $2;
  OCSP_NOSIGS	= $4;
  OCSP_NOCHAIN = $8;
  OCSP_NOVERIFY = $10;
  OCSP_NOEXPLICIT = $20;
  OCSP_NOCASIGN	= $40;
  OCSP_NODELEGATED = $80;
  OCSP_NOCHECKS	= $100;
  OCSP_TRUSTOTHER	= $200;
  OCSP_RESPID_KEY	= $400;
  OCSP_NOTIME	= $800;
  OCSP_RESPONSE_STATUS_SUCCESSFUL          = 0;
  OCSP_RESPONSE_STATUS_MALFORMEDREQUEST    = 1;
  OCSP_RESPONSE_STATUS_INTERNALERROR       = 2;
  OCSP_RESPONSE_STATUS_TRYLATER            = 3;
  OCSP_RESPONSE_STATUS_SIGREQUIRED         = 5;
  OCSP_RESPONSE_STATUS_UNAUTHORIZED        = 6;
  OCSP_REVOKED_STATUS_NOSTATUS             = -1;
  OCSP_REVOKED_STATUS_UNSPECIFIED           = 0;
  OCSP_REVOKED_STATUS_KEYCOMPROMISE         = 1;
  OCSP_REVOKED_STATUS_CACOMPROMISE          = 2;
  OCSP_REVOKED_STATUS_AFFILIATIONCHANGED    = 3;
  OCSP_REVOKED_STATUS_SUPERSEDED            = 4;
  OCSP_REVOKED_STATUS_CESSATIONOFOPERATION  = 5;
  OCSP_REVOKED_STATUS_CERTIFICATEHOLD       = 6;
  OCSP_REVOKED_STATUS_REMOVEFROMCRL         = 8;
  V_OCSP_CERTSTATUS_GOOD    = 0;
  V_OCSP_CERTSTATUS_REVOKED = 1;
  V_OCSP_CERTSTATUS_UNKNOWN = 2;
  OCSP_F_ASN1_STRING_ENCODE		   	= 100;
  OCSP_F_D2I_OCSP_NONCE				    = 102;
  OCSP_F_OCSP_BASIC_ADD1_STATUS	  = 103;
  OCSP_F_OCSP_BASIC_SIGN			    = 104;
  OCSP_F_OCSP_BASIC_VERIFY  		  = 105;
  OCSP_F_OCSP_CERT_ID_NEW		  	  = 101;
  OCSP_F_OCSP_CHECK_DELEGATED	    = 106;
  OCSP_F_OCSP_CHECK_IDS				    = 107;
  OCSP_F_OCSP_CHECK_ISSUER		    = 108;
  OCSP_F_OCSP_CHECK_VALIDITY	    = 115;
  OCSP_F_OCSP_MATCH_ISSUERID	    = 109;
  OCSP_F_OCSP_PARSE_URL				    = 114;
  OCSP_F_OCSP_REQUEST_SIGN		    = 110;
  OCSP_F_OCSP_REQUEST_VERIFY			= 116;
  OCSP_F_OCSP_RESPONSE_GET1_BASIC	= 111;
  OCSP_F_OCSP_SENDREQ_BIO			    = 112;
  OCSP_F_PARSE_HTTP_LINE1		      = 117;
  OCSP_F_REQUEST_VERIFY	          = 113;
//* Reason codes. */
  OCSP_R_BAD_DATA					= 100;
  OCSP_R_CERTIFICATE_VERIFY_ERROR			= 101;
  OCSP_R_DIGEST_ERR				= 102;
  OCSP_R_ERROR_IN_NEXTUPDATE_FIELD		= 122;
  OCSP_R_ERROR_IN_THISUPDATE_FIELD		= 123;
  OCSP_R_ERROR_PARSING_URL			= 121;
  OCSP_R_MISSING_OCSPSIGNING_USAGE		= 103;
  OCSP_R_NEXTUPDATE_BEFORE_THISUPDATE		= 124;
  OCSP_R_NOT_BASIC_RESPONSE			= 104;
  OCSP_R_NO_CERTIFICATES_IN_CHAIN			= 105;
  OCSP_R_NO_CONTENT				 = 106;
  OCSP_R_NO_PUBLIC_KEY				= 107;
  OCSP_R_NO_RESPONSE_DATA			= 108;
  OCSP_R_NO_REVOKED_TIME			= 109;
  OCSP_R_PRIVATE_KEY_DOES_NOT_MATCH_CERTIFICATE	= 110;
  OCSP_R_REQUEST_NOT_SIGNED		 = 128;
  OCSP_R_RESPONSE_CONTAINS_NO_REVOCATION_DATA	 = 111;
  OCSP_R_ROOT_CA_NOT_TRUSTED		 = 112;
  OCSP_R_SERVER_READ_ERROR			 = 113;
  OCSP_R_SERVER_RESPONSE_ERROR	 = 114;
  OCSP_R_SERVER_RESPONSE_PARSE_ERROR = 115;
  OCSP_R_SERVER_WRITE_ERROR		 = 116;
  OCSP_R_SIGNATURE_FAILURE		 = 117;
  OCSP_R_SIGNER_CERTIFICATE_NOT_FOUND		= 118;
  OCSP_R_STATUS_EXPIRED				 = 125;
  OCSP_R_STATUS_NOT_YET_VALID	 = 126;
  OCSP_R_STATUS_TOO_OLD				 = 127;
  OCSP_R_UNKNOWN_MESSAGE_DIGEST	= 119;
  OCSP_R_UNKNOWN_NID			  = 120;
  OCSP_R_UNSUPPORTED_REQUESTORNAME_TYPE	= 129;
  SSL_ST_CONNECT = $1000;
  SSL23_ST_CR_SRVR_HELLO_A = $220 or SSL_ST_CONNECT;
  SSL23_ST_CR_SRVR_HELLO_B = $221 or SSL_ST_CONNECT;
  SSL23_ST_CW_CLNT_HELLO_A = $210 or SSL_ST_CONNECT;
  SSL23_ST_CW_CLNT_HELLO_B = $211 or SSL_ST_CONNECT;
  SSL_ST_ACCEPT = $2000;
  SSL23_ST_SR_CLNT_HELLO_A = $210 or SSL_ST_ACCEPT;
  SSL23_ST_SR_CLNT_HELLO_B = $211 or SSL_ST_ACCEPT;
  SSL2_AT_MD5_WITH_RSA_ENCRYPTION = $01;
  SSL2_CF_5_BYTE_ENC = $01;
  SSL2_CF_8_BYTE_ENC = $02;
  SSL2_CHALLENGE_LENGTH = 16;
  SSL2_CK_DES_192_EDE3_CBC_WITH_MD5 = $020700c0;
  SSL2_CK_DES_192_EDE3_CBC_WITH_SHA = $020701c0;
  SSL2_CK_DES_64_CBC_WITH_MD5 = $02060040;
  SSL2_CK_DES_64_CBC_WITH_SHA = $02060140;
  SSL2_CK_DES_64_CFB64_WITH_MD5_1 = $02ff0800;
  SSL2_CK_IDEA_128_CBC_WITH_MD5 = $02050080;
  SSL2_CK_NULL = $02ff0810;
  SSL2_CK_NULL_WITH_MD5 = $02000000;
  SSL2_CK_RC2_128_CBC_EXPORT40_WITH_MD5 = $02040080;
  SSL2_CK_RC2_128_CBC_WITH_MD5 = $02030080;
  SSL2_CK_RC4_128_EXPORT40_WITH_MD5 = $02020080;
  SSL2_CK_RC4_128_WITH_MD5 = $02010080;
  SSL2_CK_RC4_64_WITH_MD5 = $02080080;
  SSL2_CONNECTION_ID_LENGTH = 16;
  SSL2_CT_X509_CERTIFICATE = $01;
  SSL2_MAX_CERT_CHALLENGE_LENGTH = 32;
  SSL2_MAX_CHALLENGE_LENGTH = 32;
  SSL2_MAX_CONNECTION_ID_LENGTH = 16;
  SSL2_MAX_KEY_MATERIAL_LENGTH = 24;
  SSL2_MAX_MASTER_KEY_LENGTH_IN_BITS = 256;
  SSL2_MAX_RECORD_LENGTH_3_BYTE_HEADER = 16383;
  SSL2_MAX_SSL_SESSION_ID_LENGTH = 32;
  SSL2_MIN_CERT_CHALLENGE_LENGTH = 16;
  SSL2_MIN_CHALLENGE_LENGTH = 16;
  SSL2_MT_CLIENT_CERTIFICATE = 8;
  SSL2_MT_CLIENT_FINISHED = 3;
  SSL2_MT_CLIENT_HELLO = 1;
  SSL2_MT_CLIENT_MASTER_KEY = 2;
  SSL2_MT_ERROR = 0;
  SSL2_MT_REQUEST_CERTIFICATE = 7;
  SSL2_MT_SERVER_FINISHED = 6;
  SSL2_MT_SERVER_HELLO = 4;
  SSL2_MT_SERVER_VERIFY = 5;
  SSL2_PE_BAD_CERTIFICATE = $0004;
  SSL2_PE_NO_CERTIFICATE = $0002;
  SSL2_PE_NO_CIPHER = $0001;
  SSL2_PE_UNDEFINED_ERROR = $0000;
  SSL2_PE_UNSUPPORTED_CERTIFICATE_TYPE = $0006;
  SSL2_SSL_SESSION_ID_LENGTH = 16;
  SSL2_ST_CLIENT_START_ENCRYPTION = $80 or SSL_ST_CONNECT;
  SSL2_ST_GET_CLIENT_FINISHED_A = $50 or SSL_ST_ACCEPT;
  SSL2_ST_GET_CLIENT_FINISHED_B = $51 or SSL_ST_ACCEPT;
  SSL2_ST_GET_CLIENT_HELLO_A = $10 or SSL_ST_ACCEPT;
  SSL2_ST_GET_CLIENT_HELLO_B = $11 or SSL_ST_ACCEPT;
  SSL2_ST_GET_CLIENT_HELLO_C = $12 or SSL_ST_ACCEPT;
  SSL2_ST_GET_CLIENT_MASTER_KEY_A = $30 or SSL_ST_ACCEPT;
  SSL2_ST_GET_CLIENT_MASTER_KEY_B = $31 or SSL_ST_ACCEPT;
  SSL2_ST_GET_SERVER_FINISHED_A = $70 or SSL_ST_CONNECT;
  SSL2_ST_GET_SERVER_FINISHED_B = $71 or SSL_ST_CONNECT;
  SSL2_ST_GET_SERVER_HELLO_A = $20 or SSL_ST_CONNECT;
  SSL2_ST_GET_SERVER_HELLO_B = $21 or SSL_ST_CONNECT;
  SSL2_ST_GET_SERVER_VERIFY_A = $60 or SSL_ST_CONNECT;
  SSL2_ST_GET_SERVER_VERIFY_B = $61 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_CERTIFICATE_A = $50 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_CERTIFICATE_B = $51 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_CERTIFICATE_C = $52 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_CERTIFICATE_D = $53 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_FINISHED_A = $40 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_FINISHED_B = $41 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_HELLO_A = $10 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_HELLO_B = $11 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_MASTER_KEY_A = $30 or SSL_ST_CONNECT;
  SSL2_ST_SEND_CLIENT_MASTER_KEY_B = $31 or SSL_ST_CONNECT;
  SSL2_ST_SEND_REQUEST_CERTIFICATE_A = $70 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_REQUEST_CERTIFICATE_B = $71 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_REQUEST_CERTIFICATE_C = $72 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_REQUEST_CERTIFICATE_D = $73 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_SERVER_FINISHED_A = $60 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_SERVER_FINISHED_B = $61 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_SERVER_HELLO_A = $20 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_SERVER_HELLO_B = $21 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_SERVER_VERIFY_A = $40 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_SERVER_VERIFY_B = $41 or SSL_ST_ACCEPT;
  SSL2_ST_SEND_SERVER_VERIFY_C = $42 or SSL_ST_ACCEPT;
  SSL2_ST_SERVER_START_ENCRYPTION = $80 or SSL_ST_ACCEPT;
  SSL2_ST_X509_GET_CLIENT_CERTIFICATE = $90 or SSL_ST_CONNECT;
  SSL2_ST_X509_GET_SERVER_CERTIFICATE = $90 or SSL_ST_ACCEPT;
  SSL2_TXT_DES_192_EDE3_CBC_WITH_MD5 = 'DES-CBC3-MD5';  {Do not localize}
  SSL2_TXT_DES_192_EDE3_CBC_WITH_SHA = 'DES-CBC3-SHA';  {Do not localize}
  SSL2_TXT_DES_64_CBC_WITH_MD5 = 'DES-CBC-MD5';  {Do not localize}
  SSL2_TXT_DES_64_CBC_WITH_SHA = 'DES-CBC-SHA';  {Do not localize}
  SSL2_TXT_DES_64_CFB64_WITH_MD5_1 = 'DES-CFB-M1';  {Do not localize}
  SSL2_TXT_IDEA_128_CBC_WITH_MD5 = 'IDEA-CBC-MD5';  {Do not localize}
  SSL2_TXT_NULL = 'NULL';  {Do not localize}
  SSL2_TXT_NULL_WITH_MD5 = 'NULL-MD5';  {Do not localize}
  SSL2_TXT_RC2_128_CBC_EXPORT40_WITH_MD5 = 'EXP-RC2-CBC-MD5';  {Do not localize}
  SSL2_TXT_RC2_128_CBC_WITH_MD5 = 'RC2-CBC-MD5';  {Do not localize}
  SSL2_TXT_RC4_128_EXPORT40_WITH_MD5 = 'EXP-RC4-MD5';  {Do not localize}
  SSL2_TXT_RC4_128_WITH_MD5 = 'RC4-MD5';  {Do not localize}
  SSL2_TXT_RC4_64_WITH_MD5 = 'RC4-64-MD5';  {Do not localize}
  SSL2_VERSION = $0002;
  SSL2_VERSION_MAJOR = $00;
  SSL2_VERSION_MINOR = $02;
  SSL3_AD_BAD_CERTIFICATE = 42;
  SSL3_AD_BAD_RECORD_MAC = 20;
  SSL3_AD_CERTIFICATE_EXPIRED = 45;
  SSL3_AD_CERTIFICATE_REVOKED = 44;
  SSL3_AD_CERTIFICATE_UNKNOWN = 46;
  SSL3_AD_CLOSE_NOTIFY = 0;
  SSL3_AD_DECOMPRESSION_FAILURE = 30;
  SSL3_AD_HANDSHAKE_FAILURE = 40;
  SSL3_AD_ILLEGAL_PARAMETER = 47;
  SSL3_AD_NO_CERTIFICATE = 41;
  SSL3_AD_UNEXPECTED_MESSAGE = 10;
  SSL3_AD_UNSUPPORTED_CERTIFICATE = 43;
  SSL3_AL_FATAL = 2;
  SSL3_AL_WARNING = 1;
  SSL3_CC_CLIENT = $10;
  SSL3_CC_READ = $01;
  SSL3_CC_SERVER = $20;
  SSL3_CC_WRITE = $02;
  SSL3_CHANGE_CIPHER_CLIENT_READ = SSL3_CC_CLIENT or SSL3_CC_READ;
  SSL3_CHANGE_CIPHER_CLIENT_WRITE = SSL3_CC_CLIENT or SSL3_CC_WRITE;
  SSL3_CHANGE_CIPHER_SERVER_READ = SSL3_CC_SERVER or SSL3_CC_READ;
  SSL3_CHANGE_CIPHER_SERVER_WRITE = SSL3_CC_SERVER or SSL3_CC_WRITE;
  SSL3_CK_ADH_DES_192_CBC_SHA = $0300001B;
  SSL3_CK_ADH_DES_40_CBC_SHA = $03000019;
  SSL3_CK_ADH_DES_64_CBC_SHA = $0300001A;
  SSL3_CK_ADH_RC4_128_MD5 = $03000018;
  SSL3_CK_ADH_RC4_40_MD5 = $03000017;
  SSL3_CK_DH_DSS_DES_192_CBC3_SHA = $0300000D;
  SSL3_CK_DH_DSS_DES_40_CBC_SHA = $0300000B;
  SSL3_CK_DH_DSS_DES_64_CBC_SHA = $0300000C;
  SSL3_CK_DH_RSA_DES_192_CBC3_SHA = $03000010;
  SSL3_CK_DH_RSA_DES_40_CBC_SHA = $0300000E;
  SSL3_CK_DH_RSA_DES_64_CBC_SHA = $0300000F;
  SSL3_CK_EDH_DSS_DES_192_CBC3_SHA = $03000013;
  SSL3_CK_EDH_DSS_DES_40_CBC_SHA = $03000011;
  SSL3_CK_EDH_DSS_DES_64_CBC_SHA = $03000012;
  SSL3_CK_EDH_RSA_DES_192_CBC3_SHA = $03000016;
  SSL3_CK_EDH_RSA_DES_40_CBC_SHA = $03000014;
  SSL3_CK_EDH_RSA_DES_64_CBC_SHA = $03000015;
  SSL3_CK_FZA_DMS_FZA_SHA = $0300001D;
  SSL3_CK_FZA_DMS_NULL_SHA = $0300001C;
  SSL3_CK_FZA_DMS_RC4_SHA = $0300001E;
  SSL3_CK_RSA_DES_192_CBC3_SHA = $0300000A;
  SSL3_CK_RSA_DES_40_CBC_SHA = $03000008;
  SSL3_CK_RSA_DES_64_CBC_SHA = $03000009;
  SSL3_CK_RSA_IDEA_128_SHA = $03000007;
  //* Signalling cipher suite value: from draft-ietf-tls-renegotiation-03.txt */
  SSL3_CK_SCSV	= $030000FF;

  SSL3_CK_RSA_NULL_MD5 = $03000001;
  SSL3_CK_RSA_NULL_SHA = $03000002;
  SSL3_CK_RSA_RC2_40_MD5 = $03000006;
  SSL3_CK_RSA_RC4_128_MD5 = $03000004;
  SSL3_CK_RSA_RC4_128_SHA = $03000005;
  SSL3_CK_RSA_RC4_40_MD5 = $03000003;
  SSL3_CT_DSS_EPHEMERAL_DH = 6;
  SSL3_CT_DSS_FIXED_DH = 4;
  SSL3_CT_DSS_SIGN = 2;
  SSL3_CT_FORTEZZA_DMS = 20;
  SSL3_CT_NUMBER = 7;
  SSL3_CT_RSA_EPHEMERAL_DH = 5;
  SSL3_CT_RSA_FIXED_DH = 3;
  SSL3_CT_RSA_SIGN = 1;
  SSL3_FLAGS_DELAY_CLIENT_FINISHED = $0002;
  SSL3_FLAGS_NO_RENEGOTIATE_CIPHERS = $0001;
  SSL3_FLAGS_POP_BUFFER = $0004;
  TLS1_FLAGS_TLS_PADDING_BUG = $0008;

  SSL3_MASTER_SECRET_SIZE = 48;
  SSL3_MAX_SSL_SESSION_ID_LENGTH = 32;
  SSL3_MT_HELLO_REQUEST	= 0;
  SSL3_MT_CLIENT_REQUEST = 0;
  SSL3_MT_CLIENT_HELLO = 1;
  SSL3_MT_SERVER_HELLO = 2;
  SSL3_MT_NEWSESSION_TICKET = 4;
  SSL3_MT_CERTIFICATE = 11;
  SSL3_MT_SERVER_KEY_EXCHANGE = 12;
  SSL3_MT_CERTIFICATE_REQUEST = 13;
  SSL3_MT_SERVER_DONE = 14;
  SSL3_MT_CERTIFICATE_VERIFY = 15;
  SSL3_MT_CLIENT_KEY_EXCHANGE = 16;
  SSL3_MT_FINISHED = 20;
  SSL3_MT_CERTIFICATE_STATUS = 22;
  DTLS1_MT_HELLO_VERIFY_REQUEST = 3;
  SSL3_MT_CCS = 1;
  SSL3_RANDOM_SIZE = 32;
  SSL3_RS_BLANK = 1;
  SSL3_RS_ENCODED = 2;
  SSL3_RS_PART_READ = 4;
  SSL3_RS_PART_WRITE = 5;
  SSL3_RS_PLAIN = 3;
  SSL3_RS_READ_MORE = 3;
  SSL3_RT_ALERT = 21;
  SSL3_RT_APPLICATION_DATA = 23;
  SSL3_RT_CHANGE_CIPHER_SPEC = 20;
  SSL3_RT_HANDSHAKE = 22;
  SSL3_RT_HEADER_LENGTH = 5;
  SSL3_RT_MAX_PLAIN_LENGTH = 16384;
  SSL3_RT_MAX_COMPRESSED_LENGTH = 1024+SSL3_RT_MAX_PLAIN_LENGTH;
  SSL3_RT_MAX_DATA_SIZE = 1024*1024;
  SSL3_RT_MAX_ENCRYPTED_LENGTH = 1024+SSL3_RT_MAX_COMPRESSED_LENGTH;
  SSL3_RT_MAX_EXTRA = 16384;
  SSL3_RT_MAX_PACKET_SIZE = SSL3_RT_MAX_ENCRYPTED_LENGTH+SSL3_RT_HEADER_LENGTH;
  SSL3_SESSION_ID_SIZE = 32;
  SSL3_SSL_SESSION_ID_LENGTH = 32;
  SSL3_ST_CR_CERT_A = $130 or SSL_ST_CONNECT;
  SSL3_ST_CR_CERT_B = $131 or SSL_ST_CONNECT;
  SSL3_ST_CR_CERT_REQ_A = $150 or SSL_ST_CONNECT;
  SSL3_ST_CR_CERT_REQ_B = $151 or SSL_ST_CONNECT;
  SSL3_ST_CR_CHANGE_A = $1C0 or SSL_ST_CONNECT;
  SSL3_ST_CR_CHANGE_B = $1C1 or SSL_ST_CONNECT;
  SSL3_ST_CR_FINISHED_A = $1D0 or SSL_ST_CONNECT;
  SSL3_ST_CR_FINISHED_B = $1D1 or SSL_ST_CONNECT;
  SSL3_ST_CR_SESSION_TICKET_A = ($1E0 or SSL_ST_CONNECT);
  SSL3_ST_CR_SESSION_TICKET_B = ($1E1 or SSL_ST_CONNECT);
  SSL3_ST_CR_CERT_STATUS_A = ($1F0 or SSL_ST_CONNECT);
  SSL3_ST_CR_CERT_STATUS_B = ($1F1 or SSL_ST_CONNECT);
  SSL3_ST_CR_KEY_EXCH_A = $140 or SSL_ST_CONNECT;
  SSL3_ST_CR_KEY_EXCH_B = $141 or SSL_ST_CONNECT;
  SSL3_ST_CR_SRVR_DONE_A = $160 or SSL_ST_CONNECT;
  SSL3_ST_CR_SRVR_DONE_B = $161 or SSL_ST_CONNECT;
  SSL3_ST_CR_SRVR_HELLO_A = $120 or SSL_ST_CONNECT;
  SSL3_ST_CR_SRVR_HELLO_B = $121 or SSL_ST_CONNECT;
  SSL3_ST_CW_CERT_A = $170 or SSL_ST_CONNECT;
  SSL3_ST_CW_CERT_B = $171 or SSL_ST_CONNECT;
  SSL3_ST_CW_CERT_C = $172 or SSL_ST_CONNECT;
  SSL3_ST_CW_CERT_D = $173 or SSL_ST_CONNECT;
  SSL3_ST_CW_CERT_VRFY_A = $190 or SSL_ST_CONNECT;
  SSL3_ST_CW_CERT_VRFY_B = $191 or SSL_ST_CONNECT;
  SSL3_ST_CW_CHANGE_A = $1A0 or SSL_ST_CONNECT;
  SSL3_ST_CW_CHANGE_B = $1A1 or SSL_ST_CONNECT;
  SSL3_ST_CW_CLNT_HELLO_A = $110 or SSL_ST_CONNECT;
  SSL3_ST_CW_CLNT_HELLO_B = $111 or SSL_ST_CONNECT;
  SSL3_ST_CW_FINISHED_A = $1B0 or SSL_ST_CONNECT;
  SSL3_ST_CW_FINISHED_B = $1B1 or SSL_ST_CONNECT;
  SSL3_ST_CW_FLUSH = $100 or SSL_ST_CONNECT;
  SSL3_ST_CW_KEY_EXCH_A = $180 or SSL_ST_CONNECT;
  SSL3_ST_CW_KEY_EXCH_B = $181 or SSL_ST_CONNECT;
  SSL3_ST_SR_CERT_A = $180 or SSL_ST_ACCEPT;
  SSL3_ST_SR_CERT_B = $181 or SSL_ST_ACCEPT;
  SSL3_ST_SR_CERT_VRFY_A = $1A0 or SSL_ST_ACCEPT;
  SSL3_ST_SR_CERT_VRFY_B = $1A1 or SSL_ST_ACCEPT;
  SSL3_ST_SR_CHANGE_A = $1B0 or SSL_ST_ACCEPT;
  SSL3_ST_SR_CHANGE_B = $1B1 or SSL_ST_ACCEPT;
  SSL3_ST_SR_CLNT_HELLO_A = $110 or SSL_ST_ACCEPT;
  SSL3_ST_SR_CLNT_HELLO_B = $111 or SSL_ST_ACCEPT;
  SSL3_ST_SR_CLNT_HELLO_C = $112 or SSL_ST_ACCEPT;
  SSL3_ST_SR_FINISHED_A = $1C0 or SSL_ST_ACCEPT;
  SSL3_ST_SR_FINISHED_B = $1C1 or SSL_ST_ACCEPT;
  SSL3_ST_SR_KEY_EXCH_A = $190 or SSL_ST_ACCEPT;
  SSL3_ST_SR_KEY_EXCH_B = $191 or SSL_ST_ACCEPT;
  SSL3_ST_SW_CERT_A = $140 or SSL_ST_ACCEPT;
  SSL3_ST_SW_CERT_B = $141 or SSL_ST_ACCEPT;
  SSL3_ST_SW_CERT_REQ_A = $160 or SSL_ST_ACCEPT;
  SSL3_ST_SW_CERT_REQ_B = $161 or SSL_ST_ACCEPT;
  SSL3_ST_SW_CHANGE_A = $1D0 or SSL_ST_ACCEPT;
  SSL3_ST_SW_CHANGE_B = $1D1 or SSL_ST_ACCEPT;
  SSL3_ST_SW_FINISHED_A = $1E0 or SSL_ST_ACCEPT;
  SSL3_ST_SW_FINISHED_B = $1E1 or SSL_ST_ACCEPT;
  SSL3_ST_SW_SESSION_TICKET_A = ($1F0 or SSL_ST_ACCEPT);
  SSL3_ST_SW_SESSION_TICKET_B = ($1F1 or SSL_ST_ACCEPT);
  SSL3_ST_SW_CERT_STATUS_A =	($200 or SSL_ST_ACCEPT);
  SSL3_ST_SW_CERT_STATUS_B =	($201 or SSL_ST_ACCEPT);
  SSL3_ST_SW_FLUSH = $100 or SSL_ST_ACCEPT;
  SSL3_ST_SW_HELLO_REQ_A = $120 or SSL_ST_ACCEPT;
  SSL3_ST_SW_HELLO_REQ_B = $121 or SSL_ST_ACCEPT;
  SSL3_ST_SW_HELLO_REQ_C = $122 or SSL_ST_ACCEPT;
  SSL3_ST_SW_KEY_EXCH_A = $150 or SSL_ST_ACCEPT;
  SSL3_ST_SW_KEY_EXCH_B = $151 or SSL_ST_ACCEPT;
  SSL3_ST_SW_SRVR_DONE_A = $170 or SSL_ST_ACCEPT;
  SSL3_ST_SW_SRVR_DONE_B = $171 or SSL_ST_ACCEPT;
  SSL3_ST_SW_SRVR_HELLO_A = $130 or SSL_ST_ACCEPT;
  SSL3_ST_SW_SRVR_HELLO_B = $131 or SSL_ST_ACCEPT;
  SSL3_TXT_ADH_DES_192_CBC_SHA = 'ADH-DES-CBC3-SHA';  {Do not localize}
  SSL3_TXT_ADH_DES_40_CBC_SHA = 'EXP-ADH-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_ADH_DES_64_CBC_SHA = 'ADH-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_ADH_RC4_128_MD5 = 'ADH-RC4-MD5';  {Do not localize}
  SSL3_TXT_ADH_RC4_40_MD5 = 'EXP-ADH-RC4-MD5';  {Do not localize}
  SSL3_TXT_DH_DSS_DES_192_CBC3_SHA = 'DH-DSS-DES-CBC3-SHA';  {Do not localize}
  SSL3_TXT_DH_DSS_DES_40_CBC_SHA = 'EXP-DH-DSS-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_DH_DSS_DES_64_CBC_SHA = 'DH-DSS-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_DH_RSA_DES_192_CBC3_SHA = 'DH-RSA-DES-CBC3-SHA';  {Do not localize}
  SSL3_TXT_DH_RSA_DES_40_CBC_SHA = 'EXP-DH-RSA-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_DH_RSA_DES_64_CBC_SHA = 'DH-RSA-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_EDH_DSS_DES_192_CBC3_SHA = 'EDH-DSS-DES-CBC3-SHA';  {Do not localize}
  SSL3_TXT_EDH_DSS_DES_40_CBC_SHA = 'EXP-EDH-DSS-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_EDH_DSS_DES_64_CBC_SHA = 'EDH-DSS-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_EDH_RSA_DES_192_CBC3_SHA = 'EDH-RSA-DES-CBC3-SHA';  {Do not localize}
  SSL3_TXT_EDH_RSA_DES_40_CBC_SHA = 'EXP-EDH-RSA-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_EDH_RSA_DES_64_CBC_SHA = 'EDH-RSA-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_FZA_DMS_FZA_SHA = 'FZA-FZA-CBC-SHA';  {Do not localize}
  SSL3_TXT_FZA_DMS_NULL_SHA = 'FZA-NULL-SHA';  {Do not localize}
  SSL3_TXT_FZA_DMS_RC4_SHA = 'FZA-RC4-SHA';  {Do not localize}
  SSL3_TXT_RSA_DES_192_CBC3_SHA = 'DES-CBC3-SHA';  {Do not localize}
  SSL3_TXT_RSA_DES_40_CBC_SHA = 'EXP-DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_RSA_DES_64_CBC_SHA = 'DES-CBC-SHA';  {Do not localize}
  SSL3_TXT_RSA_IDEA_128_SHA = 'IDEA-CBC-SHA';  {Do not localize}
  SSL3_TXT_RSA_NULL_MD5 = 'NULL-MD5';  {Do not localize}
  SSL3_TXT_RSA_NULL_SHA = 'NULL-SHA';  {Do not localize}
  SSL3_TXT_RSA_RC2_40_MD5 = 'EXP-RC2-CBC-MD5';  {Do not localize}
  SSL3_TXT_RSA_RC4_128_MD5 = 'RC4-MD5';  {Do not localize}
  SSL3_TXT_RSA_RC4_128_SHA = 'RC4-SHA';  {Do not localize}
  SSL3_TXT_RSA_RC4_40_MD5 = 'EXP-RC4-MD5';  {Do not localize}
  SSL3_VERSION = $0300;
  SSL3_VERSION_MAJOR = $03;
  SSL3_VERSION_MINOR = $00;
  SSLEAY_VERSION = 0;
//* #define SSLEAY_OPTIONS 1 no longer supported */
  SSLEAY_CFLAGS = 2;
  SSLEAY_BUILT_ON = 3;
  SSLEAY_PLATFORM = 4;
  SSLEAY_DIR = 5;
  //tls1.h
  TLS1_AD_DECRYPTION_FAILED = 21;
  TLS1_AD_RECORD_OVERFLOW = 22;
  TLS1_AD_UNKNOWN_CA = 48;
  TLS1_AD_ACCESS_DENIED = 49;
  TLS1_AD_DECODE_ERROR = 50;
  TLS1_AD_DECRYPT_ERROR = 51;
  TLS1_AD_EXPORT_RESTRICTION = 60;
  TLS1_AD_PROTOCOL_VERSION = 70;
  TLS1_AD_INSUFFICIENT_SECURITY = 71;
  TLS1_AD_INTERNAL_ERROR = 80;
  TLS1_AD_USER_CANCELLED = 90;
  TLS1_AD_NO_RENEGOTIATION = 100;
  //* codes 110-114 are from RFC3546 */
  TLS1_AD_UNSUPPORTED_EXTENSION = 110;
  TLS1_AD_CERTIFICATE_UNOBTAINABLE = 111;
  TLS1_AD_UNRECOGNIZED_NAME = 112;
  TLS1_AD_BAD_CERTIFICATE_STATUS_RESPONSE = 113;
  TLS1_AD_BAD_CERTIFICATE_HASH_VALUE = 114;
  TLS1_AD_UNKNOWN_PSK_IDENTITY = 115;//* fatal */
//* ExtensionType values from RFC 3546 */
  TLSEXT_TYPE_server_name = 0;
  TLSEXT_TYPE_max_fragment_length = 1;
  TLSEXT_TYPE_client_certificate_url = 2;
  TLSEXT_TYPE_trusted_ca_keys = 3;
  TLSEXT_TYPE_truncated_hmac = 4;
  TLSEXT_TYPE_status_request =5;
  TLSEXT_TYPE_elliptic_curves = 10;
  TLSEXT_TYPE_ec_point_formats = 11;
  TLSEXT_TYPE_session_ticket = 35;
  //* Temporary extension type */
 TLSEXT_TYPE_renegotiate = $ff01;

  //* NameType value from RFC 3546 */
  TLSEXT_NAMETYPE_host_name = 0;
//* status request value from RFC 3546 */
  TLSEXT_STATUSTYPE_ocsp = 1;
{$IFNDEF OPENSSL_NO_TLSEXT}
  TLSEXT_MAXLEN_host_name = 255;
  SSL_TLSEXT_ERR_OK  = 0;
  SSL_TLSEXT_ERR_ALERT_WARNING = 1;
  SSL_TLSEXT_ERR_ALERT_FATAL = 2;
  SSL_TLSEXT_ERR_NOACK = 3;
{$ENDIF}
  //
  SSLEAY_VERSION_NUMBER = OPENSSL_VERSION_NUMBER;
  SSL_AD_REASON_OFFSET = 1000;
  SSL_AD_CLOSE_NOTIFY = SSL3_AD_CLOSE_NOTIFY;
  SSL_AD_UNEXPECTED_MESSAGE = SSL3_AD_UNEXPECTED_MESSAGE;
  SSL_AD_BAD_RECORD_MAC = SSL3_AD_BAD_RECORD_MAC;
  SSL_AD_DECRYPTION_FAILED = TLS1_AD_DECRYPTION_FAILED;
  SSL_AD_RECORD_OVERFLOW = TLS1_AD_RECORD_OVERFLOW;
  SSL_AD_DECOMPRESSION_FAILURE = SSL3_AD_DECOMPRESSION_FAILURE;
  SSL_AD_HANDSHAKE_FAILURE = SSL3_AD_HANDSHAKE_FAILURE;
  SSL_AD_NO_CERTIFICATE = SSL3_AD_NO_CERTIFICATE;
  SSL_AD_BAD_CERTIFICATE = SSL3_AD_BAD_CERTIFICATE;
  SSL_AD_UNSUPPORTED_CERTIFICATE = SSL3_AD_UNSUPPORTED_CERTIFICATE;
  SSL_AD_CERTIFICATE_REVOKED = SSL3_AD_CERTIFICATE_REVOKED;
  SSL_AD_CERTIFICATE_EXPIRED = SSL3_AD_CERTIFICATE_EXPIRED;
  SSL_AD_CERTIFICATE_UNKNOWN = SSL3_AD_CERTIFICATE_UNKNOWN;
  SSL_AD_ILLEGAL_PARAMETER = SSL3_AD_ILLEGAL_PARAMETER;
  SSL_AD_UNKNOWN_CA = TLS1_AD_UNKNOWN_CA;
  SSL_AD_ACCESS_DENIED = TLS1_AD_ACCESS_DENIED;
  SSL_AD_DECODE_ERROR = TLS1_AD_DECODE_ERROR;
  SSL_AD_DECRYPT_ERROR = TLS1_AD_DECRYPT_ERROR;
  SSL_AD_EXPORT_RESTRICTION = TLS1_AD_EXPORT_RESTRICTION;
  SSL_AD_PROTOCOL_VERSION = TLS1_AD_PROTOCOL_VERSION;
  SSL_AD_INSUFFICIENT_SECURITY = TLS1_AD_INSUFFICIENT_SECURITY;
  SSL_AD_INTERNAL_ERROR = TLS1_AD_INTERNAL_ERROR;
  SSL_AD_USER_CANCELLED = TLS1_AD_USER_CANCELLED;
  SSL_AD_NO_RENEGOTIATION = TLS1_AD_NO_RENEGOTIATION;
  SSL_AD_UNSUPPORTED_EXTENSION = TLS1_AD_UNSUPPORTED_EXTENSION;
  SSL_AD_CERTIFICATE_UNOBTAINABLE = TLS1_AD_CERTIFICATE_UNOBTAINABLE;
  SSL_AD_UNRECOGNIZED_NAME = TLS1_AD_UNRECOGNIZED_NAME;
  SSL_AD_BAD_CERTIFICATE_STATUS_RESPONSE = TLS1_AD_BAD_CERTIFICATE_STATUS_RESPONSE;

  SSL_CB_LOOP = $01;
  SSL_CB_EXIT = $02;
  SSL_CB_READ = $04;
  SSL_CB_WRITE = $08;
  SSL_CB_ALERT = $4000;
  SSL_CB_READ_ALERT = SSL_CB_ALERT or SSL_CB_READ;
  SSL_CB_WRITE_ALERT = SSL_CB_ALERT or SSL_CB_WRITE;
  SSL_CB_ACCEPT_LOOP = SSL_ST_ACCEPT or SSL_CB_LOOP;
  SSL_CB_ACCEPT_EXIT = SSL_ST_ACCEPT or SSL_CB_EXIT;
  SSL_CB_CONNECT_LOOP = SSL_ST_CONNECT or SSL_CB_LOOP;
  SSL_CB_CONNECT_EXIT = SSL_ST_CONNECT or SSL_CB_EXIT;
  SSL_CB_HANDSHAKE_START = $10;
  SSL_CB_HANDSHAKE_DONE = $20;

  SSL_CTRL_NEED_TMP_RSA = 1;
  SSL_CTRL_SET_TMP_RSA = 2;
  SSL_CTRL_SET_TMP_DH = 3;
  SSL_CTRL_SET_TMP_ECDH = 4;
  SSL_CTRL_SET_TMP_RSA_CB = 5;
  SSL_CTRL_SET_TMP_DH_CB = 6;
  SSL_CTRL_SET_TMP_ECDH_CB = 7;
  {$IFNDEF NO_TLSEXT}
  //* see tls1.h for macros based on these */
  SSL_CTRL_SET_TLSEXT_SERVERNAME_CB	= 53;
  SSL_CTRL_SET_TLSEXT_SERVERNAME_ARG = 54;
  SSL_CTRL_SET_TLSEXT_HOSTNAME = 55;
  SSL_CTRL_SET_TLSEXT_DEBUG_CB = 56;
  SSL_CTRL_SET_TLSEXT_DEBUG_ARG	= 57;
  SSL_CTRL_GET_TLSEXT_TICKET_KEYS	= 58;
  SSL_CTRL_SET_TLSEXT_TICKET_KEYS	=	59;
  SSL_CTRL_SET_TLSEXT_STATUS_REQ_CB	= 63;
  SSL_CTRL_SET_TLSEXT_STATUS_REQ_CB_ARG	= 64;
  SSL_CTRL_SET_TLSEXT_STATUS_REQ_TYPE	= 65;
  SSL_CTRL_GET_TLSEXT_STATUS_REQ_EXTS	= 66;
  SSL_CTRL_SET_TLSEXT_STATUS_REQ_EXTS	= 67;
  SSL_CTRL_GET_TLSEXT_STATUS_REQ_IDS = 68;
  SSL_CTRL_SET_TLSEXT_STATUS_REQ_IDS = 69;
  SSL_CTRL_GET_TLSEXT_STATUS_REQ_OCSP_RESP = 70;
  SSL_CTRL_SET_TLSEXT_STATUS_REQ_OCSP_RESP = 71;
  SSL_CTRL_SET_TLSEXT_TICKET_KEY_CB	= 72;
  {$ENDIF}

  DTLS_CTRL_GET_TIMEOUT	= 73;
  DTLS_CTRL_HANDLE_TIMEOUT = 74;
  DTLS_CTRL_LISTEN = 75;

  SSL_CTRL_GET_RI_SUPPORT	= 76;
  SSL_CTRL_CLEAR_OPTIONS = 77;
  SSL_CTRL_CLEAR_MODE = 78;

  SSL_CTRL_GET_SESSION_REUSED = 8;
  SSL_CTRL_GET_CLIENT_CERT_REQUEST = 9;
  SSL_CTRL_GET_NUM_RENEGOTIATIONS = 10;
  SSL_CTRL_CLEAR_NUM_RENEGOTIATIONS = 11;
  SSL_CTRL_GET_TOTAL_RENEGOTIATIONS = 12;
  SSL_CTRL_GET_FLAGS = 13;
  SSL_CTRL_EXTRA_CHAIN_CERT = 14;
  SSL_CTRL_SET_MSG_CALLBACK             = 15;
  SSL_CTRL_SET_MSG_CALLBACK_ARG         = 16;
//* only applies to datagram connections */
  SSL_CTRL_SET_MTU               = 17;
//* Stats */
  SSL_CTRL_SESS_NUMBER = 20;
  SSL_CTRL_SESS_CONNECT = 21;
  SSL_CTRL_SESS_CONNECT_GOOD = 22;
  SSL_CTRL_SESS_CONNECT_RENEGOTIATE = 23;
  SSL_CTRL_SESS_ACCEPT = 24;
  SSL_CTRL_SESS_ACCEPT_GOOD = 25;
  SSL_CTRL_SESS_ACCEPT_RENEGOTIATE = 26;
  SSL_CTRL_SESS_HIT = 27;
  SSL_CTRL_SESS_CB_HIT = 28;
  SSL_CTRL_SESS_MISSES = 29;
  SSL_CTRL_SESS_TIMEOUTS = 30;
  SSL_CTRL_SESS_CACHE_FULL = 31;
  SSL_CTRL_OPTIONS = 32;
  SSL_CTRL_MODE = 33;
  SSL_CTRL_GET_READ_AHEAD = 40;
  SSL_CTRL_SET_READ_AHEAD = 41;
  SSL_CTRL_SET_SESS_CACHE_SIZE = 42;
  SSL_CTRL_GET_SESS_CACHE_SIZE = 43;
  SSL_CTRL_SET_SESS_CACHE_MODE = 44;
  SSL_CTRL_GET_SESS_CACHE_MODE = 45;
  SSL_CTRL_GET_MAX_CERT_LIST = 50;
  SSL_CTRL_SET_MAX_CERT_LIST = 51;
  SSL_DEFAULT_CIPHER_LIST = 'AES:ALL:!aNULL:!eNULL:+RC4:@STRENGTH'; //* low priority for RC4 */
  SSL_ERROR_NONE = 0;
  SSL_ERROR_SSL = 1;
  SSL_ERROR_WANT_READ = 2;
  SSL_ERROR_WANT_WRITE = 3;
  SSL_ERROR_WANT_X509_LOOKUP = 4;
  SSL_ERROR_SYSCALL = 5;
  SSL_ERROR_ZERO_RETURN = 6;
  SSL_ERROR_WANT_CONNECT = 7;
  SSL_ERROR_WANT_ACCEPT = 8;
  X509_FILETYPE_ASN1 = 2;
  SSL_FILETYPE_ASN1 = X509_FILETYPE_ASN1;
  X509_FILETYPE_PEM = 1;
  SSL_FILETYPE_PEM = X509_FILETYPE_PEM;
  SSL_F_CLIENT_CERTIFICATE = 100;
  SSL_F_CLIENT_HELLO = 101;
  SSL_F_CLIENT_MASTER_KEY = 102;
  SSL_F_D2I_SSL_SESSION = 103;
  SSL_F_DO_SSL3_WRITE = 104;
  SSL_F_DTLS1_ACCEPT = 246;
  SSL_F_DTLS1_ADD_CERT_TO_BUF	= 280;
  SSL_F_DTLS1_BUFFER_RECORD = 247;
  SSL_F_DTLS1_CLIENT_HELLO = 248;
  SSL_F_DTLS1_CONNECT = 249;
  SSL_F_DTLS1_ENC = 250;
  SSL_F_DTLS1_GET_HELLO_VERIFY = 251;
  SSL_F_DTLS1_GET_MESSAGE = 252;
  SSL_F_DTLS1_GET_MESSAGE_FRAGMENT = 253;
  SSL_F_DTLS1_GET_RECORD = 254;
  SSL_F_DTLS1_HANDLE_TIMEOUT = 282;
  SSL_F_DTLS1_OUTPUT_CERT_CHAIN = 255;
  SSL_F_DTLS1_PREPROCESS_FRAGMENT = 277;
  SSL_F_DTLS1_PROCESS_OUT_OF_SEQ_MESSAGE = 256;
  SSL_F_DTLS1_PROCESS_RECORD = 257;
  SSL_F_DTLS1_READ_BYTES = 258;
  SSL_F_DTLS1_READ_FAILED = 259;
  SSL_F_DTLS1_SEND_CERTIFICATE_REQUEST = 260;
  SSL_F_DTLS1_SEND_CLIENT_CERTIFICATE = 261;
  SSL_F_DTLS1_SEND_CLIENT_KEY_EXCHANGE = 262;
  SSL_F_DTLS1_SEND_CLIENT_VERIFY = 263;
  SSL_F_DTLS1_SEND_HELLO_VERIFY_REQUEST = 264;
  SSL_F_DTLS1_SEND_SERVER_CERTIFICATE = 265;
  SSL_F_DTLS1_SEND_SERVER_HELLO = 266;
  SSL_F_DTLS1_SEND_SERVER_KEY_EXCHANGE = 267;
  SSL_F_DTLS1_WRITE_APP_DATA_BYTES = 268;
  SSL_F_GET_CLIENT_FINISHED = 105;
  SSL_F_GET_CLIENT_HELLO = 106;
  SSL_F_GET_CLIENT_MASTER_KEY = 107;
  SSL_F_GET_SERVER_FINISHED = 108;
  SSL_F_GET_SERVER_HELLO = 109;
  SSL_F_GET_SERVER_VERIFY = 110;
  SSL_F_I2D_SSL_SESSION = 111;
  SSL_F_READ_N = 112;
  SSL_F_REQUEST_CERTIFICATE = 113;
  SSL_F_SERVER_HELLO = 114;
  SSL_F_SSL23_ACCEPT = 115;
  SSL_F_SSL3_ADD_CERT_TO_BUF = 281;

  SSL_F_SSL23_CLIENT_HELLO = 116;
  SSL_F_SSL23_CONNECT = 117;
  SSL_F_SSL23_GET_CLIENT_HELLO = 118;
  SSL_F_SSL23_GET_SERVER_HELLO = 119;
  SSL_F_SSL23_READ = 120;
  SSL_F_SSL23_WRITE = 121;
  SSL_F_SSL2_ACCEPT = 122;
  SSL_F_SSL2_CONNECT = 123;
  SSL_F_SSL2_ENC_INIT = 124;
  SSL_F_SSL2_READ = 125;
  SSL_F_SSL2_SET_CERTIFICATE = 126;
  SSL_F_SSL2_WRITE = 127;
  SSL_F_SSL3_ACCEPT = 128;
  SSL_F_SSL3_CHANGE_CIPHER_STATE = 129;
  SSL_F_SSL3_CHECK_CERT_AND_ALGORITHM = 130;
  SSL_F_SSL3_CLIENT_HELLO = 131;
  SSL_F_SSL3_CONNECT = 132;
  SSL_F_SSL3_CTRL = 213;
  SSL_F_SSL3_CTX_CTRL = 133;
  SSL_F_SSL3_DO_CHANGE_CIPHER_SPEC = 279;
  SSL_F_SSL3_ENC = 134;
  SSL_F_SSL3_GET_CERTIFICATE_REQUEST = 135;
  SSL_F_SSL3_GET_CERT_STATUS = 288;
  SSL_F_SSL3_GET_CERT_VERIFY = 136;
  SSL_F_SSL3_GET_CLIENT_CERTIFICATE = 137;
  SSL_F_SSL3_GET_CLIENT_HELLO = 138;
  SSL_F_SSL3_GET_CLIENT_KEY_EXCHANGE = 139;
  SSL_F_SSL3_GET_FINISHED = 140;
  SSL_F_SSL3_GET_KEY_EXCHANGE = 141;
  SSL_F_SSL3_GET_MESSAGE = 142;
  SSL_F_SSL3_GET_NEW_SESSION_TICKET = 283;
  SSL_F_SSL3_GET_RECORD = 143;
  SSL_F_SSL3_GET_SERVER_CERTIFICATE = 144;
  SSL_F_SSL3_GET_SERVER_DONE = 145;
  SSL_F_SSL3_GET_SERVER_HELLO = 146;
  SSL_F_SSL3_NEW_SESSION_TICKET = 284;
  SSL_F_SSL3_OUTPUT_CERT_CHAIN = 147;
  SSL_F_SSL3_READ_BYTES = 148;
  SSL_F_SSL3_READ_N = 149;
  SSL_F_SSL3_SEND_CERTIFICATE_REQUEST = 150;
  SSL_F_SSL3_SEND_CLIENT_CERTIFICATE = 151;
  SSL_F_SSL3_SEND_CLIENT_KEY_EXCHANGE = 152;
  SSL_F_SSL3_SEND_CLIENT_VERIFY = 153;
  SSL_F_SSL3_SEND_SERVER_CERTIFICATE = 154;
  SSL_F_SSL3_SEND_SERVER_KEY_EXCHANGE = 155;
  SSL_F_SSL3_SETUP_BUFFERS = 156;
  SSL_F_SSL3_SETUP_KEY_BLOCK = 157;
  SSL_F_SSL3_WRITE_BYTES = 158;
  SSL_F_SSL3_WRITE_PENDING = 159;
  SSL_F_SSL_ADD_CLIENTHELLO_RENEGOTIATE_EXT = 285;
  SSL_F_SSL_ADD_CLIENTHELLO_TLSEXT = 272;
  SSL_F_SSL_ADD_DIR_CERT_SUBJECTS_TO_STACK = 215;
  SSL_F_SSL_ADD_FILE_CERT_SUBJECTS_TO_STACK = 216;
  SSL_F_SSL_ADD_SERVERHELLO_RENEGOTIATE_EXT = 286;
  SSL_F_SSL_ADD_SERVERHELLO_TLSEXT = 273;
  SSL_F_SSL_BAD_METHOD = 160;
  SSL_F_SSL_BYTES_TO_CIPHER_LIST = 161;
  SSL_F_SSL_CERT_DUP = 221;
  SSL_F_SSL_CERT_INST = 222;
  SSL_F_SSL_CERT_INSTANTIATE = 214;
  SSL_F_SSL_CERT_NEW = 162;
  SSL_F_SSL_CHECK_PRIVATE_KEY = 163;
  SSL_F_SSL_CHECK_SERVERHELLO_TLSEXT = 274;
  SSL_F_SSL_CIPHER_PROCESS_RULESTR = 230;
  SSL_F_SSL_CIPHER_STRENGTH_SORT = 231;
  SSL_F_SSL_CLEAR = 164;
  SSL_F_SSL_COMP_ADD_COMPRESSION_METHOD = 165;
  SSL_F_SSL_CREATE_CIPHER_LIST = 166;
  SSL_F_SSL_CTRL = 232;
  SSL_F_SSL_CTX_CHECK_PRIVATE_KEY = 168;
  SSL_F_SSL_CTX_NEW = 169;
  SSL_F_SSL_CTX_SET_CIPHER_LIST = 269;
  SSL_F_SSL_CTX_SET_CLIENT_CERT_ENGINE = 278;
  SSL_F_SSL_CTX_SET_PURPOSE = 226;
  SSL_F_SSL_CTX_SET_SESSION_ID_CONTEXT = 219;
  SSL_F_SSL_CTX_SET_SSL_VERSION = 170;
  SSL_F_SSL_CTX_SET_TRUST	= 229;
  SSL_F_SSL_CTX_USE_CERTIFICATE = 171;
  SSL_F_SSL_CTX_USE_CERTIFICATE_ASN1 = 172;
  SSL_F_SSL_CTX_USE_CERTIFICATE_CHAIN_FILE = 220;
  SSL_F_SSL_CTX_USE_CERTIFICATE_FILE = 173;
  SSL_F_SSL_CTX_USE_PRIVATEKEY = 174;
  SSL_F_SSL_CTX_USE_PRIVATEKEY_ASN1 = 175;
  SSL_F_SSL_CTX_USE_PRIVATEKEY_FILE = 176;
  SSL_F_SSL_CTX_USE_RSAPRIVATEKEY = 177;
  SSL_F_SSL_CTX_USE_RSAPRIVATEKEY_ASN1 = 178;
  SSL_F_SSL_CTX_USE_RSAPRIVATEKEY_FILE = 179;
  SSL_F_SSL_DO_HANDSHAKE = 180;
  SSL_F_SSL_GET_NEW_SESSION = 181;
  SSL_F_SSL_GET_PREV_SESSION = 217;
  SSL_F_SSL_GET_SERVER_SEND_CERT = 182;
  SSL_F_SSL_GET_SIGN_PKEY = 183;
  SSL_F_SSL_INIT_WBIO_BUFFER = 184;
  SSL_F_SSL_LOAD_CLIENT_CA_FILE = 185;
  SSL_F_SSL_NEW = 186;
  SSL_F_SSL_PARSE_CLIENTHELLO_RENEGOTIATE_EXT = 287;
  SSL_F_SSL_PARSE_CLIENTHELLO_TLSEXT = 290;
  SSL_F_SSL_PARSE_SERVERHELLO_RENEGOTIATE_EXT	= 289;
  SSL_F_SSL_PARSE_SERVERHELLO_TLSEXT = 291;
  SSL_F_SSL_PEEK = 270;
  SSL_F_SSL_PREPARE_CLIENTHELLO_TLSEXT = 275;
  SSL_F_SSL_PREPARE_SERVERHELLO_TLSEXT = 276;
  SSL_F_SSL_READ = 223;
  SSL_F_SSL_RSA_PRIVATE_DECRYPT = 187;
  SSL_F_SSL_RSA_PUBLIC_ENCRYPT = 188;
  SSL_F_SSL_SESSION_NEW = 189;
  SSL_F_SSL_SESSION_PRINT_FP = 190;
  SSL_F_SSL_SESS_CERT_NEW = 225;
  SSL_F_SSL_SET_CERT = 191;
  SSL_F_SSL_SET_FD = 192;
  SSL_F_SSL_SET_PKEY = 193;
  SSL_F_SSL_SET_RFD = 194;
  SSL_F_SSL_SET_SESSION = 195;
  SSL_F_SSL_SET_SESSION_ID_CONTEXT = 218;
  SSL_F_SSL_SET_WFD = 196;
  SSL_F_SSL_SHUTDOWN = 224;
  SSL_F_SSL_UNDEFINED_FUNCTION = 197;
  SSL_F_SSL_USE_CERTIFICATE = 198;
  SSL_F_SSL_USE_CERTIFICATE_ASN1 = 199;
  SSL_F_SSL_USE_CERTIFICATE_FILE = 200;
  SSL_F_SSL_USE_PRIVATEKEY = 201;
  SSL_F_SSL_USE_PRIVATEKEY_ASN1 = 202;
  SSL_F_SSL_USE_PRIVATEKEY_FILE = 203;
  SSL_F_SSL_USE_RSAPRIVATEKEY = 204;
  SSL_F_SSL_USE_RSAPRIVATEKEY_ASN1 = 205;
  SSL_F_SSL_USE_RSAPRIVATEKEY_FILE = 206;
  SSL_F_SSL_VERIFY_CERT_CHAIN = 207;
  SSL_F_SSL_WRITE = 208;
  SSL_F_TLS1_CHANGE_CIPHER_STATE = 209;
  SSL_F_TLS1_ENC = 210;
  SSL_F_TLS1_SETUP_KEY_BLOCK = 211;
  SSL_F_WRITE_PENDING = 212;
  SSL_MAX_KEY_ARG_LENGTH = 8;
  SSL_MAX_MASTER_KEY_LENGTH = 48;
  SSL_MAX_SID_CTX_LENGTH = 32;
  SSL_MAX_KRB5_PRINCIPAL_LENGTH = 256;
  SSL_MAX_SSL_SESSION_ID_LENGTH = 32;
  SSL_MODE_ENABLE_PARTIAL_WRITE       = $00000001;
  SSL_MODE_ACCEPT_MOVING_WRITE_BUFFER = $00000002;
  SSL_MODE_AUTO_RETRY                 = $00000004;
  SSL_MODE_NO_AUTO_CHAIN              = $00000008;
  SSL_NOTHING = 1;
  SSL_OP_MICROSOFT_SESS_ID_BUG = $00000001;
  SSL_OP_NETSCAPE_CHALLENGE_BUG = $00000002;
//* Allow initial connection to servers that don't support RI */
  SSL_OP_LEGACY_SERVER_CONNECT = $00000004;

  SSL_OP_NETSCAPE_REUSE_CIPHER_CHANGE_BUG = $00000008;
  SSL_OP_SSLREF2_REUSE_CERT_TYPE_BUG = $00000010;
  SSL_OP_MICROSOFT_BIG_SSLV3_BUFFER  = $00000020;
  SSL_OP_MSIE_SSLV2_RSA_PADDING      = $00000040;
  SSL_OP_SSLEAY_080_CLIENT_DH_BUG    = $00000080;
  SSL_OP_TLS_D5_BUG                  = $00000100;
  SSL_OP_TLS_BLOCK_PADDING_BUG       = $00000200;
  SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS = $00000800;
  SSL_OP_ALL                         = $00000FFF; //this was $000FFFFF; before 0.9.7
  SSL_OP_NO_QUERY_MTU                           = $00001000;
  SSL_OP_COOKIE_EXCHANGE                        = $00002000;
  SSL_OP_NO_TICKET                              = $00004000;
//* Use Cisco's "speshul" version of DTLS_BAD_VER (as client)  */
  SSL_OP_CISCO_ANYCONNECT	= $00008000;
  SSL_OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION = $00010000;
//* Permit unsafe legacy renegotiation */
  SSL_OP_ALLOW_UNSAFE_LEGACY_RENEGOTIATION      = $00040000;

  SSL_OP_SINGLE_ECDH_USE                        = $00080000;
  SSL_OP_SINGLE_DH_USE                          = $00100000;
  SSL_OP_EPHEMERAL_RSA                          = $00200000;
  SSL_OP_CIPHER_SERVER_PREFERENCE               = $00400000;
  SSL_OP_TLS_ROLLBACK_BUG                       = $00800000; //was $00000400;
  SSL_OP_NO_SSLv2 = $01000000;
  SSL_OP_NO_SSLv3 = $02000000;
  SSL_OP_NO_TLSv1 = $04000000;
  SSL_OP_PKCS1_CHECK_1 = $08000000;
  SSL_OP_PKCS1_CHECK_2 = $10000000;
  SSL_OP_NETSCAPE_CA_DN_BUG = $20000000;
  //OPENSSL_SSL_OP_NON_EXPORT_FIRST was removed for OpenSSL 0.9.7 (that was $40000000;)
  SSL_OP_NETSCAPE_DEMO_CIPHER_CHANGE_BUG = $40000000;// was $80000000;
  SSL_READING = 3;
  SSL_RECEIVED_SHUTDOWN = 2;
  SSL_R_APP_DATA_IN_HANDSHAKE = 100;
  SSL_R_ATTEMPT_TO_REUSE_SESSION_IN_DIFFERENT_CONTEXT = 272;
  SSL_R_BAD_ALERT_RECORD = 101;
  SSL_R_BAD_AUTHENTICATION_TYPE = 102;
  SSL_R_BAD_CHANGE_CIPHER_SPEC = 103;
  SSL_R_BAD_CHECKSUM = 104;
  SSL_R_BAD_CLIENT_REQUEST = 105;
  SSL_R_BAD_DATA_RETURNED_BY_CALLBACK = 106;
  SSL_R_BAD_DECOMPRESSION = 107;
  SSL_R_BAD_DH_G_LENGTH = 108;
  SSL_R_BAD_DH_PUB_KEY_LENGTH = 109;
  SSL_R_BAD_DH_P_LENGTH = 110;
  SSL_R_BAD_DIGEST_LENGTH = 111;
  SSL_R_BAD_DSA_SIGNATURE = 112;
  SSL_R_BAD_LENGTH = 271;
  SSL_R_BAD_MAC_DECODE = 113;
  SSL_R_BAD_MESSAGE_TYPE = 114;
  SSL_R_BAD_PACKET_LENGTH = 115;
  SSL_R_BAD_PROTOCOL_VERSION_NUMBER = 116;
  SSL_R_BAD_RESPONSE_ARGUMENT = 117;
  SSL_R_BAD_RSA_DECRYPT = 118;
  SSL_R_BAD_RSA_ENCRYPT = 119;
  SSL_R_BAD_RSA_E_LENGTH = 120;
  SSL_R_BAD_RSA_MODULUS_LENGTH = 121;
  SSL_R_BAD_RSA_SIGNATURE = 122;
  SSL_R_BAD_SIGNATURE = 123;
  SSL_R_BAD_SSL_FILETYPE = 124;
  SSL_R_BAD_SSL_SESSION_ID_LENGTH = 125;
  SSL_R_BAD_STATE = 126;
  SSL_R_BAD_WRITE_RETRY = 127;
  SSL_R_BIO_NOT_SET = 128;
  SSL_R_BLOCK_CIPHER_PAD_IS_WRONG = 129;
  SSL_R_BN_LIB = 130;
  SSL_R_CA_DN_LENGTH_MISMATCH = 131;
  SSL_R_CA_DN_TOO_LONG = 132;
  SSL_R_CCS_RECEIVED_EARLY = 133;
  SSL_R_CERTIFICATE_VERIFY_FAILED = 134;
  SSL_R_CERT_LENGTH_MISMATCH = 135;
  SSL_R_CHALLENGE_IS_DIFFERENT = 136;
  SSL_R_CIPHER_CODE_WRONG_LENGTH = 137;
  SSL_R_CIPHER_OR_HASH_UNAVAILABLE = 138;
  SSL_R_CIPHER_TABLE_SRC_ERROR = 139;
  SSL_R_CLIENTHELLO_TLSEXT = 157;
  SSL_R_COMPRESSED_LENGTH_TOO_LONG = 140;
  SSL_R_COMPRESSION_FAILURE = 141;
  SSL_R_COMPRESSION_LIBRARY_ERROR = 142;
  SSL_R_CONNECTION_ID_IS_DIFFERENT = 143;
  SSL_R_CONNECTION_TYPE_NOT_SET = 144;
  SSL_R_DATA_BETWEEN_CCS_AND_FINISHED = 145;
  SSL_R_DATA_LENGTH_TOO_LONG = 146;
  SSL_R_DECRYPTION_FAILED = 147;
  SSL_R_DH_PUBLIC_VALUE_LENGTH_IS_WRONG = 148;
  SSL_R_DIGEST_CHECK_FAILED = 149;
  SSL_R_DTLS_MESSAGE_TOO_BIG = 318;

  SSL_R_ENCRYPTED_LENGTH_TOO_LONG = 150;
  SSL_R_ERROR_IN_RECEIVED_CIPHER_LIST = 151;
  SSL_R_EXCESSIVE_MESSAGE_SIZE = 152;
  SSL_R_EXTRA_DATA_IN_MESSAGE = 153;
  SSL_R_GOT_A_FIN_BEFORE_A_CCS = 154;
  SSL_R_HTTPS_PROXY_REQUEST = 155;
  SSL_R_HTTP_REQUEST = 156;
  SSL_R_INTERNAL_ERROR = 157;
  SSL_R_INVALID_CHALLENGE_LENGTH = 158;
  SSL_R_INVALID_COMMAND = 280;
  SSL_R_INVALID_PURPOSE = 278;
  SSL_R_INVALID_STATUS_RESPONSE = 316;
  SSL_R_INVALID_TICKET_KEYS_LENGTH = 275;
  SSL_R_INVALID_TRUST = 279;
  SSL_R_LENGTH_MISMATCH = 159;
  SSL_R_LENGTH_TOO_SHORT = 160;
  SSL_R_LIBRARY_BUG = 274;
  SSL_R_LIBRARY_HAS_NO_CIPHERS = 161;
  SSL_R_MISSING_DH_DSA_CERT = 162;
  SSL_R_MISSING_DH_KEY = 163;
  SSL_R_MISSING_DH_RSA_CERT = 164;
  SSL_R_MISSING_DSA_SIGNING_CERT = 165;
  SSL_R_MISSING_EXPORT_TMP_DH_KEY = 166;
  SSL_R_MISSING_EXPORT_TMP_RSA_KEY = 167;
  SSL_R_MISSING_RSA_CERTIFICATE = 168;
  SSL_R_MISSING_RSA_ENCRYPTING_CERT = 169;
  SSL_R_MISSING_RSA_SIGNING_CERT = 170;
  SSL_R_MISSING_TMP_DH_KEY = 171;
  SSL_R_MISSING_TMP_RSA_KEY = 172;
  SSL_R_MISSING_TMP_RSA_PKEY = 173;
  SSL_R_MISSING_VERIFY_MESSAGE = 174;
  SSL_R_NON_SSLV2_INITIAL_PACKET = 175;
  SSL_R_NO_CERTIFICATES_RETURNED = 176;
  SSL_R_NO_CERTIFICATE_ASSIGNED = 177;
  SSL_R_NO_CERTIFICATE_RETURNED = 178;
  SSL_R_NO_CERTIFICATE_SET = 179;
  SSL_R_NO_CERTIFICATE_SPECIFIED = 180;
  SSL_R_NO_CIPHERS_AVAILABLE = 181;
  SSL_R_NO_CIPHERS_PASSED = 182;
  SSL_R_NO_CIPHERS_SPECIFIED = 183;
  SSL_R_NO_CIPHER_LIST = 184;
  SSL_R_NO_CIPHER_MATCH = 185;
  SSL_R_NO_CLIENT_CERT_METHOD	= 317;
  SSL_R_NO_CLIENT_CERT_RECEIVED = 186;
  SSL_R_NO_COMPRESSION_SPECIFIED = 187;
  SSL_R_NO_METHOD_SPECIFIED = 188;
  SSL_R_NO_PRIVATEKEY = 189;
  SSL_R_NO_PRIVATE_KEY_ASSIGNED = 190;
  SSL_R_NO_PROTOCOLS_AVAILABLE = 191;
  SSL_R_NO_PUBLICKEY = 192;
  //was 318
  SSL_R_NO_RENEGOTIATION = 319;
  SSL_R_NO_SHARED_CIPHER = 193;
  SSL_R_NO_VERIFY_CALLBACK = 194;
  SSL_R_NULL_SSL_CTX = 195;
  SSL_R_NULL_SSL_METHOD_PASSED = 196;
  SSL_R_OLD_SESSION_CIPHER_NOT_RETURNED = 197;
  SSL_R_ONLY_TLS_ALLOWED_IN_FIPS_MODE = 297;
  SSL_R_PACKET_LENGTH_TOO_LONG = 198;
  SSL_R_PARSE_TLSEXT = 223;
  SSL_R_PATH_TOO_LONG = 270;
  SSL_R_PEER_DID_NOT_RETURN_A_CERTIFICATE = 199;
  SSL_R_PEER_ERROR = 200;
  SSL_R_PEER_ERROR_CERTIFICATE = 201;
  SSL_R_PEER_ERROR_NO_CERTIFICATE = 202;
  SSL_R_PEER_ERROR_NO_CIPHER = 203;
  SSL_R_PEER_ERROR_UNSUPPORTED_CERTIFICATE_TYPE = 204;
  SSL_R_PRE_MAC_LENGTH_TOO_LONG = 205;
  SSL_R_PROBLEMS_MAPPING_CIPHER_FUNCTIONS = 206;
  SSL_R_PROTOCOL_IS_SHUTDOWN = 207;
  SSL_R_PUBLIC_KEY_ENCRYPT_ERROR = 208;
  SSL_R_PUBLIC_KEY_IS_NOT_RSA = 209;
  SSL_R_PUBLIC_KEY_NOT_RSA = 210;
  SSL_R_READ_BIO_NOT_SET = 211;
  SSL_R_READ_WRONG_PACKET_TYPE = 212;
  SSL_R_RECORD_LENGTH_MISMATCH = 213;
  SSL_R_RECORD_TOO_LARGE = 214;
  SSL_R_RECORD_TOO_SMALL = 298;
  SSL_R_RENEGOTIATE_EXT_TOO_LONG = 320;
  SSL_R_RENEGOTIATION_ENCODING_ERR = 321;
  SSL_R_RENEGOTIATION_MISMATCH = 322;
  SSL_R_REQUIRED_CIPHER_MISSING = 215;
  SSL_R_REUSE_CERT_LENGTH_NOT_ZERO = 216;
  SSL_R_REUSE_CERT_TYPE_NOT_ZERO = 217;
  SSL_R_REUSE_CIPHER_LIST_NOT_ZERO = 218;
  SSL_R_SCSV_RECEIVED_WHEN_RENEGOTIATING = 324;
  SSL_R_SERVERHELLO_TLSEXT = 224;
  SSL_R_SESSION_ID_CONTEXT_UNINITIALIZED = 277;
  SSL_R_SHORT_READ = 219;
  SSL_R_SIGNATURE_FOR_NON_SIGNING_CERTIFICATE = 220;
  SSL_R_SSL23_DOING_SESSION_ID_REUSE = 221;
  SSL_R_SSL2_CONNECTION_ID_TOO_LONG = 299;
  SSL_R_SSL3_EXT_INVALID_SERVERNAME = 225;
  SSL_R_SSL3_EXT_INVALID_SERVERNAME_TYPE = 226;
  SSL_R_SSL3_SESSION_ID_TOO_LONG = 300;
  SSL_R_SSL3_SESSION_ID_TOO_SHORT = 222;
  SSL_R_SSLV3_ALERT_BAD_CERTIFICATE = 1042;
  SSL_R_SSLV3_ALERT_BAD_RECORD_MAC = 1020;
  SSL_R_SSLV3_ALERT_CERTIFICATE_EXPIRED = 1045;
  SSL_R_SSLV3_ALERT_CERTIFICATE_REVOKED = 1044;
  SSL_R_SSLV3_ALERT_CERTIFICATE_UNKNOWN = 1046;
  SSL_R_SSLV3_ALERT_DECOMPRESSION_FAILURE = 1030;
  SSL_R_SSLV3_ALERT_HANDSHAKE_FAILURE = 1040;
  SSL_R_SSLV3_ALERT_ILLEGAL_PARAMETER = 1047;
  SSL_R_SSLV3_ALERT_NO_CERTIFICATE = 1041;
  SSL_R_SSLV3_ALERT_PEER_ERROR_CERTIFICATE = 223;
  SSL_R_SSLV3_ALERT_PEER_ERROR_NO_CERTIFICATE = 224;
  SSL_R_SSLV3_ALERT_PEER_ERROR_NO_CIPHER = 225;
  SSL_R_SSLV3_ALERT_PEER_ERROR_UNSUPPORTED_CERTIFICATE_TYPE = 226;
  SSL_R_SSLV3_ALERT_UNEXPECTED_MESSAGE = 1010;
  SSL_R_SSLV3_ALERT_UNKNOWN_REMOTE_ERROR_TYPE = 227;
  SSL_R_SSLV3_ALERT_UNSUPPORTED_CERTIFICATE = 1043;
  SSL_R_SSL_CTX_HAS_NO_DEFAULT_SSL_VERSION = 228;
  SSL_R_SSL_HANDSHAKE_FAILURE = 229;
  SSL_R_SSL_LIBRARY_HAS_NO_CIPHERS = 230;
  SSL_R_SSL_SESSION_ID_CONTEXT_TOO_LONG = 273;
  SSL_R_SSL_SESSION_ID_IS_DIFFERENT = 231;
  SSL_R_TLSV1_ALERT_ACCESS_DENIED = 1049;
  SSL_R_TLSV1_ALERT_DECODE_ERROR = 1050;
  SSL_R_TLSV1_ALERT_DECRYPTION_FAILED = 1021;
  SSL_R_TLSV1_ALERT_DECRYPT_ERROR = 1051;
  SSL_R_TLSV1_ALERT_EXPORT_RESTRICION = 1060;
  SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY = 1071;
  SSL_R_TLSV1_ALERT_INTERNAL_ERROR = 1080;
  SSL_R_TLSV1_ALERT_NO_RENEGOTIATION = 1100;
  SSL_R_TLSV1_ALERT_PROTOCOL_VERSION = 1070;
  SSL_R_TLSV1_ALERT_RECORD_OVERFLOW = 1022;
  SSL_R_TLSV1_ALERT_UNKNOWN_CA = 1048;
  SSL_R_TLSV1_ALERT_USER_CANCLED = 1090;
  SSL_R_TLS_CLIENT_CERT_REQ_WITH_ANON_CIPHER = 232;
  SSL_R_TLS_INVALID_ECPOINTFORMAT_LIST = 227;
  SSL_R_TLS_PEER_DID_NOT_RESPOND_WITH_CERTIFICATE_LIST = 233;
  SSL_R_TLS_RSA_ENCRYPTED_VALUE_LENGTH_IS_WRONG = 234;
  SSL_R_TRIED_TO_USE_UNSUPPORTED_CIPHER = 235;
  SSL_R_UNABLE_TO_DECODE_DH_CERTS = 236;
  SSL_R_UNABLE_TO_EXTRACT_PUBLIC_KEY = 237;
  SSL_R_UNABLE_TO_FIND_DH_PARAMETERS = 238;
  SSL_R_UNABLE_TO_FIND_PUBLIC_KEY_PARAMETERS = 239;
  SSL_R_UNABLE_TO_FIND_SSL_METHOD = 240;
  SSL_R_UNABLE_TO_LOAD_SSL2_MD5_ROUTINES = 241;
  SSL_R_UNABLE_TO_LOAD_SSL3_MD5_ROUTINES = 242;
  SSL_R_UNABLE_TO_LOAD_SSL3_SHA1_ROUTINES = 243;
  SSL_R_UNEXPECTED_MESSAGE = 244;
  SSL_R_UNEXPECTED_RECORD = 245;
  SSL_R_UNINITIALIZED = 276;
  SSL_R_UNKNOWN_ALERT_TYPE = 246;
  SSL_R_UNKNOWN_CERTIFICATE_TYPE = 247;
  SSL_R_UNKNOWN_CIPHER_RETURNED = 248;
  SSL_R_UNKNOWN_CIPHER_TYPE = 249;
  SSL_R_UNKNOWN_KEY_EXCHANGE_TYPE = 250;
  SSL_R_UNKNOWN_PKEY_TYPE = 251;
  SSL_R_UNKNOWN_PROTOCOL = 252;
  SSL_R_UNKNOWN_REMOTE_ERROR_TYPE = 253;
  SSL_R_UNKNOWN_SSL_VERSION = 254;
  SSL_R_UNSUPPORTED_STATUS_TYPE = 329;
  SSL_R_UNKNOWN_STATE = 255;
  SSL_R_UNSAFE_LEGACY_RENEGOTIATION_DISABLED = 323;
  SSL_R_UNSUPPORTED_CIPHER = 256;
  SSL_R_UNSUPPORTED_COMPRESSION_ALGORITHM = 257;
  SSL_R_UNSUPPORTED_PROTOCOL = 258;
  SSL_R_UNSUPPORTED_SSL_VERSION = 259;
  SSL_R_WRITE_BIO_NOT_SET = 260;
  SSL_R_WRONG_CIPHER_RETURNED = 261;
  SSL_R_WRONG_MESSAGE_TYPE = 262;
  SSL_R_WRONG_NUMBER_OF_KEY_BITS = 263;
  SSL_R_WRONG_SIGNATURE_LENGTH = 264;
  SSL_R_WRONG_SIGNATURE_SIZE = 265;
  SSL_R_WRONG_SSL_VERSION = 266;
  SSL_R_WRONG_VERSION_NUMBER = 267;
  SSL_R_X509_LIB = 268;
  SSL_R_X509_VERIFICATION_SETUP_PROBLEMS = 269;
  SSL_SENT_SHUTDOWN = 1;
  SSL_SESSION_ASN1_VERSION = $0001;
  SSL_SESSION_CACHE_MAX_SIZE_DEFAULT = 1024*20;
  SSL_SESS_CACHE_CLIENT = $0001;
  SSL_SESS_CACHE_SERVER = $0002;
  SSL_SESS_CACHE_BOTH = SSL_SESS_CACHE_CLIENT or SSL_SESS_CACHE_SERVER;
  SSL_SESS_CACHE_NO_AUTO_CLEAR = $0080;
  SSL_SESS_CACHE_NO_INTERNAL_LOOKUP = $0100;
  SSL_SESS_CACHE_OFF = $0000;
  SSL_ST_BEFORE = $4000;
  SSL_ST_INIT = SSL_ST_CONNECT or SSL_ST_ACCEPT;
  SSL_ST_MASK = $0FFF;
  SSL_ST_OK = $03;
  SSL_ST_READ_BODY = $F1;
  SSL_ST_READ_DONE = $F2;
  SSL_ST_READ_HEADER = $F0;
  SSL_ST_RENEGOTIATE = $04 or SSL_ST_INIT;
  SSL_TXT_LOW = 'LOW';  {Do not localize}
  SSL_TXT_MEDIUM = 'MEDIUM';  {Do not localize}
  SSL_TXT_HIGH = 'HIGH';  {Do not localize}
  SSL_TXT_FIPS = 'FIPS';  {Do not localize}
  SSL_TXT_kFZA = 'kFZA';  {Do not localize}
  SSL_TXT_aFZA = 'aFZA';  {Do not localize}
  SSL_TXT_eFZA = 'eFZA';  {Do not localize}
  SSL_TXT_FZA = 'FZA';  {Do not localize}
  SSL_TXT_aNULL = 'aNULL';  {Do not localize}
  SSL_TXT_eNULL = 'eNULL';  {Do not localize}
  SSL_TXT_NULL = 'NULL';  {Do not localize}
  SSL_TXT_kKRB5    = 'kKRB5';{Do not localize}
  SSL_TXT_aKRB5     ='aKRB5';{Do not localize}
  SSL_TXT_KRB5      = 'KRB5';{Do not localize}
  SSL_TXT_kRSA = 'kRSA';  {Do not localize}
  SSL_TXT_kDHr = 'kDHr';  {Do not localize}
  SSL_TXT_kDHd = 'kDHd';  {Do not localize}
  SSL_TXT_kEDH = 'kEDH';  {Do not localize}
  SSL_TXT_aRSA = 'aRSA';  {Do not localize}
  SSL_TXT_aDSS = 'aDSS';  {Do not localize}
  SSL_TXT_aDH	= 'aDH';  {Do not localize}
  SSL_TXT_RSA = 'RSA';  {Do not localize}
  SSL_TXT_DH = 'DH';  {Do not localize}
  SSL_TXT_EDH = 'EDH';  {Do not localize}
  SSL_TXT_ADH_C = 'ADH';  {Do not localize}
  SSL_TXT_aDH_S = 'aDH';  {Do not localize}
  SSL_TXT_DSS = 'DSS';  {Do not localize}
  SSL_TXT_DES = 'DES';  {Do not localize}
  SSL_TXT_3DES = '3DES';  {Do not localize}
  SSL_TXT_RC4 = 'RC4';  {Do not localize}
  SSL_TXT_RC2 = 'RC2';  {Do not localize}
  SSL_TXT_IDEA = 'IDEA';  {Do not localize}
  SSL_TXT_SEED = 'SEED';  {Do not localize}
  SSL_TXT_AES = 'AES'; {Do not localize}
  SSL_TXT_CAMELLIA = 'CAMELLIA'; {Do not localize}
  SSL_TXT_MD5 = 'MD5';  {Do not localize}
  SSL_TXT_SHA1 = 'SHA1';  {Do not localize}
  SSL_TXT_SHA = 'SHA';  {Do not localize}
  SSL_TXT_EXP = 'EXP'; {Do not localize}
  SSL_TXT_EXPORT = 'EXPORT';  {Do not localize}
  SSL_TXT_EXP40 = 'EXPORT40';  {Do not localize}
  SSL_TXT_EXP56 = 'EXPORT56';  {Do not localize}
  SSL_TXT_SSLV2 = 'SSLv2';  {Do not localize}
  SSL_TXT_SSLV3 = 'SSLv3';  {Do not localize}
  SSL_TXT_TLSV1 = 'TLSv1';  {Do not localize}
  SSL_TXT_ALL = 'ALL';  {Do not localize}
  SSL_TXT_ECC = 'ECCdraft'; //* ECC ciphersuites are not yet official */
  SSL_TXT_DES_192_EDE3_CBC_WITH_MD5 = SSL2_TXT_DES_192_EDE3_CBC_WITH_MD5;
  SSL_TXT_DES_192_EDE3_CBC_WITH_SHA = SSL2_TXT_DES_192_EDE3_CBC_WITH_SHA;
  SSL_TXT_DES_64_CBC_WITH_MD5 = SSL2_TXT_DES_64_CBC_WITH_MD5;
  SSL_TXT_DES_64_CBC_WITH_SHA = SSL2_TXT_DES_64_CBC_WITH_SHA;
  SSL_TXT_IDEA_128_CBC_WITH_MD5 = SSL2_TXT_IDEA_128_CBC_WITH_MD5;
  SSL_TXT_NULL_WITH_MD5 = SSL2_TXT_NULL_WITH_MD5;
  SSL_TXT_RC2_128_CBC_EXPORT40_WITH_MD5 = SSL2_TXT_RC2_128_CBC_EXPORT40_WITH_MD5;
  SSL_TXT_RC2_128_CBC_WITH_MD5 = SSL2_TXT_RC2_128_CBC_WITH_MD5;
  SSL_TXT_RC4_128_EXPORT40_WITH_MD5 = SSL2_TXT_RC4_128_EXPORT40_WITH_MD5;
  SSL_TXT_RC4_128_WITH_MD5 = SSL2_TXT_RC4_128_WITH_MD5;
  SSL_VERIFY_CLIENT_ONCE = $04;
  SSL_VERIFY_FAIL_IF_NO_PEER_CERT = $02;
  SSL_VERIFY_NONE = $00;
  SSL_VERIFY_PEER = $01;
  SSL_WRITING = 2;
  SSL_X509_LOOKUP = 4;
  TLS1_ALLOW_EXPERIMENTAL_CIPHERSUITES = 0;
  TLS1_VERSION = $0301;
  TLS1_VERSION_MAJOR = $03;
  TLS1_VERSION_MINOR = $01;
  TLS1_CK_RSA_EXPORT1024_WITH_RC4_56_MD5 = $03000060;
  TLS1_CK_RSA_EXPORT1024_WITH_RC2_CBC_56_MD5 = $03000061;
  TLS1_CK_RSA_EXPORT1024_WITH_DES_CBC_SHA = $03000062;
  TLS1_CK_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA = $03000063;
  TLS1_CK_RSA_EXPORT1024_WITH_RC4_56_SHA = $03000064;
  TLS1_CK_DHE_DSS_EXPORT1024_WITH_RC4_56_SHA = $03000065;
  TLS1_CK_DHE_DSS_WITH_RC4_128_SHA = $03000066;
//* AES ciphersuites from RFC3268 */
  TLS1_CK_RSA_WITH_AES_128_SHA = $0300002F;
  TLS1_CK_DH_DSS_WITH_AES_128_SHA  = $03000030;
  TLS1_CK_DH_RSA_WITH_AES_128_SHA = $03000031;
  TLS1_CK_DHE_DSS_WITH_AES_128_SHA = $03000032;
  TLS1_CK_DHE_RSA_WITH_AES_128_SHA = $03000033;
  TLS1_CK_ADH_WITH_AES_128_SHA = $03000034;
  TLS1_CK_RSA_WITH_AES_256_SHA = $03000035;
  TLS1_CK_DH_DSS_WITH_AES_256_SHA = $03000036;
  TLS1_CK_DH_RSA_WITH_AES_256_SHA = $03000037;
  TLS1_CK_DHE_DSS_WITH_AES_256_SHA = $03000038;
  TLS1_CK_DHE_RSA_WITH_AES_256_SHA = $03000039;
  TLS1_CK_ADH_WITH_AES_256_SHA = $0300003A;
//* Camellia ciphersuites from RFC4132 */
  TLS1_CK_RSA_WITH_CAMELLIA_128_CBC_SHA = $03000041;
  TLS1_CK_DH_DSS_WITH_CAMELLIA_128_CBC_SHA = $03000042;
  TLS1_CK_DH_RSA_WITH_CAMELLIA_128_CBC_SHA = $03000043;
  TLS1_CK_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA = $03000044;
  TLS1_CK_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA = $03000045;
  TLS1_CK_ADH_WITH_CAMELLIA_128_CBC_SHA = $03000046;
  TLS1_CK_RSA_WITH_CAMELLIA_256_CBC_SHA = $03000084;
  TLS1_CK_DH_DSS_WITH_CAMELLIA_256_CBC_SHA = $03000085;
  TLS1_CK_DH_RSA_WITH_CAMELLIA_256_CBC_SHA = $03000086;
  TLS1_CK_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA = $03000087;
  TLS1_CK_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA = $03000088;
  TLS1_CK_ADH_WITH_CAMELLIA_256_CBC_SHA = $03000089;
//* SEED ciphersuites from RFC4162 */
  TLS1_CK_RSA_WITH_SEED_SHA                       = $03000096;
  TLS1_CK_DH_DSS_WITH_SEED_SHA                    = $03000097;
  TLS1_CK_DH_RSA_WITH_SEED_SHA                    = $03000098;
  TLS1_CK_DHE_DSS_WITH_SEED_SHA                   = $03000099;
  TLS1_CK_DHE_RSA_WITH_SEED_SHA                   = $0300009A;
  TLS1_CK_ADH_WITH_SEED_SHA                = $0300009B;
//* ECC ciphersuites from draft-ietf-tls-ecc-12.txt with changes soon to be in draft 13 */
  TLS1_CK_ECDH_ECDSA_WITH_NULL_SHA                = $0300C001;
  TLS1_CK_ECDH_ECDSA_WITH_RC4_128_SHA             = $0300C002;
  TLS1_CK_ECDH_ECDSA_WITH_DES_192_CBC3_SHA        = $0300C003;
  TLS1_CK_ECDH_ECDSA_WITH_AES_128_CBC_SHA         = $0300C004;
  TLS1_CK_ECDH_ECDSA_WITH_AES_256_CBC_SHA         = $0300C005;
  TLS1_CK_ECDHE_ECDSA_WITH_NULL_SHA               = $0300C006;
  TLS1_CK_ECDHE_ECDSA_WITH_RC4_128_SHA            = $0300C007;
  TLS1_CK_ECDHE_ECDSA_WITH_DES_192_CBC3_SHA       = $0300C008;
  TLS1_CK_ECDHE_ECDSA_WITH_AES_128_CBC_SHA        = $0300C009;
  TLS1_CK_ECDHE_ECDSA_WITH_AES_256_CBC_SHA        = $0300C00A;
  TLS1_CK_ECDH_RSA_WITH_NULL_SHA                  = $0300C00B;
  TLS1_CK_ECDH_RSA_WITH_RC4_128_SHA               = $0300C00C;
  TLS1_CK_ECDH_RSA_WITH_DES_192_CBC3_SHA          = $0300C00D;
  TLS1_CK_ECDH_RSA_WITH_AES_128_CBC_SHA           = $0300C00E;
  TLS1_CK_ECDH_RSA_WITH_AES_256_CBC_SHA           = $0300C00F;
  TLS1_CK_ECDHE_RSA_WITH_NULL_SHA                 = $0300C010;
  TLS1_CK_ECDHE_RSA_WITH_RC4_128_SHA              = $0300C011;
  TLS1_CK_ECDHE_RSA_WITH_DES_192_CBC3_SHA         = $0300C012;
  TLS1_CK_ECDHE_RSA_WITH_AES_128_CBC_SHA          = $0300C013;
  TLS1_CK_ECDHE_RSA_WITH_AES_256_CBC_SHA          = $0300C014;
  TLS1_CK_ECDH_anon_WITH_NULL_SHA                 = $0300C015;
  TLS1_CK_ECDH_anon_WITH_RC4_128_SHA              = $0300C016;
  TLS1_CK_ECDH_anon_WITH_DES_192_CBC3_SHA         = $0300C017;
  TLS1_CK_ECDH_anon_WITH_AES_128_CBC_SHA          = $0300C018;
  TLS1_CK_ECDH_anon_WITH_AES_256_CBC_SHA          = $0300C019;
  TLS1_FINISH_MAC_LENGTH = 12;
  TLS1_TXT_RSA_EXPORT1024_WITH_RC4_56_MD5 = 'EXP1024-RC4-MD5';
  TLS1_TXT_RSA_EXPORT1024_WITH_RC2_CBC_56_MD5 = 'EXP1024-RC2-CBC-MD5';
  TLS1_TXT_RSA_EXPORT1024_WITH_DES_CBC_SHA = 'EXP1024-DES-CBC-SHA';
  TLS1_TXT_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA = 'EXP1024-DHE-DSS-DES-CBC-SHA';
  TLS1_TXT_RSA_EXPORT1024_WITH_RC4_56_SHA = 'EXP1024-RC4-SHA';
  TLS1_TXT_DHE_DSS_EXPORT1024_WITH_RC4_56_SHA = 'EXP1024-DHE-DSS-RC4-SHA';
  TLS1_TXT_DHE_DSS_WITH_RC4_128_SHA = 'DHE-DSS-RC4-SHA';
//* AES ciphersuites from RFC3268 */
  TLS1_TXT_RSA_WITH_AES_128_SHA = 'AES128-SHA';
  TLS1_TXT_DH_DSS_WITH_AES_128_SHA ='DH-DSS-AES128-SHA';
  TLS1_TXT_DH_RSA_WITH_AES_128_SHA = 'DH-RSA-AES128-SHA';
  TLS1_TXT_DHE_DSS_WITH_AES_128_SHA = 'DHE-DSS-AES128-SHA';
  TLS1_TXT_DHE_RSA_WITH_AES_128_SHA = 'DHE-RSA-AES128-SHA';
  TLS1_TXT_ADH_WITH_AES_128_SHA = 'ADH-AES128-SHA';
  TLS1_TXT_RSA_WITH_AES_256_SHA = 'AES256-SHA';
  TLS1_TXT_DH_DSS_WITH_AES_256_SHA ='DH-DSS-AES256-SHA';
  TLS1_TXT_DH_RSA_WITH_AES_256_SHA = 'DH-RSA-AES256-SHA';
  TLS1_TXT_DHE_DSS_WITH_AES_256_SHA = 'DHE-DSS-AES256-SHA';
  TLS1_TXT_DHE_RSA_WITH_AES_256_SHA ='DHE-RSA-AES256-SHA';
  TLS1_TXT_ADH_WITH_AES_256_SHA = 'ADH-AES256-SHA';
//* ECC ciphersuites from draft-ietf-tls-ecc-01.txt (Mar 15, 2001) */
  TLS1_TXT_ECDH_ECDSA_WITH_NULL_SHA               = 'ECDH-ECDSA-NULL-SHA';
  TLS1_TXT_ECDH_ECDSA_WITH_RC4_128_SHA            = 'ECDH-ECDSA-RC4-SHA';
  TLS1_TXT_ECDH_ECDSA_WITH_DES_192_CBC3_SHA       = 'ECDH-ECDSA-DES-CBC3-SHA';
  TLS1_TXT_ECDH_ECDSA_WITH_AES_128_CBC_SHA        = 'ECDH-ECDSA-AES128-SHA';
  TLS1_TXT_ECDH_ECDSA_WITH_AES_256_CBC_SHA        = 'ECDH-ECDSA-AES256-SHA';
  TLS1_TXT_ECDHE_ECDSA_WITH_NULL_SHA              = 'ECDHE-ECDSA-NULL-SHA';
  TLS1_TXT_ECDHE_ECDSA_WITH_RC4_128_SHA           = 'ECDHE-ECDSA-RC4-SHA';
  TLS1_TXT_ECDHE_ECDSA_WITH_DES_192_CBC3_SHA      = 'ECDHE-ECDSA-DES-CBC3-SHA';
  TLS1_TXT_ECDHE_ECDSA_WITH_AES_128_CBC_SHA       = 'ECDHE-ECDSA-AES128-SHA';
  TLS1_TXT_ECDHE_ECDSA_WITH_AES_256_CBC_SHA       = 'ECDHE-ECDSA-AES256-SHA';
  TLS1_TXT_ECDH_RSA_WITH_NULL_SHA                 = 'ECDH-RSA-NULL-SHA';
  TLS1_TXT_ECDH_RSA_WITH_RC4_128_SHA              = 'ECDH-RSA-RC4-SHA';
  TLS1_TXT_ECDH_RSA_WITH_DES_192_CBC3_SHA         = 'ECDH-RSA-DES-CBC3-SHA';
  TLS1_TXT_ECDH_RSA_WITH_AES_128_CBC_SHA          = 'ECDH-RSA-AES128-SHA';
  TLS1_TXT_ECDH_RSA_WITH_AES_256_CBC_SHA          = 'ECDH-RSA-AES256-SHA';
  TLS1_TXT_ECDHE_RSA_WITH_NULL_SHA                = 'ECDHE-RSA-NULL-SHA';
  TLS1_TXT_ECDHE_RSA_WITH_RC4_128_SHA             = 'ECDHE-RSA-RC4-SHA';
  TLS1_TXT_ECDHE_RSA_WITH_DES_192_CBC3_SHA        = 'ECDHE-RSA-DES-CBC3-SHA';
  TLS1_TXT_ECDHE_RSA_WITH_AES_128_CBC_SHA         = 'ECDHE-RSA-AES128-SHA';
  TLS1_TXT_ECDHE_RSA_WITH_AES_256_CBC_SHA         = 'ECDHE-RSA-AES256-SHA';
  TLS1_TXT_ECDH_anon_WITH_NULL_SHA                = 'AECDH-NULL-SHA';
  TLS1_TXT_ECDH_anon_WITH_RC4_128_SHA             = 'AECDH-RC4-SHA';
  TLS1_TXT_ECDH_anon_WITH_DES_192_CBC3_SHA        = 'AECDH-DES-CBC3-SHA';
  TLS1_TXT_ECDH_anon_WITH_AES_128_CBC_SHA         = 'AECDH-AES128-SHA';
  TLS1_TXT_ECDH_anon_WITH_AES_256_CBC_SHA         = 'AECDH-AES256-SHA';
//* Camellia ciphersuites from RFC4132 */
  TLS1_TXT_RSA_WITH_CAMELLIA_128_CBC_SHA = 'CAMELLIA128-SHA';
  TLS1_TXT_DH_DSS_WITH_CAMELLIA_128_CBC_SHA = 'DH-DSS-CAMELLIA128-SHA';
  TLS1_TXT_DH_RSA_WITH_CAMELLIA_128_CBC_SHA = 'DH-RSA-CAMELLIA128-SHA';
  TLS1_TXT_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA = 'DHE-DSS-CAMELLIA128-SHA';
  TLS1_TXT_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA = 'DHE-RSA-CAMELLIA128-SHA';
  TLS1_TXT_ADH_WITH_CAMELLIA_128_CBC_SHA = 'ADH-CAMELLIA128-SHA';
  TLS1_TXT_RSA_WITH_CAMELLIA_256_CBC_SHA = 'CAMELLIA256-SHA';
  TLS1_TXT_DH_DSS_WITH_CAMELLIA_256_CBC_SHA = 'DH-DSS-CAMELLIA256-SHA';
  TLS1_TXT_DH_RSA_WITH_CAMELLIA_256_CBC_SHA = 'DH-RSA-CAMELLIA256-SHA';
  TLS1_TXT_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA = 'DHE-DSS-CAMELLIA256-SHA';
  TLS1_TXT_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA = 'DHE-RSA-CAMELLIA256-SHA';
  TLS1_TXT_ADH_WITH_CAMELLIA_256_CBC_SHA = 'ADH-CAMELLIA256-SHA';
//* SEED ciphersuites from RFC4162 */
  TLS1_TXT_RSA_WITH_SEED_SHA                      = 'SEED-SHA';
  TLS1_TXT_DH_DSS_WITH_SEED_SHA                   = 'DH-DSS-SEED-SHA';
  TLS1_TXT_DH_RSA_WITH_SEED_SHA                   = 'DH-RSA-SEED-SHA';
  TLS1_TXT_DHE_DSS_WITH_SEED_SHA                  = 'DHE-DSS-SEED-SHA';
  TLS1_TXT_DHE_RSA_WITH_SEED_SHA                  = 'DHE-RSA-SEED-SHA';
  TLS1_TXT_ADH_WITH_SEED_SHA                      = 'ADH-SEED-SHA';
  TLS_CT_DSS_FIXED_DH = 4;
  TLS_CT_DSS_SIGN = 2;
  TLS_CT_NUMBER = 4;
  TLS_CT_RSA_FIXED_DH = 3;
  TLS_CT_RSA_SIGN = 1;

  TLS_MD_CLIENT_FINISH_CONST = 'client finished';  {Do not localize}
  TLS_MD_CLIENT_FINISH_CONST_SIZE = 15;
  TLS_MD_SERVER_FINISH_CONST = 'server finished';  {Do not localize}
  TLS_MD_SERVER_FINISH_CONST_SIZE = 15;
  TLS_MD_KEY_EXPANSION_CONST = 'key expansion';  {Do not localize}
  TLS_MD_KEY_EXPANSION_CONST_SIZE = 13;
  TLS_MD_CLIENT_WRITE_KEY_CONST = 'client write key';  {Do not localize}
  TLS_MD_CLIENT_WRITE_KEY_CONST_SIZE = 16;
  TLS_MD_SERVER_WRITE_KEY_CONST = 'server write key';  {Do not localize}
  TLS_MD_SERVER_WRITE_KEY_CONST_SIZE = 16;
  TLS_MD_IV_BLOCK_CONST = 'IV block';  {Do not localize}
  TLS_MD_IV_BLOCK_CONST_SIZE = 8;
  TLS_MD_MASTER_SECRET_CONST = 'master secret';  {Do not localize}
  TLS_MD_MASTER_SECRET_CONST_SIZE = 13;
  TLS_MD_MAX_CONST_SIZE = 20;

  TMP_MAX = 26;
  V_ASN1_APPLICATION = $40;
  V_ASN1_APP_CHOOSE = -2;
  V_ASN1_BIT_STRING = 3;
  V_ASN1_BMPSTRING = 30;
  V_ASN1_BOOLEAN = 1;
  V_ASN1_CONSTRUCTED = $20;
  V_ASN1_CONTEXT_SPECIFIC = $80;
  V_ASN1_ENUMERATED = 10;
  V_ASN1_EOC = 0;
  V_ASN1_EXTERNAL = 8;
  V_ASN1_GENERALIZEDTIME = 24;
  V_ASN1_GENERALSTRING = 27;
  V_ASN1_GRAPHICSTRING = 25;
  V_ASN1_IA5STRING = 22;
  V_ASN1_INTEGER = 2;
  V_ASN1_ISO64STRING = 26;
  V_ASN1_NEG_ENUMERATED = 10+$100;
  V_ASN1_NEG_INTEGER = 2+$100;
  V_ASN1_NULL = 5;
  V_ASN1_NUMERICSTRING = 18;
  V_ASN1_OBJECT = 6;
  V_ASN1_OBJECT_DESCRIPTOR = 7;
  V_ASN1_OCTET_STRING = 4;
  V_ASN1_PRIMATIVE_TAG = $1f;
  V_ASN1_PRIMITIVE_TAG = $1f;
  V_ASN1_PRINTABLESTRING = 19;
  V_ASN1_PRIVATE = $c0;
  V_ASN1_REAL = 9;
  V_ASN1_SEQUENCE = 16;
  V_ASN1_SET = 17;
  V_ASN1_T61STRING = 20;
  V_ASN1_TELETEXSTRING = 20;
  V_ASN1_UNDEF = -1;
  V_ASN1_UNIVERSAL = $00;
  V_ASN1_UNIVERSALSTRING = 28;
  V_ASN1_UTCTIME = 23;
  V_ASN1_UTF8STRING = 12;
  V_ASN1_VIDEOTEXSTRING = 21;
  V_ASN1_VISIBLESTRING = 26;
  WINNT = 1;
  X509_EXT_PACK_STRING = 2;
  X509_EXT_PACK_UNKNOWN = 1;
  X509_EX_V_INIT = $0001;
  X509_EX_V_NETSCAPE_HACK = $8000;
  X509_FILETYPE_DEFAULT = 3;
  X509_F_ADD_CERT_DIR                  = 100;
  X509_F_BY_FILE_CTRL                  = 101;
  X509_F_DIR_CTRL                      = 102;
  X509_F_GET_CERT_BY_SUBJECT           = 103;
  X509_F_X509V3_ADD_EXT                = 104;
  X509_F_X509_EXTENSION_CREATE_BY_NID  = 108;
  X509_F_X509_EXTENSION_CREATE_BY_OBJ  = 109;

  X509_F_X509_GET_PUBKEY_PARAMETERS    = 110;
  X509_F_X509_LOAD_CERT_FILE           = 111;
  X509_F_X509_LOAD_CRL_FILE            = 112;
  X509_F_X509_NAME_ADD_ENTRY           = 113;
  X509_F_X509_NAME_ENTRY_CREATE_BY_NID = 114;
  X509_F_X509_NAME_ENTRY_SET_OBJECT    = 115;
  X509_F_X509_NAME_ONELINE             = 116;
  X509_F_X509_NAME_PRINT               = 117;
  X509_F_X509_PRINT_FP                 = 118;
  X509_F_X509_PUBKEY_GET               = 119;

  X509_F_X509_PUBKEY_SET               = 120;
  X509_F_X509_REQ_PRINT                = 121;
  X509_F_X509_REQ_PRINT_FP             = 122;
  X509_F_X509_REQ_TO_X509              = 123;
  X509_F_X509_STORE_ADD_CERT           = 124;
  X509_F_X509_STORE_ADD_CRL            = 125;
  X509_F_X509_TO_X509_REQ              = 126;
  X509_F_X509_VERIFY_CERT              = 127;
  X509_F_X509_CHECK_PRIVATE_KEY        = 128;
  X509_F_NETSCAPE_SPKI_B64_DECODE	     = 129;

  X509_F_NETSCAPE_SPKI_B64_ENCODE	     = 130;
  X509_F_X509_NAME_ENTRY_CREATE_BY_TXT = 131;
  X509_F_X509_LOAD_CERT_CRL_FILE       = 132;
  X509_F_X509_TRUST_ADD                = 133;
  X509_F_X509_STORE_CTX_PURPOSE_INHERIT	= 134;
  X509_F_X509AT_ADD1_ATTR	             = 135;
  X509_F_X509_ATTRIBUTE_CREATE_BY_NID  = 136;
  X509_F_X509_ATTRIBUTE_CREATE_BY_OBJ	 = 137;
  X509_F_X509_ATTRIBUTE_SET1_DATA      = 138;
  X509_F_X509_ATTRIBUTE_GET0_DATA      = 139;

  X509_F_X509_ATTRIBUTE_CREATE_BY_TXT	 = 140;
  X509_F_X509_TRUST_SET                = 141;
  X509_F_X509_STORE_CTX_NEW		         = 142;
  X509_F_X509_STORE_CTX_INIT           = 143;
  X509_F_X509_REQ_CHECK_PRIVATE_KEY	   = 144;
  X509_F_CHECK_POLICY	                 = 145;
  X509_F_X509_STORE_CTX_GET1_ISSUER		 = 146;
  X509_F_X509_CRL_PRINT_FP             = 147;

  X509_LU_CRL = 2;
  X509_LU_FAIL = 0;
  X509_LU_PKEY = 3;
  X509_LU_RETRY = -1;
  X509_LU_X509 = 1;
  X509_L_ADD_DIR = 2;
  X509_L_FILE_LOAD = 1;
  X509_R_BAD_X509_FILETYPE = 100;
  X509_R_BASE64_DECODE_ERROR = 118;
  X509_R_CANT_CHECK_DH_KEY = 114;
  X509_R_CERT_ALREADY_IN_HASH_TABLE = 101;
  X509_R_ERR_ASN1_LIB = 102;
  X509_R_INVALID_DIRECTORY = 113;
  X509_R_INVALID_FIELD_NAME = 119;
  X509_R_INVALID_TRUST = 123;
  X509_R_KEY_TYPE_MISMATCH = 115;
  X509_R_KEY_VALUES_MISMATCH = 116;
  X509_R_LOADING_CERT_DIR = 103;
  X509_R_LOADING_DEFAULTS = 104;
  X509_R_NO_CERT_SET_FOR_US_TO_VERIFY = 105;
  X509_R_SHOULD_RETRY = 106;
  X509_R_UNABLE_TO_FIND_PARAMETERS_IN_CHAIN = 107;
  X509_R_UNABLE_TO_GET_CERTS_PUBLIC_KEY = 108;
  X509_R_UNKNOWN_KEY_TYPE = 117;
  X509_R_UNKNOWN_NID = 109;
  X509_R_UNKNOWN_PURPOSE_ID	= 121;
  X509_R_UNSUPPORTED_ALGORITHM = 111;
  X509_R_WRONG_LOOKUP_TYPE = 112;
  X509_R_WRONG_TYPE = 122;
  X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT = 2;
  X509_V_ERR_UNABLE_TO_GET_CRL = 3;
  X509_V_ERR_UNABLE_TO_DECRYPT_CERT_SIGNATURE = 4;
  X509_V_ERR_UNABLE_TO_DECRYPT_CRL_SIGNATURE = 5;
  X509_V_ERR_UNABLE_TO_DECODE_ISSUER_PUBLIC_KEY = 6;
  X509_V_ERR_CERT_SIGNATURE_FAILURE = 7;
  X509_V_ERR_CRL_SIGNATURE_FAILURE = 8;
  X509_V_ERR_CERT_NOT_YET_VALID = 9;
  X509_V_ERR_CERT_HAS_EXPIRED = 10;
  X509_V_ERR_CRL_NOT_YET_VALID = 11;
  X509_V_ERR_CRL_HAS_EXPIRED = 12;
  X509_V_ERR_ERROR_IN_CERT_NOT_BEFORE_FIELD = 13;
  X509_V_ERR_ERROR_IN_CERT_NOT_AFTER_FIELD = 14;
  X509_V_ERR_ERROR_IN_CRL_LAST_UPDATE_FIELD = 15;
  X509_V_ERR_ERROR_IN_CRL_NEXT_UPDATE_FIELD = 16;
  X509_V_ERR_OUT_OF_MEM = 17;
  X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT = 18;
  X509_V_ERR_SELF_SIGNED_CERT_IN_CHAIN = 19;
  X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY = 20;
  X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE = 21;
  X509_V_ERR_CERT_CHAIN_TOO_LONG = 22;
  X509_V_ERR_CERT_REVOKED = 23;
  X509_V_ERR_INVALID_CA	 = 24;
  X509_V_ERR_PATH_LENGTH_EXCEEDED	= 25;
  X509_V_ERR_INVALID_PURPOSE = 26;
  X509_V_ERR_CERT_UNTRUSTED	= 27;
  X509_V_ERR_CERT_REJECTED = 28;
//* These are 'informational' when looking for issuer cert */
  X509_V_ERR_SUBJECT_ISSUER_MISMATCH = 29;
  X509_V_ERR_AKID_SKID_MISMATCH	= 30;
  X509_V_ERR_AKID_ISSUER_SERIAL_MISMATCH = 31;
  X509_V_ERR_KEYUSAGE_NO_CERTSIGN	= 32;
  X509_V_ERR_UNABLE_TO_GET_CRL_ISSUER	= 33;
  X509_V_ERR_UNHANDLED_CRITICAL_EXTENSION	= 34;
  X509_V_ERR_KEYUSAGE_NO_CRL_SIGN	= 35;
  X509_V_ERR_UNHANDLED_CRITICAL_CRL_EXTENSION = 36;
  X509_V_ERR_INVALID_NON_CA	= 37;
  X509_V_ERR_PROXY_PATH_LENGTH_EXCEEDED = 38;
  X509_V_ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE = 39;
  X509_V_ERR_PROXY_CERTIFICATES_NOT_ALLOWED = 40;
  X509_V_ERR_INVALID_EXTENSION = 41;
  X509_V_ERR_INVALID_POLICY_EXTENSION = 42;
  X509_V_ERR_NO_EXPLICIT_POLICY = 43;
  X509_V_ERR_UNNESTED_RESOURCE = 44;
  X509_V_ERR_APPLICATION_VERIFICATION = 50;
  //* Certificate verify flags */

  //* Send issuer+subject checks to verify_cb */
  X509_V_FLAG_CB_ISSUER_CHECK	= $1;
  //* Use check time instead of current time */
  X509_V_FLAG_USE_CHECK_TIME = $2;
  //* Lookup CRLs */
  X509_V_FLAG_CRL_CHECK	 = $4;
  //* Lookup CRLs for whole chain */
  X509_V_FLAG_CRL_CHECK_ALL	= $8;
  //* Ignore unhandled critical extensions */
  X509_V_FLAG_IGNORE_CRITICAL	 = $10;
//* Disable workarounds for broken certificates */
  X509_V_FLAG_X509_STRICT	= $20;
//* Enable proxy certificate validation */
  X509_V_FLAG_ALLOW_PROXY_CERTS	= $40;
//* Enable policy checking */
  X509_V_FLAG_POLICY_CHECK	= $80;
//* Policy variable require-explicit-policy */
  X509_V_FLAG_EXPLICIT_POLICY = $100;
//* Policy variable inhibit-any-policy */
  X509_V_FLAG_INHIBIT_ANY	= $200;
//* Policy variable inhibit-policy-mapping */
  X509_V_FLAG_INHIBIT_MAP	= $400;
//* Notify callback that policy is OK */
  X509_V_FLAG_NOTIFY_POLICY	= $800;

//* Check selfsigned CA signature */
  X509_V_FLAG_CHECK_SS_SIGNATURE = $4000;

  X509_VP_FLAG_DEFAULT = $1;
  X509_VP_FLAG_OVERWRITE = $2;
  X509_VP_FLAG_RESET_FLAGS = $4;
  X509_VP_FLAG_LOCKED	= $8;
  X509_VP_FLAG_ONCE	= $10;
  X509_V_FLAG_POLICY_MASK = (X509_V_FLAG_POLICY_CHECK or
    X509_V_FLAG_EXPLICIT_POLICY or
		X509_V_FLAG_INHIBIT_ANY or
    X509_V_FLAG_INHIBIT_MAP);

  X509_V_OK = 0;
  X509v3_KU_CRL_SIGN = $0002;
  X509v3_KU_DATA_ENCIPHERMENT = $0010;
  X509v3_KU_DECIPHER_ONLY = $8000;
  X509v3_KU_DIGITAL_SIGNATURE = $0080;
  X509v3_KU_ENCIPHER_ONLY = $0001;
  X509v3_KU_KEY_AGREEMENT = $0008;
  X509v3_KU_KEY_CERT_SIGN = $0004;
  X509v3_KU_KEY_ENCIPHERMENT = $0020;
  X509v3_KU_NON_REPUDIATION = $0040;
  X509v3_KU_UNDEF = $ffff;
  X509V3_EXT_DYNAMIC = $1;
  X509V3_EXT_CTX_DEP = $2;
  X509V3_EXT_MULTILINE = $4;
  GEN_OTHERNAME	= 0;
  GEN_EMAIL	= 1;
  GEN_DNS = 2;
  GEN_X400 = 3;
  GEN_DIRNAME = 4;
  GEN_EDIPARTY = 5;
  GEN_URI	= 6;
  GEN_IPADD = 7;
  GEN_RID = 8;
  //* X509_PURPOSE stuff */
  EXFLAG_BCONS = $1;
  EXFLAG_KUSAGE	= $2;
  EXFLAG_XKUSAGE = $4;
  EXFLAG_NSCERT	= $8;
  EXFLAG_CA = $10;
  //* Really self issued not necessarily self signed */
  EXFLAG_SI	= $20;
  EXFLAG_SS	= $20;
  EXFLAG_V1	= $40;
  EXFLAG_INVALID = $80;
  EXFLAG_SET = $100;
  EXFLAG_CRITICAL	= $200;
  EXFLAG_PROXY = $400;
  EXFLAG_INVALID_POLICY = $800;
  KU_DIGITAL_SIGNATURE = $0080;
  KU_NON_REPUDIATION	= $0040;
  KU_KEY_ENCIPHERMENT	= $0020;
  KU_DATA_ENCIPHERMENT = $0010;
  KU_KEY_AGREEMENT = $0008;
  KU_KEY_CERT_SIGN = $0004;
  KU_CRL_SIGN	= $0002;
  KU_ENCIPHER_ONLY = $0001;
  KU_DECIPHER_ONLY = $8000;
  NS_SSL_CLIENT	= $80;
  NS_SSL_SERVER	= $40;
  NS_SMIME = $20;
  NS_OBJSIGN = $10;
  NS_SSL_CA	= $04;
  NS_SMIME_CA	= $02;
  NS_OBJSIGN_CA = $01;
  NS_ANY_CA	= (NS_SSL_CA or NS_SMIME_CA or
    NS_OBJSIGN_CA);
  XKU_SSL_SERVER = $1;
  XKU_SSL_CLIENT = $2;
  XKU_SMIME	=	$4;
  XKU_CODE_SIGN	= $8;
  XKU_SGC	= $10;
  XKU_OCSP_SIGN = $20;
  XKU_TIMESTAMP = $40;
  XKU_DVCS = $80;
  X509_PURPOSE_DYNAMIC = $1;
  X509_PURPOSE_DYNAMIC_NAME = $2;
  _ATEXIT_SIZE = 32;
  {$EXTERNALSYM _ATEXIT_SIZE}
  _IOFBF = 0;
  {$EXTERNALSYM _IOFBF}
  _IOLBF = 1;
  {$EXTERNALSYM _IOLBF}
  _IONBF = 2;
  {$EXTERNALSYM _IONBF}
  _N_LISTS = 30;
  {$EXTERNALSYM _N_LISTS}
  _MSS_WIN32 = 1;
  {$EXTERNALSYM _MSS_WIN32}
  _MSS_X86_ = 1;
  {$EXTERNALSYM _MSS_X86_}
  __CYGWIN32__ = 1;
  {$EXTERNALSYM __CYGWIN32__}
  __CYGWIN__ = 1;
  {$EXTERNALSYM __CYGWIN__}
  __GNUC_MINOR__ = 91;
  {$EXTERNALSYM __GNUC_MINOR__}
  __GNUC__ = 2;
  {$EXTERNALSYM __GNUC__}
  __SAPP = $0100;
  {$EXTERNALSYM __SAPP }
  __SEOF = $0020;
  {$EXTERNALSYM __SEOF }
  __SERR = $0040;
  {$EXTERNALSYM __SERR }
  __SLBF = $0001;
  {$EXTERNALSYM __SLBF }
  __SMBF = $0080;
  {$EXTERNALSYM __SMBF }
  __SMOD = $2000;
  {$EXTERNALSYM __SMOD }
  __SNBF = $0002;
  {$EXTERNALSYM __SNBF }
  __SNPT = $0800;
  {$EXTERNALSYM __SNPT }
  __SOFF = $1000;
  {$EXTERNALSYM __SOFF }
  __SOPT = $0400;
  {$EXTERNALSYM __SOPT }
  __SRD = $0004;
  {$EXTERNALSYM __SRD }
  __SRW = $0010;
  {$EXTERNALSYM __SRW }
  __SSTR = $0200;
  {$EXTERNALSYM __SSTR }
  __STDC__ = 1;
  {$EXTERNALSYM __STDC__}
  __SWR = $0008;
  {$EXTERNALSYM __SWR }
  __WINNT = 1;
  {$EXTERNALSYM __WINNT}
  __WINNT__ = 1;
  {$EXTERNALSYM __WINNT__}
  __i386 = 1;
  {$EXTERNALSYM __i386}
  __i386__ = 1;
  {$EXTERNALSYM __i386__}
  __i586 = 1;
  {$EXTERNALSYM __i586}
  __i586__ = 1;
  {$EXTERNALSYM __i586__}
  __pentium = 1;
  {$EXTERNALSYM __pentium}
  __pentium__ = 1;
  {$EXTERNALSYM __pentium__}
  i386 = 1;
  {$EXTERNALSYM i386}
  i586 = 1;
  {$EXTERNALSYM i586}
  pentium = 1;
  {$EXTERNALSYM pentium}
//kssl.h
{$IFNDEF OPENSSL_NO_KRB5}
{These are consts for Kerberos support.  These will not be complete because
FreePascal, Borland Delphi, and Indy don't support Kerberos.  These are here
as place holders so we get an exact OpenSSL API if Kerberos support was compiled
in.
}
  KSSL_ERR_MAX = 255;
  KSSL_CLIENT  = 1;
  KSSL_SERVER  = 2;
  KSSL_SERVICE = 3;
  KSSL_KEYTAB = 4;
  KSSL_CTX_OK = 0;
  KSSL_CTX_ERR = 1;
  KSSL_NOMEM = 2;
{$ENDIF}

{Error - err.h }
const
  ERR_TXT_MALLOCED = $01;
  ERR_TXT_STRING = $02;
  ERR_NUM_ERRORS = 16;

const
  // library
  ERR_LIB_NONE = 1;
  ERR_LIB_SYS  = 2;
  ERR_LIB_BN   = 3;
  ERR_LIB_RSA  = 4;
  ERR_LIB_DH   = 5;
  ERR_LIB_EVP  = 6;
  ERR_LIB_BUF  = 7;
  ERR_LIB_OBJ  = 8;
  ERR_LIB_PEM  = 9;
  ERR_LIB_DSA  = 10;
  ERR_LIB_X509 = 11;
//  ERR_LIB_METH = 12;
  ERR_LIB_ASN1 = 13;
  ERR_LIB_CONF = 14;
  ERR_LIB_CRYPTO = 15;
  ERR_LIB_EC = 16;
  ERR_LIB_SSL    = 20;
//  ERR_LIB_SSL23 = 21;
//  ERR_LIB_SSL2  = 22;
//  ERR_LIB_SSL3  = 23;
//  ERR_LIB_RSAREF = 30;
//  ERR_LIB_PROXY = 31;
  ERR_LIB_BIO  = 32;
  ERR_LIB_PKCS7 = 33;
  ERR_LIB_X509V3 = 34;
  ERR_LIB_PKCS12  = 35;
  ERR_LIB_RAND   = 36;
  ERR_LIB_DSO   = 37;
  ERR_LIB_ENGINE = 38;
  ERR_LIB_OCSP = 39;
  ERR_LIB_UI    = 40;
  ERR_LIB_COMP  = 41;
  ERR_LIB_ECDSA = 42;
  ERR_LIB_ECDH  = 43;
  ERR_LIB_STORE = 44;
  ERR_LIB_FIPS = 45;
  ERR_LIB_CMS = 46;
  ERR_LIB_JPAKE = 47;
//* fatal error */
  ERR_R_FATAL	= 64;
//was  ERR_R_FATAL = 32;
  ERR_R_MALLOC_FAILURE = (1 or ERR_R_FATAL);
  ERR_R_SHOULD_NOT_HAVE_BEEN_CALLED = (2 or ERR_R_FATAL);
  ERR_R_PASSED_NULL_PARAMETER = (3 or ERR_R_FATAL);
  ERR_R_INTERNAL_ERROR = (4 or ERR_R_FATAL);
  ERR_R_DISABLED = (5 or ERR_R_FATAL);
  ERR_LIB_USER  = 128;
  // OS functions
  SYS_F_FOPEN = 1;
  SYS_F_CONNECT = 2;
  SYS_F_GETSERVBYNAME = 3;
  SYS_F_SOCKET = 4;
  SYS_F_IOCTLSOCKET = 5;
  SYS_F_BIND = 6;
  SYS_F_LISTEN = 7;
  SYS_F_ACCEPT = 8;
  SYS_F_WSASTARTUP = 9; { Winsock stuff }
  SYS_F_OPENDIR = 10;
  SYS_F_FREAD	= 11;
//* These are the possible flags.  They can be or'ed together. */
//* Use to have echoing of input */
  UI_INPUT_FLAG_ECHO = $01;
///* Use a default password.  Where that password is found is completely
//   up to the application, it might for example be in the user data set
//   with UI_add_user_data().  It is not recommended to have more than
//   one input in each UI being marked with this flag, or the application
//   might get confused. */
  UI_INPUT_FLAG_DEFAULT_PWD	= $02;

//* The user of these routines may want to define flags of their own.  The core
//   UI won't look at those, but will pass them on to the method routines.  They
//   must use higher bits so they don't get confused with the UI bits above.
//   UI_INPUT_FLAG_USER_BASE tells which is the lowest bit to use.  A good
//   example of use is this:

//	#define MY_UI_FLAG1	(0x01 << UI_INPUT_FLAG_USER_BASE)
//*/
  UI_INPUT_FLAG_USER_BASE	= 16;
  //IO_ctrl commands
//* The commands */
//* Use UI_CONTROL_PRINT_ERRORS with the value 1 to have UI_process print the
//   OpenSSL error stack before printing any info or added error messages and
//   before any prompting. */
  UI_CTRL_PRINT_ERRORS = 1;
//* Check if a UI_process() is possible to do again with the same instance of
//   a user interface.  This makes UI_ctrl() return 1 if it is redoable, and 0
//   if not. */
  UI_CTRL_IS_REDOABLE	=	2;
//* Function codes. */
  UI_F_GENERAL_ALLOCATE_BOOLEAN = 108;
  UI_F_GENERAL_ALLOCATE_PROMPT = 109;
  UI_F_GENERAL_ALLOCATE_STRING = 100;
  UI_F_UI_CTRL = 111;
  UI_F_UI_DUP_ERROR_STRING = 101;
  UI_F_UI_DUP_INFO_STRING = 102;
  UI_F_UI_DUP_INPUT_BOOLEAN = 110;
  UI_F_UI_DUP_INPUT_STRING = 103;
  UI_F_UI_DUP_VERIFY_STRING = 106;
  UI_F_UI_GET0_RESULT	= 107;
  UI_F_UI_NEW_METHOD = 104;
  UI_F_UI_SET_RESULT = 105;
//* Reason codes. */
  UI_R_COMMON_OK_AND_CANCEL_CHARACTERS = 104;
  UI_R_INDEX_TOO_LARGE = 102;
  UI_R_INDEX_TOO_SMALL = 103;
  UI_R_NO_RESULT_BUFFER	= 105;
  UI_R_RESULT_TOO_LARGE	= 100;
  UI_R_RESULT_TOO_SMALL	= 101;
  UI_R_UNKNOWN_CONTROL_COMMAND = 106;

const
  // reasons
  ERR_R_SYS_LIB = ERR_LIB_SYS;
  ERR_R_BN_LIB  = ERR_LIB_BN;
  ERR_R_RSA_LIB = ERR_LIB_RSA;
  ERR_R_DH_LIB = ERR_LIB_DH;
  ERR_R_EVP_LIB = ERR_LIB_EVP;
  ERR_R_BUF_LIB = ERR_LIB_BUF;
  ERR_R_OBJ_LIB = ERR_LIB_OBJ;
  ERR_R_PEM_LIB = ERR_LIB_PEM;
  ERR_R_DSA_LIB = ERR_LIB_DSA;
  ERR_R_X509_LIB = ERR_LIB_X509;
  ERR_R_ASN1_LIB = ERR_LIB_ASN1;
  ERR_R_CONF_LIB = ERR_LIB_CONF;
  ERR_R_CRYPTO_LIB = ERR_LIB_CRYPTO;
  ERR_R_EC_LIB = ERR_LIB_EC;
  ERR_R_SSL_LIB = ERR_LIB_SSL;
  ERR_R_BIO_LIB = ERR_LIB_BIO;
  ERR_R_PKCS7_LIB = ERR_LIB_PKCS7;
  ERR_R_X509V3_LIB = ERR_LIB_X509V3;
  ERR_R_PKCS12_LIB = ERR_LIB_PKCS12;
  ERR_R_RAND_LIB = ERR_LIB_RAND;
  ERR_R_DSO_LIB	= ERR_LIB_DSO;
  ERR_R_ENGINE_LIB = ERR_LIB_ENGINE;
  ERR_R_OCSP_LIB = ERR_LIB_OCSP;
  ERR_R_UI_LIB = ERR_LIB_UI;
  ERR_R_COMP_LIB = ERR_LIB_COMP;
  ERR_R_ECDSA_LIB = ERR_LIB_ECDSA;
  ERR_R_ECDH_LIB = ERR_LIB_ECDH;
  ERR_R_STORE_LIB = ERR_LIB_STORE;
  ERR_R_NESTED_ASN1_ERROR = 58;
  ERR_R_BAD_ASN1_OBJECT_HEADER = 59;
  ERR_R_BAD_GET_ASN1_OBJECT_CALL = 60;
  ERR_R_EXPECTING_AN_ASN1_SEQUENCE = 61;
  ERR_R_ASN1_LENGTH_MISMATCH = 62;
  ERR_R_MISSING_ASN1_EOS = 63;
  DTLS1_VERSION = $FEFF;
  DTLS1_BAD_VER = $0100;
{$IFNDEF USE_THIS}
//* this alert description is not specified anywhere... */
 DTLS1_AD_MISSING_HANDSHAKE_MESSAGE = 110;
{$endif}
  //was 32
  DTLS1_COOKIE_LENGTH = 256;
  DTLS1_RT_HEADER_LENGTH = 13;
  DTLS1_HM_HEADER_LENGTH = 12;
  DTLS1_HM_BAD_FRAGMENT = -2;
  DTLS1_HM_FRAGMENT_RETRY = -3;
  //OpenSSL 0.9.8e defines this as OPENSSL_DTLS1_CCS_HEADER_LENGTH = 3;
  DTLS1_CCS_HEADER_LENGTH = 1;
{$ifdef DTLS1_AD_MISSING_HANDSHAKE_MESSAGE}
  DTLS1_AL_HEADER_LENGTH = 7;
{$else}
  DTLS1_AL_HEADER_LENGTH = 2;
{$endif}

type
  UInteger        = Longint;
  PUInteger       =^UInteger;
  PFunction       = Pointer;
  {$IFNDEF FPC}
    {$IFNDEF VCL_2007_OR_ABOVE}
  // Kudzu - CB3,4 dont like this. I think its a typo anyways. I dont think they
  // intended a pointer to a pointer to an integer.
  //PInteger  =^PInteger;
  PInteger    =^Integer;
    {$ENDIF}
  {$ENDIF}
  // End Kudzu
  PLong     =^Longint;
  // mlussier - CB3,4 dont like this. I think its a typo anyways. I dont think they
  // intended a pointer to a pointer to an cardinal.
  //PULong  =^PULong;
  PULong    =^LongWord;
  PUShort   =^Word;
  {$IFNDEF FPC}
     {$IFNDEF VCL_2007_OR_ABOVE}
  PPAnsiChar    =^PAnsiChar;
     {$ENDIF}
  {$ENDIF}
  PPByte    =^PByte;
  {$IFNDEF VCL_6_OR_ABOVE}
  PPointer = ^Pointer;
  {$ENDIF}

//This is just a synthasis since Pascal probably has what we need.
//In C, the OpenSSL developers were using the PQ_64BIT moniker
//to ensure that they had a value that is always 64bit.
//In Pascal, this is not a problem since Delphi and FreePascla have this in some form.
  {$IFDEF FPC}
  PQ_64BIT = QWord;
  size_t = PtrUInt;
  {$ELSE}
  PQ_64BIT = Int64;
  size_t = LongWord;
  {$ENDIF}
  {$NODEFINE size_t}
// RLebeau - the following value was conflicting with iphlpapi.h under C++Builder
// (and possibly other headers) so using the HPPEMIT further above as a workaround
  {$EXTERNALSYM time_t}
  time_t	  = TIdC_LONG;
  STACK = record
    num : TIdC_INT; //int num;
    data : PAnsiChar;  //char **data;
    sorted : TIdC_INT;//int sorted;
    num_alloc : TIdC_INT; //int num_alloc;
    comp : function (_para1: PPAnsiChar; _para2: PPAnsiChar):  TIdC_INT; cdecl;
    //int (*comp)(const char * const *, const char * const *);
  end;
  PSTACK          = ^STACK;
  PPSTACK         =^PSTACK;
  PSSL            = ^SSL;
  //opensslconf.h
  {$IFNDEF OPENSSL_NO_MD2}
    {$IFDEF MD2_CHAR}
  MD2_INT = Char;
    {$ELSE}
      {$IFDEF MD2_LONG}
  MD2_INT = TIdC_ULONG;
      {$ELSE}
  MD2_INT = TIdC_UINT;
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC1}
    {$IFDEF RC2_SHORT}
  RC2_INT = TIdC_USHORT;
    {$ELSE}
      {$IFDEF RC2_LONG}
  RC2_INT = TIdC_ULONG;
      {$ELSE}
  RC2_INT = TIdC_UINT;
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC4}
    {$IFDEF RC4_CHAR}
  RC4_INT = TIdC_USHORT;
    {$ELSE}
      {$IFDEF RC4_LONG}
  RC4_INT = TIdC_ULONG;
      {$ELSE}
  RC4_INT = TIdC_UINT;
      {$ENDIF}
    {$ENDIF}
    {$IFDEF RC4_CHUNK}
  RC4_CHUNK = TIdC_ULONG;
      {$ELSE}
        {$IFDEF RC4_CHUNK_LL}
  RC4_CHUNK = TIdC_ULONGLONG;
      {$ELSE}
        {$UNDEF RC4_CHUNK}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_IDEA}
    {$IFDEF IDEA_SHORT}
  IDEA_INT = TIdC_USHORT;
    {$ELSE}
      {$IFDEF IDEA_LONG}
  IDEA_INT = TIdC_ULONG;
      {$ELSE}
  IDEA_INT = TIdC_UINT;
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  ERR_string_data = record
    error : TIdC_ULONG;
   	_string : PAnsiChar;
  end;
  PERR_string_data = ^ERR_string_data;
  ERR_STATE = record
    PID: TIdC_UINT;
    err_flags : array [0..ERR_NUM_ERRORS - 1] of TIdC_INT;
    err_buffer: array[0..ERR_NUM_ERRORS-1] of TIdC_UINT;
    err_data : array [0..ERR_NUM_ERRORS -1] of PAnsiChar;
    err_data_flags : array [0..ERR_NUM_ERRORS -1] of TIdC_INT;
    err_file: array[0..ERR_NUM_ERRORS-1] of PAnsiChar;
    err_line: array[0..ERR_NUM_ERRORS-1] of TIdC_INT;
    top: TIdC_INT;
    bottom: TIdC_INT;
  end; // record
  TERR_STATE = ERR_STATE;
  PERR_FNS = Pointer;
  //rand.h
  {$IFDEF OPENSSL_FIPS}
  FIPS_RAND_SIZE_T = TIdC_int;
  {$ENDIF}
  RAND_METHOD = record
    seed : procedure (const buf : Pointer; num : TIdC_INT) cdecl;
    bytes : function(const buf : PAnsiChar; num : TIdC_INT) : TIdC_INT cdecl;
    cleanup : procedure cdecl;
    add : procedure (const buf : Pointer; num : TIdC_INT; entropy : TIdC_DOUBLE) cdecl;
    pseudorand : function(buf : PAnsiChar; num : TIdC_INT) : TIdC_INT cdecl;
    status : function : TIdC_INT cdecl;
  end;
  //bn.h
  {$IFDEF SIXTY_FOUR_BIT_LONG}
  BN_ULLONG = TIdC_LONGLONG;
  BN_ULONG = TIdC_ULONG;
  BN_LONG = TIdC_LONG;
  {$ENDIF}
  {$IFDEF SIXTY_FOUR_BIT}
  BN_LONG = TIdC_LONGLONG;
  BN_ULONG = TIdC_ULONGLONG;
  {$ENDIF}
  {$IFDEF THIRTY_TWO_BIT}
    {$IFDEF BN_LLONG}
    BN_ULLONG = TIdC_INT64;
    {$ELSE}
    BN_ULLONG = TIdC_ULONGLONG;
    {$ENDIF}
    BN_LONG = TIdC_LONG;
    BN_ULONG = TIdC_ULONG;
  {$ENDIF}
  PBN_LONG = ^BN_LONG;
  PBN_ULONG = ^BN_ULONG;
  BIGNUM = record
    d : PBN_ULONG;	// Pointer to an array of 'BN_BITS2' bit chunks.
    top : TIdC_INT;	// Index of last used d +1.
    // The next are internal book keeping for bn_expand.
    dmax : TIdC_INT;	// Size of the d array.
    neg : TIdC_INT;	// one if the number is negative
    flags : TIdC_INT;
  end;
  PBIGNUM = ^BIGNUM;
 // BN_CTX = record
    //This is defined internally.  I don't want to do anything with an internal structure.
 // end;
  PBN_CTX = Pointer;//^BN_CTX;
  PPBN_CTX = ^PBN_CTX; 
  // Used for montgomery multiplication
  BN_MONT_CTX = record
    ri : TIdC_INT;   // number of bits in R
    RR : BIGNUM;     // used to convert to montgomery form
    N : BIGNUM;      // The modulus
    Ni : BIGNUM;     // R*(1/R mod N) - N*Ni = 1
                     // (Ni is only stored for bignum algorithm)
{#if 0
	/* OpenSSL 0.9.9 preview: */
	BN_ULONG n0[2];/* least significant word(s) of Ni */
#else
	BN_ULONG n0;   /* least significant word of Ni */
#endif}
    {$IFNDEF USE_THIS}
    //* OpenSSL 0.9.9 preview: */
    n0 : array [0..1] of BN_ULONG;
    {$ELSE}
    n0 : BN_ULONG;   // least significant word of Ni
    {$ENDIF}
    flags : TIdC_INT;
  end;
  PBN_MONT_CTX = ^BN_MONT_CTX;
//  BN_BLINDING = record
    //I can't locate any information about the record fields in this.
//  end;
  PBN_BLINDING = pointer;//^BN_BLINDING;
  BN_RECP_CTX = record
    N : BIGNUM;  // the divisor
    Nr : BIGNUM; // the reciprocal
    num_bits : TIdC_INT;
    shift : TIdC_INT;
    flags : TIdC_INT;
  end;
  PBN_RECP_CTX = ^BN_RECP_CTX;
  PBN_GENCB = ^BN_GENCB;
  PPBN_GENCB = ^PBN_GENCB;
  BN_cb_1 = procedure (p1, p2 : TIdC_INT; p3 : Pointer); cdecl;
  BN_cb_2 = function (p1, p2 : TIdC_INT; p3 : PBN_GENCB): TIdC_INT; cdecl;
  BN_GENCB_union = record
    case Integer of
    		// if(ver==1) - handles old style callbacks
        0 : (cb_1 : BN_cb_1);
		// if(ver==2) - new callback style
        1 : (cb_2 : BN_cb_2);
  end;
  BN_GENCB = record
    ver : TIdC_UINT;  // To handle binary (in)compatibility
    arg : Pointer;    // callback-specific data
    cb : BN_GENCB_union;
  end;
  //md2.h
  {$IFNDEF OPENSSL_NO_MD2}
  MD2_CTX = record
    num : TIdC_UINT;
    data : array [0..MD2_BLOCK - 1] of AnsiChar;
    cksm : array [0..MD2_BLOCK - 1] of MD2_INT;
    state : array[0..MD2_BLOCK -1] of MD2_INT;
  end;
  PMD2_CTX = ^MD2_CTX;
  {$ENDIF}
  //md4.h
  {$IFNDEF OPENSSL_NO_MD4}
  MD4_LONG = TIdC_ULONG;
  MD4_CTX = record
    A,B,C,D : MD4_LONG;
    Nl,Nh : MD4_LONG;
    data : array [0..(MD4_LBLOCK-1)] of MD4_LONG;
    num : TIdC_UINT;
  end;
  {$ENDIF}
  //md5.h
  MD5_LONG = TIdC_UINT;
  MD5_CTX = record
    A,B,C,D : MD5_LONG;
    Nl,Nh : MD5_LONG;
    data : array [0..(MD5_LBLOCK - 1)] of MD5_LONG;
    num : TIdC_UINT;
  end;
  PMD5_CTX = ^MD5_CTX;
  //sha.h
//#if defined(OPENSSL_NO_SHA) || (defined(OPENSSL_NO_SHA0) && defined(OPENSSL_NO_SHA1))
//#error SHA is disabled.
//#endif
  {$IFDEF OPENSSL_NO_SHA}
    {$DEFINE DONTUSESHA}
  {$ENDIF}
  {$IFDEF PENSSL_NO_SHA0}
    {$IFDEF OPENSSL_NO_SHA1}
      {$DEFINE DONTUSESHA}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF DONTUSESHA}
    {$IFDEF OPENSSL_FIPS}
      FIPS_SHA_SIZE_T  = size_t;
    {$ENDIF}
  {$ENDIF}
  SHA_LONG  = TIdC_UINT;
  SHA_CTX = record
    h0,h1,h2,h3,h4 : SHA_LONG;
    Nl,Nh : SHA_LONG;
    data : array [0..SHA_LBLOCK] of SHA_LONG;
    num : TIdC_INT;
  end;
  {$IFNDEF OPENSSL_NO_SHA256}
  SHA256_CTX = record
    h : array [0..(8 - 1)] of SHA_LONG;
    Nl,Nh : SHA_LONG;
    data : array [0..(SHA_LBLOCK -1)] of SHA_LONG;
    num,md_len : TIdC_UINT;
  end;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA512}
  //not defined like this in sha.h but a comment
  //says that it must be 64 bit.
  SHA_LONG64 = TIdC_UINT64;
  TSHA512_CTX_Union = record
    case integer of
     0 : (d : array [0..(SHA_LBLOCK -1)] of SHA_LONG64);
     1 : (p : array [0..(SHA512_CBLOCK -1)] of byte);
  end;
  SHA512_CTX = record
    h : array[0..(8-1)]of SHA_LONG64;
    Nl,Nh : SHA_LONG64;
    u :  TSHA512_CTX_Union;
    num,md_len : TIdC_UINT;
  end;
  {$ENDIF}
   //ui.h
   PUI_METHOD = Pointer;  //^UI_METHOD
   PUI_STRING = Pointer;  //^UI_STRING;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_UI_STRING = record
    stack: stack;
  end;
  PSTACK_OF_UI_STRING = ^STACK_OF_UI_STRING;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_UI_STRING = PSTACK;
  {$ENDIF}
  UI_string_types = (
  	UIT_NONE,    //=0,
  	UIT_PROMPT,	 //* Prompt for a string */
   	UIT_VERIFY,	 //* Prompt for a string and verify */
   	UIT_BOOLEAN, //* Prompt for a yes/no response */
   	UIT_INFO,		 //* Send info to the user */
   	UIT_ERROR);	 //* Send an error message to the user */
  //crypto.h
  //  OpenSSL 1.0.0 structure
  ///* Don't use this structure directly. */
  CRYPTO_THREADID = record
    ptr : Pointer;
    val : TIdC_ULONG;
  end;
  PCRYPTO_THREADID = ^CRYPTO_THREADID;
  //  end OpenSSL 1.0.0 structures
  OPENSSL_ITEM = record
    code : TIdC_INT;
    value : Pointer;		//* Not used for flag attributes */
    value_size : size_t;	//* Max size of value for output, length for input */
    value_length : ^size_t;	//* Returned length of value for output */
  end;
  CRYPTO_EX_DATA = record
    sk : PSTACK;
    dummy : TIdC_INT; // gcc is screwing up this data structure :-(
  end;
  PCRYPTO_EX_DATA = ^CRYPTO_EX_DATA;
{
/* Some applications as well as some parts of OpenSSL need to allocate
   and deallocate locks in a dynamic fashion.  The following typedef
   makes this possible in a type-safe manner.  */
/* struct CRYPTO_dynlock_value has to be defined by the application. */
}
  PCRYPTO_dynlock_value = Pointer;
  CRYPTO_dynlock = record
	  references : TIdC_INT;
	  data : PCRYPTO_dynlock_value;
  end;
  PCRYPTO_dynlock = ^CRYPTO_dynlock;
//* Callback types for crypto.h */
//typedef int CRYPTO_EX_new(void *parent, void *ptr, CRYPTO_EX_DATA *ad,
//					int idx, long argl, void *argp);
  CRYPTO_EX_new = function(parent : Pointer; ptr : Pointer; ad : CRYPTO_EX_DATA;
    idx : TIdC_INT; arg1 : TIdC_LONG; argp : Pointer) : TIdC_INT; cdecl;
//typedef void CRYPTO_EX_free(void *parent, void *ptr, CRYPTO_EX_DATA *ad,
//					int idx, long argl, void *argp);
  CRYPTO_EX_free = procedure (parent : Pointer; ptr : Pointer; ad : CRYPTO_EX_DATA;
    idx : TIdC_INT; arg1 : TIdC_LONG; argp : Pointer); cdecl;
//typedef int CRYPTO_EX_dup(CRYPTO_EX_DATA *to, CRYPTO_EX_DATA *from, void *from_d,
//					int idx, long argl, void *argp);
  CRYPTO_EX_dup = function (_to : PCRYPTO_EX_DATA; from : PCRYPTO_EX_DATA;
    from_d : Pointer; idx : TIdC_INT; arg1 : TIdC_LONG; argp : Pointer) : TIdC_INT; cdecl;
  CRYPTO_EX_DATA_FUNCS = record
    argl : TIdC_LONG;	//* Arbitary long */
    argp : Pointer;	//* Arbitary void * */
    new_func : CRYPTO_EX_new;
    free_func : CRYPTO_EX_free;
    dup_func : CRYPTO_EX_dup;
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_CRYPTO_EX_DATA_FUNCS = record
    stack: stack;
  end;
  PSTACK_OF_CRYPTO_EX_DATA_FUNCS = ^STACK_OF_CRYPTO_EX_DATA_FUNCS;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_CRYPTO_EX_DATA_FUNCS = PSTACK;
  {$ENDIF}
  ///* An opaque type representing an implementation of "ex_data" support */
  PCRYPTO_EX_DATA_IMPL = Pointer;
  //bio.h
  //http://www.openssl.org/docs/crypto/bio.html
  PBIO = ^BIO;
  PBIO_METHOD = ^BIO_METHOD;
  Pbio_info_cb = procedure (_para1 : PBIO; _para2 : TIdC_INT; _para3 : PAnsiChar;
     _para4 : TIdC_INT; _para5, _para6 : TIdC_LONG); cdecl;
  BIO_METHOD = record
    _type : TIdC_INT;
    name : PAnsiChar;
    bwrite : function(_para1 : PBIO; _para2 : PAnsiChar; _para3 : TIdC_INT) : TIdC_INT; cdecl;
    bread : function(_para1: PBIO; _para2: PAnsiChar; _para3: TIdC_INT) : TIdC_INT; cdecl;
    bputs : function (_para1 : PBIO; _para2 : PAnsiChar) : TIdC_INT; cdecl;
    bgets : function (_para1 : PBIO; _para2 : PAnsiChar; _para3 : TIdC_INT) : TIdC_INT; cdecl;
    ctrl : function (_para1 : PBIO; _para2 : TIdC_INT; _para3 : TIdC_LONG; _para4 : Pointer) : TIdC_LONG; cdecl;
    create : function(_para1 : PBIO) : TIdC_INT; cdecl;
    destroy : function (_para1 : PBIO) : TIdC_INT; cdecl;
    callback_ctrl : function (_para1 : PBIO; _para2 : TIdC_INT; _para3 : pbio_info_cb): TIdC_LONG; cdecl;
  end;
  BIO = record
    method : PBIO_METHOD;
    // bio, mode, argp, argi, argl, ret
    callback : function (_para1 : PBIO; _para2 : TIdC_INT; _para3 : PAnsiChar;
       _para4 : TIdC_INT; _para5, _para6 : TIdC_LONG) : TIdC_LONG cdecl;
    cb_arg : PAnsiChar; // first argument for the callback
    init : TIdC_INT;
    shutdown : TIdC_INT;
    flags : TIdC_INT;  // extra storage
    retry_reason : TIdC_INT;
    num : TIdC_INT;
    ptr : Pointer;
    next_bio : PBIO;  // used by filter BIOs
    prev_bio : PBIO;  // used by filter BIOs
    references : TIdC_INT;
    num_read : TIdC_ULONG;
    num_write : TIdC_ULONG;
    ex_data : CRYPTO_EX_DATA;
  end;
  //struct from engine.h
//  ENGINE = record
    //I don't have any info about record fields.
//  end;
  PENGINE = Pointer;//^ENGINE;
  //asn1.h

  //#define I2D_OF(type) int (*)(type *,unsigned char **)
  I2D_OF_void = function(_para1 : Pointer; _para2 : PPByte) : TIdC_INT cdecl;
  //D2I_OF(type) type *(*)(type **,const unsigned char **,long)
  D2I_OF_void = function (_para1 : PPointer;  _para2 : PPByte; _para3 : TIdC_LONG) : Pointer cdecl;
  // This is just an opaque pointer
 // ASN1_VALUE = record
 // end;
  PASN1_VALUE = Pointer;//^ASN1_VALUE;
  PPASN1_VALUE = ^PASN1_VALUE;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_ASN1_VALUE = record
    stack: stack;
  end;
  PSTACK_OF_ASN1_VALUE = ^STACK_OF_AASN1_VALUE;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_ASN1_VALUE = PSTACK;
  {$ENDIF}
  ASN1_OBJECT = record
    sn, ln : PAnsiChar;
    nid    : TIdC_INT;
    length : TIdC_INT;
    data   : PAnsiChar;
    flags  : TIdC_INT; // Should we free this one
  end;
  PASN1_OBJECT = ^ASN1_OBJECT;
  PPASN1_OBJECT = ^PASN1_OBJECT;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_ASN1_OBJECT = record
    stack: stack;
  end;
  PSTACK_OF_ASN1_OBJECT = ^STACK_OF_ASN1_OBJECT;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_ASN1_OBJECT = PSTACK;
  {$ENDIF}
  PPSTACK_OF_ASN1_OBJECT = ^PSTACK_OF_ASN1_OBJECT;
  asn1_string_st = record
    length : TIdC_INT;
    _type : TIdC_INT;
    data : PAnsiChar;
    { The value of the following field depends on the type being
      held.  It is mostly being used for BIT_STRING so if the
      input data has a non-zero 'unused bits' value, it will be
      handled correctly }
    flags : TIdC_LONG;
  end;
   //moved from asn1.h section here for a type definition
  {$IFNDEF OPENSSL_EXPORT_VAR_AS_FUNCTION}
  // ASN1_ITEM pointer exported type
  // typedef const ASN1_ITEM ASN1_ITEM_EXP;
  PASN1_ITEM = ^ASN1_ITEM;
  {$ELSE}
  // Platforms that can't easily handle shared global variables are declared
  // as functions returning ASN1_ITEM pointers.
  // ASN1_ITEM pointer exported type
  //typedef const ASN1_ITEM * ASN1_ITEM_EXP(void);
  PASN1_ITEM_EXP = ^ASN1_ITEM_EXP;
  {$ENDIF}
//  typedef int asn1_output_data_fn(BIO *out, BIO *data, ASN1_VALUE *val, int flags,
//					const ASN1_ITEM *it);
  asn1_output_data_fn = function(AOut : PBIO; data : PBIO; val : PASN1_VALUE;
    flags : TIdC_INT; it : PASN1_ITEM): TIdC_INT; stdcall;
  ASN1_STRING = asn1_string_st;
  PASN1_STRING = ^ASN1_STRING;
  PPASN1_STRING = ^PASN1_STRING;
  ASN1_INTEGER = ASN1_STRING;
  PASN1_INTEGER = ^ASN1_INTEGER;
  PPASN1_INTEGER = ^PASN1_INTEGER;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_ASN1_INTEGER = record
    stack: stack;
  end;
  PSTACK_OF_ASN1_INTEGER = ^STACK_OF_ASN1_INTEGER;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_ASN1_INTEGER = PSTACK;
  {$ENDIF}
  ASN1_ENUMERATED = ASN1_STRING;
  PASN1_ENUMERATED = ^ASN1_ENUMERATED;
  PPASN1_ENUMERATED = ^PASN1_ENUMERATED;
  ASN1_BIT_STRING = ASN1_STRING;
  PASN1_BIT_STRING = ^ASN1_BIT_STRING;
  PPASN1_BIT_STRING = ^PASN1_BIT_STRING;
  ASN1_OCTET_STRING = ASN1_STRING;
  PASN1_OCTET_STRING = ^ASN1_OCTET_STRING;
  PPASN1_OCTET_STRING = ^PASN1_OCTET_STRING;
  ASN1_PRINTABLESTRING = ASN1_STRING;
  PASN1_PRINTABLESTRING = ^ASN1_PRINTABLESTRING;
  PPASN1_PRINTABLESTRING = ^PASN1_PRINTABLESTRING;
  ASN1_T61STRING = ASN1_STRING;
  PASN1_T61STRING = ^ASN1_T61STRING;
  PPASN1_T61STRING = ^PASN1_T61STRING;
  ASN1_IA5STRING = ASN1_STRING;
  PASN1_IA5STRING = ^ASN1_IA5STRING;
  PPASN1_IA5STRING = ^PASN1_IA5STRING;
  ASN1_UTCTIME = ASN1_STRING;
  PASN1_UTCTIME = ^ASN1_UTCTIME;
  PPASN1_UTCTIME = ^PASN1_UTCTIME;
  ASN1_GENERALIZEDTIME = ASN1_STRING;
  PASN1_GENERALIZEDTIME = ^ASN1_GENERALIZEDTIME;
  PPASN1_GENERALIZEDTIME = ^PASN1_GENERALIZEDTIME;
  ASN1_TIME = ASN1_STRING;
  PASN1_TIME = ^ASN1_TIME;
  PPASN1_TIME = ^PASN1_TIME;
  ASN1_GENERALSTRING = ASN1_STRING;
  PASN1_GENERALSTRING = ^ASN1_GENERALSTRING;
  PPASN1_GENERALSTRING = ^PASN1_GENERALSTRING;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_ASN1_GENERALSTRING = record
    _stack: STACK;
  end;
  PSTACK_OF_ASN1_GENERALSTRING =^STACK_OF_ASN1_GENERALSTRING;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
   PSTACK_OF_ASN1_GENERALSTRING = PSTACK;
  {$ENDIF}
  ASN1_UNIVERSALSTRING = ASN1_STRING;
  PASN1_UNIVERSALSTRING = ^ASN1_UNIVERSALSTRING;
  PPASN1_UNIVERSALSTRING = ^PASN1_UNIVERSALSTRING;
  ASN1_BMPSTRING = ASN1_STRING;
  PASN1_BMPSTRING = ^ASN1_BMPSTRING;
  PPASN1_BMPSTRING = ^PASN1_BMPSTRING;
  ASN1_VISIBLESTRING = ASN1_STRING;
  PASN1_VISIBLESTRING = ^ASN1_VISIBLESTRING;
  PPASN1_VISIBLESTRING = ^PASN1_VISIBLESTRING;
  ASN1_UTF8STRING = ASN1_STRING;
  PASN1_UTF8STRING = ^ASN1_UTF8STRING;
  PPASN1_UTF8STRING = ^PASN1_UTF8STRING;
  ASN1_BOOLEAN = TIdC_INT;
  PASN1_BOOLEAN = ^ASN1_BOOLEAN;
  PPASN1_BOOLEAN = ^PASN1_BOOLEAN;
  ASN1_NULL = TIdC_INT;
  PASN1_NULL = ^ASN1_NULL;
  PPASN1_NULL = ^PASN1_NULL;
  ASN1_TYPE = record
    case Integer of
      0:  (ptr: PAnsiChar);
      1:  (boolean: ASN1_BOOLEAN);
      2:  (asn1_string: PASN1_STRING);
      3:  (_object: PASN1_OBJECT);
      4:  (integer: PASN1_INTEGER);
      5:  (enumerated: PASN1_ENUMERATED);
      6:  (bit_string: PASN1_BIT_STRING);
      7:  (octet_string: PASN1_OCTET_STRING);
      8:  (printablestring: PASN1_PRINTABLESTRING);
      9:  (t61string: PASN1_T61STRING);
      10: (ia5string: PASN1_IA5STRING);
      11: (generalstring: PASN1_GENERALSTRING);
      12: (bmpstring: PASN1_BMPSTRING);
      13: (universalstring: PASN1_UNIVERSALSTRING);
      14: (utctime: PASN1_UTCTIME);
      15: (generalizedtime: PASN1_GENERALIZEDTIME);
      16: (visiblestring: PASN1_VISIBLESTRING);
      17: (utf8string: PASN1_UTF8STRING);
      { set and sequence are left complete and still
      contain the set or sequence bytes }
      18: (_set: PASN1_STRING);
      19: (sequence: PASN1_STRING);
  end;
  PASN1_TYPE = ^ASN1_TYPE;
  PPASN1_TYPE = ^PASN1_TYPE;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_ASN1_TYPE = record
    _stack: stack;
  end;
  PSTACK_OF_ASN1_TYPE = ^STACK_OF_ASN1_TYPE;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_ASN1_TYPE = ^PSTACK;
  {$ENDIF}
  ASN1_CTX = record
    p : PAnsiChar;         // work char pointer
    eos : TIdC_INT;    // end of sequence read for indefinite encoding
    error : TIdC_INT;  // error code to use when returning an error
    inf : TIdC_INT;    // constructed if 0x20, indefinite is 0x21
    tag : TIdC_INT;    // tag from last 'get object'
    xclass : TIdC_INT; // class from last 'get object'
    slen : TIdC_LONG;  // length of last 'get object'
    max : PAnsiChar;       // largest value of p allowed
    q : PAnsiChar;         // temporary variable
    pp : PPAnsiChar;       // variable
    line : TIdC_INT;   // used in error processing
  end;
  PASN1_CTX = ^ASN1_CTX;
  PPASN1_CTX = ^PASN1_CTX;
  ASN1_METHOD = record
    i2d : i2d_of_void;
    d2i : i2d_of_void;
    create : function: Pointer; cdecl;
    destroy : procedure(ptr: Pointer); cdecl;
  end;
  PASN1_METHOD = ^ASN1_METHOD;
  PPASN1_METHOD = ^PASN1_METHOD;
  // This is used when parsing some Netscape objects
  ASN1_HEADER = record
    header : PASN1_OCTET_STRING;
    data : Pointer;
    meth : PASN1_METHOD;
  end;
  PASN1_HEADER = ^ASN1_HEADER;
  PPASN1_HEADER = ^PASN1_HEADER;
  ASN1_ENCODING = record
    enc: PAnsiChar;
    len: TIdC_LONG;
    modified: TIdC_INT;
  end;
  PASN1_ENCODING = ^ASN1_ENCODING;
  PPASN1_ENCODING = ^ASN1_ENCODING;
  ASN1_STRING_TABLE = record
    nid : TIdC_INT;
    minsize : TIdC_LONG;
    maxsize : TIdC_LONG;
    mask : TIdC_ULONG;
    flags : TIdC_ULONG;
  end;
  PASN1_STRING_TABLE = ^ASN1_STRING_TABLE;
  PPASN1_STRING_TABLE = ^ASN1_STRING_TABLE;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_ASN1_STRING_TABLE = record
    _stack: stack;
  end;
  PSTACK_OF_ASN1_STRING_TABLE = ^STACK_OF_ASN1_STRING_TABLE;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_ASN1_STRING_TABLE = PSTACK;
  {$ENDIF}
  {$IFNDEF OPENSSL_EXPORT_VAR_AS_FUNCTION}
  // ASN1_ITEM pointer exported type
  // typedef const ASN1_ITEM ASN1_ITEM_EXP;
  // ASN1_ITEM_EXP = ASN1_ITEM;
  // PASN1_ITEM_EXP = ^ASN1_ITEM_EXP;
   // PASN1_ITEM = ^ASN1_ITEM;
    PASN1_ITEM_EXP = PASN1_ITEM;
  {$ELSE}
  // Platforms that can't easily handle shared global variables are declared
  // as functions returning ASN1_ITEM pointers.

  // ASN1_ITEM pointer exported type
  //typedef const ASN1_ITEM * ASN1_ITEM_EXP(void);
  ASN1_ITEM_EXP = function : PASN1_ITEM cdecl;
//  PASN1_ITEM_EXP = ^ASN1_ITEM_EXP;
  {$ENDIF}
  //rsa.h - struct rsa_st
  {$IFNDEF OPENSSL_NO_RSA}
    {$IFDEF OPENSSL_FIPS}
  FIPS_RSA_SIZE_T	= TIdC_int;
    {$ENDIF}
  PRSA = ^RSA;
  PPRSA =^PRSA;
  RSA_METHOD = record
    name : PAnsiChar;
    rsa_pub_enc : function (flen : TIdC_INT; const from : PAnsiChar;
      _to : PAnsiChar; rsa : PRSA; padding : TIdC_INT) : TIdC_INT; cdecl;
    rsa_pub_dec : function (flen : TIdC_INT; const from : PAnsiChar;
      _to : PAnsiChar; rsa : PRSA; padding : TIdC_INT) : TIdC_INT; cdecl;
    rsa_priv_enc : function (flen : TIdC_INT; const from : PAnsiChar;
      _to : PAnsiChar; rsa : PRSA; padding : TIdC_INT) : TIdC_INT; cdecl;
    rsa_priv_dec : function (flen : TIdC_INT; const from : PAnsiChar;
       _to : PAnsiChar; rsa : PRSA; padding : TIdC_INT) : TIdC_INT; cdecl;
    rsa_mod_exp : function (r0 : PBIGNUM; const I : PBIGNUM;
      rsa : PRSA; ctx : PBN_CTX) : TIdC_INT cdecl; // Can be null /
    bn_mod_exp : function (r : PBIGNUM; const a : PBIGNUM;
      const p : PBIGNUM; const m: PBIGNUM; ctx : PBN_CTX;
      m_ctx : PBN_MONT_CTX ) : TIdC_INT; cdecl; // Can be null
    init : function (rsa : PRSA) : TIdC_INT; cdecl; // called at new
    finish : function (rsa : PRSA) : TIdC_INT; cdecl; // called at free
    flags : TIdC_INT; // RSA_METHOD_FLAG_* things
    app_data : PAnsiChar;   // may be needed!
    // New sign and verify functions: some libraries don't allow arbitrary data
    // to be signed/verified: this allows them to be used. Note: for this to work
    // the RSA_public_decrypt() and RSA_private_encrypt() should *NOT* be used
    // RSA_sign(), RSA_verify() should be used instead. Note: for backwards
    // compatibility this functionality is only enabled if the RSA_FLAG_SIGN_VER
    // option is set in 'flags'.
    //
    rsa_sign : function (_type : TIdC_INT; const m : PAnsiChar; m_length : TIdC_UINT;
      sigret : PAnsiChar; siglen : PIdC_UINT; const rsa : PRSA) : TIdC_INT; cdecl;
    rsa_verify : function(dtype : TIdC_INT; const m : PAnsiChar; m_length : PIdC_UINT;
      sigbuf : PAnsiChar; siglen : PIdC_UINT; const rsa :PRSA) : TIdC_INT; cdecl;
    // If this callback is NULL, the builtin software RSA key-gen will be used.
    // This is for behavioural compatibility whilst the code gets rewired, but
    // one day it would be nice to assume there are no such things as "builtin
    // software" implementations.
    rsa_keygen : function (rsa : PRSA; bits : TIdC_INT; e : PBIGNUM; cb : PBN_GENCB) : TIdC_INT; cdecl;
  end;
  PRSA_METHOD = ^RSA_METHOD;
  RSA = record
    // The first parameter is used to pickup errors where
    // this is passed instead of aEVP_PKEY, it is set to 0
    pad : TIdC_INT;
    version : TIdC_LONG;
    meth : PRSA_METHOD; // const RSA_METHOD *meth;
    // functional reference if 'meth' is ENGINE-provided
    engine : PENGINE;
    n : PBIGNUM;
    e : PBIGNUM;
    d : PBIGNUM;
    p : PBIGNUM;
    q : PBIGNUM;
    dmp1 : PBIGNUM;
    dmq1 : PBIGNUM;
    iqmp : PBIGNUM;
    // be careful using this if the RSA structure is shared
    ex_data : CRYPTO_EX_DATA;
    references : TIdC_INT;
    flags : TIdC_INT;
    // Used to cache montgomery values
    _method_mod_n : PBN_MONT_CTX;
    _method_mod_p : PBN_MONT_CTX;
    _method_mod_q : PBN_MONT_CTX;
    // all BIGNUM values are actually in the following data, if it is not NULL
    bignum_data : PAnsiChar;
    blinding : PBN_BLINDING;
    mt_blinding : PBN_BLINDING;
  end;
  {$ENDIF}
  //dh.h
  {$IFNDEF OPENSSL_NO_DH}
  PDH = ^DH;
  DH_METHOD = record
    name : PAnsiChar;
    // Methods here
    generate_key : function (dh : PDH) : TIdC_INT; cdecl;
    compute_key : function (key : PAnsiChar; const pub_key : PBIGNUM; dh : PDH) : TIdC_INT; cdecl;
    bn_mod_exp : function (const dh : PDH; r : PBIGNUM; const e : PBIGNUM;
      const p : PBIGNUM; const m : PBIGNUM; ctx : PBN_CTX;
      m_ctx : PBN_MONT_CTX) : TIdC_INT; cdecl;  // Can be null
    init : function (dh : PDH) : TIdC_INT; cdecl;
    finish : function (dh : PDH) : TIdC_INT; cdecl;
    flags : TIdC_INT;
    app_data : PAnsiChar;
    // If this is non-NULL, it will be used to generate parameters
    generate_params : function(dh : PDH; prime_len, generator : TIdC_INT; cb : PBN_GENCB) : TIdC_INT; cdecl;
  end;
  DH = record
    // The first parameter is used to pickup errors where
    // this is passed instead of aEVP_PKEY, it is set to 0
    pad : TIdC_INT;
    version : TIdC_LONG;
    meth : PRSA_METHOD;
    // functional reference if 'meth' is ENGINE-provided
    engine: PENGINE;
    n : PBIGNUM;
    e : PBIGNUM;
    d : PBIGNUM;
    p : PBIGNUM;
    q : PBIGNUM;
    dmp1 : PBIGNUM;
    dmq1 : PBIGNUM;
    iqmp : PBIGNUM;
    // be careful using this if the RSA structure is shared
    ex_data : CRYPTO_EX_DATA;
    references : TIdC_INT;
    flags : TIdC_INT;
    // Used to cache montgomery values
    _method_mod_n : BN_MONT_CTX;
    _method_mod_p : BN_MONT_CTX;
    _method_mod_q : BN_MONT_CTX;
    // all BIGNUM values are actually in the following data, if it is not NULL
    bignum_data : PAnsiChar;
    blinding : PBN_BLINDING;
    mt_blinding : PBN_BLINDING;
  end;
  PPDH =^PDH;
  {$ENDIF}
  // dsa.h
  {$IFNDEF OPENSSL_NO_DSA}
    {$IFDEF OPENSSL_FIPS}
  FIPS_DSA_SIZE_T = TIdC_int;
    {$ENDIF}
  DSA_SIG = record
    r : PBIGNUM;
    s : PBIGNUM;
  end;
  PDSA_SIG = ^DSA_SIG;
  PDSA = ^DSA;
  DSA_METHOD = record
    name : PAnsiChar;
    dsa_do_sign : function (const dgst : PAnsiChar; dlen : TIdC_INT; dsa : PDSA) : PDSA_SIG; cdecl;
    dsa_sign_setup : function (dsa : PDSA; ctx_in : PBN_CTX; kinvp, rp : PPBN_CTX) : TIdC_INT; cdecl;
    dsa_do_verify : function(dgst : PAnsiChar; dgst_len : TIdC_INT;
      sig : PDSA_SIG; dsa : PDSA) : TIdC_INT; cdecl;
    dsa_mod_exp : function(dsa : PDSA; rr, a1, p1,
       a2, p2, m : PBIGNUM; ctx : PBN_CTX;
       in_mont : PBN_MONT_CTX) : TIdC_INT; cdecl;
    bn_mod_exp : function (dsa : PDSA; r, a : PBIGNUM; const p, m : PBIGNUM;
      ctx : PBN_CTX; m_ctx : PBN_CTX): TIdC_INT; cdecl; // Can be null
    init : function (dsa : PDSA) : TIdC_INT; cdecl;
    finish : function (dsa : PDSA) : TIdC_INT; cdecl;
    flags : TIdC_INT;
    app_data : PAnsiChar;
    // If this is non-NULL, it is used to generate DSA parameters
     dsa_paramgen : function (dsa : PDSA; bits : TIdC_INT; seed : PAnsiChar;
       seed_len : TIdC_INT; counter_ret : PIdC_INT; h_ret : PIdC_ULONG;
       cb : PBN_GENCB ) : TIdC_INT; cdecl;
    // If this is non-NULL, it is used to generate DSA keys
    dsa_keygen : function(dsa : PDSA) : TIdC_INT; cdecl;
  end;
  PDSA_METHOD = ^DSA_METHOD;
  DSA = record
    // This first variable is used to pick up errors where
    // a DSA is passed instead of of a EVP_PKEY
    pad : TIdC_INT;
    version : TIdC_LONG;
    write_params : TIdC_INT;
    p : PBIGNUM;
    q : PBIGNUM; // == 20
    g : PBIGNUM;
    pub_key : PBIGNUM;  // y public key
    priv_key : PBIGNUM; // x private key
    kinv : BIGNUM; // Signing pre-calc
    r : PBIGNUM;   // Signing pre-calc
    flags : TIdC_INT;
    // Normally used to cache montgomery values
    method_mont_p : PBN_MONT_CTX;
    references : TIdC_INT;
    ex_data : CRYPTO_EX_DATA;
    meth : PDSA_METHOD;
    // functional reference if 'meth' is ENGINE-provided
    engine : PENGINE;
  end;
  PPDSA = ^PDSA;
  {$ENDIF}
  // ec.h
  {$IFNDEF OPENSSL_NO_EC}
 // EC_METHOD = record
    //The fields are internal to OpenSSL, they are not listed in the header.
 // end;
  PEC_METHOD = Pointer;//^EC_METHOD;
  PPEC_METHOD = ^PEC_METHOD;
 // EC_GROUP = record
    //The fields are internal to OpenSSL, they are not listed in the header.
//  end;
  PEC_GROUP = Pointer;//^EC_GROUP;
  PPEC_GROUP = ^PEC_GROUP;
//  EC_POINT = record
    //The fields are internal to OpenSSL, they are not listed in the header.
//  end;
  PEC_POINT = Pointer;//^EC_POINT;
  PPEC_POINT = ^PEC_POINT;
  EC_builtin_curve = record
    nid : TIdC_INT;
    comment : PAnsiChar;
  end;
  PEC_KEY = Pointer;//^EC_KEY;
//  EC_KEY = record
    //The fields are internal to OpenSSL, they are not listed in the header.
//  end;
  PPEC_KEY = ^PEC_KEY;
  {$ENDIF}
  //evp.h
//  EVP_PBE_KEYGEN = record
//  end;
  PEVP_PBE_KEYGEN = Pointer;//^EVP_PBE_KEYGEN;
  //evp.h
  //struct evp_pkey_st
  PPEVP_PKEY = ^PEVP_PKEY;
  PEVP_PKEY = ^EVP_PKEY;
  EVP_PKEY_union = record
    case byte of
      0: (ptr : PAnsiChar);
      {$IFNDEF OPENSSL_NO_RSA}
      1: (rsa : PRSA);    // RSA
      {$ENDIF}
      {$IFNDEF OPENSSL_NO_DSA}
      2: (dsa : PDSA);    // DSA
      {$ENDIF}
      {$IFNDEF OPENSSL_NO_DH}
      3: (dh :PDH);       // DH
      {$ENDIF}
      {$IFNDEF OPENSSL_NO_EC}
      4: (ec : PEC_KEY);  // ECC
      {$ENDIF}
  end;
  Pevp_pkey_st    = PEVP_PKEY;
  //this was moved from x509 section so that something here can compile.
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_ATTRIBUTE = record
    _stack: STACK;
  end;
  PSTACK_OF_X509_ATTRIBUTE = ^STACK_OF_X509_ATTRIBUTE;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_ATTRIBUTE = PSTACK;
  {$ENDIF}
  PPSTACK_OF_X509_ATTRIBUTE = ^PSTACK_OF_X509_ATTRIBUTE;
  EVP_PKEY = record
    _type : TIdC_INT;
    save_type : TIdC_INT;
    references : TIdC_INT;
    pkey : EVP_PKEY_union;
    attributes : PSTACK_OF_X509_ATTRIBUTE;  // [ 0 ]
  end;
  PEVP_MD = ^EVP_MD;
  EVP_MD_CTX = record
    digest : PEVP_MD;
    engine : PENGINE; // functional reference if 'digest' is ENGINE-provided
    flags : TIdC_ULONG;
    md_data : Pointer;
  end;
  PEVP_MD_CTX = ^EVP_MD_CTX;
  EVP_MD_SVCTX = record
	  mctx : PEVP_MD_CTX;
	  key : Pointer;
  end;
  PEVP_MD_SVCTX = ^EVP_MD_SVCTX;
  EVP_MD = record
    _type : TIdC_INT;
    pkey_type : TIdC_INT;
    md_size : TIdC_INT;
    flags : TIdC_ULONG;
    init : function (ctx : PEVP_MD_CTX) : TIdC_INT; cdecl;
    update : function (ctx : PEVP_MD_CTX; data : Pointer; count : size_t):TIdC_INT; cdecl;
    _final : function (ctx : PEVP_MD_CTX; md : PAnsiChar) : TIdC_INT; cdecl;
    copy : function (_to : PEVP_MD_CTX; from : PEVP_MD_CTX ) : TIdC_INT; cdecl;
    cleanup : function(ctx : PEVP_MD_CTX) : TIdC_INT; cdecl;
    // FIXME: prototype these some day
    sign : function(_type : TIdC_INT; m : PAnsiChar; m_length : TIdC_UINT;
      sigret : PAnsiChar; siglen : TIdC_UINT; key : Pointer) : TIdC_INT; cdecl;
    verify : function(_type : TIdC_INT; m : PAnsiChar; m_length : PAnsiChar;
      sigbuf : PAnsiChar; siglen : TIdC_UINT; key : Pointer) : TIdC_INT; cdecl;
    required_pkey_type : array [0..4] of TIdC_INT; // EVP_PKEY_xxx
    block_size : TIdC_INT;
    ctx_size : TIdC_INT; // how big does the ctx->md_data need to be
  end;
  PPEVP_CIPHER_CTX = ^PEVP_CIPHER_CTX;
  PEVP_CIPHER_CTX = ^EVP_CIPHER_CTX;
  PEVP_CIPHER = ^EVP_CIPHER;
  EVP_CIPHER = record
    nid : TIdC_INT;
    block_size : TIdC_INT;
    key_len : TIdC_INT; // Default value for variable length ciphers
    iv_len : TIdC_INT;
    flags : TIdC_UINT; // Various flags
    init : function (ctx : PEVP_CIPHER_CTX; key : PAnsiChar; iv : PAnsiChar; enc : TIdC_INT): TIdC_INT; cdecl;
    do_cipher : function (ctx : PEVP_CIPHER_CTX; _out : PAnsiChar; _in : PAnsiChar; inl : TIdC_UINT) : TIdC_INT; cdecl;
    cleanup : function (_para1 : PEVP_CIPHER_CTX): TIdC_INT; cdecl; // cleanup ctx
    ctx_size : TIdC_INT;  // how big ctx->cipher_data needs to be
    set_asn1_parameters : function (_para1 : PEVP_CIPHER_CTX;
      _para2 : PASN1_TYPE) : TIdC_INT; cdecl; // Populate a ASN1_TYPE with parameters
    get_asn1_parameters :function (_para1 : PEVP_CIPHER_CTX;
      _para2 :  PASN1_TYPE) : TIdC_INT; cdecl; // Get parameters from a ASN1_TYPE
    ctrl : function (_para1 : PEVP_CIPHER_CTX; _type : TIdC_INT; arg : TIdC_INT;
      ptr : Pointer): TIdC_INT; cdecl; // Miscellaneous operations
    app_data : Pointer;  // Application data
  end;
  EVP_CIPHER_CTX = record
    cipher : PEVP_CIPHER;
    engine : PENGINE;   // functional reference if 'cipher' is ENGINE-provided
    encrypt: TIdC_INT;  // encrypt or decrypt
    buf_len : TIdC_INT; // number we have left
    oiv : array [0..EVP_MAX_IV_LENGTH-1] of AnsiChar; // original iv
    iv : array [0..EVP_MAX_IV_LENGTH -1] of AnsiChar; // working iv
    buf : array [0..EVP_MAX_BLOCK_LENGTH -1] of AnsiChar; // saved partial block
    num : TIdC_INT;     // used by cfb/ofb mode
    app_data : Pointer; // application stuff
    key_len : TIdC_INT; // May change for variable length cipher
    flags : TIdC_ULONG;	// Various flags
    cipher_data : Pointer; // per EVP data
    final_used : TIdC_INT;
    block_mask : TIdC_INT;
    _final : array [0..EVP_MAX_BLOCK_LENGTH-1] of AnsiChar; // possible final block
  end;
  EVP_CIPHER_INFO = record
    cipher : PEVP_CIPHER;
    iv : array [0..EVP_MAX_IV_LENGTH -1] of AnsiChar;
  end;
  PEVP_CIPHER_INFO = ^EVP_CIPHER_INFO;
  EVP_ENCODE_CTX = record
    num : TIdC_INT;    // number saved in a partial encode/decode
    length: TIdC_INT;  // The length is either the output line length
                       // (in input bytes) or the shortest input line
                       // length that is ok.  Once decoding begins,
                       // the length is adjusted up each time a longer
                       // line is decoded
    enc_data:array [0..79] of AnsiChar;
    line_num: TIdC_INT;	// number read on current line
    expect_nl: TIdC_INT;
  end;
  PEVP_ENCODE_CTX = ^EVP_ENCODE_CTX;
  //forward declarations from x509.h to make sure this compiles.
  PX509 = ^X509;
  PPX509 = ^PX509;
  PX509_CRL = ^X509_CRL;
  PX509_NAME = ^X509_NAME;
  PX509_NAME_ENTRY = ^X509_NAME_ENTRY;
  PX509_REQ = ^X509_REQ;
  PX509_REQ_INFO = ^X509_REQ_INFO;
  PPX509_REQ_INFO = ^PX509_REQ_INFO;
  {$IFDEF DEBUG_SAFESTACK}
  PSTACK_OF_X509_NAME_ENTRY = ^STACK_OF_X509_NAME_ENTRY;
  PSTACK_OF_X509_REVOKED = ^STACK_OF_X509_REVOKED;
  {$ELSE}
  PSTACK_OF_X509_NAME_ENTRY = PSTACK;
  PSTACK_OF_X509_REVOKED = PSTACK;
  {$ENDIF}
  PPSTACK_OF_X509_REVOKED = ^PSTACK_OF_X509_REVOKED;
  PPX509_NAME =^PX509_NAME;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_NAME = record
    _stack: STACK;
  end;
  PSTACK_OF_X509_NAME = ^STACK_OF_X509_NAME;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_NAME = PSTACK;
  {$ENDIF}
  PPSTACK_OF_X509_NAME = ^PSTACK_OF_X509_NAME;
  //pcy_int.h
  //Note that anything other than PSTACK should be undefined since the record
  //members aren't exposed in the headers.
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_POLICY_DATA = record
    _stack: stack;
  end;
  PSTACK_OF_X509_POLICY_DATA = ^STACK_OF_X509_POLICY_DATA;
  STACK_OF_X509_POLICY_REF = record
    _stack: stack;
  end;
  PSTACK_OF_X509_POLICY_REF = ^STACK_OF_X509_POLICY_DATA;
  STACK_OF_X509_POLICY_NODE = record
    _stack: stack;
  end;
  PSTACK_OF_X509_POLICY_NODE = ^STACK_OF_X509_POLICY_NODE;
  PSTACK_OF_POLICYQUALINFO = ^STACK_OF_POLICYQUALINFO;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_POLICY_DATA = PSTACK;
  PSTACK_OF_X509_POLICY_REF = PSTACK;
  PSTACK_OF_X509_POLICY_NODE = PSTACK;
  PSTACK_OF_POLICYQUALINFO = PSTACK;
  {$ENDIF}
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509V3_EXT_METHOD = record
    _stack: stack;
  end;
  PSTACK_OF_X509V3_EXT_METHOD = ^STACK_OF_X509V3_EXT_METHOD;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509V3_EXT_METHOD = PSTACK;
  {$ENDIF}
  PPSTACK_OF_X509V3_EXT_METHOD = ^PSTACK_OF_X509V3_EXT_METHOD;
  {$IFDEF DEBUF_SAFESTACK}
  STACK_OF_X509 = record
    _stack: STACK;
  end;
  PSTACK_OF_X509 = ^STACK_OF_X509;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509 = PSTACK;
  {$ENDIF}
  //fips.h
  //engiene.h
  {$IFNDEF OPENSSL_NO_ENGINE}
  //* Generic function pointer */
//typedef int (*ENGINE_GEN_FUNC_PTR)(void);
  ENGINE_GEN_FUNC_PTR = function : TIdC_INT; cdecl;
//  typedef int (*ENGINE_GEN_INT_FUNC_PTR)(ENGINE *);
  ENGINE_GEN_INT_FUNC_PTR = function(Para1 : PENGINE) : TIdC_INT; cdecl;
//typedef int (*ENGINE_CTRL_FUNC_PTR)(ENGINE *, int, long, void *, void (*f)(void));
  ENGINE_CTRL_FUNC_PTR_F = procedure; cdecl;
  ENGINE_CTRL_FUNC_PTR = function(Para1 : PENGINE; Para2 : TIdC_INT;
    Para3 : TIdC_LONG; Para4 : Pointer; f : ENGINE_CTRL_FUNC_PTR_F) : TIdC_Int; cdecl;
//typedef EVP_PKEY * (*ENGINE_LOAD_KEY_PTR)(ENGINE *, const char *,
//	UI_METHOD *ui_method, void *callback_data);
  ENGINE_LOAD_KEY_PTR = function(Para1 : PENGINE; Para2 : PAnsiChar;
    ui_method : PUI_METHOD; callback_data : Pointer) : PEVP_PKEY; cdecl;
//typedef int (*ENGINE_SSL_CLIENT_CERT_PTR)(ENGINE *, SSL *ssl,
//	STACK_OF(X509_NAME) *ca_dn, X509 **pcert, EVP_PKEY **pkey,
//	STACK_OF(X509) **pother, UI_METHOD *ui_method, void *callback_data);
  ENGINE_SSL_CLIENT_CERT_PTR = function(Para1 : PENGINE; ssl : PSSL;
    ca_dn : PSTACK_OF_X509_NAME; var pcert : PX509; var pkey : PEVP_PKEY;
    var pother : PSTACK_OF_X509; ui_method : PUI_METHOD; callback_data : Pointer) : TIdC_Int; cdecl;
//typedef int (*ENGINE_CIPHERS_PTR)(ENGINE *, const EVP_CIPHER **, const int **, int);
  ENGINE_CIPHERS_PTR = function(para1 : PENGINE; var para2 : PEVP_CIPHER; var para3 : PIdC_Int; para4 : TIdC_Int) : TIdC_Int; cdecl;
//typedef int (*ENGINE_DIGESTS_PTR)(ENGINE *, const EVP_MD **, const int **, int);
  ENGINE_DIGESTS_PTR = function(para1 : PENGINE; var Para2 : PEVP_MD; var Para3 : PIdC_INT; para : TIdC_INT) : TIdC_INT; cdecl;
{
/* When compiling an ENGINE entirely as an external shared library, loadable by
 * the "dynamic" ENGINE, these types are needed. The 'dynamic_fns' structure
 * type provides the calling application's (or library's) error functionality
 * and memory management function pointers to the loaded library. These should
 * be used/set in the loaded library code so that the loading application's
 * 'state' will be used/changed in all operations. The 'static_state' pointer
 * allows the loaded library to know if it shares the same static data as the
 * calling application (or library), and thus whether these callbacks need to be
 * set or not. */
}
//typedef void *(*dyn_MEM_malloc_cb)(size_t);
  dyn_MEM_malloc_cb = function(para1 : size_t) : Pointer; cdecl;
//typedef void *(*dyn_MEM_realloc_cb)(void *, size_t);
  dyn_MEM_realloc_cb = function (para1 : Pointer; para2 : size_t): Pointer; cdecl;
//typedef void (*dyn_MEM_free_cb)(void *);
  dyn_MEM_free_cb = procedure (para1 : Pointer); cdecl;
  dynamic_MEM_fns = record
    malloc_cb : dyn_MEM_malloc_cb;
    realloc_cb : dyn_MEM_realloc_cb;
    free_cb : dyn_MEM_free_cb;
  end;
///* FIXME: Perhaps the memory and locking code (crypto.h) should declare and use
// * these types so we (and any other dependant code) can simplify a bit?? */
//typedef void (*dyn_lock_locking_cb)(int,int,const char *,int);
  dyn_lock_locking_cb = procedure (para1, para2 : TIdC_INT; para3 : PAnsiChar; para4 : TIdC_INT); cdecl;
//typedef int (*dyn_lock_add_lock_cb)(int*,int,int,const char *,int);
  dyn_lock_add_lock_cb = function (var para1 : TIdC_INT; para2, para3 : TIdC_INT; para4 : PAnsiChar; para5 : TIdC_INT) : TIdC_INT; cdecl;
//typedef struct CRYPTO_dynlock_value *(*dyn_dynlock_create_cb)(
//						const char *,int);
  dyn_dynlock_create_cb = function (para1 : PAnsiChar; para2 : TIdC_INT) : PCRYPTO_dynlock_value; cdecl;
//typedef void (*dyn_dynlock_lock_cb)(int,struct CRYPTO_dynlock_value *,
//						const char *,int);
  dyn_dynlock_lock_cb = procedure (para1 : TIdC_INT; para2 : PCRYPTO_dynlock_value); cdecl;
//typedef void (*dyn_dynlock_destroy_cb)(struct CRYPTO_dynlock_value *,
//						const char *,int);
  dyn_dynlock_destroy_cb = procedure(para1 : PCRYPTO_dynlock_value; para2 : PAnsiChar; para3 : TIdC_INT); cdecl;
//typedef struct st_dynamic_LOCK_fns {
//	dyn_lock_locking_cb			lock_locking_cb;
//	dyn_lock_add_lock_cb			lock_add_lock_cb;
//	dyn_dynlock_create_cb			dynlock_create_cb;
//	dyn_dynlock_lock_cb			dynlock_lock_cb;
//	dyn_dynlock_destroy_cb			dynlock_destroy_cb;
//	} dynamic_LOCK_fns;
   dynamic_LOCK_fns = record
     lock_locking_cb : dyn_lock_locking_cb;
     lock_add_lock_cb : dyn_lock_add_lock_cb;
     dynlock_create_cb : dyn_dynlock_create_cb;
     dynlock_lock_cb : dyn_dynlock_lock_cb;
     dynlock_destroy_cb : dyn_dynlock_destroy_cb;
   end;
//* The top-level structure */
   dynamic_fns = record
     static_state : Pointer;
     err_fns : PERR_FNS;
     ex_data_fns : PCRYPTO_EX_DATA_IMPL;
     mem_fns : dynamic_MEM_fns;
     lock_fns : dynamic_LOCK_fns;
   end;
// typedef unsigned long (*dynamic_v_check_fn)(unsigned long ossl_version);
  dynamic_v_check_fn = function(ossl_version : TIdC_ULONG) : TIdC_ULONG; cdecl;
//typedef int (*dynamic_bind_engine)(ENGINE *e, const char *id,
//    const dynamic_fns *fns);
  dynamic_bind_engine = function(e : PENGINE; id : PAnsiChar; fns : dynamic_fns) : TIdC_INT; cdecl;
  {$ENDIF}
  //ecdsa.h
  {$IFNDEF OPENSSL_NO_ECDSA}
  ECDSA_SIG = record
    r : PBIGNUM;
    s : PBIGNUM;
  end;
  PECDSA_SIG = ^ECDSA_SIG;
  PPECDSA_SIG = ^PECDSA_SIG;
//  ECDH_METHOD = record
    //defined interally, not through the header so use function to access members
 // end;
  PECDH_METHOD = Pointer;//^ECDH_METHOD;
  PPECDH_METHOD = ^PECDH_METHOD;
  {$ENDIF}
  //ecdh.h
  //aes.h
 {$IFNDEF OPENSSL_NO_AES}
   {$IFDEF OPENSSL_FIPS}
  FIPS_AES_SIZE_T	= TIdC_INT;
  {$ENDIF}
  //OpenSSL Developer's note
  // This should be a hidden type, but EVP requires that the size be known
  AES_KEY = record
    rd_key: array[0..(4 *(AES_MAXNR + 1)-1)] of TIdC_UINT;
    rounds : TIdC_INT;
  end;
  PAES_KEY = ^AES_KEY;
  PPAES_KEY = ^PAES_KEY;
  {$ENDIF}
  //lhash.h
  PLHASH_NODE = ^LHASH_NODE;
  PPLHASH_NODE = ^PLHASH_NODE;
  LHASH_NODE = record
    data : Pointer;
    next : PLHASH_NODE;
    {$IFNDEF OPENSSL_NO_HASH_COMP}
    hash : TIdC_ULONG;
    {$ENDIF}
  end;
  LHASH_COMP_FN_TYPE = function (const p1,p2 : Pointer) : TIdC_INT; cdecl;
  PLHASH_COMP_FN_TYPE = ^LHASH_COMP_FN_TYPE;
  LHASH_HASH_FN_TYPE = function(const p1 : Pointer) : TIdC_ULONG; cdecl;
  LHASH_DOALL_FN_TYPE = procedure(p1 : Pointer); cdecl;
  LHASH_DOALL_ARG_FN_TYPE = procedure(p1, p2 : Pointer); cdecl;
  LHASH = record
    b : PPLHASH_NODE;
    comp : LHASH_COMP_FN_TYPE;
    hash : LHASH_HASH_FN_TYPE;
    num_nodes : TIdC_UINT;
    num_alloc_nodes : TIdC_UINT;
    p : TIdC_UINT;
    pmax : TIdC_UINT;
    up_load : TIdC_ULONG; // load times 256
    down_load : TIdC_ULONG; // load times 256
    num_items : TIdC_ULONG;
    num_expands : TIdC_ULONG;
    num_expand_reallocs : TIdC_ULONG;
    num_contracts : TIdC_ULONG;
    num_contract_reallocs : TIdC_ULONG;
    num_hash_calls : TIdC_ULONG;
    num_comp_calls : TIdC_ULONG;
    num_insert : TIdC_ULONG;
    num_replace : TIdC_ULONG;
    num_delete : TIdC_ULONG;
    num_no_delete : TIdC_ULONG;
    num_retrieve : TIdC_ULONG;
    num_retrieve_miss : TIdC_ULONG;
    num_hash_comps : TIdC_ULONG;
    error : TIdC_INT;
  end;
  PLHASH = ^LHASH;
  //conf.h
  CONF_VALUE = record
    section : PAnsiChar;
    name : PAnsiChar;
    value : PAnsiChar;
  end;
  PCONF_VALUE = ^CONF_VALUE;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_CONF_VALUE = record
    stack: stack;
  end;
  PSTACK_OF_CONF_VALUE = ^STACK_OF_CONF_VALUE;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_CONF_VALUE = PSTACK;
  {$ENDIF}
  //* This is used to contain a list of bit names */
  BIT_STRING_BITNAME = record
    bitnum : TIdC_INT;
    lname : PAnsiChar;
    sname : PAnsiChar;
  end;
  PBIT_STRING_BITNAME = ^BIT_STRING_BITNAME;
  PPBIT_STRING_BITNAME = ^PBIT_STRING_BITNAME;
  buf_mem_st = record
    length : TIdC_INT; // current number of bytes
    data : PAnsiChar;
    max: TIdC_INT; // size of buffer
  end;
  BUF_MEM = buf_mem_st;
  PBUF_MEM = ^BUF_MEM;
  PPBUF_MEM = ^PBUF_MEM;
  PFILE = Pointer;
  //asn1t.h
  ASN1_TEMPLATE = record
    flags : TIdC_ULONG;   // Various flags
    tag : TIdC_LONG;      // tag, not used if no tagging
    offset : TIdC_ULONG;  // Offset of this field in structure
    {$IFNDEF NO_ASN1_FIELD_NAMES}
    field_name : PAnsiChar;   // Field name
    {$ENDIF}
    item : PASN1_ITEM_EXP; // Relevant ASN1_ITEM or ASN1_ADB
  end;
  PASN1_TEMPLATE = ^ASN1_TEMPLATE;
  ASN1_ITEM = record
    itype : Char;                 // The item type, primitive, SEQUENCE, CHOICE or extern
    utype : TIdC_LONG;            // underlying type
    templates : PASN1_TEMPLATE;   // If SEQUENCE or CHOICE this contains the contents
    tcount : TIdC_LONG;           // Number of templates if SEQUENCE or CHOICE
    funcs : Pointer;              // functions that handle this type
    size : TIdC_LONG;             // Structure size (usually)
    {$IFNDEF NO_ASN1_FIELD_NAMES}
    sname : PAnsiChar;		  // Structure name
    {$ENDIF}
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_ASN1_ADB_TABLE = record
    stack: stack;
  end;
  PSTACK_OF_ASN1_ADB_TABLE = ^STACK_OF_ASN1_ADB_TABLE;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_ASN1_ADB_TABLE = PSTACK;
  {$ENDIF}
  PPSTACK_OF_ASN1_ADB_TABLE = ^PSTACK_OF_ASN1_ADB_TABLE;
  PASN1_ADB_TABLE = ^ASN1_ADB_TABLE;
  PASN1_ADB = ^ASN1_ADB;
  ASN1_ADB = record
    flags : TIdC_ULONG;          // Various flags
    offset : TIdC_ULONG;         // Offset of selector field
    app_items : PPSTACK_OF_ASN1_ADB_TABLE; // Application defined items
    tbl : PASN1_ADB_TABLE;       // Table of possible types
    tblcount : TIdC_LONG;        // Number of entries in tbl
    default_tt : PASN1_TEMPLATE; // Type to use if no match
    null_tt : PASN1_TEMPLATE;    // Type to use if selector is NULL
  end;
  ASN1_ADB_TABLE = record
    flags : TIdC_LONG;            // Various flags
    offset : TIdC_LONG;	          // Offset of selector field
    app_items : PPSTACK_OF_ASN1_ADB_TABLE; // Application defined items
    tbl : PASN1_ADB_TABLE;        // Table of possible types
    tblcount : TIdC_LONG;         // Number of entries in tbl
    default_tt : PASN1_TEMPLATE;  // Type to use if no match
    null_tt : PASN1_TEMPLATE;     // Type to use if selector is NULL
  end;
  PASN1_TLC = ^ASN1_TLC;
  ASN1_TLC = record
	  valid : Byte;	//* Values below are valid */
	  ret : TIdC_INT;	//* return value */
	  plen : TIdC_LONG;	//* length */
	  ptag : TIdC_INT;	//* class value */
	  pclass : TIdC_INT;	//* class value */
	  hdrlen : TIdC_INT;	//* header length */
  end;
  ///* Typedefs for ASN1 function pointers */
  ASN1_new_func = function : PASN1_VALUE; cdecl;
  ASN1_free_func = procedure (a : PASN1_VALUE); cdecl;
//  typedef ASN1_VALUE * ASN1_d2i_func(ASN1_VALUE **a, const unsigned char ** in, long length);
  ASN1_d2i_func = function (a : PASN1_VALUE; _in : PPByte; length : TIdC_LONG ) : PASN1_VALUE; cdecl;
 // typedef int ASN1_i2d_func(ASN1_VALUE * a, unsigned char **in);
  ASN1_i2d_func = function (a : PASN1_VALUE; _in : PPByte)  : TIdC_INT; cdecl;
//  typedef int ASN1_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len, const ASN1_ITEM *it,
//					int tag, int aclass, char opt, ASN1_TLC *ctx);
  ASN1_ex_d2i = function(pval : PPASN1_VALUE; _in : PPByte; len : TIdC_LONG;
    it : PASN1_ITEM; tag, aclass : TIdC_INT; opt : Byte;
    ctx : PASN1_TLC) : TIdC_INT; cdecl;
//typedef int ASN1_ex_i2d(ASN1_VALUE **pval, unsigned char **out, const ASN1_ITEM *it, int tag, int aclass);
  ASN1_ex_i2d = function(pval : PPASN1_VALUE; _out : PPByte;  it : PASN1_ITEM; tag, aclass : TIdC_INT) : TIdC_INT; cdecl;
//typedef int ASN1_ex_new_func(ASN1_VALUE **pval, const ASN1_ITEM *it);
  ASN1_ex_new_func = function(pval : PPASN1_VALUE; it : PASN1_ITEM) : TIdC_INT; cdecl;
//typedef void ASN1_ex_free_func(ASN1_VALUE **pval, const ASN1_ITEM *it);
  ASN1_ex_free_func = procedure( pval : PPASN1_VALUE; it : PASN1_ITEM); cdecl;
//typedef int ASN1_primitive_i2c(ASN1_VALUE **pval, unsigned char *cont, int *putype, const ASN1_ITEM *it);
  ASN1_primitive_i2c = function (pval : PPASN1_VALUE; cont : PByte; putype : PIdC_INT; it : PASN1_ITEM ) : TIdC_INT; cdecl;
//typedef int ASN1_primitive_c2i(ASN1_VALUE **pval, const unsigned char *cont, int len, int utype, char *free_cont, const ASN1_ITEM *it);
  ASN1_primitive_c2i = function (pval : PPASN1_VALUE; cont : PByte; len, utype : TIdC_INT; free_cont : PByte; it: PASN1_ITEM) : TIdC_INT; cdecl;
  ///* end typedefs
  ASN1_COMPAT_FUNCS = record
	  asn1_new : ASN1_new_func;
	  asn1_free : ASN1_free_func;
	  asn1_d2i : ASN1_d2i_func;
	 asn1_i2d : ASN1_i2d_func;
  end;
  PASN1_COMPAT_FUNCS = ^ASN1_COMPAT_FUNCS;
  ASN1_EXTERN_FUNCS = record
	  app_data : Pointer;
    asn1_ex_new : ASN1_ex_new_func; //	ASN1_ex_new_func *asn1_ex_new;
    asn1_ex_free : ASN1_ex_free_func; //	ASN1_ex_free_func *asn1_ex_free;
    asn1_ex_clear: ASN1_ex_free_func;//	ASN1_ex_free_func *asn1_ex_clear;
    asn1_ex_d2i : ASN1_ex_d2i;//	ASN1_ex_d2i *asn1_ex_d2i;
    asn1_ex_i2d : ASN1_ex_i2d; //	ASN1_ex_i2d *asn1_ex_i2d;
  end;
  PASN1_EXTERN_FUNCS = ^ASN1_EXTERN_FUNCS;
  ASN1_PRIMITIVE_FUNCS = record
    app_data : Pointer;
    flags : TIdC_ULONG;
//	ASN1_ex_new_func *prim_new;
    prim_new : ASN1_ex_new_func;
//	ASN1_ex_free_func *prim_free;
    prim_free : ASN1_ex_free_func;
//	ASN1_ex_free_func *prim_clear;
    prim_clear : ASN1_ex_free_func;
//	ASN1_primitive_c2i *prim_c2i;
    prim_c2i : ASN1_primitive_c2i;
//	ASN1_primitive_i2c *prim_i2c;
    prim_i2c : ASN1_primitive_i2c;
  end;
  PASN1_PRIMITIVE_FUNCS = ^ASN1_PRIMITIVE_FUNCS;
//typedef int ASN1_aux_cb(int operation, ASN1_VALUE **in, const ASN1_ITEM *it);
  ASN1_aux_cb = function (operation : TIdC_INT; _in : PPASN1_VALUE; it : PASN1_ITEM) : TIdC_INT; cdecl;
  ASN1_AUX = record
    app_data : Pointer;
    flags : TIdC_INT;
    ref_offset : TIdC_INT;		//* Offset of reference value */
    ref_lock : TIdC_INT;		//* Lock type to use */
    asn1_cb : ASN1_aux_cb; //ASN1_aux_cb *asn1_cb;
    enc_offset : TIdC_INT;		//* Offset of ASN1_ENCODING structure */
  end;
  PASN1_AUX = ^ASN1_AUX;
  //hmac.h
  //This has to come after the EVP definitions
  {$IFNDEF OPENSSL_NO_HMAC}
  HMAC_CTX = record
    md : PEVP_MD;
    md_ctx : EVP_MD_CTX;
    i_ctx : EVP_MD_CTX;
    o_ctx : EVP_MD_CTX;
    key_length : TIdC_UINT;
    key : array[0..(HMAC_MAX_MD_CBLOCK - 1)] of byte;
  end;
  PHMAC_CTX = ^HMAC_CTX;
  PPHMAC_CTX = ^PHMAC_CTX;
  {$ENDIF}
 // X509_POLICY_DATA = record
 // end;
  PX509_POLICY_DATA = Pointer;//^X509_POLICY_DATA;
 // X509_POLICY_REF = record
 // end;
  PX509_POLICY_REF = Pointer;//^X509_POLICY_REF;
 // X509_POLICY_CACHE = record
 // end;
  PX509_POLICY_CACHE = Pointer; //^X509_POLICY_CACHE;
  //x509v3.h
  PPX509_NAME_ENTRY = ^PX509_NAME_ENTRY;
  //forward declarations
  PV3_EXT_METHOD = ^V3_EXT_METHOD;
  PV3_EXT_CTX = ^V3_EXT_CTX;
  //
  X509V3_EXT_NEW = function: Pointer; cdecl;
  X509V3_EXT_FREE = procedure(_para1 : Pointer); cdecl;
  X509V3_EXT_D2I = function(_para1 : Pointer; const _para2 : PPAnsiChar; para3 : TIdC_LONG): Pointer; cdecl;
  X509V3_EXT_I2D = function (_para1 : Pointer; _para2 : PPAnsiChar) : TIdC_INT; cdecl;
  X509V3_EXT_I2V = function (method : PV3_EXT_METHOD; ext : Pointer; extlist : PSTACK_OF_CONF_VALUE) : PSTACK_OF_CONF_VALUE; cdecl;
  X509V3_EXT_V2I = function (method : Pv3_ext_method; ctx : PV3_EXT_CTX; values : PSTACK_OF_CONF_VALUE): Pointer; cdecl;
  X509V3_EXT_I2S = function (method : Pv3_ext_method; ext : Pointer) : PAnsiChar; cdecl;
  X509V3_EXT_S2I = function (method : Pv3_ext_method; ctx : Pv3_ext_ctx; const str : PAnsiChar): Pointer; cdecl;
  X509V3_EXT_I2R = function (method : Pv3_ext_method; ext : Pointer; _out : PBIO; indent : TIdC_INT) : TIdC_INT; cdecl;
  X509V3_EXT_R2I = function (method : Pv3_ext_method; ctx : Pv3_ext_ctx; const str : PAnsiChar): Pointer; cdecl;
  V3_EXT_METHOD = record
    ext_nid : TIdC_INT;
    ext_flags : TIdC_INT;
    // If this is set the following four fields are ignored
    // I'm not sure what the ASN1_ITEM_EXP really is.  The headers don't make it clear, JPM.
    it : PASN1_ITEM_EXP;
    // Old style ASN1 calls
    ext_new : X509V3_EXT_NEW;
    ext_free : X509V3_EXT_FREE;
    d2i : X509V3_EXT_D2I;
    i2d : X509V3_EXT_I2D;
    // The following pair is used for string extensions
    i2s : X509V3_EXT_I2S;
    s2i : X509V3_EXT_S2I;
    // The following pair is used for multi-valued extensions
    i2v : X509V3_EXT_I2V;
    v2i : X509V3_EXT_V2I;
    // The following are used for raw extensions
    i2r : X509V3_EXT_I2R;
    r2i : X509V3_EXT_R2I;
    usr_data : Pointer;  // Any extension specific data
  end;
  X509V3_EXT_METHOD = V3_EXT_METHOD;
  X509V3_CONF_METHOD = record
    get_string : function(db : Pointer; section, value : PAnsiChar) : PAnsiChar; cdecl;
    get_section : function(db : Pointer; section : PAnsiChar) : PSTACK_OF_CONF_VALUE; cdecl;
    free_string : procedure(db : Pointer; _string : PAnsiChar); cdecl;
    free_section : procedure (db : Pointer; section : PSTACK_OF_CONF_VALUE);
  end;
  V3_EXT_CTX = record
    flags : TIdC_INT;
    issuer_cert : PX509;
    subject_cert : PX509;
    subject_req : PX509_REQ;
    crl : PX509_CRL;
    db_meth : X509V3_CONF_METHOD;
    db : Pointer;
    // OpenSSL developer's message from header
    // Maybe more here
  end;
  ENUMERATED_NAMES = BIT_STRING_BITNAME;
  BASIC_CONSTRAINTS = record
   ca : TIdC_INT;
   pathlen: PASN1_INTEGER;
  end;
  PBASIC_CONSTRAINTS = ^BASIC_CONSTRAINTS;
  PKEY_USAGE_PERIOD = record
    notBefore : ASN1_GENERALIZEDTIME;
    notAfter : PASN1_GENERALIZEDTIME;
  end;
  PPKEY_USAGE_PERIOD = ^PKEY_USAGE_PERIOD;
  OTHERNAME = record
    type_id : PASN1_OBJECT;
    value : PASN1_TYPE;
  end;
  POTHERNAME = ^OTHERNAME;
  EDIPARTYNAME = record
    nameAssigner : PASN1_STRING;
    partyName : PASN1_STRING;
  end;
  PEDIPARTYNAME = ^EDIPARTYNAME;
  GENERAL_NAME_union = record
    case byte of
      0 : (ptr : PAnsiChar);
      1 : (otherName : POTHERNAME); // otherName
      2 : (rfc822Name : PASN1_IA5STRING);
      3 : (dNSName : PASN1_IA5STRING);
      4 : (x400Address : PASN1_TYPE);
      5 : (directoryName : PX509_NAME);
      6 : (ediPartyName : PEDIPARTYNAME);
      7 : (uniformResourceIdentifier : PASN1_IA5STRING);
      8 : (iPAddress : PASN1_OCTET_STRING);
      9 : (registeredID : PASN1_OBJECT);
     // Old names
     10 : (ip : PASN1_OCTET_STRING); // iPAddress
     11 : (dirn : PX509_NAME);       // dirn
     12 : (ia5 : PASN1_IA5STRING);   // rfc822Name, dNSName, uniformResourceIdentifier
     13 : (rid : ASN1_OBJECT);       // registeredID
     14 : (other : PASN1_TYPE);      // x400Address
  end;
  GENERAL_NAME = record
    _type : TIdC_INT;
    d : GENERAL_NAME_union;
  end;
  PGENERAL_NAME = ^GENERAL_NAME;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_GENERAL_NAME = record
    _stack: stack;
  end;
  PSTACK_OF_GENERAL_NAME = ^STACK_OF_GENERAL_NAME;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_GENERAL_NAME = PSTACK;
  {$ENDIF}
  PGENERAL_NAMES = PSTACK_OF_GENERAL_NAME;
  ACCESS_DESCRIPTION = record
    method : PASN1_OBJECT;
    location : PGENERAL_NAME;
  end;
  PACCESS_DESCRIPTION = ^ACCESS_DESCRIPTION;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_ACCESS_DESCRIPTION = record
    _stack: stack;
  end;
  PSTACK_OF_ACCESS_DESCRIPTION = ^STACK_OF_ACCESS_DESCRIPTION;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_ACCESS_DESCRIPTION = PSTACK;
  {$ENDIF}
  PAUTHORITY_INFO_ACCESS = PSTACK_OF_ACCESS_DESCRIPTION;
  PEXTENDED_KEY_USAGE = PSTACK_OF_ASN1_OBJECT;
  DIST_POINT_NAME_union = record
    case byte of
    0 : (fullname : PGENERAL_NAMES);
    1 : (relativename : PSTACK_OF_X509_NAME_ENTRY);
  end;
  DIST_POINT_NAME = record
    _type : TIdC_INT;
    name : DIST_POINT_NAME_union;
  end;
  PDIST_POINT_NAME = ^DIST_POINT_NAME;
  DIST_POINT = record
    distpoint : PDIST_POINT_NAME;
    reasons : PASN1_BIT_STRING;
    CRLissuer : PGENERAL_NAMES;
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_DIST_POINT = record
    _stack: stack;
  end;
  PSTACK_OF_DIST_POINT = ^STACK_OF_DIST_POINT;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_DIST_POINT = PSTACK;
  {$ENDIF}
  AUTHORITY_KEYID = record
    keyid : PASN1_OCTET_STRING;
    issuer : PGENERAL_NAMES;
    serial : PASN1_INTEGER;
  end;
  PAUTHORITY_KEYID = ^AUTHORITY_KEYID;
  // Strong extranet structures
  SXNETID = record
    zone : PASN1_INTEGER;
    user : PASN1_OCTET_STRING;
  end;
  PSXNETID = ^SXNETID;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_SXNETID = record
    _stack: stack;
  end;
  PSTACK_OF_SXNETID = ^STACK_OF_SXNETID;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_SXNETID = PSTACK;
  {$ENDIF}
  SXNET = record
    version : PASN1_INTEGER;
    ids : PSTACK_OF_SXNETID;
  end;
  PSXNET = ^SXNET;
  NOTICEREF = record
    organization : PASN1_STRING;
    noticenos : PSTACK_OF_ASN1_INTEGER;
  end;
  PNOTICEREF = ^NOTICEREF;
  USERNOTICE = record
    noticeref : PNOTICEREF;
    exptext : PASN1_STRING;
  end;
  PUSERNOTICE = ^USERNOTICE;
  POLICYQUALINFO_union = record
    case byte of
      0 : (cpsuri : PASN1_IA5STRING);
      1 : (usernotice : PUSERNOTICE);
      2 : (other : PASN1_TYPE);
  end;
  POLICYQUALINFO = record
    pqualid : PASN1_OBJECT;
    d : POLICYQUALINFO_union;
  end;
  PPOLICYQUALINFO = ^POLICYQUALINFO;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_POLICYQUALINFO = record
    _stack: stack;
  end;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  {$ENDIF}
  {$IFDEF DEBUG_SAFESTACK}
  PSTACK_OF_POLICYINFO = ^STACK_OF_POLICYINFO;
  {$ELSE}
  PSTACK_OF_POLICYINFO = PSTACK;
  {$ENDIF}
  POLICYINFO = record
    policyid : PASN1_OBJECT;
    qualifiers : PSTACK_OF_POLICYQUALINFO;
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_POLICYQUALINFO = record
    _stack: stack;
  end;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  {$ENDIF}
  CERTIFICATEPOLICIES = PSTACK_OF_POLICYINFO;
  //typedef STACK_OF(POLICYINFO) CERTIFICATEPOLICIES;
  POLICY_MAPPING = record
    issuerDomainPolicy : PASN1_OBJECT;
    subjectDomainPolicy : PASN1_OBJECT;
  end;
  PPOLICY_MAPPING = ^POLICY_MAPPING;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_PPOLICY_MAPPING = record
    _stack: stack;
  end;
  PSTACK_OF_POLICY_MAPPING = ^STACK_OF_POLICY_MAPPING;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_POLICY_MAPPING = PSTACK;
  {$ENDIF}
  PPSTACK_OF_POLICY_MAPPING = ^PSTACK_OF_POLICY_MAPPING;
  GENERAL_SUBTREE = record
    base : PGENERAL_NAME;
    minimum : PASN1_INTEGER;
    maximum : PASN1_INTEGER;
  end;
  PGENERAL_SUBTREE = ^GENERAL_SUBTREE;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_GENERAL_SUBTREE = record
    _stack: stack;
  end;
  PSTACK_OF_GENERAL_SUBTREE = ^STACK_OF_GENERAL_SUBTREE;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_GENERAL_SUBTREE = PSTACK;
  {$ENDIF}
  NAME_CONSTRAINTS = record
    permittedSubtrees : PSTACK_OF_GENERAL_SUBTREE;
    excludedSubtrees : PSTACK_OF_GENERAL_SUBTREE;
  end;
  PNAME_CONSTRAINTS = ^NAME_CONSTRAINTS;
  POLICY_CONSTRAINTS = record
    requireExplicitPolicy : PASN1_INTEGER;
    inhibitPolicyMapping : ASN1_INTEGER;
  end;
  PPOLICY_CONSTRAINTS = ^POLICY_CONSTRAINTS;
  // Proxy certificate structures, see RFC 3820
  PROXY_POLICY = record
    policyLanguage : PASN1_OBJECT;
    policy : ASN1_OCTET_STRING;
  end;
  PPROXY_POLICY = ^PROXY_POLICY;
  PROXY_CERT_INFO_EXTENSION = record
    pcPathLengthConstraint : PASN1_INTEGER;
    proxyPolicy : PPROXY_POLICY;
  end;
  PPROXY_CERT_INFO_EXTENSION = ^PROXY_CERT_INFO_EXTENSION;
  PX509_PURPOSE = ^X509_PURPOSE;
  X509_PURPOSE_check_purpose = function(const _para1 : Px509_purpose; const _para2 : PX509;
      para3 : TIdC_INT) : TIdC_INT; cdecl;
  X509_PURPOSE = record
    purpose : TIdC_INT;
    trust : TIdC_INT;    // Default trust ID
    flags : TIdC_INT;
    check_purpose : X509_PURPOSE_check_purpose;
    name : PAnsiChar;
    sname : PAnsiChar;
    usr_data : Pointer;
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_PURPOSE = record
    _stack: stack;
  end;
  PSTACK_OF_X509_PURPOSE = ^STACK_OF_X509_PURPOSE;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_PURPOSE = PSTACK;
  {$ENDIF}
  //x509.h
  X509_HASH_DIR_CTX = record
    num_dirs : TIDC_INT;
    dirs : PPAnsiChar;
    dirs_type : PIdC_INT;
    num_dirs_alloced : TIdC_INT;
  end;
  PX509_HASH_DIR_CTX = ^X509_HASH_DIR_CTX;
  X509_CERT_FILE_CTX = record
    num_paths : TIdC_INT;  // number of paths to files or directories
    num_alloced : TIdC_INT;
    paths : PPAnsiChar;  // the list of paths or directories
    path_type : TIdC_INT;
  end;
  PX509_CERT_FILE_CTX = ^X509_CERT_FILE_CTX;
  x509_object_union = record
    case byte of
      0: (ptr : PAnsiChar);
      1: (_x509 : Px509);
      2: (crl : PX509_CRL);
      3: (pkey : PEVP_PKEY);
  end;
  X509_OBJECT = record
    _type : TIdC_INT;
    data : x509_object_union;
  end;
  PX509_OBJECT  = ^X509_OBJECT;
  PPX509_OBJECT  = ^PX509_OBJECT;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_OBJECT = record
    _stack: STACK;
  end;
  PSTACK_OF_X509_OBJECT = ^STACK_OF_X509_OBJECT;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_OBJECT = PSTACK;
  {$ENDIF}
  X509_ALGOR = record
    algorithm : PASN1_OBJECT;
    parameter : PASN1_TYPE;
  end;
  PX509_ALGOR  = ^X509_ALGOR;
  PPX509_ALGOR =^PX509_ALGOR;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_ALGOR = record
    _stack: stack;
  end;
  PSTACK_OF_X509_ALGOR = ^STACK_OF_X509_ALGOR;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_ALGOR = PSTACK;
  {$ENDIF}
  PPSTACK_OF_X509_ALGOR = ^PSTACK_OF_X509_ALGOR;
  X509_VAL = record
    notBefore : PASN1_TIME;
    notAfter : PASN1_TIME;
  end;
  PX509_VAL = ^X509_VAL;
  PPX509_VAL =^PX509_VAL;
  X509_PUBKEY = record
    algor : PX509_ALGOR;
    public_key : PASN1_BIT_STRING;
    pkey : PEVP_PKEY;
  end;
  PX509_PUBKEY = ^X509_PUBKEY;
  PPX509_PUBKEY =^PX509_PUBKEY;
  X509_SIG = record
    algor : PX509_ALGOR;
    digest : PASN1_OCTET_STRING;
  end;
  PX509_SIG = X509_SIG;
  PPX509_SIG =^PX509_SIG;
  X509_NAME_ENTRY = record
    _object : PASN1_OBJECT;
    value : PASN1_STRING;
    _set : TIdC_INT;
    size : TIdC_INT; // temp variable
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_NAME_ENTRY = record
    _stack: stack;
  end;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  {$ENDIF}
  X509_NAME = record
    entries : PSTACK_OF_X509_NAME_ENTRY;
    modified : TIdC_INT;  // true if 'bytes' needs to be built
    {$IFNDEF OPENSSL_NO_BUFFER}
    bytes : PBUF_MEM;
    {$else}
    bytes : PAnsiChar;
    {$ENDIF}
    hash : TIdC_ULONG; // Keep the hash around for lookups
  end;
  X509_EXTENSION = record
    _object : PASN1_OBJECT;
    critical : ASN1_BOOLEAN;
    value : PASN1_OCTET_STRING;
  end;
  PX509_EXTENSION = ^X509_EXTENSION;
  PPX509_EXTENSION =^PX509_EXTENSION;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_EXTENSION = record
    _stack: stack;
  end;
  X509_EXTENSIONS = STACK_OF_X509_EXTENSION;
  PSTACK_OF_X509_EXTENSION = ^STACK_OF_X509_EXTENSION;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_EXTENSION = PSTACK;
  {$ENDIF}
  PPSTACK_OF_X509_EXTENSION = ^PSTACK_OF_X509_EXTENSION;
  PX509_EXTENSIONS = PPSTACK_OF_X509_EXTENSION;
  x509_attributes_union = record
    case Byte of
      $FF :(Ptr : PAnsiChar);
      0 : (_set: PSTACK_OF_ASN1_TYPE); // 0
      1  : (_single: PASN1_TYPE);
  end;
  X509_ATTRIBUTE = record
    _object : PASN1_OBJECT;
    single : TIdC_INT; // 0 for a set, 1 for a single item (which is wrong)
    value : x509_attributes_union;
  end;
  PX509_ATTRIBUTE = ^X509_ATTRIBUTE;
  PPX509_ATTRIBUTE =^PX509_ATTRIBUTE;
  X509_REQ_INFO = record
    enc: ASN1_ENCODING;
    version: PASN1_INTEGER;
    subject: PX509_NAME;
    pubkey: PX509_PUBKEY;
    attributes: PSTACK_OF_X509_ATTRIBUTE; // [ 0 ]
  end;
  X509_REQ = record
    req_info: PX509_REQ_INFO;
    sig_alg: PX509_ALGOR;
    signature: PASN1_BIT_STRING;
    references: TIdC_INT;
  end;
  PPX509_REQ = ^PX509_REQ;
  PX509_CINF = ^X509_CINF;
  X509_CINF = record
    version: PASN1_INTEGER;
    serialNumber: PASN1_INTEGER;
    signature: PX509_ALGOR;
    issuer: PX509_NAME;
    validity: PX509_VAL;
    subject: PX509_NAME;
    key: PX509_PUBKEY;
    issuerUID: PASN1_BIT_STRING; // [ 1 ] optional in v2
    subjectUID: PASN1_BIT_STRING; // [ 2 ] optional in v2
    extensions: PSTACK_OF_X509_EXTENSION;
  end;
  X509_CERT_AUX = record
    trust : PSTACK_OF_ASN1_OBJECT;  // trusted uses
    reject : PSTACK_OF_ASN1_OBJECT; // rejected uses
    alias : PASN1_UTF8STRING;       // "friendly name"
    keyid : PASN1_OCTET_STRING;	    // key id of private key
    other : PSTACK_OF_X509_ALGOR;   // other unspecified info
  end;
  PX509_CERT_AUX = ^X509_CERT_AUX;
  X509 = record
    cert_info: PX509_CINF;
    sig_alg : PX509_ALGOR;
    signature : PASN1_BIT_STRING;
    valid : TIdC_INT;
    references : TIdC_INT;
    name : PAnsiChar;
    ex_data : CRYPTO_EX_DATA;
    // These contain copies of various extension values
    ex_pathlen : TIdC_LONG;
    ex_pcpathlen : TIdC_LONG;
    ex_flags : TIdC_ULONG;
    ex_kusage : TIdC_ULONG;
    ex_xkusage : TIdC_ULONG;
    ex_nscert : TIdC_ULONG;
    skid : PASN1_OCTET_STRING;
    akid : PAUTHORITY_KEYID;
    policy_cache : PX509_POLICY_CACHE;
    {$IFNDEF OPENSSL_NO_SHA}
    sha1_hash : array [0..SHA_DIGEST_LENGTH-1] of AnsiChar;
    {$ENDIF}
    aux : PX509_CERT_AUX;
  end;
  X509_CRL_INFO = record
    version : PASN1_INTEGER;
    sig_alg : PX509_ALGOR;
    issuer : PX509_NAME;
    lastUpdate : PASN1_TIME;
    nextUpdate : PASN1_TIME;
    revoked : PSTACK_OF_X509_REVOKED;
    extensions : PSTACK_OF_X509_EXTENSION; // [0]
    enc : ASN1_ENCODING;
  end;
  PX509_CRL_INFO     = ^X509_CRL_INFO;
  PPX509_CRL_INFO    =^PX509_CRL_INFO;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_CRL_INFO = record
    _stack: stack;
  end;
  PSTACK_OF_XX509_CRL_INFO = ^STACK_OF_X509_CRL_INFO;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_CRL_INFO = PSTACK;
  {$ENDIF}
  PX509_LOOKUP = ^X509_LOOKUP;
  //This has to be declared ehre for a reference in the next type.
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_LOOKUP = record
    _stack: STACK;
  end;
  PSTACK_OF_X509_LOOKUP = ^STACK_OF_X509_LOOKUP;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_LOOKUP = PSTACK;
  {$ENDIF}
  PX509_VERIFY_PARAM = ^X509_VERIFY_PARAM;
  PX509_STORE_CTX = ^X509_STORE_CTX;
  PPX509_CRL = ^PX509_CRL;
  X509_STORE = record
    // The following is a cache of trusted certs
    cache : TIdC_INT;               // if true, stash any hits
    objs : PSTACK_OF_X509_OBJECT;   // Cache of all objects
    // These are external lookup methods
    get_cert_methods : PSTACK_OF_X509_LOOKUP;
    param : PX509_VERIFY_PARAM;
    // Callbacks for various operations
    verify : function (ctx : PX509_STORE_CTX) : TIdC_INT; cdecl; // called to verify a certificate
    verify_cb : function (ok : TIdC_INT; ctx : PX509_STORE_CTX) : TIdC_INT; cdecl; // error callback
    get_issuer : function (issuer : PPX509; ctx : PX509_STORE_CTX; x : PX509) : TIdC_INT; cdecl; // get issuers cert from ctx
    check_issued : function (ctx : PX509_STORE_CTX; x : PX509; issuer : PX509) : TIdC_INT; cdecl; // check issued
    check_revocation : function (ctx : PX509_STORE_CTX) : TIdC_INT; cdecl; // Check revocation status of chain
    get_crl : function (ctx : PX509_STORE_CTX; crl : PPX509_CRL; x : PX509) : TIdC_INT; cdecl;// retrieve CRL
    check_crl : function(ctx : PX509_STORE_CTX; crl : PX509_CRL) : TIdC_INT; cdecl; // Check CRL validity
    cert_crl : function(ctx : PX509_STORE_CTX; crl : PX509_CRL; x : PX509) : TIdC_INT; cdecl; // Check certificate against CRL
    cleanup : function(ctx : PX509_STORE_CTX) : TIdC_INT; cdecl;
    ex_data : CRYPTO_EX_DATA;
    references : TIdC_INT;
  end;
  PX509_STORE = ^X509_STORE;
  X509_CRL = record
    crl : PX509_CRL_INFO;
    sig_alg : PX509_ALGOR;
    signature : PASN1_BIT_STRING;
    references : TIdC_INT;
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_CRL = record
    _stack: STACK;
  end;
  PSTACK_OF_X509_CRL = ^STACK_OF_X509_CRL;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_CRL = PSTACK;
  {$ENDIF}
  X509_LOOKUP_METHOD = record
    name : PAnsiChar;
    new_item : function (ctx : PX509_LOOKUP): TIdC_INT; cdecl;
    free : procedure (ctx : PX509_LOOKUP); cdecl;
    init : function(ctx : PX509_LOOKUP) : TIdC_INT; cdecl;
    shutdown : function(ctx : PX509_LOOKUP) : TIdC_INT; cdecl;
    ctrl: function(ctx : PX509_LOOKUP; cmd : TIdC_INT; const argc : PAnsiChar; argl : TIdC_LONG; out ret : PAnsiChar ) : TIdC_INT; cdecl;
    get_by_subject: function(ctx : PX509_LOOKUP; _type : TIdC_INT; name : PX509_NAME; ret : PX509_OBJECT ) : TIdC_INT; cdecl;
    get_by_issuer_serial : function(ctx : PX509_LOOKUP; _type : TIdC_INT; name : PX509_NAME; serial : PASN1_INTEGER; ret : PX509_OBJECT) : TIdC_INT; cdecl;
    get_by_fingerprint : function (ctx : PX509_LOOKUP; _type : TIdC_INT; bytes : PAnsiChar; len : TIdC_INT; ret : PX509_OBJECT): TIdC_INT; cdecl;
    get_by_alias : function(ctx : PX509_LOOKUP; _type : TIdC_INT; str : PAnsiChar; ret : PX509_OBJECT) : TIdC_INT; cdecl;
  end;
  PX509_LOOKUP_METHOD      = ^X509_LOOKUP_METHOD;
  PPX509_LOOKUP_METHOD     = ^PX509_LOOKUP_METHOD;
  X509_VERIFY_PARAM = record
    name : PAnsiChar;
    check_time : time_t;          // Time to use
    inh_flags : TIdC_ULONG;       // Inheritance flags
    flags : TIdC_ULONG;           // Various verify flags
    purpose : TIdC_INT;           // purpose to check untrusted certificates
    trust : TIdC_INT;             // trust setting to check
    depth : TIdC_INT;             // Verify depth
    policies : PSTACK_OF_ASN1_OBJECT; // Permissible policies
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_VERIFY_PARAM = record
    _stack: STACK;
  end;
  PSTACK_OF_X509_VERIFY_PARAM = ^STACK_OF_X509_VERIFY_PARAM;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_VERIFY_PARAM = PSTACK;
  {$ENDIF}
  X509_LOOKUP = record
    init : TIdC_INT;              // have we been started
    skip : TIdC_INT;              // don't use us.
    method : PX509_LOOKUP_METHOD; // the functions
    method_data : PAnsiChar;          // method data
    store_ctx : PX509_STORE;      // who owns us
  end;
  PPSTACK_OF_X509_LOOKUP = ^PSTACK_OF_X509_LOOKUP;
  // This is a used when verifying cert chains.  Since the
  // gathering of the cert chain can take some time (and have to be
  // 'retried', this needs to be kept and passed around.
  X509_STORE_CTX = record   // X509_STORE_CTX
    ctx : PX509_STORE;
    current_method : TIdC_INT;  // used when looking up certs
    // The following are set by the caller
    cert : PX509;               // The cert to check
    untrusted : PSTACK_OF_X509; // chain of X509s - untrusted - passed in
    crls : PSTACK_OF_X509_CRL;  // set of CRLs passed in
    param : PX509_VERIFY_PARAM;
    other_ctx : Pointer;  // Other info for use with get_issuer()
    // Callbacks for various operations
    verify : function (ctx : PX509_STORE_CTX) : TIdC_INT; cdecl;  // called to verify a certificate
    verify_cb : function (ok : TIdC_INT; ctx : PX509_STORE_CTX) : TIdC_INT; cdecl; // error callback
    get_issuer : function (var issuer : PX509; ctx : PX509_STORE_CTX; x : PX509) : TIdC_INT; cdecl; // get issuers cert from ctx
    check_issued : function(ctx : PX509_STORE_CTX; x, issuer : PX509) : TIdC_INT; cdecl; // check issued
    check_revocation : function (ctx : PX509_STORE_CTX): TIdC_INT; cdecl; // Check revocation status of chain
    get_crl : function (ctx : PX509_STORE_CTX; var crl : X509_CRL; x : PX509): TIdC_INT; cdecl; // retrieve CRL
    check_crl : function (ctx : PX509_STORE_CTX; var crl : X509_CRL) : TIdC_INT; cdecl; // Check CRL validity
    cert_crl : function (ctx : PX509_STORE_CTX; crl : PX509_CRL; x : PX509) : TIdC_INT; cdecl; // Check certificate against CRL
    check_policy : function (ctx : PX509_STORE_CTX) : TIdC_INT;  cdecl;
    cleanup : function (ctx : PX509_STORE_CTX) : TIdC_INT;  cdecl;
  end;
  PX509_EXTENSION_METHOD   = Pointer;
  PX509_TRUST = ^X509_TRUST;
  X509_TRUST_check_trust = function(_para1 : PX509_TRUST; para2 : PX509; _para3 : TIdC_INT) : TIdC_INT; cdecl;
  X509_TRUST = record
    trust : TIdC_INT;
    flags : TIdC_INT;
    check_trust : X509_TRUST_check_trust;
    name : PAnsiChar;
    arg1 : TIdC_INT;
    arg2 : Pointer;
  end;
  PPX509_TRUST = ^PX509_TRUST;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_NAME_ENTRY = record
    _stack: stack;
  end;
  PSTACK_OF_509_TRUST = ^STACK_OF_509_TRUST;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_509_TRUST = PSTACK;
  {$ENDIF}
  X509_REVOKED = record
    serialNumber: PASN1_INTEGER;
    revocationDate: PASN1_TIME;
    extensions: PSTACK_OF_X509_EXTENSION; // optional
    sequence: TIdC_INT;
  end;
  PX509_REVOKED      = ^X509_REVOKED;
  PPX509_REVOKED     =^PX509_REVOKED;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_REVOKED = record
    _stack: stack;
  end;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  {$ENDIF}
  PX509_PKEY       = Pointer;
  PPX509_PKEY      =^PX509_PKEY;
  X509_INFO = record
    x509 : PX509;
    crl : PX509_CRL;
    x_pkey : PX509_PKEY;
    enc_cipher: EVP_CIPHER_INFO;
    enc_len: TIdC_INT;
    enc_data: PAnsiChar;
    references: TIdC_INT;
  end;
  PX509_INFO       = ^X509_INFO;
  PPX509_INFO      =^PX509_INFO;
 {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_X509_INFO = record
    _stack: stack;
  end;
  PSTACK_OF_X509_INFO = ^STACK_OF_X509_INFO;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_X509_INFO = PSTACK;
  {$ENDIF}
// OpenSSL Developer's note
// The next 2 structures and their 8 routines were sent to me by
// Pat Richard <patr@x509.com> and are used to manipulate
// Netscapes spki structures - useful if you are writing a CA web page
  NETSCAPE_SPKAC = record
    pubkey : PX509_PUBKEY;
    challenge : PASN1_IA5STRING;  // challenge sent in atlas >= PR2
  end;
  PNETSCAPE_SPKAC = ^NETSCAPE_SPKAC;
  PPNETSCAPE_SPKAC = ^PNETSCAPE_SPKAC;
  NETSCAPE_SPKI = record
    spkac : PNETSCAPE_SPKAC;  // signed public key and challenge
    sig_algor : PX509_ALGOR;
    signature : PASN1_BIT_STRING;
  end;
  PNETSCAPE_SPKI = ^NETSCAPE_SPKI;
  PPNETSCAPE_SPKI = ^PNETSCAPE_SPKI;
  NETSCAPE_CERT_SEQUENCE = record
    _type : PASN1_OBJECT;
    certs : PSTACK_OF_X509;
  end;
  PNETSCAPE_CERT_SEQUENCE = ^NETSCAPE_CERT_SEQUENCE;
  PPNETSCAPE_CERT_SEQUENCE = ^PNETSCAPE_CERT_SEQUENCE;
  // Password based encryption structure
  PBEPARAM = record
    salt : PASN1_OCTET_STRING;
    iter : PASN1_INTEGER;
  end;
  PPBEPARAM = ^PBEPARAM;
  PPPBEPARAM = ^PPBEPARAM;
  // Password based encryption V2 structures
  PBE2PARAM = record
    keyfunc : PX509_ALGOR;
    encryption : PX509_ALGOR;
  end;
  PPBE2PARAM = ^PBE2PARAM;
  PBKDF2PARAM = record
    salt : PASN1_TYPE;  // Usually OCTET STRING but could be anything
    iter : PASN1_INTEGER;
    keylength : PASN1_INTEGER;
    prf : PX509_ALGOR;
  end;
  PPBKDF2PARAM = ^PBKDF2PARAM;
  PPPBKDF2PARAM = ^PPBKDF2PARAM;
  PKCS8_PRIV_KEY_INFO = record
    broken : TIdC_INT;     // Flag for various broken formats
//#define PKCS8_OK              0
//#define PKCS8_NO_OCTET        1
//#define PKCS8_EMBEDDED_PARAM  2
//#define PKCS8_NS_DB           3
    version : PASN1_INTEGER;
    pkeyalg : PX509_ALGOR;
    pkey : PASN1_TYPE; // Should be OCTET STRING but some are broken
    attributes : PSTACK_OF_X509_ATTRIBUTE;
  end;
  PPKCS8_PRIV_KEY_INFO = ^PKCS8_PRIV_KEY_INFO;
  PPPKCS8_PRIV_KEY_INFO = ^PPKCS8_PRIV_KEY_INFO;
  PPKCS7_RECIP_INFO = ^PKCS7_RECIP_INFO;

  PSHA_CTX = ^SHA_CTX;
  //ripemd.h
  {$IFNDEF OPENSSL_NO_RIPEMD}
  RIPEMD160_LONG = TIdC_UINT;
  RIPEMD160_CTX = record
    A,B,C,D,E : RIPEMD160_LONG;
    Nl,Nh : RIPEMD160_LONG;
    data : array [0..RIPEMD160_LBLOCK -1 ] of RIPEMD160_LONG;
    num : TIdC_UINT;
  end;
  PRIPEMD160_CTX = ^RIPEMD160_CTX;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC4}
  RC4_KEY = record
    x,y : RC4_INT;
    data : array [0..(256 - 1)] of RC4_INT;
  end;
  PRC4_KEY = ^RC4_KEY;
  {$ENDIF}
  //rc2.h
  {$IFNDEF OPENSSL_NO_RC2}
  RC2_KEY = record
    data : array [0..(64 - 1)] of RC2_INT;
  end;
  PRC2_KEY = ^RC2_KEY;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC5}
  RC5_32_INT = TIdC_UINT;
  RC5_32_KEY = record
    // Number of rounds
    rounds : TIdC_INT;
    data : array [0..(2*(RC5_16_ROUNDS+1)-1)] of RC5_32_INT;
  end;
  PRC5_32_KEY = ^RC5_32_KEY;
  {$ENDIF}
  //blowfish.h
  {$IFNDEF OPENSSL_NO_BF}
  BF_LONG = TIdC_UINT;
  BF_KEY = record
    P : array [0..(BF_ROUNDS+2)-1] of BF_LONG;
    S : array [0..(4*256)-1] of BF_LONG;
  end;
  PBF_KEY = ^BF_KEY;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_CAST}
  CAST_LONG = TIdC_ULONG;
  CAST_KEY = record
    data : array[0..(32 -1)] of CAST_LONG;
    short_key : TIdC_INT; // Use reduced rounds for short key
  end;
  PCAST_KEY = ^CAST_KEY;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_IDEA}
  IDEA_KEY_SCHEDULE = record
    data : array [0..(9-1),0..(6-1)] of IDEA_INT;
  end;
  PIDEA_KEY_SCHEDULE = ^IDEA_KEY_SCHEDULE;
  {$ENDIF}
  //ocsp.h
  //*   CertID ::= SEQUENCE {
  //*       hashAlgorithm            AlgorithmIdentifier,
  //*       issuerNameHash     OCTET STRING, -- Hash of Issuer's DN
  //*       issuerKeyHash      OCTET STRING, -- Hash of Issuers public key (excluding the tag & length fields)
  //*       serialNumber       CertificateSerialNumber }
  //*/
//typedef struct ocsp_cert_id_st
  OCSP_CERTID = record
    hashAlgorithm : PX509_ALGOR;
    issuerNameHash : PASN1_OCTET_STRING;
    issuerKeyHash : PASN1_OCTET_STRING;
    serialNumber : PASN1_INTEGER;
  end;
  POCSP_CERTID = ^OCSP_CERTID;
  PPOCSP_CERTID = ^POCSP_CERTID;
 {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_OCSP_CERTID = record
    _stack: stack;
  end;
  PSTACK_OF_OCSP_CERTID = ^STACK_OF_OCSP_CERTID;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_OCSP_CERTID = PSTACK;
  {$ENDIF}
// *   Request ::=     SEQUENCE {
// *       reqCert                    CertID,
// *       singleRequestExtensions    [0] EXPLICIT Extensions OPTIONAL }
// */
  OCSP_ONEREQ = record
    reqCert : POCSP_CERTID;
    singleRequestExtensions : PSTACK_OF_X509_EXTENSION;
  end;
  POCSP_ONEREQ = ^OCSP_ONEREQ;
  PPOCSP_ONEREQ = ^POCSP_ONEREQ;
 {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_OCSP_ONEREQ = record
    _stack: stack;
  end;
  PSTACK_OF_OCSP_ONEREQ = ^STACK_OF_OCSP_ONEREQ;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_OCSP_ONEREQ = PSTACK;
  {$ENDIF}
//*   TBSRequest      ::=     SEQUENCE {
//*       version             [0] EXPLICIT Version DEFAULT v1,
//*       requestorName       [1] EXPLICIT GeneralName OPTIONAL,
//*       requestList             SEQUENCE OF Request,
//*       requestExtensions   [2] EXPLICIT Extensions OPTIONAL }
//*/
  OCSP_REQINFO = record
   	version : PASN1_INTEGER;
    requestorName : PGENERAL_NAME;
	  requestList : PSTACK_OF_OCSP_ONEREQ;
	  requestExtensions : PSTACK_OF_X509_EXTENSION;
  end;
  POCSP_REQINFO = ^OCSP_REQINFO;
  PPOCSP_REQINFO = ^POCSP_REQINFO;
///*   Signature       ::=     SEQUENCE {
// *       signatureAlgorithm   AlgorithmIdentifier,
// *       signature            BIT STRING,
// *       certs                [0] EXPLICIT SEQUENCE OF Certificate OPTIONAL }
// */
  OCSP_SIGNATURE = record
	 signatureAlgorithm : PX509_ALGOR;
	 signature : PASN1_BIT_STRING;
  	certs : PSTACK_OF_X509;
  end;
  POCSP_SIGNATURE = ^OCSP_SIGNATURE;
  PPOCSP_SIGNATURE = ^POCSP_SIGNATURE;
///*   OCSPRequest     ::=     SEQUENCE {
// *       tbsRequest                  TBSRequest,
// *       optionalSignature   [0]     EXPLICIT Signature OPTIONAL }
// */
  OCSP_REQUEST = record
	  tbsRequest : POCSP_REQINFO;
	  optionalSignature : POCSP_SIGNATURE; //* OPTIONAL */
	end;
  POCSP_REQUEST = ^OCSP_REQUEST;
  PPOCSP_REQUEST = ^POCSP_REQUEST;
///*   OCSPResponseStatus ::= ENUMERATED {
// *       successful            (0),      --Response has valid confirmations
// *       malformedRequest      (1),      --Illegal confirmation request
// *       internalError         (2),      --Internal error in issuer
// *       tryLater              (3),      --Try again later
// *                                       --(4) is not used
// *       sigRequired           (5),      --Must sign the request
// *       unauthorized          (6)       --Request unauthorized
// *   }
// */
///*   ResponseBytes ::=       SEQUENCE {
// *       responseType   OBJECT IDENTIFIER,
// *       response       OCTET STRING }
// */
  OCSP_RESPBYTES = record
	  responseType : PASN1_OBJECT;
	  response : PASN1_OCTET_STRING;
  end;
  POCSP_RESPBYTES = ^OCSP_RESPBYTES;
  PPOCSP_RESPBYTES = ^POCSP_RESPBYTES;
///*   OCSPResponse ::= SEQUENCE {
// *      responseStatus         OCSPResponseStatus,
// *      responseBytes          [0] EXPLICIT ResponseBytes OPTIONAL }
// */
  OCSP_RESPONSE = record
	 responseStatus : PASN1_ENUMERATED;
	 responseBytes : POCSP_RESPBYTES;
  end;
  POCSP_RESPONSE = ^OCSP_RESPONSE;
  PPOCSP_RESPONSE = ^POCSP_RESPONSE;
// /*   ResponderID ::= CHOICE {
// *      byName   [1] Name,
// *      byKey    [2] KeyHash }
// */
  OCSP_RESPID_union = record
    case Integer of
      0 : (byName : PX509_NAME);
      1 : (byKey : PASN1_OCTET_STRING);
  end;
  OCSP_RESPID = record
    _type : TIdC_INT;
    value : OCSP_RESPID_union;
  end;
  POCSP_RESPID = ^OCSP_RESPID;
  PPOCSP_RESPID = ^POCSP_RESPID;
  //*   KeyHash ::= OCTET STRING --SHA-1 hash of responder's public key
  // *                            --(excluding the tag and length fields)
  // */
 {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_OCSP_RESPID = record
    _stack: stack;
  end;
  PSTACK_OF_OCSP_RESPID = ^STACK_OF_OCSP_RESPID;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_OCSP_RESPID = PSTACK;
  {$ENDIF}
///*   RevokedInfo ::= SEQUENCE {
// *       revocationTime              GeneralizedTime,
// *       revocationReason    [0]     EXPLICIT CRLReason OPTIONAL }
// */
  OCSP_REVOKEDINFO = record
	  revocationTime : PASN1_GENERALIZEDTIME;
    revocationReason : PASN1_ENUMERATED;
  end;
  POCSP_REVOKEDINFO = ^OCSP_REVOKEDINFO;
  PPOCSP_REVOKEDINFO = ^POCSP_REVOKEDINFO;
///*   CertStatus ::= CHOICE {
// *       good                [0]     IMPLICIT NULL,
// *       revoked             [1]     IMPLICIT RevokedInfo,
// *       unknown             [2]     IMPLICIT UnknownInfo }
// */
  OCSP_CERTSTATUS_union = record
    case Integer of
     0 : (good : PASN1_NULL);
     1 : (revoked : POCSP_REVOKEDINFO);
     2 : (unknown : PASN1_NULL);
  end;
  OCSP_CERTSTATUS = record
    _type : TIdC_INT;
    value : OCSP_CERTSTATUS_union;
  end;
  POCSP_CERTSTATUS = ^OCSP_CERTSTATUS;
  PPOCSP_CERTSTATUS = ^POCSP_CERTSTATUS;
///*   SingleResponse ::= SEQUENCE {
// *      certID                       CertID,
// *      certStatus                   CertStatus,
// *      thisUpdate                   GeneralizedTime,
// *      nextUpdate           [0]     EXPLICIT GeneralizedTime OPTIONAL,
// *      singleExtensions     [1]     EXPLICIT Extensions OPTIONAL }
// */
  OCSP_SINGLERESP = record
	  certId : POCSP_CERTID;
	  certStatus : POCSP_CERTSTATUS;
	  thisUpdate : PASN1_GENERALIZEDTIME;
	  nextUpdate : PASN1_GENERALIZEDTIME;
	  singleExtensions : PSTACK_OF_X509_EXTENSION;
  end;
  POCSP_SINGLERESP = ^OCSP_SINGLERESP;
  PPOCSP_SINGLERESP = ^POCSP_SINGLERESP;
 {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_OCSP_SINGLERESP = record
    _stack: stack;
  end;
  PSTACK_OF_OCSP_SINGLERESP = ^STACK_OF_OCSP_SINGLERESP;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_OCSP_SINGLERESP = PSTACK;
  {$ENDIF}
///*   ResponseData ::= SEQUENCE {
// *      version              [0] EXPLICIT Version DEFAULT v1,
// *      responderID              ResponderID,
// *      producedAt               GeneralizedTime,
// *      responses                SEQUENCE OF SingleResponse,
// *      responseExtensions   [1] EXPLICIT Extensions OPTIONAL }
// */
  OCSP_RESPDATA = record
	  version : PASN1_INTEGER;
	  responderId : POCSP_RESPID;
	  producedAt : PASN1_GENERALIZEDTIME;
	  responses : PSTACK_OF_OCSP_SINGLERESP;
	  responseExtensions : PSTACK_OF_X509_EXTENSION;
	end;
  POCSP_RESPDATA = ^OCSP_RESPDATA;
  PPOCSP_RESPDATA = ^POCSP_RESPDATA;
///*   BasicOCSPResponse       ::= SEQUENCE {
// *      tbsResponseData      ResponseData,
// *      signatureAlgorithm   AlgorithmIdentifier,
// *      signature            BIT STRING,
// *      certs                [0] EXPLICIT SEQUENCE OF Certificate OPTIONAL }
// */
//  /* Note 1:
//     The value for "signature" is specified in the OCSP rfc2560 as follows:
//     "The value for the signature SHALL be computed on the hash of the DER
//     encoding ResponseData."  This means that you must hash the DER-encoded
//     tbsResponseData, and then run it through a crypto-signing function, which
//     will (at least w/RSA) do a hash-'n'-private-encrypt operation.  This seems
//     a bit odd, but that's the spec.  Also note that the data structures do not
//     leave anywhere to independently specify the algorithm used for the initial
//     hash. So, we look at the signature-specification algorithm, and try to do
//     something intelligent.	-- Kathy Weinhold, CertCo */
//  /* Note 2:
//     It seems that the mentioned passage from RFC 2560 (section 4.2.1) is open
//     for interpretation.  I've done tests against another responder, and found
//     that it doesn't do the double hashing that the RFC seems to say one
//     should.  Therefore, all relevant functions take a flag saying which
//     variant should be used.	-- Richard Levitte, OpenSSL team and CeloCom */
  OCSP_BASICRESP = record
	  tbsResponseData : POCSP_RESPDATA;
	  signatureAlgorithm : PX509_ALGOR;
	  signature : PASN1_BIT_STRING;
	  certs : PSTACK_OF_X509;
	end;
  POCSP_BASICRESP = ^OCSP_BASICRESP;
  PPOCSP_BASICRESP = ^POCSP_BASICRESP;
///* CrlID ::= SEQUENCE {
// *     crlUrl               [0]     EXPLICIT IA5String OPTIONAL,
// *     crlNum               [1]     EXPLICIT INTEGER OPTIONAL,
// *     crlTime              [2]     EXPLICIT GeneralizedTime OPTIONAL }
// */
  OCSP_CRLID = record
	  crlUrl : PASN1_IA5STRING;
	  crlNum : PASN1_INTEGER;
	  crlTime : PASN1_GENERALIZEDTIME;
	end;
  POCSP_CRLID = ^OCSP_CRLID;
  PPOCSP_CRLID = ^POCSP_CRLID;
///* ServiceLocator ::= SEQUENCE {
// *      issuer    Name,
// *      locator   AuthorityInfoAccessSyntax OPTIONAL }
// */
  OCSP_SERVICELOC = record
	  issuer : PX509_NAME;
	  locator : PSTACK_OF_ACCESS_DESCRIPTION;
  end;
  POCSP_SERVICELOC = ^OCSP_SERVICELOC;
  PPOCSP_SERVICELOC = ^POCSP_SERVICELOC;
  //mdc2.h
  //MDC2_CTX = record
    //this is not defined in headers so it's best use functions in the API to access the structure.
  //end;
  PMDC2_CTX = Pointer;//^MDC2_CTX;
  //tmdiff.h
//  MS_TM = record
    //this is not defined in headers so it's best use functions in the API to access the structure.
 // end;
  PMS_TM = Pointer;//^MS_TM;
  PPMS_TM = ^PMS_TM;
  //PEVP_PBE_KEYGEN          = Pointer;
  ppem_password_cb = function (buf : PAnsiChar; size : TIdC_INT; rwflag : TIdC_INT; userdata : Pointer) : TIdC_INT; cdecl;
  PEM_ENCODE_SEAL_CTX   = record
    encode : EVP_ENCODE_CTX;
    md : EVP_MD_CTX;
    cipher : EVP_CIPHER_CTX;
  end;
  PPEM_ENCODE_SEAL_CTX     = ^PEM_ENCODE_SEAL_CTX;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_SSL_COMP = record
    _stack: stack;
  end;
  PSTACK_OF_SSL_COMP = ^STACK_OF_SSL_COMP;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_SSL_COMP = PSTACK;
  {$ENDIF}
  PPSTACK_OF_SSL_COMP = ^PSTACK_OF_SSL_COMP;
  PSSL_COMP = ^SSL_COMP;
  // PASN1_UTCTIME     = Pointer;

//GREGOR - spremenjana deklaracija ker se tol�e
//  Phostent	  = Pointer;
  Phostent2   = Pointer;
//END GREGOR
{ This should cause problems, but I will solve them ONLY if they came ...      }
{ !!!InvalidTypes!!!                                                           }
//END REMY
   //des.h
  // des_cblock   = Integer;
  DES_cblock = array[0..7] of Byte;
  PDES_cblock = ^DES_cblock;
  const_DES_cblock = DES_cblock;
  Pconst_DES_cblock = ^const_DES_cblock;
  // des_key_schedule = Integer;
  {$IFDEF DES_INT}
   DES_LONG = TIdC_UINT;
  {$ELSE}
  DES_LONG = TIdC_ULONG;
  {$ENDIF}
  des_cblock_union = record
    case integer of
      0: (cblock: des_cblock);
      1: (deslong: array [0..1] of DES_LONG);
  end;
  des_ks_struct = record
    ks : des_cblock_union;
    //IMPORTANT!!!
    //Since OpenSSL 0.9.7-dev, the OpenSSL  developers
    //dropped this member.  See:
    //http://marc.info/?l=openssl-dev&m=100342566217528&w=2
    weak_key: TIdC_INT;
  end;
  des_key_schedule = array[0..15] of des_ks_struct;
  des_cblocks     = array[0..7] of byte;
  //des_cblocks     = Integer;
  //des_old.h
  _ossl_old_des_cblock = array [0..7] of byte;
  P_ossl_old_des_cblock = ^_ossl_old_des_cblock;
  _ossl_old_des_ks_union = record
    case Integer of
       0 : (_ : _ossl_old_des_cblock);
		//* make sure things are correct size on machines with
		//* 8 byte longs */
       2 : (pad : array [0..1] of DES_LONG);
  end;
  _ossl_old_des_ks_struct = record
    ks : _ossl_old_des_ks_union;
  end;
  _ossl_old_des_key_schedule = array [0..15] of _ossl_old_des_ks_struct;
  P_ossl_old_des_key_schedule = ^_ossl_old_des_key_schedule;
{IMPORTANT!!!

In C, symbols are case sensitive while in Pascal, they are insensitive.
Thus, when we something like this:

#define des_cblock DES_cblock

we, should do something like this:

_des_cblock = DES_cblock
}
  {$IFNDEF OPENSSL_DES_LIBDES_COMPATIBILITY}
  _des_cblock = DES_cblock;
  _const_des_cblock = const_DES_cblock;
  _des_key_schedule = DES_key_schedule;
  {$ELSE}
///* libdes compatibility */
//* Map all symbol names to _ossl_old_des_* form, so we avoid all
//   clashes with libdes */
  _des_cblock = _ossl_old_des_cblock;
  _des_key_schedule = _ossl_old_des_key_schedule;
  {$ENDIF}
  TIdSslLockingCallback = procedure (mode, n : TIdC_INT; Afile : PAnsiChar; line : TIdC_INT); cdecl;
  TIdSslIdCallback = function: TIdC_ULONG; cdecl;
///ssl_locl.h structs.  These are probably internal records so don't expose
//their members as ssl_lock.h is not included in the headers
//JPM
  PSSL3_ENC_METHOD = pointer;//^SSL3_ENC_METHOD;
//  SSL3_ENC_METHOD = record
//  end;
  PCERT = pointer;
  PPCERT = ^PCERT;
  PSESS_CERT = pointer;
  //pkcs7.h
  PPKCS7 = ^PKCS7;
  PPPKCS7 = ^PPKCS7;
  PKCS7_ISSUER_AND_SERIAL = record
    issuer : PX509_NAME;
    serial : PASN1_INTEGER;
  end;
  PPKCS7_ISSUER_AND_SERIAL = ^PKCS7_ISSUER_AND_SERIAL;
  PKCS7_SIGNER_INFO = record
    version : PASN1_INTEGER;  // version 1
    issuer_and_serial : PPKCS7_ISSUER_AND_SERIAL;
    digest_alg : PX509_ALGOR;
    auth_attr : PSTACK_OF_X509_ATTRIBUTE; // [ 0 ]
    digest_enc_alg : PX509_ALGOR;
    enc_digest :  PASN1_OCTET_STRING;
    unauth_attr : PSTACK_OF_X509_ATTRIBUTE; // [ 1 ]
    // The private key to sign with
    pkey : PEVP_PKEY;
  end;
  PPKCS7_SIGNER_INFO = ^PKCS7_SIGNER_INFO;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_PKCS7_SIGNER_INFO = record
    _stack: stack;
  end;
  PSTACK_OF_PKCS7_SIGNER_INFO = ^STACK_OF_PKCS7_SIGNER_INFO;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_PKCS7_SIGNER_INFO = PSTACK;
  {$ENDIF}
  PKCS7_RECIP_INFO = record
    version : PASN1_INTEGER;  // version 0
    issuer_and_serial : PPKCS7_ISSUER_AND_SERIAL;
    key_enc_algor : PX509_ALGOR;
    enc_key : PASN1_OCTET_STRING;
    cert : PX509; // get the pub-key from this
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_PKCS7_RECIP_INFO = record
    _stack: stack;
  end;
  PSTACK_OF_PKCS7_RECIP_INFO = ^STACK_OF_PKCS7_RECIP_INFO;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_PKCS7_RECIP_INFO = PSTACK;
  {$ENDIF}
  PPSTACK_OF_PKCS7_RECIP_INFO = ^PSTACK_OF_PKCS7_RECIP_INFO;
  PKCS7_SIGNED = record
    version : PASN1_INTEGER;  // version 1
    md_algs : PSTACK_OF_X509_ALGOR; // md used
    cert : PSTACK_OF_X509;    //  [ 0 ]
    crl : PSTACK_OF_X509_CRL; //  [ 1 ]
    signer_info : PSTACK_OF_PKCS7_SIGNER_INFO;
    contents : PPKCS7;
  end;
  PPKCS7_SIGNED = ^PKCS7_SIGNED;
  PPPKCS7_SIGNED = ^PPKCS7_SIGNED;
  PKCS7_ENC_CONTENT = record
    content_type : PASN1_OBJECT;
    algorithm : PX509_ALGOR;
    enc_data : PASN1_OCTET_STRING;  // [ 0 ]
    cipher : PEVP_CIPHER;
  end;
  PPKCS7_ENC_CONTENT = ^PKCS7_ENC_CONTENT;
  PKCS7_ENVELOPE = record
    version : PASN1_INTEGER;  // version 0
    recipientinfo : PSTACK_OF_PKCS7_RECIP_INFO;
    enc_data : PPKCS7_ENC_CONTENT;
  end;
  PPKCS7_ENVELOPE = ^PKCS7_ENVELOPE;
  // OpenSSL developer notes
  // The above structure is very very similar to PKCS7_SIGN_ENVELOPE.
  // How about merging the two
  PKCS7_SIGN_ENVELOPE = record
    version : PASN1_INTEGER;  // version 1
    md_algs : PSTACK_OF_X509_ALGOR; // md used
    cert : PSTACK_OF_X509;    // [ 0 ]
    crl : PSTACK_OF_X509_CRL; // [ 1 ]
    signer_info : PSTACK_OF_PKCS7_SIGNER_INFO;
    enc_data : PPKCS7_ENC_CONTENT;
    recipientinfo : PSTACK_OF_PKCS7_RECIP_INFO;
  end;
  PPKCS7_SIGN_ENVELOPE = ^PKCS7_SIGN_ENVELOPE;
  PKCS7_DIGEST = record
    version : PASN1_INTEGER;  // version 0
    md : PX509_ALGOR;   // md used
    contents : PPKCS7;
    digest : PASN1_OCTET_STRING;
  end;
  PPKCS7_DIGEST = ^PKCS7_DIGEST;
  PKCS7_ENCRYPT = record
    version : PASN1_INTEGER;  // version 0
    enc_data : PPKCS7_ENC_CONTENT;
  end;
  PPKCS7_ENCRYPT = ^PKCS7_ENCRYPT;
  PKCS7_union = record
    // content as defined by the type
    // all encryption/message digests are applied to the 'contents',
    // leaving out the 'type' field.
    case Integer of
      0 : (ptr : PAnsiChar);
      // NID_pkcs7_data
      1 : (data : PASN1_OCTET_STRING);
      // NID_pkcs7_signed
      2 : (sign : PPKCS7_SIGNED);
      // NID_pkcs7_enveloped
      3 : (enveloped : PPKCS7_ENVELOPE);
      // NID_pkcs7_signedAndEnveloped
      4 : (signed_and_enveloped : PPKCS7_SIGN_ENVELOPE);
      // NID_pkcs7_digest
      5 : (digest : PPKCS7_DIGEST);
      // NID_pkcs7_encrypted
      6 : (encrypted : PPKCS7_ENCRYPT);
  end;
  PKCS7 = record
    // The following is non NULL if it contains ASN1 encoding of
    // this structure
    asn1 : PAnsiChar;
    length : TIdC_LONG;
//#define PKCS7_S_HEADER  0
//#define PKCS7_S_BODY    1
//#define PKCS7_S_TAIL    2
    state : TIdC_INT; // used during processing
    detached : TIdC_INT;
    _type : PASN1_OBJECT;
    // content as defined by the type
    // all encryption/message digests are applied to the 'contents',
    // leaving out the 'type' field.
    d : PKCS7_union;
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_PKCS7 = record
    _stack: stack;
  end;
  PSTACK_OF_PKCS7 = ^STACK_OF_PKCS7;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_PKCS7 = PSTACK;
  {$ENDIF}
  //pkcs12.h
  PKCS12_MAC_DATA = record
    dinfo : PX509_SIG;
    salt : PASN1_OCTET_STRING;
    iter : PASN1_INTEGER; // defaults to 1
  end;
  PPKCS12_MAC_DATA = ^PKCS12_MAC_DATA;
 // PSESS_CERT = ^SESS_CERT;
  PPKCS12 = ^PKCS12;
  PKCS12 = record
    version : PASN1_INTEGER;
    mac : PPKCS12_MAC_DATA;
    authsafes : PPKCS7;
  end;
  //comp.h
  PCOMP_CTX = ^COMP_CTX;
  COMP_METHOD = record
    _type : TIdC_INT; // NID for compression library
    name : PAnsiChar; // A text string to identify the library
    init : function (ctx : PCOMP_CTX) : TIdC_INT; cdecl;
    finish : procedure (ctx : PCOMP_CTX); cdecl;
    compress : function (ctx : PCOMP_CTX;
      _out : PAnsiChar; olen : TIdC_UINT;
      _in : PAnsiChar; ilen : TIdC_UINT) : TIdC_INT; cdecl;
    expand : function  (ctx : PCOMP_CTX;
      _out : PAnsiChar; olen : TIdC_UINT;
      _in : PAnsiChar; ilen : TIdC_UINT) : TIdC_INT; cdecl;
    // The following two do NOTHING, but are kept for backward compatibility
    ctrl : function : TIdC_INT; cdecl;
    callback_ctrl : function : TIdC_INT; cdecl;
  end;
  PCOMP_METHOD = ^COMP_METHOD;
  COMP_CTX = record
    meth : PCOMP_METHOD;
    compress_in : TIdC_ULONG;
    compress_out : TIdC_ULONG;
    expand_in : TIdC_ULONG;
    expand_out : TIdC_ULONG;
    ex_data : PCRYPTO_EX_DATA;
  end;
  //kssl.h
  {These are structures for Kerberos support.  These will not be complete because
  FreePascal, Borland Delphi, and Indy don't support Kerberos.  These are here
  as place holders so we get an exact OpenSSL API if Kerberos support was compiled
  in.
  }
  {$IFNDEF OPENSSL_NO_KRB5}
  KSSL_ERR = record
    reason : TIdC_INT;
      text : array [0..KSSL_ERR_MAX] of Char;
  end;
  KSSL_CTX = record
    {I am not going to do anything to define this because it uses things in the
    Kerberos API.  Since there's no support for Kerberos, I'm leaving it empty.
    We only need the pointer anyway}
  end;
  PKSSL_CTX = ^KSSL_CTX;
  {$ENDIF}
  //ssl.h
  PSSL_CIPHER = ^SSL_CIPHER;
  SSL_CIPHER = record
    valid : TIdC_INT;
    name: PAnsiChar;  // text name
    id: TIdC_ULONG; // id, 4 bytes, first is version
    algorithms: TIdC_ULONG; // what ciphers are used
    algo_strength: TIdC_ULONG; // strength and export flags
    algorithm2: TIdC_ULONG;// Extra flags
    strength_bits: TIdC_INT;  // Number of bits really used
    alg_bits: TIdC_INT;     // Number of bits for algorithm
    mask: TIdC_ULONG;   // used for matching
    mask_strength: TIdC_ULONG;  // also used for matching
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_SSL_CIPHER = record
    _stack: STACK;
  end;
  PSTACK_OF_SSL_CIPHER = ^STACK_OF_SSL_CIPHER;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_SSL_CIPHER = PSTACK;
  {$ENDIF}
  SSL_SESSION = record
    ssl_version : TIdC_INT; // what ssl version session info is being kept in here?
    // only really used in SSLv2
    key_arg_length: TIdC_UINT;
    key_arg: Array[0..SSL_MAX_KEY_ARG_LENGTH-1] of Byte;
    master_key_length: TIdC_INT;
    master_key: Array[0..SSL_MAX_MASTER_KEY_LENGTH-1] of Byte;
    // session_id - valid?
    session_id_length: TIdC_UINT;
    session_id: Array[0..SSL_MAX_SSL_SESSION_ID_LENGTH-1] of Byte;
    // this is used to determine whether the session is being reused in
    // the appropriate context. It is up to the application to set this,
    // via SSL_new
    sid_ctx_length: TIdC_UINT;
    sid_ctx: array[0..SSL_MAX_SID_CTX_LENGTH-1] of Byte;
    {$IFNDEF OPENSSL_NO_KRB5}
    krb5_client_princ_len: TIdC_UINT;
    krb5_client_princ: array[0..SSL_MAX_KRB5_PRINCIPAL_LENGTH-1] of Byte;
    {$ENDIF}
    not_resumable: TIdC_INT;
    // The cert is the certificate used to establish this connection
    sess_cert :  PSESS_CERT;
    {$IFNDEF OPENSSL_NO_TLSEXT}
    tlsext_hostname : PAnsiChar;
 //* RFC4507 info */
    tlsext_tick : PAnsiChar;//* Session ticket */
    tlsext_ticklen : size_t;//* Session ticket length */ 
    tlsext_tick_lifetime_hint : TIdC_LONG;//* Session lifetime hint in seconds */
    {$ENDIF}
  end;
  PSSL_SESSION = ^SSL_SESSION;
  // typedef struct ssl_method_st
  PSSL_CTX = ^SSL_CTX;
  SSL_METHOD_PROC = procedure; cdecl;
  PSSL_METHOD = ^SSL_METHOD;
  SSL_METHOD = record
     version: TIdC_INT;
     ssl_new: function(s: PSSL): TIdC_INT; cdecl;
     ssl_clear: procedure(s: PSSL); cdecl;
     ssl_free: procedure(s: PSSL); cdecl;
     ssl_accept: function(s: PSSL): TIdC_INT; cdecl;
     ssl_connect: function(s: PSSL): TIdC_INT; cdecl;
     ssl_read: function(s: PSSL; buf: Pointer; len: TIdC_INT):TIdC_INT; cdecl;
     ssl_peek: function(s: PSSL; buf: Pointer; len: TIdC_INT):TIdC_INT; cdecl;
     ssl_write: function(s: PSSL; const buf: Pointer; len:TIdC_INT): TIdC_INT; cdecl;
     ssl_shutdown: function(s: PSSL): TIdC_INT; cdecl;
     ssl_renegotiate: function(s: PSSL): TIdC_INT; cdecl;
     ssl_renegotiate_check: function(s: PSSL): TIdC_INT; cdecl;
     ssl_get_message: function(s: PSSL; st1, stn, mt: TIdC_INT; max: TIdC_LONG; ok: PIdC_INT): TIdC_LONG; cdecl;
     ssl_read_bytes: function(s: PSSL; _type: TIdC_INT; buf:PByte; len, peek: TIdC_INT): TIdC_INT; cdecl;
     ssl_write_bytes: function(s: PSSL; _type: TIdC_INT; const buf: Pointer; len: TIdC_INT): TIdC_INT; cdecl;
     ssl_dispatch_alert: function(s: PSSL): TIdC_INT; cdecl;
     ssl_ctrl: function(s: PSSL; cmd: TIdC_INT; larg: TIdC_LONG; parg: Pointer): TIdC_LONG; cdecl;
     ssl_ctx_ctrl: function(ctx: PSSL_CTX; cmd: TIdC_INT; larg:TIdC_LONG; parg: Pointer): TIdC_LONG; cdecl;
     get_cipher_by_char: function(const ptr: PByte):PSSL_CIPHER; cdecl;
     put_cipher_by_char: function(const cipher: PSSL_CIPHER;ptr: PByte): TIdC_INT; cdecl;
     ssl_pending: function(const s: PSSL): TIdC_INT; cdecl;
     num_ciphers: function: TIdC_INT; cdecl;
     get_cipher: function(ncipher: TIdC_UNSIGNED): PSSL_CIPHER;cdecl;
     get_ssl_method: function(version: TIdC_INT): PSSL_METHOD; cdecl;
     get_timeout: function : TIdC_LONG; cdecl;
     ssl3_enc: PSSL3_ENC_METHOD;
     ssl_version: function : TIdC_INT; cdecl;
     ssl_callback_ctrl: function(s: PSSL; cb_id: TIdC_INT; fp: SSL_METHOD_PROC): TIdC_LONG; cdecl;
     ssl_ctx_callback_ctrl: function(s: PSSL_CTX; cb_id:TIdC_INT; fp: SSL_METHOD_PROC): TIdC_LONG; cdecl;
  end;
  PPSSL_METHOD  =^PSSL_METHOD;
// This callback type is used inside SSL_CTX, SSL, and in the functions that set
// them. It is used to override the generation of SSL/TLS session IDs in a
// server. Return value should be zero on an error, non-zero to proceed. Also,
// callbacks should themselves check if the id they generate is unique otherwise
// the SSL handshake will fail with an error - callbacks can do this using the
// 'ssl' value they're passed by;
//      SSL_has_matching_session_id(ssl, id, *id_len)
// The length value passed in is set at the maximum size the session ID can be.
// In SSLv2 this is 16 bytes, whereas SSLv3/TLSv1 it is 32 bytes. The callback
// can alter this length to be less if desired, but under SSLv2 session IDs are
// supposed to be fixed at 16 bytes so the id will be padded after the callback
// returns in this case. It is also an error for the callback to set the size to
// zero.
  PGEN_SESSION_CB = function (const SSL : PSSL; id : PByte; id_len : TIdC_UINT) : TIdC_INT; cdecl;
  SSL_COMP = record
    id : TIdC_INT;
    name : PAnsiChar;
    {$IFNDEF OPENSSL_NO_COMP}
    method : PCOMP_METHOD;
    {$ELSE}
    method : PAnsiChar;
    {$ENDIF}
  end;
  {$IFDEF DEBUG_SAFESTACK}
  STACK_OF_COMP = record
    _stack: stack;
  end;
  PSTACK_OF_COMP = ^STACK_OF_COMP;
  {$ELSE}
  //I think the DECLARE_STACK_OF macro is empty
  PSTACK_OF_COMP = PSTACK;
  {$ENDIF}
  PSSL_CTEX_tlsext_servername_callback = function(ssl : PSSL; Para1 : TIdC_INT; Para2 : Pointer) : TIdC_INT; cdecl;
  PSSL_CTX_info_callback = procedure (const ssl : PSSL; _type, val : TIdC_INT); cdecl; // used if SSL's info_callback is NULL
//int (*tlsext_ticket_key_cb)(SSL *ssl,
//					unsigned char *name, unsigned char *iv,
//					EVP_CIPHER_CTX *ectx,
//					HMAC_CTX *hctx, int enc);
  Ptlsext_ticket_key_cb = function (ssl : PSSL; name, iv : PAnsiChar;
    ectx : PEVP_CIPHER_CTX;
    hctx : PHMAC_CTX; enc : TIdC_INT) : TIdC_INT; cdecl;
//	int (*tlsext_status_cb)(SSL *ssl, void *arg);
  Ptlsext_status_cb = function (ssl : PSSL; arg : Pointer) : TIdC_INT; cdecl;
  SSL_CTX_stats = record
    sess_connect: TIdC_INT;  // SSL new conn - started
    sess_connect_renegotiate: TIdC_INT;  // SSL reneg - requested
    sess_connect_good: TIdC_INT; // SSL new conne/reneg - finished
    sess_accept: TIdC_INT;    // SSL new accept - started
    sess_accept_renegotiate: TIdC_INT; // SSL reneg - requested
    sess_accept_good: TIdC_INT;  // SSL accept/reneg - finished
    sess_miss: TIdC_INT;  // session lookup misses
    sess_timeout: TIdC_INT; // reuse attempt on timeouted session
    sess_cache_full: TIdC_INT; // session removed due to full cache
    sess_hit: TIdC_INT; // session reuse actually done
    sess_cb_hit: TIdC_INT; // session-id that was not
                          // in the cache was
                          // passed back via the callback.  This
                          // indicates that the application is
                          // supplying session-id's from other
                          // processes - spooky :-)
  end;
  SSL_CTX = record
    method: PSSL_METHOD;
    cipher_list: PSTACK_OF_SSL_CIPHER;
    // same as above but sorted for lookup
    cipher_list_by_id: PSTACK_OF_SSL_CIPHER;
    cert_store: PX509_STORE;
    sessions: PLHASH;
    // a set of SSL_SESSIONs
    // Most session-ids that will be cached, default is
    // SSL_SESSION_CACHE_MAX_SIZE_DEFAULT. 0 is unlimited.
    session_cache_size: TIdC_ULONG;
    session_cache_head: PSSL_SESSION;
    session_cache_tail: PSSL_SESSION;
    // This can have one of 2 values, ored together,
    // SSL_SESS_CACHE_CLIENT,
    // SSL_SESS_CACHE_SERVER,
    // Default is SSL_SESSION_CACHE_SERVER, which means only
    // SSL_accept which cache SSL_SESSIONS.
    session_cache_mode: TIdC_INT;
    session_timeout: TIdC_LONG;
    // If this callback is not null, it will be called each
    // time a session id is added to the cache.  If this function
    // returns 1, it means that the callback will do a
    // SSL_SESSION_free() when it has finished using it.  Otherwise,
    // on 0, it means the callback has finished with it.
    // If remove_session_cb is not null, it will be called when
    // a session-id is removed from the cache.  After the call,
    // OpenSSL will SSL_SESSION_free() it.
    new_session_cb: function (ssl : PSSL; sess: PSSL_SESSION): TIdC_INT; cdecl;
    remove_session_cb: procedure (ctx : PSSL_CTX; sess : PSSL_SESSION); cdecl;
    get_session_cb: function (ssl : PSSL; data : PByte; len: TIdC_INT; copy : PIdC_INT) : PSSL_SESSION; cdecl;
    stats : SSL_CTX_stats;
    
    references: TIdC_INT;
    // if defined, these override the X509_verify_cert() calls
    app_verify_callback: function (_para1 : PX509_STORE_CTX; _para2 : Pointer) : TIdC_INT; cdecl;
    app_verify_arg: Pointer;
    // before OpenSSL 0.9.7, 'app_verify_arg' was ignored
    // ('app_verify_callback' was called with just one argument)
    // Default password callback.
    default_passwd_callback: ppem_password_cb;
    // Default password callback user data.
    default_passwd_callback_userdata: Pointer;
    // get client cert callback
    client_cert_cb: function (SSL : PSSL; x509 : PPX509; pkey : PPEVP_PKEY) : TIdC_INT; cdecl;
    // verify cookie callback
    app_gen_cookie_cb: function (ssl : PSSL; cookie : PByte; cookie_len : TIdC_UINT) : TIdC_INT; cdecl;
    app_verify_cookie_cb: Pointer;
    ex_data : CRYPTO_EX_DATA;
    rsa_md5 : PEVP_MD; // For SSLv2 - name is 'ssl2-md5'
    md5: PEVP_MD; // For SSLv3/TLSv1 'ssl3-md5'
    sha1: PEVP_MD; // For SSLv3/TLSv1 'ssl3->sha1'
    extra_certs: PSTACK_OF_X509;
    comp_methods: PSTACK_OF_COMP; // stack of SSL_COMP, SSLv3/TLSv1
    // Default values used when no per-SSL value is defined follow
    info_callback: PSSL_CTX_info_callback; // used if SSL's info_callback is NULL
    // what we put in client cert requests
    client_CA : PSTACK_OF_X509_NAME;
    // Default values to use in SSL structures follow (these are copied by SSL_new)
    options : TIdC_ULONG;
    mode : TIdC_ULONG;
    max_cert_list : TIdC_LONG;
    cert : PCERT;
    read_ahead : TIdC_INT;
    // callback that allows applications to peek at protocol messages
    msg_callback : procedure (write_p, version, content_type : TIdC_INT; const buf : Pointer; len : size_t; ssl : PSSL; arg : Pointer); cdecl;
    msg_callback_arg : Pointer;
    verify_mode : TIdC_INT;
    sid_ctx_length : TIdC_UINT;
    sid_ctx : array[0..SSL_MAX_SID_CTX_LENGTH - 1] of AnsiChar;
    default_verify_callback : function(ok : TIdC_INT; ctx : PX509_STORE_CTX) : TIdC_INT; cdecl; // called 'verify_callback' in the SSL
    // Default generate session ID callback.
    generate_session_id : PGEN_SESSION_CB;
    param : PX509_VERIFY_PARAM;
    {$IFDEF OMIT_THIS}
    purpose : TIdC_INT;  // Purpose setting
    trust : TIdC_INT;    // Trust setting
    {$ENDIF}
    {$IFNDEF OPENSSL_ENGINE}
	///* Engine to pass requests for client certs to
	// */
	  client_cert_engine : PENGINE;
    {$ENDIF}
    quiet_shutdown : TIdC_INT;
    {$IFNDEF OPENSSL_NO_TLSEXT}
//* TLS extensions servername callback */
    tlsext_servername_callback : PSSL_CTEX_tlsext_servername_callback;
    tlsext_servername_arg : Pointer;
    //* RFC 4507 session ticket keys */
    tlsext_tick_key_name : array [0..(16-1)] of AnsiChar;
    tlsext_tick_hmac_key : array [0..(16-1)] of AnsiChar;
    tlsext_tick_aes_key : array [0..(16-1)] of AnsiChar;
	//* Callback to support customisation of ticket key setting */
 //	int (*tlsext_ticket_key_cb)(SSL *ssl,
 //					unsigned char *name, unsigned char *iv,
 //					EVP_CIPHER_CTX *ectx,
 //					HMAC_CTX *hctx, int enc);
    tlsext_ticket_key_cb : Ptlsext_ticket_key_cb;
	//* certificate status request info */
	//* Callback for status request */
	//int (*tlsext_status_cb)(SSL *ssl, void *arg);
    tlsext_status_cb : Ptlsext_status_cb;
	  tlsext_status_arg : Pointer;
    {$ENDIF}
  end;
  PSSL2_STATE = ^SSL2_STATE;
  PSSL3_STATE = ^SSL3_STATE;
  PDTLS1_STATE = ^DTLS1_STATE;
//* TLS extension debug callback */
  PSSL_tlsext_debug_cb = procedure (s : PSSL; client_server : TIdC_INT; 
    _type : TIdC_INT; data : PAnsiChar; len : TIdC_INT; arg : Pointer); cdecl;
  SSL = record
    // protocol version
    // (one of SSL2_VERSION, SSL3_VERSION, TLS1_VERSION, DTLS1_VERSION)
    version : TIdC_INT;
    _type : TIdC_INT; //* SSL_ST_CONNECT or SSL_ST_ACCEPT */
    method : PSSL_METHOD; //* SSLv3 */
    // There are 2 BIO's even though they are normally both the
    // same.  This is so data can be read and written to different
    // handlers
    {$IFNDEF OPENSSL_NO_BIO}
    rbio : PBIO; // used by SSL_read
    wbio : PBIO; // used by SSL_write
    bbio : PBIO; // used during session-id reuse to concatenate messages
    {$ELSE}
    rbio : PAnsiChar; // used by SSL_read
    wbio : PAnsiChar; // used by SSL_write
    bbio : PAnsiChar;
    {$ENDIF}
    // This holds a variable that indicates what we were doing
    // when a 0 or -1 is returned.  This is needed for
    // non-blocking IO so we know what request needs re-doing when
    // in SSL_accept or SSL_connect
    rwstate : TIdC_INT;
    // true when we are actually in SSL_accept() or SSL_connect()
    in_handshake : TIdC_INT;
    handshake_func : function (_para1 : PSSL) : TIdC_INT; cdecl;
    // Imagine that here's a boolean member "init" that is
    // switched as soon as SSL_set_{accept/connect}_state
    // is called for the first time, so that "state" and
    // handshake_func" are properly initialized.  But as
    // handshake_func is == 0 until then, we use this
    // test instead of an "init" member.
    server : TIdC_INT;  // are we the server side? - mostly used by SSL_clear
    new_session : TIdC_INT;
                 // 1 if we are to use a new session.
                 // 2 if we are a server and are inside a handshake
                 //    (i.e. not just sending a HelloRequest)
                 // NB: For servers, the 'new' session may actually be a previously
                 // cached session or even the previous session unless
                 // SSL_OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION is set
    quiet_shutdown : TIdC_INT;  // don't send shutdown packets
    shutdown : TIdC_INT;        // we have shut things down, 0x01 sent, 0x02
                                // for received
    state : TIdC_INT;   // where we are
    rstate : TIdC_INT;  // where we are when reading
    init_buf : PBUF_MEM;    // buffer used during init
    init_msg : Pointer;     // pointer to handshake message body, set by ssl3_get_message()
    init_num : TIdC_INT;    // amount read/written
    init_off : TIdC_INT;    // amount read/written
    // used internally to point at a raw packet
    packet : PAnsiChar;
    packet_length : TIdC_UINT;
    s2 : Pssl2_state;   // SSLv2 variables
    s3 : Pssl3_state;   // SSLv3 variables
    d1 : Pdtls1_state;  // DTLSv1 variables
    read_ahead : TIdC_INT;  // Read as many input bytes as possible (for non-blocking reads)
    // callback that allows applications to peek at protocol messages
    msg_callback : procedure(write_p, version, content_type : TIdC_INT;
      const buf : Pointer; len : size_t; ssl : PSSL; arg : Pointer); cdecl;
    msg_callback_arg : Pointer;
    hit : TIdC_INT;    //* reusing a previous session */
    param : PX509_VERIFY_PARAM;
    {$IFDEF OMIT_THIS}
    purpose : TIdC_INT; // Purpose setting
    trust : TIdC_INT;   // Trust setting
    {$ENDIF}
    // crypto
    cipher_list : PSTACK_OF_SSL_CIPHER;
    cipher_list_by_id : PSTACK_OF_SSL_CIPHER;
    // These are the ones being used, the ones in SSL_SESSION are
    // the ones to be 'copied' into these ones
    enc_read_ctx : PEVP_CIPHER_CTX;  // cryptographic state
    read_hash : PEVP_MD;    // used for mac generation
    {$IFNDEF OPENSSL_NO_COMP}
    expand : PCOMP_CTX;             // uncompress
    {$ELSE}
    expand : PAnsiChar;
    {$ENDIF}
    enc_write_ctx : PEVP_CIPHER_CTX;   // cryptographic state
    write_hash : PEVP_MD;              // used for mac generation
    {$IFNDEF OPENSSL_NO_COMP}
    compress : PCOMP_CTX;              // compression
    {$ELSE}
    compress : PAnsiChar;
    {$ENDIF}
    // session info
    // client cert?
    // This is used to hold the server certificate used
    cert : PCERT;
    // the session_id_context is used to ensure sessions are only reused
    // in the appropriate context
    sid_ctx_length : TIdC_UINT;
    sid_ctx : array [0..SSL_MAX_SID_CTX_LENGTH -1] of AnsiChar;
    // This can also be in the session once a session is established
    session : PSSL_SESSION;
    // Default generate session ID callback.
    generate_session_id : PGEN_SESSION_CB;
    // Used in SSL2 and SSL3
    verify_mode : TIdC_INT; // 0 don't care about verify failure.
                            // 1 fail if verify fails
    verify_callback : function (ok : TIdC_INT; ctx : PX509_STORE_CTX) : TIdC_INT; cdecl; // fail if callback returns 0
    info_callback : procedure(const ssl : PSSL; _type, val : TIdC_INT) ; cdecl;
    error : TIdC_INT;       // error bytes to be written
    error_code : TIdC_INT;  // actual code
    {$IFNDEF OPENSSL_NO_KRB5}
    kssl_ctx : PKSSL_CTX;     // Kerberos 5 context
    {$ENDIF}
    ctx : PSSL_CTX;
    // set this flag to 1 and a sleep(1) is put into all SSL_read()
    // and SSL_write() calls, good for nbio debuging :-)
    debug : TIdC_INT;
    //  extra application data
    verify_result : TIdC_LONG;
    ex_data : CRYPTO_EX_DATA;
    // for server side, keep the list of CA_dn we can use
    client_CA : PSTACK_OF_X509_NAME;
    references : TIdC_INT;
    options : TIdC_ULONG; // protocol behaviour
    mode : TIdC_ULONG; // API behaviour
    max_cert_list : TIdC_LONG;
    first_packet : TIdC_INT;
    client_version : TIdC_INT; // what was passed, used for
    // SSLv3/TLS rollback check
    {$IFNDEF OPENSSL_NO_TLSEXT}
    //* TLS extension debug callback */
    tlsext_debug_cb : PSSL_tlsext_debug_cb;
    tlsext_debug_arg : Pointer;
    tlsext_hostname : PAnsiChar;
    servername_done : TIdC_INT;   //* no further mod of servername 
                       //   0 : call the servername extension callback.
                       //   1 : prepare 2, allow last ack just after in server callback.
                       //   2 : don't call servername callback, no ack in server hello
                       //*/
	//* certificate status request info */
	//* Status type or -1 if no status type */
	  tlsext_status_type : TIdC_INT;
	//* Expect OCSP CertificateStatus message */
	  tlsext_status_expected : TIdC_INT;
	//* OCSP status request only */
    tlsext_ocsp_ids : PSTACK_OF_OCSP_RESPID;//STACK_OF(OCSP_RESPID) *tlsext_ocsp_ids;
	  tlsext_ocsp_exts : PX509_EXTENSIONS;
	//* OCSP response received or to be sent */
	  tlsext_ocsp_resp : PAnsiChar;
	  tlsext_ocsp_resplen : TIdC_INT;
    //* RFC4507 session ticket expected to be received or sent */
    tlsext_ticket_expected : TIdC_INT;
    initial_ctx : PSSL_CTX; //* initial ctx, used to store sessions */
   {$DEFINE session_ctx} 
   {$DEFINE initial_ctx}
{$ELSE}
   {$DEFINE ctx}
   {$DEFINE session_ctx}
{$ENDIF}
  end;
  //ssl2.h
  SSL2_STATE = record
    three_byte_header : TIdC_INT;
    clear_text : TIdC_INT;    // clear text
    escape : TIdC_INT;        // not used in SSLv2
    ssl2_rollback : TIdC_INT; // used if SSLv23 rolled back to SSLv2
    // non-blocking io info, used to make sure the same
    // args were passwd
    wnum : TIdC_UINT; // number of bytes sent so far
    wpend_tot : TIdC_INT;
    wpend_buf : PByte;
    wpend_off : TIdC_INT; // offset to data to write
    wpend_len : TIdC_INT; // number of bytes passwd to write
    wpend_ret : TIdC_INT; // number of bytes to return to caller
    // buffer raw data
    rbuf_left : TIdC_INT;
    rbuf_offs : TIdC_INT;
    rbuf : PAnsiChar;
    wbuf : PAnsiChar;
    write_ptr : PAnsiChar; // used to point to the start due to 2/3 byte header. */
    padding : TIdC_UINT;
    rlength : TIdC_UINT; // passed to ssl2_enc
    ract_data_length : TIdC_INT; // Set when things are encrypted.
    wlength : TIdC_UINT; // passed to ssl2_enc
    wact_data_length : TIdC_INT; // Set when things are decrypted.
    ract_data : PAnsiChar;
    wact_data : PAnsiChar;
    mac_data : PAnsiChar;
    read_key : PAnsiChar;
    write_key : PAnsiChar;
    // Stuff specifically to do with this SSL session
    challenge_length : TIdC_UINT;
    challenge : array [0..SSL2_MAX_CHALLENGE_LENGTH -1] of AnsiChar;
    conn_id_length : TIdC_UINT;
    conn_id : array [0..SSL2_MAX_CONNECTION_ID_LENGTH -1] of AnsiChar;
    key_material_length : TIdC_UINT;
    key_material : array[0..(SSL2_MAX_KEY_MATERIAL_LENGTH*2)-1] of AnsiChar;
    read_sequence : TIdC_ULONG;
    write_sequence : TIdC_ULONG;
    tmp_conn_id_length : TIdC_UINT;
    tmp_cert_type : TIdC_UINT;
    tmp_cert_length : TIdC_UINT;
    tmp_csl : TIdC_UINT;
    tmp_clear : TIdC_UINT;
    tmp_enc : TIdC_UINT;
    tmp_ccl : array [0..SSL2_MAX_CERT_CHALLENGE_LENGTH -1] of AnsiChar;
    tmp_cipher_spec_length : TIdC_UINT;
    tmp_session_id_length : TIdC_UINT;
    tmp_clen : TIdC_UINT;
    tmp_rlen : TIdC_UINT;
  end;
  //sl3.h
  PSSL3_RECORD = ^SSL3_RECORD;
  SSL3_RECORD = record
    {*r *}  _type : TIdC_INT;   // type of record
    {*rw*}  length : TIdC_UINT; // How many bytes available
    {*r *}  off : TIdC_UINT;    // read/write offset into 'buf'
    {*rw*}  data : PAnsiChar;       // pointer to the record data
    {*rw*}  input : PAnsiChar;      // where the decode bytes are
    {*r *}  comp : PAnsiChar;       // only used with decompression - malloc()ed
    {*r *}  epoch : TIdC_ULONG; // epoch number, needed by DTLS1
    {*r *}  seq_num : PQ_64BIT; // sequence number, needed by DTLS1
  end;
  PSSL3_BUFFER = ^SSL3_BUFFER;
  SSL3_BUFFER = record
    buf : PAnsiChar;            // at least SSL3_RT_MAX_PACKET_SIZE bytes,
                            // see ssl3_setup_buffers()
    len : size_t;           // buffer size
    offset : TIdC_INT;      // where to 'copy from'
    left : TIdC_INT;        // how many bytes left
  end;
  SSL3_STATE = record
    flags : TIdC_LONG;
    delay_buf_pop_ret : TIdC_INT;

    read_sequence : array [0..7] of AnsiChar;
    read_mac_secret : array [0..EVP_MAX_MD_SIZE -1] of AnsiChar;
    write_sequence : array [0..7] of AnsiChar;
    write_mac_secret : array [0..EVP_MAX_MD_SIZE] of AnsiChar;
    server_random : array [0..SSL3_RANDOM_SIZE - 1] of AnsiChar;
    client_random : array [0..SSL3_RANDOM_SIZE -1] of AnsiChar;
    // flags for countermeasure against known-IV weakness
    need_empty_fragments : TIdC_INT;
    empty_fragment_done : TIdC_INT;
    rbuf : PSSL3_BUFFER;    //* read IO goes into here */
    wbuf : PSSL3_BUFFER;	//* write IO goes into here */
    rrec : PSSL3_RECORD;    //* each decoded record goes in here */
    wrec : PSSL3_RECORD;    //* goes out from here */
    // storage for Alert/Handshake protocol data received but not
    // yet processed by ssl3_read_bytes:
    alert_fragment : array [0..1] of PAnsiChar;
    alert_fragment_len : TIdC_UINT;
    handshake_fragment : array [0..3] of PAnsiChar;
    handshake_fragment_len : TIdC_UINT;
    // partial write - check the numbers match
    wnum : TIdC_UINT; // number of bytes sent so far
    wpend_tot : TIdC_INT;  // number bytes written
    wpend_type : TIdC_INT;
    wpend_ret : TIdC_INT; // number of bytes submitted
    wpend_buf : PByte;
    // used during startup, digest all incoming/outgoing packets */
    finish_dgst1 : PEVP_MD_CTX;
    finish_dgst2 : PEVP_MD_CTX;
    // this is set whenerver we see a change_cipher_spec message
    // come in when we are not looking for one
    change_cipher_spec : TIdC_INT;
    warn_alert : TIdC_INT;
    fatal_alert : TIdC_INT;
    // we allow one fatal and one warning alert to be outstanding,
    // send close alert via the warning alert */
     alert_dispatch : TIdC_INT;
     send_alert : array [0..1] of AnsiChar;
    // This flag is set when we should renegotiate ASAP, basically when
    // there is no more data in the read or write buffers
    renegotiate : TIdC_INT;
    total_renegotiations : TIdC_INT;
    num_renegotiations : TIdC_INT;
    in_read_app_data : TIdC_INT;
    // actually only needs to be 16+20
    tmp_cert_verify_md: array [0..(EVP_MAX_MD_SIZE*2)-1] of AnsiChar;
    // actually only need to be 16+20 for SSLv3 and 12 for TLS
    tmp_finish_md : array[0..(EVP_MAX_MD_SIZE*2)-1] of AnsiChar;
    tmp_finish_md_len : TIdC_INT;
    tmp_peer_finish_md : array[0..(EVP_MAX_MD_SIZE*2)-1] of AnsiChar;
    tmp_peer_finish_md_len : TIdC_INT;
    tmp_message_size : TIdC_UINT;
    tmp_message_type : TIdC_INT;
    // used to hold the new cipher we are going to use
    tmp_new_cipher : PSSL_CIPHER;
    {$IFNDEF OPENSSL_NO_DH}
    tmp_dh : PDH;
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_ECDH}
    tmp_ecdh : PEC_KEY; // holds short lived ECDH key
    {$ENDIF}
    // used when SSL_ST_FLUSH_DATA is entered
    tmp_next_state : TIdC_INT;
    tmp_reuse_message : TIdC_INT;
    // used for certificate requests
    tmp_cert_req : TIdC_INT;
    tmp_ctype_num : TIdC_INT;
    tmp_ctype : array [0..SSL3_CT_NUMBER -1] of AnsiChar;
    tmp_ca_names : PSTACK_OF_X509_NAME;
    tmp_use_rsa_tmp : TIdC_INT;
    tmp_key_block_length : TIdC_INT;
    tmp_key_block : PAnsiChar;
    tmp_new_sym_enc : PEVP_CIPHER;
    tmp_new_hash : PEVP_MD;
    {$IFNDEF OPENSSL_NO_COMP}
    tmp_new_compression : PSSL_COMP;
    {$ELSE}
    tmp_new_compression : PAnsiChar;
    {$ENDIF}
    tmp_cert_request : TIdC_INT;

    //* Connection binding to prevent renegotiation attacks */
        previous_client_finished : array [0..EVP_MAX_MD_SIZE - 1] of AnsiChar;
        previous_client_finished_len : Byte;
        previous_server_finished : array [0..EVP_MAX_MD_SIZE - 1] of AnsiChar;
        previous_server_finished_len : Byte;
        send_connection_binding : TIdC_INT; //* TODOEKR */

  end;
  //openssl/pq_compat.h
  ppitem = ^pitem;
  pitem = record
    priority : PQ_64BIT;
    data : Pointer;
    next : ppitem;
  end;
  //ssl/dtls1.h
  //for some reason, this header is refering to crypto/pqueue/pqueue.c
  //which is in the OpenSSL headers.
  pqueue = record
    items : ppitem;
    count : TIdC_INT;
  end;
  //
  dtls1_retransmit_state = record
	  enc_write_ctx : PEVP_CIPHER_CTX;	//* cryptographic state */
   	write_hash : PEVP_MD;		//* used for mac generation */
{$IFNDEF OPENSSL_NO_COMP}
   	compress : COMP_CTX;				//* compression */
{$ELSE}
   	compress : PAnsiChar;
{$ENDIF}
   	session : PSSL_SESSION;
	  epoch : TIdC_USHORT;
  end;
  Pdtls1_retransmit_state = ^dtls1_retransmit_state;
  DTLS1_BITMAP = record
    map : PQ_64BIT;
    length : TIdC_ULONG;     // sizeof the bitmap in bits
    max_seq_num : PQ_64BIT;  // max record number seen so far
  end;
  PDTLS1_BITMAP = ^DTLS1_BITMAP;
  hm_header = record
    _type : PAnsiChar;
    msg_len : TIdC_ULONG;
    seq : TIdC_USHORT;
    frag_off : TIdC_ULONG;
    frag_len : TIdC_ULONG;
    is_ccs : TIdC_UINT;
    //	struct dtls1_retransmit_state saved_retransmit_state;
    saved_retransmit_state : dtls1_retransmit_state;
  end;
  ccs_header_st = record
    _type : PAnsiChar;
    seq : TIdC_USHORT;
  end;
  dtls1_timeout_st = record
    // Number of read timeouts so far
    read_timeouts : TIdC_UINT;
    // Number of write timeouts so far
    write_timeouts : TIdC_UINT;
    // Number of alerts received so far
    num_alerts : TIdC_UINT;
  end;
  record_pqueue = record
    epoch : TIdC_USHORT;
    q : pqueue;
  end;
  hm_fragment = record
    msg_header : hm_header;
    fragment : PAnsiChar;
  end;
  DTLS1_STATE = record
    send_cookie : TIdC_UINT;
    cookie : array [0..DTLS1_COOKIE_LENGTH - 1 ] of AnsiChar;
    rcvd_cookie : array [0..DTLS1_COOKIE_LENGTH -1] of AnsiChar;
    cookie_len : TIdC_UINT;
    // The current data and handshake epoch.  This is initially
    // undefined, and starts at zero once the initial handshake is
    // completed
    r_epoch : TIdC_USHORT;
    w_epoch : TIdC_USHORT;
    // records being received in the current epoch
    bitmap : DTLS1_BITMAP;
    // renegotiation starts a new set of sequence numbers
    next_bitmap : DTLS1_BITMAP;
    // handshake message numbers
    handshake_write_seq : TIdC_USHORT;
    next_handshake_write_seq : TIdC_USHORT;
    handshake_read_seq : TIdC_USHORT;
	//* save last sequence number for retransmissions */
   	last_write_sequence : array [0..8-1] of byte;

    // Received handshake records (processed and unprocessed)
    unprocessed_rcds : record_pqueue;
    processed_rcds : record_pqueue;
    // Buffered handshake messages
    buffered_messages : pqueue;
    // Buffered (sent) handshake records
    sent_messages : pqueue;
   ///* Buffered application records.
	 //* Only for records between CCS and Finished
	 //* to prevent either protocol violation or
	 //* unnecessary message loss.
	 //*/
	  buffered_app_data : record_pqueue;

	///* Is set when listening for new connections with dtls1_listen() */
	  listen : TIdC_UINT;

    mtu : TIdC_UINT; // max wire packet size
    w_msg_hdr : hm_header;
    r_msg_hdr : hm_header;
    timeout :  dtls1_timeout_st;
    	//* Indicates when the last handshake msg sent will timeout */
    next_timeout : timeval;

	//* Timeout duration */
	   timeout_duration : TIdC_USHORT;

    // storage for Alert/Handshake protocol data received but not
    // yet processed by ssl3_read_bytes:
    alert_fragment : array [0..DTLS1_AL_HEADER_LENGTH-1] of AnsiChar;
    alert_fragment_len : TIdC_UINT;
    handshake_fragment : array[0..DTLS1_HM_HEADER_LENGTH -1] of AnsiChar;
    handshake_fragment_len : TIdC_UINT;
    retransmitting : TIdC_UINT;
    change_cipher_spec_ok : TIdC_UINT;
  end;
  X509V3_CTX = V3_EXT_CTX;
  PX509V3_CTX = ^X509V3_CTX;

type
  Tsk_new_cmp = function (const a, b : PAnsiChar; const c : PAnsiChar) : TIdC_INT cdecl;
  TRSA_generate_key_callback = procedure (p1, p2 : TIdC_INT; p3 : Pointer); cdecl;
  TCRYPTO_set_mem_functions_m = function (size : size_t) : Pointer; cdecl;
  TCRYPTO_set_mem_functions_r = function (ptr : Pointer; size : size_t) : Pointer; cdecl;
  TCRYPTO_set_mem_functions_f = procedure (ptr : Pointer); cdecl;
  TCRYPTO_set_mem_ex_functions_m = function(size : size_t; const c : PAnsiChar; i : TIdC_INT) : Pointer; cdecl;
  TCRYPTO_set_mem_ex_functions_r = function(ptr : Pointer; size : size_t; const c : PAnsiChar; i : TIdC_INT) : Pointer; cdecl;
  TCRYPTO_set_mem_ex_functions_f = procedure (ptr : Pointer); cdecl;
  Tset_mem_debug_functions_m = procedure (addr : Pointer; num : TIdC_INT; const _file : PAnsiChar; line, before_p : TIdC_INT); cdecl;
  Tset_mem_debug_functions_r = procedure (addr1, addr2 : Pointer; num : TIdC_INT; const _file : PAnsiChar; line, before_p : TIdC_INT); cdecl;
  Tset_mem_debug_functions_f = procedure (addr : Pointer; before_p : TIdC_INT); cdecl;
  Tset_mem_debug_functions_so = procedure (bits : TIdC_LONG); cdecl;
  Tset_mem_debug_functions_go = function : TIdC_LONG; cdecl;
  TSSL_CTX_set_verify_callback = function (ok : TIdC_INT; ctx : PX509_STORE_CTX) : TIdC_INT; cdecl;
  Tsk_pop_free_func = procedure (p : Pointer); cdecl;
  SSL_callback_ctrl_fp = procedure (para1 : PBIO; para2 : TIdC_INT;
    para3 : PAnsiChar; para4 : TIdC_INT; para5, para6 : TIdC_INT); cdecl;
  TCRYPTO_THREADID_set_callback_threadid_func = procedure (id : PCRYPTO_THREADID) cdecl;

var
  OpenSSL_add_all_algorithms : procedure cdecl = nil;
  OpenSSL_add_all_ciphers : procedure cdecl = nil;
  OpenSSL_add_all_digests : procedure cdecl = nil;

  EVP_cleanup : procedure cdecl = nil;
  //SSL Version function
  _SSLeay_version : function(_type : TIdC_INT) : PAnsiChar cdecl = nil;
  //SSLeay
  SSLeay : function : TIdC_ULONG cdecl;
  //CRYPTO_set_mem_ex_functions
  CRYPTO_set_mem_functions : function(
    m: TCRYPTO_set_mem_functions_m;
    r: TCRYPTO_set_mem_functions_r;
    f: TCRYPTO_set_mem_functions_f): TIdC_INT cdecl = nil;
  CRYPTO_malloc : function(num: TIdC_INT; const _file: PAnsiChar; line: TIdC_INT): Pointer cdecl = nil;
  CRYPTO_free : procedure(ptr : Pointer) cdecl = nil;
  CRYPTO_mem_leaks : procedure(b:PBIO) cdecl = nil;
  CRYPTO_mem_ctrl : function(mode: TIdC_INT): TIdC_INT cdecl = nil;
  CRYPTO_set_mem_debug_functions : procedure (
      m: Tset_mem_debug_functions_m;
      r: Tset_mem_debug_functions_r;
      f : Tset_mem_debug_functions_f;
      so : Tset_mem_debug_functions_so;
      go : Tset_mem_debug_functions_go) cdecl = nil;
  CRYPTO_dbg_malloc : procedure(addr: Pointer; num: TIdC_INT; const _file: PAnsiChar; line, before: TIdC_INT) cdecl = nil;
  CRYPTO_dbg_realloc : procedure(arrd1, addr2: Pointer; num: TIdC_INT; const _file: PAnsiChar; line, before: TIdC_INT) cdecl = nil;
  CRYPTO_dbg_free : procedure(addr: Pointer; before: TIdC_INT) cdecl = nil;
  CRYPTO_dbg_set_options : procedure(bits: TIdC_LONG) cdecl = nil;
  CRYPTO_dbg_get_options : function: TIdC_LONG cdecl = nil;
  CRYPTO_THREADID_set_numeric : procedure(id : PCRYPTO_THREADID; val : TIdC_ULONG) cdecl = nil;
  CRYPTO_THREADID_set_pointer : procedure(id : PCRYPTO_THREADID; ptr : Pointer) cdecl = nil;
  CRYPTO_THREADID_set_callback : function(threadid_func : TCRYPTO_THREADID_set_callback_threadid_func) : TIdC_INT cdecl = nil;
  sk_num : function (const x : PSTACK) : TIdC_INT cdecl = nil;
  sk_value : function (x : PSTACK; i : TIdC_INT) : PAnsiChar cdecl = nil;
  sk_new : function ( cmp : Tsk_new_cmp) : PStack cdecl = nil;
  sk_new_null : function: PSTACK cdecl = nil;
  sk_free : procedure (st : PSTACK) cdecl = nil;
  sk_push : function(st: PSTACK; data: PAnsiChar): TIdC_INT cdecl = nil;

  RSA_new: function: PRSA cdecl = nil;
  RSA_size: function(key: PRSA): TIdC_INT cdecl = nil;
  //This function is depreciated.
  RSA_generate_key : function(bits: TIdC_INT; e: TIdC_ULONG; callback: TRSA_generate_key_callback; cb_arg: Pointer): PRSA cdecl = nil;
  RSA_generate_key_ex : function(rsa : PRSA; bits : TIdC_INT; e : PBIGNUM; cb : PBN_GENCB) : TIdC_INT cdecl = nil;

  RSA_free : procedure(rsa: PRSA) cdecl = nil;
  RSA_check_key : function(const rsa: PRSA): TIdC_INT cdecl = nil;
  RSA_private_decrypt: function(flen: TIdC_INT; from: PByte; _to: PByte; rsa: PRSA; padding: TIdC_INT): TIdC_INT cdecl = nil;
  RSA_public_encrypt: function(flen: TIdC_INT; from: PByte; _to: PByte; rsa: PRSA; padding: TIdC_INT): TIdC_INT cdecl = nil;

  X509_get_default_cert_file : function : PAnsiChar cdecl = nil;
  X509_get_default_cert_file_env : function : PAnsiChar cdecl = nil;

  BIO_new : function(_type: PBIO_METHOD): PBIO cdecl = nil;
  BIO_new_mem_buf : function (buf : Pointer; len : TIdC_INT) : PBIO cdecl = nil;
  BIO_free : function(bio: PBIO): TIdC_INT cdecl = nil;
  BIO_s_mem : function: PBIO_METHOD cdecl = nil;
  BIO_s_file : function: PBIO_METHOD cdecl = nil;
  BIO_ctrl : function(bp: PBIO; cmd: TIdC_INT; larg: TIdC_LONG; parg: Pointer): TIdC_LONG cdecl = nil;
  BIO_ptr_ctrl : function(bp : PBIO; cmd : TIdC_INT; larg : TIdC_LONG) : PAnsiChar cdecl = nil;
  BIO_int_ctrl : function(bp : PBIO; cmd : TIdC_INT; larg : TIdC_LONG; iArg : TIdC_INT) : TIdC_LONG cdecl = nil;
  BIO_callback_ctrl : function(b : PBIO; cmd : TIdC_INT; fp : SSL_callback_ctrl_fp ) : TIdC_INT cdecl = nil;
  BIO_new_file : function(const filename: PAnsiChar; const mode: PAnsiChar): PBIO cdecl = nil;

  BIO_puts : function(b: PBIO; const txt: PAnsiChar): TIdC_INT cdecl = nil;
  BIO_read : function(b: PBIO; data: Pointer; len: TIdC_INT): TIdC_INT cdecl = nil;
  BIO_write : function(b: PBIO; const buf: Pointer; len: TIdC_INT): TIdC_INT cdecl = nil;

  BN_hex2bn: function(var n:PBIGNUM; const Str: PAnsiChar): TIdC_INT cdecl = nil;
  BN_bn2hex: function(const n:PBIGNUM): PAnsiChar cdecl = nil;

  {$IFNDEF SSLEAY_MACROS}
  //Note that these are defined as a pointer to a pointer to a structure.
  //This is done because the pointer being passed could be nil.  The pointer is probably
  //more of a template than anything.  If it is used, it should be initialized to nil.
  _PEM_read_bio_X509 : function(bp: PBIO; x: PPX509; cb: ppem_password_cb; u: Pointer): PX509 cdecl = nil;
  _PEM_read_bio_X509_REQ : function(bp :PBIO; x : PPX509_REQ; cb :ppem_password_cb; u: PAnsiChar) : PX509_REQ cdecl = nil;
  _PEM_read_bio_X509_CRL : function(bp : PBIO; x : PPX509_CRL;cb : ppem_password_cb; u: Pointer) : PX509_CRL cdecl = nil;
  _PEM_read_bio_RSAPrivateKey : function(bp : PBIO; x : PPRSA; cb : ppem_password_cb; u: Pointer) : PRSA cdecl = nil;
  _PEM_read_bio_RSAPublicKey : function(bp : PBIO; x : PPRSA; cb : ppem_password_cb; u: Pointer) : PRSA cdecl = nil;
  _PEM_read_bio_DSAPrivateKey : function(bp : PBIO; x : PPDSA; cb : ppem_password_cb; u : Pointer) : PDSA cdecl = nil;
  _PEM_read_bio_PrivateKey : function(bp : PBIO; x : PPEVP_PKEY; cb : ppem_password_cb; u : Pointer) : PEVP_PKEY cdecl = nil;
  _PEM_read_bio_PKCS7 : function(bp : PBIO; x : PPPKCS7; cb : ppem_password_cb; u : Pointer) : PPKCS7 cdecl = nil;
  _PEM_read_bio_DHparams : function(bp : PBIO; x : PPDH; cb : ppem_password_cb; u : Pointer) : PDH cdecl = nil;
  _PEM_read_bio_DSAparams : function(bp : PBIO; x : PPDSA; cb : ppem_password_cb; u : Pointer) : PDSA cdecl = nil;
  _PEM_read_bio_NETSCAPE_CERT_SEQUENCE : function(bp : PBIO; x : PPNETSCAPE_CERT_SEQUENCE;
    cb : ppem_password_cb; u : Pointer) : PNETSCAPE_CERT_SEQUENCE cdecl = nil;
  _PEM_write_bio_X509 : function(b: PBIO; x: PX509): TIdC_INT cdecl = nil;
  _PEM_write_bio_X509_REQ : function(bp: PBIO; x: PX509_REQ): TIdC_INT cdecl = nil;
  _PEM_write_bio_X509_CRL : function(bp : PBIO; x : PX509_CRL) : TIdC_INT cdecl = nil;
  _PEM_write_bio_RSAPublicKey : function(bp : PBIO; x : PRSA) : TIdC_INT cdecl = nil;
  _PEM_write_bio_RSAPrivateKey : function(bp : PBIO; x : PRSA; const enc : PEVP_CIPHER;
     kstr : PAnsiChar; klen : TIdC_INT; cb : ppem_password_cb; u : POinter) : TIdC_INT cdecl = nil;
  _PEM_write_bio_DSAPrivateKey : function(bp : PBIO; x : PDSA; const enc : PEVP_CIPHER;
    kstr :PAnsiChar; klen : TIdC_INT; cb : Ppem_password_cb; u : Pointer) : TIdC_INT cdecl = nil;
  _PEM_write_bio_PrivateKey : function(bp : PBIO; x : PEVP_PKEY; const enc : PEVP_CIPHER;
    kstr :PAnsiChar; klen : TIdC_INT; cb : Ppem_password_cb; u : Pointer) : TIdC_INT cdecl = nil;
  _PEM_write_bio_PKCS7 : function(bp : PBIO; x : PPKCS7) : TIdC_INT cdecl = nil;
  _PEM_write_bio_DHparams : function(bp : PBIO; x : PDH): TIdC_INT cdecl = nil;
  _PEM_write_bio_DSAparams : function(bp : PBIO; x : PDSA) : TIdC_INT cdecl = nil;
  _PEM_write_bio_NETSCAPE_CERT_SEQUENCE : function(bp : PBIO; x : PDSA) : TIdC_INT cdecl = nil;

    {$IFNDEF OPENSSL_NO_BIO}
  _PEM_write_bio_PKCS8PrivateKey : function(bp: PBIO; key: PEVP_PKEY; enc: PEVP_CIPHER;
      kstr: PAnsiChar; klen: TIdC_INT; cb: ppem_password_cb; u: Pointer): TIdC_INT cdecl = nil;

    {$ENDIF}

  {$ELSE}
    {$IFNDEF OPENSSL_NO_BIO}
  PEM_ASN1_write_bio : function(i2d: i2d_of_void; const name: PAnsiChar;
    bp: PBIO; x: PAnsiChar; const enc: PEVP_CIPHER; kstr: PAnsiChar; klen: TIdC_INT;
    cb: ppem_password_cb; u: Pointer):TIdC_INT cdecl = nil;
  PEM_ASN1_read_bio : function(d2i: d2i_OF_void; name: PAnsiChar; bp: PBIO;
      x: PPointer; cb: ppem_password_cb; u:Pointer): Pointer cdecl = nil;

    {$ENDIF}
  {$ENDIF}
  PEM_X509_INFO_read_bio : function (bp : PBIO; sk : PSTACK_OF_X509_INFO;
    cb : ppem_password_cb; u : Pointer) : PSTACK_OF_X509_INFO cdecl = nil;
  PEM_read_bio_X509_AUX : function (bp : PBIO; x : PPX509;
    cb : ppem_password_cb; u : Pointer) : PX509 cdecl = nil;
  EVP_DigestInit_ex : function (ctx : PEVP_MD_CTX; const AType : PEVP_MD; impl : PENGINE) : TIdC_Int cdecl = nil;
//int	EVP_DigestUpdate(EVP_MD_CTX *ctx,const void *d,
//			 size_t cnt);
  EVP_DigestUpdate : function (ctx : PEVP_MD_CTX; d : Pointer; cnt : size_t) : TIdC_Int cdecl = nil;
//int	EVP_DigestFinal_ex(EVP_MD_CTX *ctx,unsigned char *md,unsigned int *s);
  EVP_DigestFinal_ex : function(ctx : PEVP_MD_CTX; md : PAnsiChar; var s : TIdC_UInt) : TIdC_Int cdecl = nil;
//void	EVP_MD_CTX_init(EVP_MD_CTX *ctx);
  EVP_MD_CTX_init : procedure(ctx : PEVP_MD_CTX) cdecl = nil;
//int	EVP_MD_CTX_cleanup(EVP_MD_CTX *ctx);
  EVP_MD_CTX_cleanup : function(ctx : PEVP_MD_CTX) : TIdC_Int cdecl = nil;
  {$IFNDEF OPENSSL_NO_DES}
  EVP_des_ede3_cbc : function: PEVP_CIPHER cdecl = nil;
  {$ENDIF}
  EVP_PKEY_new : function: PEVP_PKEY cdecl = nil;
  EVP_PKEY_free : procedure(pkey: PEVP_PKEY) cdecl = nil;
  {$IFNDEF OPENSSL_NO_RSA}
  EVP_PKEY_assign : function(pkey: PEVP_PKEY; _type: TIdC_INT; key: PAnsiChar): TIdC_INT cdecl = nil;
  {$ENDIF}
  EVP_get_digestbyname : function(const name: PAnsiChar): PEVP_MD cdecl = nil;

  ASN1_INTEGER_set : function(a: PASN1_INTEGER; v: TIdC_LONG): TIdC_INT cdecl = nil;
  ASN1_INTEGER_get : function(a: PASN1_INTEGER) : TIdC_LONG cdecl = nil;
  //IdSslAsn1UtcTimeNew : function: Pointer cdecl = nil;
  ASN1_STRING_type_new : function(_type: TIdC_INT): PASN1_STRING cdecl = nil;
  ASN1_STRING_free : procedure(a: PASN1_STRING) cdecl = nil;
  ASN1_dup : function (i2d : i2d_of_void; d2i : d2i_of_void; x : PAnsiChar) : Pointer cdecl = nil;
  i2d_X509 : function(x: PX509;  buf: PPByte) : TIdC_INT cdecl = nil;
  d2i_X509 : function(pr : PX509; _in : PPByte; len : TIdC_INT): PX509 cdecl = nil;
  i2d_X509_NAME : function(x : PX509_NAME; buf : PPByte) : TIdC_INT cdecl = nil;
  d2i_X509_NAME : function(pr : PPX509_NAME; _in : PPByte; length : TIdC_LONG):PX509_NAME cdecl = nil;
  i2d_X509_REQ : function(x: PX509_REQ;  buf: PPByte): TIdC_INT cdecl = nil;
  d2i_X509_REQ : function(pr : PX509_REQ; _in : PPByte; len : TIdC_INT): PX509_REQ cdecl = nil;
  i2d_X509_CRL : function(x: PX509_CRL; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_X509_CRL : function(pr : PX509_CRL; _in : PPByte; len : TIdC_INT): PX509_REQ cdecl = nil;
  i2d_RSAPrivateKey : function(x: PRSA; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_RSAPrivateKey : function(pr : PRSA; _in : PPByte; len : TIdC_INT): PRSA cdecl = nil;
  i2d_RSAPublicKey : function(x: PRSA; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_RSAPublicKey : function(pr : PRSA; _in : PPByte; len : TIdC_INT): PRSA cdecl = nil;
  i2d_DSAPrivateKey : function(x: PDSA; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_DSAPrivateKey : function(pr : PDSA; _in : PPByte; len : TIdC_INT): PDSA cdecl = nil;
  i2d_PrivateKey : function(x: PEVP_PKEY; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_PrivateKey : function(pr : PEVP_PKEY; _in : PPByte; len : TIdC_INT): PEVP_PKEY cdecl = nil;
  i2d_PKCS7 : function(x: PPKCS7; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_PKCS7 : function(pr : PPKCS7; _in : PPByte; len : TIdC_INT): PPKCS7 cdecl = nil;
  i2d_DHparams : function(x: PDH; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_DHparams : function(pr : PDH; _in : PPByte; len : TIdC_INT): PDH cdecl = nil;
  i2d_DSAparams : function(x: PDSA; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_DSAparams : function(pr : PDSA; _in : PPByte; len : TIdC_INT): PDSA cdecl = nil;
//NETSCAPE_CERT_SEQUENCE
  i2d_NETSCAPE_CERT_SEQUENCE : function(x: PNETSCAPE_CERT_SEQUENCE; buf: PPByte): TIdC_INT cdecl = nil;
  d2i_NETSCAPE_CERT_SEQUENCE : function(pr : PNETSCAPE_CERT_SEQUENCE; _in : PPByte; len : TIdC_INT): PNETSCAPE_CERT_SEQUENCE cdecl = nil;

  {$IFNDEF OPENSSL_NO_BIO}
  d2i_X509_bio : function(bp: PBIO; x: PPx509): PX509 cdecl = nil;
  i2d_X509_REQ_bio : function(x: PX509_REQ; bp: PBIO): TIdC_INT cdecl = nil;
  i2d_X509_bio : function(bp: PBIO; x: PX509): TIdC_INT cdecl = nil;
  i2d_PrivateKey_bio : function(b: PBIO; pkey: PEVP_PKEY): TIdC_INT cdecl = nil;

  {$ENDIF}
  X509_new : function: PPX509 cdecl = nil;
  X509_free : procedure(x: PX509) cdecl = nil;
  X509_NAME_new : function :PX509_NAME cdecl = nil;
  X509_NAME_free : procedure(x:PX509_NAME) cdecl = nil;
  X509_REQ_new : function :PX509_REQ cdecl = nil;
  X509_REQ_free : procedure(x:PX509_REQ) cdecl = nil;
  X509_to_X509_REQ : function(x: PX509; pkey: PEVP_PKEY; const md: PEVP_MD): PX509_REQ cdecl = nil;
  X509_NAME_add_entry_by_txt : function(name: PX509_NAME; const field: PAnsiChar; _type: TIdC_INT;
    const bytes: PAnsiChar; len, loc, _set: TIdC_INT): TIdC_INT cdecl = nil;
  X509_INFO_free : procedure (a : PX509_INFO) cdecl = nil;
  X509_set_version : function(x: PX509; version: TIdC_LONG): TIdC_INT cdecl = nil;
  X509_get_serialNumber : function(x: PX509): PASN1_INTEGER cdecl = nil;
  X509_gmtime_adj : function(s: PASN1_TIME; adj: TIdC_LONG): PASN1_TIME cdecl = nil;
  X509_set_notBefore : function(x: PX509; tm: PASN1_TIME): TIdC_INT cdecl = nil;
  X509_set_notAfter : function(x: PX509; tm: PASN1_TIME): TIdC_INT cdecl = nil;
  X509_set_pubkey : function(x: PX509; pkey: PEVP_PKEY): TIdC_INT cdecl = nil;
  X509_REQ_set_pubkey : function(x: PX509_REQ; pkey: PEVP_PKEY): TIdC_INT cdecl = nil;
  X509_sign : function(x: PX509; pkey: PEVP_PKEY; const md: PEVP_MD): TIdC_INT cdecl = nil;
  X509_REQ_sign : function(x: PX509_REQ; pkey: PEVP_PKEY; const md: PEVP_MD): TIdC_INT cdecl = nil;
  X509_REQ_add_extensions : function(req: PX509_REQ; exts: PSTACK_OF_X509_EXTENSION): TIdC_INT cdecl = nil;
  X509V3_EXT_conf_nid : function(conf: PLHASH; ctx: PX509V3_CTX; ext_nid: TIdC_INT; value: PAnsiChar): PX509_EXTENSION cdecl = nil;
  X509_EXTENSION_create_by_NID : function(ex: PPX509_EXTENSION; nid: TIdC_INT;
    crit: TIdC_INT; data: PASN1_OCTET_STRING): PX509_EXTENSION cdecl = nil;
  X509V3_set_ctx : procedure(ctx: PX509V3_CTX; issuer, subject: PX509; req: PX509_REQ; crl: PX509_CRL; flags: TIdC_INT) cdecl = nil;
  X509_EXTENSION_free : procedure(ex: PX509_EXTENSION) cdecl = nil;
  X509_add_ext : function(cert: PX509; ext: PX509_EXTENSION; loc: TIdC_INT): TIdC_INT cdecl = nil;
  {$IFNDEF OPENSSL_NO_BIO}
  //X509_print
  X509_print : function(bp : PBIO; x : PX509) : TIdC_INT cdecl = nil;
  {$ENDIF}
  X509_STORE_add_lookup : function (v : PX509_STORE; m : PX509_LOOKUP_METHOD) : PX509_LOOKUP cdecl = nil;
  X509_STORE_load_locations : function ( ctx : PX509_STORE; const _file, path : PAnsiChar) : TIdC_INT cdecl = nil;
  SSL_CTX_set_cipher_list : function(_para1: PSSL_CTX; const str: PAnsiChar): TIdC_INT cdecl = nil;
  SSL_CTX_new : function(meth: PSSL_METHOD): PSSL_CTX cdecl = nil;
  SSL_CTX_free : procedure(_para1: PSSL_CTX) cdecl = nil;
  SSL_set_fd : function(s: PSSL; fd: TIdC_INT): TIdC_INT cdecl = nil;
  SSL_CTX_use_PrivateKey_file : function(ctx: PSSL_CTX; const _file: PAnsiChar; _type: TIdC_INT): TIdC_INT cdecl = nil;
  SSL_CTX_use_PrivateKey : function(ctx: PSSL_CTX; pkey: PEVP_PKEY): TIdC_INT cdecl = nil;
  SSL_CTX_use_certificate : function(ctx: PSSL_CTX; x: PX509): TIdC_INT cdecl = nil;
  SSL_CTX_use_certificate_file : function(ctx: PSSL_CTX; const _file: PAnsiChar; _type: TIdC_INT): TIdC_INT cdecl = nil;
  SSL_load_error_strings : procedure cdecl = nil;
  SSL_state_string_long : function(s: PSSL): PAnsiChar cdecl = nil;
  SSL_alert_desc_string_long : function(value : TIdC_INT) : PAnsiChar cdecl = nil;
  SSL_alert_type_string_long : function(value : TIdC_INT) : PAnsiChar cdecl = nil;

  SSL_get_peer_certificate : function(s: PSSL): PX509 cdecl = nil;
  SSL_CTX_set_verify : procedure(ctx: PSSL_CTX; mode: TIdC_INT; callback: TSSL_CTX_set_verify_callback) cdecl = nil;
  SSL_CTX_set_verify_depth : procedure(ctx: PSSL_CTX; depth: TIdC_INT) cdecl = nil;
  SSL_CTX_get_verify_depth : function (ctx: PSSL_CTX): TIdC_INT cdecl = nil;
  SSL_CTX_set_default_passwd_cb : procedure(ctx: PSSL_CTX; cb: ppem_password_cb) cdecl = nil;
  SSL_CTX_set_default_passwd_cb_userdata: procedure(ctx: PSSL_CTX; u: Pointer) cdecl = nil;
  SSL_CTX_check_private_key : function(ctx: PSSL_CTX): TIdC_INT cdecl = nil;
  SSL_new : function(ctx: PSSL_CTX): PSSL cdecl = nil;
  SSL_free : procedure(ssl: PSSL) cdecl = nil;
  SSL_accept : function(ssl: PSSL): TIdC_INT cdecl = nil;
  SSL_connect : function(ssl: PSSL): TIdC_INT cdecl = nil;
  SSL_read : function(ssl: PSSL; buf: Pointer; num: TIdC_INT): TIdC_INT cdecl = nil;
  SSL_peek : function(ssl: PSSL; buf: Pointer; num: TIdC_INT): TIdC_INT cdecl = nil;
  SSL_write : function(ssl: PSSL; const buf: Pointer; num: TIdC_INT): TIdC_INT cdecl = nil;
  //int	SSL_pending(const SSL *s);
  SSL_pending : function(ssl : PSSL) : TIdC_INT; cdecl;
  //long  SSL_CTX_ctrl(SSL_CTX *ctx,int cmd, long larg, void *parg);
  SSL_CTX_ctrl : function(ssl: PSSL_CTX; cmd: TIdC_INT; larg: TIdC_LONG; parg: Pointer): TIdC_LONG cdecl = nil;
  //long	SSL_ctrl(SSL *ssl,int cmd, long larg, void *parg);
  SSL_ctrl : function(ssl : PSSL; cmd : TIdC_INT; larg : TIdC_LONG; parg : Pointer) : TIdC_LONG cdecl = nil;
  //long	SSL_callback_ctrl(SSL *, int, void (*)(void));
  SSL_callback_ctrl : function(ssl : PSSL; cmd : TIdC_INT; fp : SSL_callback_ctrl_fp) : TIdC_LONG cdecl = nil;
  //long	SSL_CTX_callback_ctrl(SSL_CTX *, int, void (*)(void));
  SSL_CTX_callback_ctrl : function(ssl : PSSL_CTX; cmd : TIdC_INT; fp : SSL_callback_ctrl_fp) : TIdC_LONG cdecl = nil;
  SSL_get_error : function(s: PSSL; ret_code: TIdC_INT): TIdC_INT cdecl = nil;
  SSLv2_method : function: PSSL_METHOD cdecl = nil; // SSLv2
  SSLv2_server_method : function: PSSL_METHOD cdecl = nil; // SSLv2
  SSLv2_client_method : function: PSSL_METHOD cdecl = nil; // SSLv2
  SSLv3_method : function: PSSL_METHOD cdecl = nil; // SSLv3
  SSLv3_server_method : function: PSSL_METHOD cdecl = nil; // SSLv3
  SSLv3_client_method : function: PSSL_METHOD cdecl = nil; // SSLv3
  SSLv23_method : function: PSSL_METHOD cdecl = nil; // SSLv3 but can rollback to v2
  SSLv23_server_method : function: PSSL_METHOD cdecl = nil; // SSLv3 but can rollback to v2
  SSLv23_client_method : function: PSSL_METHOD cdecl = nil; // SSLv3 but can rollback to v2
  TLSv1_method : function: PSSL_METHOD cdecl = nil; // TLSv1.0
  TLSv1_server_method : function: PSSL_METHOD cdecl = nil; // TLSv1.0
  TLSv1_client_method : function: PSSL_METHOD cdecl = nil; // TLSv1.0
  DTLSv1_method : function: PSSL_METHOD cdecl = nil; // DTLSv1.0
  DTLSv1_server_method : function: PSSL_METHOD cdecl = nil; // DTLSv1.0
  DTLSv1_client_method : function: PSSL_METHOD cdecl = nil; // DTLSv1.0
  SSL_shutdown : function(s: PSSL): TIdC_INT cdecl = nil;
  SSL_set_connect_state : procedure(s: PSSL) cdecl = nil;
  set_accept_state : procedure(s: PSSL) cdecl = nil;
  SSL_set_shutdown : procedure(ssl: PSSL; mode: TIdC_INT) cdecl = nil;
  SSL_CTX_load_verify_locations : function(ctx: PSSL_CTX; const CAfile: PAnsiChar; const CApath: PAnsiChar): TIdC_INT cdecl = nil;
  SSL_get_session : function(const ssl: PSSL): PSSL_SESSION cdecl = nil;
  SSLeay_add_ssl_algorithms : function: TIdC_INT cdecl = nil;
  // SSL_set_app_data : function(s: PSSL; arg: Pointer): Integer cdecl = nil;
  // SSL_get_app_data : function(s: PSSL): Pointer cdecl = nil;
  SSL_SESSION_get_id : function(const s: PSSL_SESSION; id: PPAnsiChar; length: PIdC_INT): PAnsiChar cdecl = nil;
  X509_NAME_oneline : function(a: PX509_NAME; buf: PAnsiChar; size: TIdC_INT): PAnsiChar cdecl = nil;
  X509_NAME_hash : function(x: PX509_NAME): TIdC_ULONG cdecl = nil;
  X509_set_issuer_name : function(x: PX509; name: PX509_NAME): TIdC_INT cdecl = nil;
  X509_get_issuer_name : function(a: PX509): PX509_NAME cdecl = nil;
  X509_set_subject_name : function(x: PX509; name: PX509_NAME): TIdC_INT cdecl = nil;
  X509_get_subject_name : function(a: PX509): PX509_NAME cdecl = nil;
  OBJ_obj2nid  : function (const o: PASN1_OBJECT): TIdC_INT cdecl = nil;
  OBJ_nid2obj : function (n : TIdC_INT) : PASN1_OBJECT cdecl = nil;
  OBJ_nid2ln : function (n : TIdC_INT) : PAnsiChar cdecl = nil;
   OBJ_nid2sn : function (n : TIdC_INT) : PAnsiChar cdecl = nil;
  X509_digest : function(const data: PX509; const _type: PEVP_MD;
      md: PByte; var len: TIdC_UINT): TIdC_INT cdecl = nil;
  {$IFNDEF OPENSSL_NO_SHA512}
  EVP_sha512 : function : PEVP_MD cdecl = nil;
  EVP_sha384 : function : PEVP_MD cdecl = nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA256}
  EVP_sha256 : function : PEVP_MD cdecl = nil;
  EVP_sha224 : function : PEVP_MD cdecl = nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA}
  EVP_sha1 : function: PEVP_MD cdecl = nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD5}
  EVP_md5 : function: PEVP_MD cdecl = nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD4}
  EVP_md4 : function: PEVP_MD cdecl = nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD2}
  EVP_md2 : function: PEVP_MD cdecl = nil;
  {$ENDIF}
  EVP_PKEY_type : function(_type : TIdC_INT): TIdC_INT cdecl = nil;
  d2i_PrivateKey_bio : function(bp : PBIO; a : PPEVP_PKEY) : PEVP_PKEY cdecl = nil;
  X509_LOOKUP_ctrl : function(ctx : PX509_LOOKUP; cmd : TIdC_INT; argc : PAnsiChar; arg1 : TIdC_LONG; ret : PPAnsiChar) : TIdC_INT cdecl = nil;
  X509_STORE_add_cert : function (ctx : PX509_STORE; x : PX509) : TIdC_INT cdecl = nil;
  X509_STORE_add_crl : function (ctx : PX509_STORE; x : PX509_CRL) : TIdC_INT cdecl = nil;
  X509_STORE_CTX_get_ex_data : function(ctx: PX509_STORE_CTX; idx: TIdC_INT): Pointer cdecl = nil;
  X509_STORE_CTX_get_error : function(ctx: PX509_STORE_CTX): TIdC_INT cdecl = nil;
  X509_STORE_CTX_set_error : procedure(ctx: PX509_STORE_CTX; s: TIdC_INT) cdecl = nil;
  X509_STORE_CTX_get_error_depth : function(ctx: PX509_STORE_CTX): TIdC_INT cdecl = nil;
  X509_STORE_CTX_get_current_cert : function(ctx: PX509_STORE_CTX): PX509 cdecl = nil;
  _CRYPTO_num_locks : function: TIdC_INT cdecl = nil; // return CRYPTO_NUM_LOCKS (shared libs!)
  CRYPTO_set_locking_callback : procedure(func: TIdSslLockingCallback) cdecl = nil;
  CRYPTO_set_id_callback : procedure(func: TIdSslIdCallback) cdecl = nil;
  // 3DES functions
  DES_set_odd_parity: procedure(key: Pdes_cblock) cdecl = nil;
  DES_set_key: function(key: Pconst_DES_cblock; schedule: DES_key_schedule): TIdC_INT cdecl = nil;
  DES_ecb_encrypt: procedure(input, output: Pconst_DES_cblock; ks: DES_key_schedule; enc: TIdC_INT) cdecl = nil;
  //old DES functions
  Id_ossl_old_des_set_odd_parity : procedure (key : p_ossl_old_des_cblock) cdecl = nil;
  Id_ossl_old_des_set_key : function (key : P_ossl_old_des_cblock; schedule : _ossl_old_des_key_schedule) : TIdC_INT cdecl = nil;
  Id_ossl_old_des_ecb_encrypt : procedure ( input : p_ossl_old_des_cblock; output : p_ossl_old_des_cblock; ks : p_ossl_old_des_key_schedule; enc : TIdC_int) cdecl = nil;
  //More SSL functions
  SSL_set_ex_data: function(ssl: PSSL; idx: TIdC_INT; data: Pointer): TIdC_INT cdecl = nil;
  SSL_get_ex_data: function(ssl: PSSL; idx: TIdC_INT): Pointer cdecl = nil;
  PKCS12_create: function(pass, name: PAnsiChar; pkey: PEVP_PKEY; cert : PX509;
    ca: PSTACK_OF_X509; nid_key, nid_cert, iter, mac_iter, keytype : TIdC_INT) : PPKCS12 cdecl = nil;
  i2d_PKCS12_bio: function(b: PBIO; p12: PPKCS12) : TIdC_INT cdecl = nil;
  PKCS12_free: procedure(p12: PPKCS12) cdecl = nil;
  SSL_load_client_CA_file: function(const _file: PAnsiChar): PSTACK_OF_X509_NAME cdecl = nil;
  SSL_CTX_set_client_CA_list: procedure(ctx: PSSL_CTX; list: PSTACK_OF_X509_NAME) cdecl = nil;
  SSL_CTX_set_default_verify_paths: function(ctx: PSSL_CTX): TIdC_INT cdecl = nil;
  SSL_CTX_set_session_id_context: function(ctx: PSSL_CTX; const sid_ctx: PByte; sid_ctx_len: TIdC_UINT): TIdC_INT cdecl = nil;
  SSL_CIPHER_description: function(_para1: PSSL_CIPHER; buf: PAnsiChar; size: TIdC_INT): PAnsiChar cdecl = nil;
  SSL_get_current_cipher: function(const s: PSSL): PSSL_CIPHER cdecl = nil;
  SSL_CIPHER_get_name: function(const c: PSSL_CIPHER): PAnsiChar cdecl = nil;
  SSL_CIPHER_get_version: function(const c: PSSL_CIPHER): PAnsiChar cdecl = nil;
  SSL_CIPHER_get_bits: function(const c: PSSL_CIPHER; var alg_bits: TIdC_INT): TIdC_INT cdecl = nil;
  //experimental
  ERR_error_string_n: procedure(e: TIdC_ULONG; buf: PAnsiChar; len : size_t) cdecl = nil;
  ERR_put_error : procedure (lib, func, reason : TIdC_INT; _file : PAnsiChar; line : TIdC_INT) cdecl = nil;
  ERR_get_error : function: TIdC_ULONG cdecl = nil;
  ERR_peek_error : function: TIdC_ULONG cdecl = nil;
  ERR_peek_last_error : function : TIdC_ULONG cdecl = nil;
  ERR_clear_error : procedure cdecl = nil;
  ERR_error_string : function (e: TIdC_ULONG; buf: PAnsiChar): PAnsiChar cdecl = nil;
  ERR_lib_error_string : function(e : TIdC_ULONG): PAnsiChar cdecl = nil;
  ERR_func_error_string : function(e : TIdC_ULONG): PAnsiChar cdecl = nil;
  ERR_reason_error_string : function(e : TIdC_ULONG): PAnsiChar cdecl = nil;
  ERR_load_ERR_strings : procedure cdecl = nil;
  ERR_load_crypto_strings : procedure cdecl = nil;
  ERR_free_strings : procedure cdecl = nil;
  ERR_remove_thread_state : procedure(const tId : PCRYPTO_THREADID) cdecl = nil;
  ERR_remove_state : procedure(pid: TIdC_ULONG) cdecl = nil;
  CRYPTO_cleanup_all_ex_data : procedure cdecl = nil;
  SSL_COMP_get_compression_methods : function: PSTACK_OF_SSL_COMP cdecl = nil;
  sk_pop_free : procedure(st: PSTACK; func: Tsk_pop_free_func) cdecl = nil;
  sk_dup : function (st : PSTACK) : PSTACK cdecl = nil;
  sk_find : function (st : PSTACK; Data : PAnsiChar) : TIdC_INT cdecl = nil;
{$IFDEF OPENSSL_FIPS}
{Note that I'm doing things this way so that we can have wrapper functions that hide
any IFDEF's and cases where the FIPS functions aren't in the .DLL}
  _FIPS_mode_set : function(onoff : TIdC_INT) : TIdC_INT cdecl = nil;
  _FIPS_mode : function () : TIdC_INT cdecl = nil;
{$ENDIF}

{$IFNDEF OPENSSL_NO_HMAC}
//void HMAC_CTX_init(HMAC_CTX *ctx);
  HMAC_CTX_init : procedure(ctx : PHMAC_CTX) cdecl = nil;
//void HMAC_Init_ex(HMAC_CTX *ctx, const void *key, int len,
//		  const EVP_MD *md, ENGINE *impl);
  HMAC_Init_ex : procedure(ctx : PHMAC_CTX; key : Pointer; len : TIdC_INT;
    md : PEVP_MD; impl : PENGINE) cdecl = nil;
//void HMAC_Update(HMAC_CTX *ctx, const unsigned char *data, size_t len);
  HMAC_Update : procedure(ctx : PHMAC_CTX; data : PAnsiChar; len : size_t) cdecl = nil;
//void HMAC_Final(HMAC_CTX *ctx, unsigned char *md, unsigned int *len);
  HMAC_Final : procedure(ctx : PHMAC_CTX; md : PAnsiChar; len : PIdC_UINT) cdecl = nil;
//void HMAC_CTX_cleanup(HMAC_CTX *ctx);
  HMAC_CTX_cleanup : procedure (ctx : PHMAC_CTX) cdecl = nil;
{$ENDIF}

{begin stack fancy stuff}
{
For the sk functions having a type, you have to typecase one procedural pointer
as another procedural pointer.   In the headers, these are defined in
safestack.h.
}
type
  Tsk_X509_NAME_new = function(cmp : Tsk_new_cmp) : PSTACK_OF_X509_NAME cdecl;
  Tsk_X509_NAME_null = function : PSTACK_OF_X509_NAME cdecl;
  Tsk_X509_NAME_free = procedure(st : PSTACK_OF_X509_NAME) cdecl;
  Tsk_X509_NAME_num = function (const sk : PSTACK_OF_X509_NAME) : TIdC_INT cdecl;
  Tsk_X509_NAME_value = function (const sk : PSTACK_OF_X509_NAME; i : TIdC_INT) : PX509_NAME cdecl;
  Tsk_X509_NAME_push = function (sk : PSTACK_OF_X509_NAME; st : PX509_NAME) : TIdC_INT cdecl;
  Tsk_X509_NAME_dup = function (sk : PSTACK_OF_X509_NAME) : PSTACK_OF_X509_NAME cdecl;
  Tsk_X509_NAME_find = function (sk : PSTACK_OF_X509_NAME; val : PX509_NAME) : TIdC_INT cdecl;
  Tsk_X509_NAME_pop_free = procedure (sk : PSTACK_OF_X509_NAME; func: Tsk_pop_free_func) cdecl;

  Tsk_X509_INFO_num = function (const sk : PSTACK_OF_X509_INFO) : TIdC_INT cdecl;
  Tsk_X509_INFO_value = function (const sk : PSTACK_OF_X509_INFO; i : TIdC_INT) : PX509_INFO cdecl;
  Tsk_X509_INFO_pop_free = procedure (sk : PSTACK_OF_X509_INFO; func: Tsk_pop_free_func) cdecl;

var
  sk_X509_NAME_new : Tsk_X509_NAME_new absolute sk_new;
  sk_X509_NAME_new_null : Tsk_X509_NAME_null absolute sk_new_null;
  sk_X509_NAME_free : Tsk_X509_NAME_free absolute sk_free;
  sk_X509_NAME_num : Tsk_X509_NAME_num absolute sk_num;
  sk_X509_NAME_value : Tsk_X509_NAME_value absolute sk_value;
  sk_X509_NAME_push : Tsk_X509_NAME_push absolute sk_push;
  sk_X509_NAME_dup : Tsk_X509_NAME_dup absolute sk_dup;
  sk_X509_NAME_find : Tsk_X509_NAME_find absolute sk_find;
  sk_X509_NAME_pop_free :  Tsk_X509_NAME_pop_free absolute sk_pop_free;
  sk_X509_INFO_num : Tsk_X509_INFO_num absolute sk_num;
  sk_X509_INFO_value : Tsk_X509_INFO_value absolute sk_value;
  sk_X509_INFO_pop_free : Tsk_X509_INFO_pop_free absolute sk_free;
{end}

function FIPS_mode_set(onoff : TIdC_INT) : TIdC_INT;  {$IFDEF INLINE}inline;{$ENDIF}
function FIPS_mode() : TIdC_INT;  {$IFDEF INLINE}inline;{$ENDIF}



{begin other stuff}
function UTC_Time_Decode(UCTtime : PASN1_UTCTIME; var year, month, day, hour, min, sec: Word;
  var tz_hour, tz_min: Integer): Integer;
function SSL_set_app_data(s: PSSL; arg: Pointer): TIdC_INT;
function SSL_get_app_data(s: PSSL): Pointer;
function Load: Boolean;
procedure Unload;
function WhichFailedToLoad: String;
procedure InitializeRandom;
function M_ASN1_STRING_length(x : PASN1_STRING): TIdC_INT;
procedure M_ASN1_STRING_length_set(x : PASN1_STRING; n : TIdC_INT);
function M_ASN1_STRING_type(x : PASN1_STRING) : TIdC_INT;
function M_ASN1_STRING_data(x : PASN1_STRING) : PAnsiChar;
function X509_NAME_dup(xn : PX509_NAME) : PX509_NAME;
function X509_STORE_CTX_get_app_data(ctx: PX509_STORE_CTX):Pointer;
function X509_get_version(x : PX509): TIdC_LONG;
function X509_get_signature_type(x : PX509) : TIdC_INT;
function X509_REQ_get_subject_name(x:PX509_REQ):PX509_NAME;
function X509_get_notBefore(x509: PX509):PASN1_TIME;
function X509_get_notAfter(x509: PX509):PASN1_TIME;
function X509_REQ_get_version(x : PX509_REQ): TIdC_LONG;
function X509_CRL_get_version(x : PX509_CRL) : TIdC_LONG;
function X509_CRL_get_lastUpdate(x : PX509_CRL) : PASN1_TIME;
function X509_CRL_get_nextUpdate(x : PX509_CRL) : PASN1_TIME;
function X509_CRL_get_issuer(x : PX509_CRL) : PX509_NAME;
function X509_CRL_get_REVOKED(x : PX509_CRL) : PSTACK_OF_X509_REVOKED;
procedure SSL_CTX_set_info_callback(ctx: PSSL_CTX; cb: PSSL_CTX_info_callback);

function SSL_CTX_set_options(ctx: PSSL_CTX; op: TIdC_LONG):TIdC_LONG;
function SSL_CTX_clear_options(ctx : PSSL_CTX; op : TIdC_LONG):TIdC_LONG;
function SSL_CTX_get_options(ctx: PSSL_CTX) : TIdC_LONG;
function SSL_set_options(ssl: PSSL; op : TIdC_LONG): TIdC_LONG;
function SSL_clear_mode(ssl : PSSL; op : TIdC_LONG) : TIdC_LONG;
function SSL_get_options(ssl : PSSL): TIdC_LONG;
function SSL_CTX_set_mode(ctx : PSSL_CTX; op : TIdC_LONG) : TIdC_LONG;
function SSL_CTX_clear_mode(ctx : PSSL_CTX; op : TIdC_LONG) : TIdC_LONG;
function SSL_CTX_get_mode(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_set_mtu(ssl : PSSL; mtu : TIdC_LONG) : TIdC_LONG;
function SSL_get_secure_renegotiation_support(ssl : PSSL) : TIdC_LONG;
function SSL_CTX_sess_number(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_connect(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_connect_good(ctx : PSSL_CTX): TIdC_LONG;
function SSL_CTX_sess_connect_renegotiate(ctx : PSSL_CTX): TIdC_LONG;
function SSL_CTX_sess_accept(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_accept_renegotiate(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_accept_good(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_hits(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_cb_hits(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_misses(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_timeouts(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_cache_full(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_sess_set_cache_size(ctx : PSSL_CTX; t : TIdC_LONG) : TIdC_LONG;
function SSL_CTX_sess_get_cache_size(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_set_session_cache_mode(ctx : PSSL_CTX; m : TIdC_LONG) : TIdC_LONG;
function SSL_CTX_get_session_cache_mode(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_get_read_ahead(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_set_read_ahead(ctx : PSSL_CTX; m : TIdC_LONG) : TIdC_LONG;
function SSL_CTX_get_max_cert_list(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_set_max_cert_list(ctx : PSSL_CTX; m : TIdC_LONG) : TIdC_LONG;
function SSL_get_max_cert_list(ssl : PSSL) : TIdC_LONG;
function SSL_set_max_cert_list(ssl : PSSL; m : TIdC_LONG) : TIdC_LONG;
function DTLSv1_get_timeout(ssl : PSSL; var arg : timeval) : TIdC_LONG;
function DTLSv1_handle_timeout(ssl : PSSL) : TIdC_LONG;
function DTLSv1_listen(ssl : PSSL; var peer : sockaddr) : TIdC_LONG;
function SSL_session_reused(ssl : PSSL) : TIdC_LONG;
function SSL_num_renegotiations(ssl : PSSL) : TIdC_LONG;
function SSL_clear_num_renegotiations(ssl : PSSL) : TIdC_LONG;
function SSL_total_renegotiations(ssl : PSSL) : TIdC_LONG;
function SSL_CTX_need_tmp_RSA(ctx : PSSL_CTX) : TIdC_LONG;
function SSL_CTX_set_tmp_rsa(ctx  : PSSL_CTX; rsa : PRSA) : TIdC_LONG;
function SSL_CTX_set_tmp_dh(ctx : PSSL_CTX; dh : PDH) : TIdC_LONG;
function SSL_CTX_set_tmp_ecdh(ctx : PSSL_CTX; ecdh : PEC_KEY) : TIdC_LONG;
function SSL_need_tmp_RSA(ssl : PSSL) : TIdC_LONG;
procedure SSL_set_tmp_rsa(ssl : PSSL; rsa : PRSA);
function SSL_set_tmp_dh(ssl : PSSL;dh : PDH) : TIdC_LONG;
function SSL_set_tmp_ecdh(ssl : PSSL; ecdh : PEC_KEY) : TIdC_LONG;
function SSL_CTX_add_extra_chain_cert(ctx : PSSL_CTX; x509 : PX509) : TIdC_LONG;

{$IFNDEF OPENSSL_NO_TLSEXT}
function SSL_set_tlsext_host_name(s : PSSL; name : AnsiString) : TIdC_LONG;
function SSL_set_tlsext_debug_callback(ssl : PSSL; cb : SSL_callback_ctrl_fp) : TIdC_LONG;
function SSL_set_tlsext_debug_arg(ssl : PSSL; arg : Pointer) : TIdC_LONG;
function SSL_set_tlsext_status_type(ssl : PSSL; _type : TIdC_LONG):TIdC_LONG;
function SSL_get_tlsext_status_exts(ssl : PSSL; arg : Pointer): TIdC_LONG;
function SSL_set_tlsext_status_exts(ssl : PSSL; arg : Pointer):TIdC_LONG;
function SSL_get_tlsext_status_ids(ssl : PSSL; arg : Pointer) : TIdC_LONG;

function SSL_set_tlsext_status_ids(ssl : PSSL; arg : Pointer) : TIdC_LONG;
function SSL_get_tlsext_status_ocsp_resp(ssl : PSSL; arg : Pointer) : TIdC_LONG;
function SSL_set_tlsext_status_ocsp_resp(ssl : PSSL; arg : Pointer; arglen : TIdC_LONG) : TIdC_LONG;
function SSL_CTX_set_tlsext_servername_callback(ctx : PSSL_CTX; cb :SSL_callback_ctrl_fp):TIdC_LONG;
{$ENDIF}
function SSL_CTX_get_version(ctx: PSSL_CTX):TIdC_INT;
//* BIO_s_connect() and BIO_s_socks4a_connect() */

function BIO_set_conn_hostname(b : PBIO; name : PAnsiChar) : TIdC_LONG;
function BIO_set_conn_port(b : PBIO; port : PAnsiChar) : TIdC_LONG;
function BIO_set_conn_ip(b : PBIO; ip : PAnsiChar) : TIdC_LONG;
function BIO_set_conn_int_port(b : PBIO; port : PAnsiChar) : TIdC_LONG;
function BIO_get_conn_hostname(b : PBIO) : PAnsiChar;
function BIO_get_conn_port(b : PBIO) : PAnsiChar;
function BIO_get_conn_ip(b : PBIO) : PAnsiChar;
function BIO_get_conn_int_port(b : PBIO) : TIdC_LONG;
function BIO_set_nbio(b : PBIO; n : TIdC_LONG) : TIdC_LONG;
//* BIO_s_accept_socket() */
function BIO_set_accept_port(b : PBIO; name : PAnsiChar) : TIdC_LONG;
function BIO_get_accept_port(b : PBIO) : PAnsiChar;
function BIO_set_nbio_accept(b : PBIO; n : TIdC_INT) : TIdC_LONG;
function BIO_set_accept_bios(b : PBIO; bio : PBIO) : TIdC_LONG;
function BIO_set_bind_mode(b : PBIO; mode : TIdC_LONG) : TIdC_LONG;
function BIO_get_bind_mode(b : PBIO; mode : TIdC_LONG) : TIdC_LONG;
function BIO_do_handshake(b : PBIO) : TIdC_LONG;
function BIO_do_connect(b : PBIO) : TIdC_LONG;
function BIO_do_accept(b : PBIO) : TIdC_LONG;
function BIO_set_url(b : PBIO; url : PAnsiChar) : TIdC_LONG;
function BIO_set_proxies(b : PBIO; p : PAnsiChar) : TIdC_LONG;

//* BIO_set_nbio(b,n) */
function BIO_set_filter_bio(b : PBIO; s : PAnsiChar) : TIdC_LONG;
function BIO_set_proxy_header(b : PBIO; sk : PAnsiChar) : TIdC_LONG;
function BIO_set_no_connect_return(b : PBIO; b2 : TIdC_LONG) : TIdC_LONG;
function BIO_get_proxy_header(b : PBIO; skp : PAnsiChar) : TIdC_LONG;
function BIO_get_proxies(b : PBIO; pxy_p : PAnsiChar) : TIdC_LONG;
function BIO_get_url(b : PBIO; url : PAnsiChar) : TIdC_LONG;
function BIO_get_no_connect_return(b : PBIO) : TIdC_LONG;
function BIO_set_fd(b : PBIO; fd,c : TIdC_INT) : TIdC_LONG;
function BIO_get_fd(b : PBIO; c : TIdC_INT) : TIdC_LONG;
function BIO_seek(b : PBIO; ofs : TIdC_LONG) : TIdC_INT;
function BIO_tell(b : PBIO) : TIdC_INT;
{$IFDEF CONST_STRICT}
{$ELSE}
function BIO_read_filename(b : PBIO; name : PAnsiChar) : TIdC_LONG;
{$ENDIF}
function BIO_write_filename(b : PBIO; name : PAnsiChar) : TIdC_LONG;
function BIO_append_filename(b : PBIO; name : PAnsiChar) : TIdC_LONG;
function BIO_rw_filename(b : PBIO; name : PAnsiChar) : TIdC_LONG;
function BIO_set_ssl(b : PBIO; ssl : PSSL; c : TIdC_LONG) : TIdC_LONG;
function BIO_get_ssl(b : PBIO; sslp : PSSL) : TIdC_LONG;
function BIO_set_ssl_mode(b : PBIO; client : TIdC_LONG) : TIdC_LONG;
function BIO_set_ssl_renegotiate_bytes(b : PBIO; num : TIdC_LONG) : TIdC_LONG;
function BIO_get_num_renegotiates(b : PBIO) : TIdC_LONG;
function BIO_set_ssl_renegotiate_timeout(b : PBIO; seconds : TIdC_LONG) : TIdC_LONG;
function BIO_get_mem_data(b : PBIO; out pp : Pointer) : TIdC_INT;
function BIO_set_mem_buf(b : PBIO; bm : PAnsiChar; c : TIdC_INT) : TIdC_INT;
function BIO_get_mem_ptr(b: PBIO; out pp: Pointer) : TIdC_INT;
procedure BIO_set_mem_eof_return(b : PBIO; const v : TIdC_INT);
//* For the BIO_f_buffer() type */
function BIO_get_buffer_num_lines(b : PBIO) : TIdC_INT;
procedure BIO_set_buffer_size(b : PBIO; const size : TIdC_INT);
//* Don't use the next one unless you know what you are doing :-) */
function BIO_dup_state(b : PBIO; ret : PBIO) : TIdC_LONG;
function BIO_reset(b : PBIO) : TIdC_INT;
function BIO_eof(b : PBIO) : TIdC_INT;
function BIO_set_close(b: PBIO; c: TIdC_LONG): TIdC_INT;
function BIO_get_close(b : PBIO) : TIdC_INT;
function BIO_pending(b : PBIO) : TIdC_INT;
function BIO_wpending(b : PBIO) : TIdC_INT;
function BIO_flush(b : PBIO) : TIdC_INT;
//* For the BIO_f_buffer() type */
function BIO_buffer_get_num_lines(b : PBIO) : TIdC_INT;
function BIO_get_info_callback(b : PBIO; var cbp : Pbio_info_cb) : TIdC_INT;
function BIO_set_info_callback(b : PBIO; cb : Pbio_info_cb) : TIdC_INT;
function BIO_set_read_buffer_size(b : PBIO; size : TIdC_LONG) : TIdC_LONG;
function BIO_set_write_buffer_size(b : PBIO; size : TIdC_LONG) : TIdC_LONG;
function BIO_make_bio_pair(b1, b2 : PBIO ): TIdC_INT;
function BIO_destroy_bio_pair(b : PBIO) : TIdC_INT;
function BIO_shutdown_wr(b : PBIO) : TIdC_INT;
///* macros with inappropriate type -- but ...pending macros use int too: */
function BIO_get_write_guarantee(b : PBIO) : TIdC_INT;
function BIO_get_read_request(b : PBIO) : TIdC_INT;
//* ctrl macros for dgram */
function _BIO_ctrl_dgram_connect(b : PBIO; peer : Sockaddr) : TIdC_INT;
function BIO_ctrl_set_connected(b : PBIO; state : TIdC_INT; peer : Sockaddr) : TIdC_INT;
function BIO_dgram_recv_timedout(b : PBIO) : TIdC_INT;
function BIO_dgram_send_timedout(b : PBIO) : TIdC_INT;
function BIO_dgram_get_peer(b : PBIO; var peer : SockAddr) : TIdC_INT;
function BIO_dgram_set_peer(b : PBIO; peer : SockAddr) : TIdC_INT;


function PEM_read_bio_X509(bp: PBIO; x: PPX509; cb: ppem_password_cb; u: Pointer): PX509;

function PEM_read_bio_X509_REQ(bp :PBIO; x : PPX509_REQ; cb :ppem_password_cb; u: Pointer) : PX509_REQ;
function PEM_read_bio_X509_CRL(bp : PBIO; x : PPX509_CRL;cb : ppem_password_cb; u: Pointer) : PX509_CRL;
function PEM_read_bio_RSAPrivateKey(bp : PBIO; x : PPRSA; cb : ppem_password_cb; u: Pointer) : PRSA;
function PEM_read_bio_RSAPublicKey(bp : PBIO; x : PPRSA; cb : ppem_password_cb; u: Pointer) : PRSA;
function PEM_read_bio_DSAPrivateKey(bp : PBIO; x : PPDSA; cb : ppem_password_cb; u : Pointer) : PDSA;
function PEM_read_bio_PrivateKey(bp : PBIO; x : PPEVP_PKEY; cb : ppem_password_cb; u : Pointer) : PEVP_PKEY;
function PEM_read_bio_PKCS7(bp : PBIO; x : PPPKCS7; cb : ppem_password_cb; u : Pointer) : PPKCS7;
function PEM_read_bio_DHparams(bp : PBIO; x : PPDH; cb : ppem_password_cb; u : Pointer) : PDH;
function PEM_read_bio_DSAparams(bp : PBIO; x : PPDSA; cb : ppem_password_cb; u : Pointer) : PDSA;

function PEM_read_bio_NETSCAPE_CERT_SEQUENCE(bp : PBIO; x : PPNETSCAPE_CERT_SEQUENCE;
  cb : ppem_password_cb; u : Pointer) : PNETSCAPE_CERT_SEQUENCE;

function PEM_write_bio_X509(bp: PBIO; x: PX509): TIdC_INT;
function PEM_write_bio_X509_REQ(bp: PBIO; x: PX509_REQ): TIdC_INT;
function PEM_write_bio_X509_CRL(bp : PBIO; x : PX509_CRL) : TIdC_INT;
function  PEM_write_bio_RSAPrivateKey(bp : PBIO; x : PRSA; const enc : PEVP_CIPHER;
  kstr : PAnsiChar; klen : TIdC_INT; cb : ppem_password_cb; u : POinter) : TIdC_INT;
function PEM_write_bio_RSAPublicKey(bp : PBIO; x : PRSA) : TIdC_INT;
function PEM_write_bio_DSAPrivateKey( bp : PBIO; x : PDSA; const enc : PEVP_CIPHER;
  kstr :PAnsiChar; klen : TIdC_INT; cb : Ppem_password_cb; u : Pointer) : TIdC_INT;
function PEM_write_bio_PrivateKey(bp : PBIO; x : PEVP_PKEY; const enc : PEVP_CIPHER;
  kstr :PAnsiChar; klen : TIdC_INT; cb : Ppem_password_cb; u : Pointer) : TIdC_INT;
function PEM_write_bio_PKCS7(bp : PBIO; x : PPKCS7) : TIdC_INT;
function PEM_write_bio_DHparams(bp : PBIO; x : PDH): TIdC_INT;
function PEM_write_bio_DSAparams(bp : PBIO; x : PDSA) : TIdC_INT;
function PEM_write_bio_NETSCAPE_CERT_SEQUENCE(bp : PBIO; x : PDSA) : TIdC_INT;

function OPENSSL_malloc(aSize:TIdC_INT):Pointer;
procedure CRYPTO_SetMemCheck(const aEnabled: Boolean);

{$IFNDEF OPENSSL_NO_RSA}
function EVP_PKEY_assign_RSA(pkey: PEVP_PKEY; rsa: PAnsiChar): TIdC_INT;
{$ENDIF}

{$IFNDEF OPENSSL_NO_DSA}
function EVP_PKEY_assign_DSA(pkey : PEVP_PKEY; dsa : PAnsiChar) : TIdC_INT;
{$ENDIF}

{$IFNDEF OPENSSL_NO_DH}
function EVP_PKEY_assign_DH(pkey : PEVP_PKEY; dh : PAnsiChar) : TIdC_INT;
{$ENDIF}

{$IFNDEF OPENSSL_NO_EC}
function EVP_PKEY_assign_EC_KEY(pkey : PEVP_PKEY; eckey : PAnsiChar) : TIdC_INT;
{$ENDIF}

procedure X509V3_set_ctx_nodb(ctx: X509V3_CTX);
//
function ErrMsg(AErr : TIdC_ULONG) : AnsiString;
function ERR_PACK(l, f, r : TIdC_INT) : TIdC_ULONG;
function ERR_GET_LIB(const l : TIdC_INT) : TIdC_ULONG;
function ERR_GET_FUNC(const l : TIdC_INT) : TIdC_ULONG;
function ERR_FATAL_ERROR(const l : TIdC_INT) : Boolean;
function ERR_GET_REASON(const l : TIdC_INT) : TIdC_INT;
procedure SYSerr(const f,r : TIdC_INT);
procedure BNerr(const f,r : TIdC_INT);
procedure RSAerr(const f,r : TIdC_INT);
procedure DHerrr(const f,r : TIdC_INT);
procedure EVPerr(const f,r : TIdC_INT);
procedure BUFerr(const f,r : TIdC_INT);
procedure OBJerr(const f,r : TIdC_INT);
procedure PEMerr(const f,r : TIdC_INT);
procedure DSAerr(const f,r : TIdC_INT);
procedure X509err(const f,r : TIdC_INT);
procedure ASN1err(const f,r : TIdC_INT);
procedure CONFerr(const f,r : TIdC_INT);
procedure CRYPTOerr(const f,r : TIdC_INT);
procedure ECerr(const f,r : TIdC_INT);
procedure SSLerr(const f,r : TIdC_INT);
procedure BIOerr(const f,r : TIdC_INT);
procedure PKCS7err(const f,r : TIdC_INT);
procedure X509V3err(const f,r : TIdC_INT);
procedure PKCS12err(const f,r : TIdC_INT);
procedure RANDerr(const f,r : TIdC_INT);
procedure DSOerr(const f,r : TIdC_INT);
procedure ENGINEerr(const f,r : TIdC_INT);
procedure OCSPerr(const f,r : TIdC_INT);
procedure UIerr(const f,r : TIdC_INT);
procedure COMPerr(const f,r : TIdC_INT);
procedure ECDSAerr(const f,r : TIdC_INT);
procedure ECDHerr(const f,r : TIdC_INT);
procedure STOREerr(const f,r : TIdC_INT);
procedure FIPSerr(const f,r : TIdC_INT);
procedure CMSerr(const f,r : TIdC_INT);
procedure JPAKEerr(const f,r : TIdC_INT);
function X509_LOOKUP_load_file(x : PX509_LOOKUP; name : PAnsiChar; _type : TIdC_LONG) : TIdC_INT;
function X509_LOOKUP_add_dir(x : PX509_LOOKUP; name : PAnsiChar; _type : TIdC_LONG) : TIdC_INT;

function GetCryptLibHandle : Integer;

type
//moved from IdSSLOpenSSL so we can use these classes in other places
  EIdOpenSSLError               = class(EIdException);
  TIdOpenSSLAPISSLError = class of EIdOpenSSLAPISSLError;

  EIdOpenSSLAPISSLError = class(EIdOpenSSLError)
  protected
    FErrorCode : TIdC_INT;
    FRetCode : TIdC_INT;
  public
    class procedure RaiseException(s: PSSL;
      const ARetCode : TIdC_INT; const AMsg : String = '');
    property ErrorCode : TIdC_INT read FErrorCode;
    property RetCode : TIdC_INT read FRetCode;
  end;

  TIdOpenSSLAPICryptoError = class of EIdOpenSSLAPICryptoError;
  EIdOpenSSLAPICryptoError = class(EIdOpenSSLError)
  protected
    FErrorCode : TIdC_ULONG;
  public
    class procedure RaiseExceptionCode(const AErrCode : TIdC_ULONG; const AMsg : String = '');
    class procedure RaiseException(const AMsg : String = '');
    property ErrorCode : TIdC_ULONG read FErrorCode;
  end;
  EIdOSSLUnderlyingCryptoError = class(EIdOpenSSLAPICryptoError);

  EIdDigestError = class(EIdOpenSSLAPICryptoError);
  EIdDigestFinalEx = class(EIdDigestError);
  EIdDigestInitEx = class(EIdDigestError);
  EIdDigestUpdate = class(EIdDigestError);

implementation

uses
  Classes,
  IdFIPS,
  IdGlobalProtocols,
  IdResourceStringsProtocols,
  IdStack
  {$IFDEF FPC}
    , DynLibs  // better add DynLibs only for fpc
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  , Windows
  {$ENDIF};

//**************** FIPS Support backend *******************
function OpenSSLIsHashingIntfAvail : Boolean;
begin
  Result := Assigned(EVP_DigestInit_ex) and
             Assigned(EVP_DigestUpdate) and
             Assigned(EVP_DigestFinal_ex);
end;

function OpenSSLGetFIPSMode : Boolean;
begin
  Result := FIPS_mode <> 0;
end;

function OpenSSLSetFIPSMode(const AMode : Boolean) : Boolean;
begin
  //leave this empty as we may not be using something that supports FIPS
  if AMode then begin
    Result := FIPS_mode_set(1) = 1;
  end else begin
    Result := FIPS_mode_set(0) = 1;
  end;
end;

function OpenSSLGetDigestCtx( AInst : PEVP_MD) : TIdHashIntCtx;
  {$IFDEF USE_INLINE} inline; {$ENDIF}
var LRet : Integer;
begin
  Result := AllocMem(SizeOf(EVP_MD_CTX));
  EVP_MD_CTX_init(Result);

  LRet := EVP_DigestInit_ex(Result, AInst, nil);
  if LRet <> 1 then begin
    EIdDigestInitEx.RaiseException('EVP_DigestInit_ex error');
  end;
end;

function OpenSSLIsMD2HashIntfAvail: Boolean;
begin
  {$IFDEF OPENSSL_NO_MD2}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_md2);
  {$ENDIF}
end;

function OpenSSLGetMD2HashInst : TIdHashIntCtx;
{$IFNDEF OPENSSL_NO_MD2}
var
  LRet : PEVP_MD;
{$ENDIF}
begin
  {$IFDEF OPENSSL_NO_MD2}
  Result := nil;
  {$ELSE}
  LRet := EVP_md2;
  Result := OpenSSLGetDigestCtx(LRet);
  {$ENDIF}
end;

function OpenSSLIsMD4HashIntfAvail: Boolean;
begin
  Result := Assigned(EVP_md4);
end;

function OpenSSLGetMD4HashInst : TIdHashIntCtx;
var
  LRet : PEVP_MD;
begin
  LRet := EVP_md4;
  Result := OpenSSLGetDigestCtx(LRet);
end;

function OpenSSLIsMD5HashIntfAvail: Boolean;
begin
  Result := Assigned(EVP_md5);
end;

function OpenSSLGetMD5HashInst : TIdHashIntCtx;
var
  LRet : PEVP_MD;
begin
  LRet := EVP_md5;
  Result := OpenSSLGetDigestCtx(LRet);
end;

function OpenSSLIsSHA1HashIntfAvail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha1);
  {$ENDIF}
end;

function OpenSSLGetSHA1HashInst : TIdHashIntCtx;
{$IFNDEF OPENSSL_NO_SHA}
var
  LRet : PEVP_MD;
{$ENDIF}
begin
  {$IFDEF OPENSSL_NO_SHA}
  Result := nil;
  {$ELSE}
  LRet := EVP_sha1;
  Result := OpenSSLGetDigestCtx(LRet);
  {$ENDIF}
end;

function OpenSSLIsSHA224HashIntfAvail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA256}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha224);
  {$ENDIF}
end;

function OpenSSLGetSHA224HashInst : TIdHashIntCtx;
{$IFNDEF OPENSSL_NO_SHA256}
var
  LRet : PEVP_MD;
{$ENDIF}
begin
  {$IFDEF OPENSSL_NO_SHA256}
  Result := nil;
  {$ELSE}
  LRet := EVP_sha224;
  Result := OpenSSLGetDigestCtx(LRet);
  {$ENDIF}
end;

function OpenSSLIsSHA256HashIntfAvail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA256}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha256);
  {$ENDIF}
end;

function OpenSSLGetSHA256HashInst : TIdHashIntCtx;
{$IFNDEF OPENSSL_NO_SHA256}
var
  LRet : PEVP_MD;
{$ENDIF}
begin
  {$IFDEF OPENSSL_NO_SHA256}
  Result := nil;
  {$ELSE}
  LRet := EVP_sha256;
  Result := OpenSSLGetDigestCtx(LRet);
  {$ENDIF}
end;

function OpenSSLIsSHA384HashIntfAvail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA512}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha384);
  {$ENDIF}
end;

function OpenSSLGetSHA384HashInst : TIdHashIntCtx;
{$IFNDEF OPENSSL_NO_SHA512}
var
  LRet : PEVP_MD;
{$ENDIF}
begin
  {$IFDEF OPENSSL_NO_SHA512}
  Result := nil;
  {$ELSE}
  LRet := EVP_sha384;
  Result := OpenSSLGetDigestCtx(LRet);
  {$ENDIF}
end;

function OpenSSLIsSHA512HashIntfAvail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA512}
  Result := nil;
  {$ELSE}
  Result := Assigned(EVP_sha512);
  {$ENDIF}
end;

function OpenSSLGetSHA512HashInst : TIdHashIntCtx;
{$IFNDEF OPENSSL_NO_SHA512}
var
  LRet : PEVP_MD;
{$ENDIF}
begin
  {$IFDEF OPENSSL_NO_SHA512}
  Result := nil;
  {$ELSE}
  LRet := EVP_sha512;
  Result := OpenSSLGetDigestCtx(LRet);
{$ENDIF}
end;

procedure OpenSSLUpdateHashInst(ACtx: TIdHashIntCtx; const AIn: TIdBytes);
var
  LRet : TIdC_Int;
begin
  LRet := EVP_DigestUpdate(ACtx,@Ain[0],Length(AIn));
  if LRet <> 1 then begin
    EIdDigestInitEx.RaiseException('EVP_DigestUpdate error');
  end;
end;

function OpenSSLFinalHashInst(ACtx: TIdHashIntCtx): TIdBytes;
var
  LLen : TIdC_UInt;
   LRet : TIdC_Int;
begin
  SetLength(Result,EVP_MAX_MD_SIZE);
  LRet := EVP_DigestFinal_ex(ACtx,PAnsiChar(@Result[0]),LLen);
  if LRet <> 1 then begin
    EIdDigestFinalEx.RaiseException('EVP_DigestFinal_ex error');
  end;
  SetLength(Result,LLen);
  EVP_MD_CTX_cleanup(ACtx);
  FreeMem(ACtx,SizeOf(EVP_MD_CTX));
end;

function OpenSSLIsHMACAvail : Boolean;
begin
  {$IFDEF OPENSSL_NO_HMAC}
  Result := False;
  {$ELSE}
  Result := Assigned(HMAC_CTX_init) and
            Assigned(HMAC_Init_ex) and
            Assigned(HMAC_Update) and
            Assigned(HMAC_Final) and
            Assigned(HMAC_CTX_cleanup);
  {$ENDIF}
end;

function OpenSSLIsHMACMD5Avail: Boolean;
begin
 {$IFDEF OPENSSL_NO_MD5}
 Result := False;
 {$ELSE}
 Result := Assigned(EVP_md5);
 {$ENDIF}
end;

function OpenSSLGetHMACMD5Inst(const AKey : TIdBytes) : TIdHMACIntCtx;
begin
  {$IFDEF OPENSSL_NO_MD5}
  Result := nil;
  {$ELSE}
  Result := AllocMem(SizeOf(HMAC_CTX));
  HMAC_CTX_init(Result);
  HMAC_Init_ex(Result,@AKey[0],Length(AKey),EVP_md5, nil);
  {$ENDIF}
end;

function OpenSSLIsHMACSHA1Avail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha1);
  {$ENDIF}
end;

function OpenSSLGetHMACSHA1Inst(const AKey : TIdBytes) : TIdHMACIntCtx;
begin
  {$IFDEF OPENSSL_NO_SHA}
  Result := nil;
  {$ELSE}
  Result := AllocMem(SizeOf(HMAC_CTX));
  HMAC_CTX_init(Result);
  HMAC_Init_ex(Result,@AKey[0],Length(AKey),EVP_sha1, nil);
  {$ENDIF}
end;

function OpenSSLIsHMACSHA224Avail: Boolean;

begin
  {$IFDEF OPENSSL_NO_SHA256}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha224);
  {$ENDIF}
end;

function OpenSSLGetHMACSHA224Inst(const AKey : TIdBytes) : TIdHMACIntCtx;
begin
  {$IFDEF OPENSSL_NO_SHA256}
  Result := nil;
  {$ELSE}
  Result := AllocMem(SizeOf(HMAC_CTX));
  HMAC_CTX_init(Result);
  HMAC_Init_ex(Result,@AKey[0],Length(AKey),EVP_sha224, nil);
  {$ENDIF}
end;

function OpenSSLIsHMACSHA256Avail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA256}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha256);
  {$ENDIF}
end;

function OpenSSLGetHMACSHA256Inst(const AKey : TIdBytes) : TIdHMACIntCtx;
begin
  {$IFDEF OPENSSL_NO_SHA256}
  Result := nil;
  {$ELSE}
  Result := AllocMem(SizeOf(HMAC_CTX));
  HMAC_CTX_init(Result);
  HMAC_Init_ex(Result,@AKey[0],Length(AKey),EVP_sha256, nil);
  {$ENDIF}
end;

function OpenSSLIsHMACSHA384Avail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA512}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha384);
  {$ENDIF}
end;

function OpenSSLGetHMACSHA384Inst(const AKey : TIdBytes) : TIdHMACIntCtx;
begin
  {$IFDEF OPENSSL_NO_SHA512}
  Result := nil;
  {$ELSE}
  Result := AllocMem(SizeOf(HMAC_CTX));
  HMAC_CTX_init(Result);
  {$ENDIF}
end;

function OpenSSLIsHMACSHA512Avail: Boolean;
begin
  {$IFDEF OPENSSL_NO_SHA512}
  Result := False;
  {$ELSE}
  Result := Assigned(EVP_sha512);
  {$ENDIF}
end;

function OpenSSLGetHMACSHA512Inst(const AKey : TIdBytes) : TIdHMACIntCtx;
begin
  {$IFDEF OPENSSL_NO_SHA512}
  Result := nil;
  {$ELSE}
  Result := AllocMem(SizeOf(HMAC_CTX));
  HMAC_CTX_init(Result);
  HMAC_Init_ex(Result,@AKey[0],Length(AKey),EVP_sha512, nil);
  {$ENDIF}
end;

procedure OpenSSLUpdateHMACInst(ACtx : TIdHMACIntCtx; const AIn: TIdBytes);
begin
  HMAC_Update(ACtx, @AIn[0],Length(AIn));
end;

function OpenSSLFinalHMACInst(ACtx: TIdHMACIntCtx): TIdBytes;
var
  LLen : TIdC_UInt;
begin
  LLen := EVP_MAX_MD_SIZE;
  SetLength(Result,LLen);
  HMAC_Final(ACtx,PAnsiChar(@Result[0]),@LLen);
  SetLength(Result,LLen);
  HMAC_CTX_cleanup(ACtx);
  FreeMem(ACtx,SizeOf(HMAC_CTX));
end;

//****************************************************
function FIPS_mode_set(onoff : TIdC_INT) : TIdC_INT;  {$IFDEF INLINE}inline;{$ENDIF}
begin
  Result := 0;
  {$IFDEF OPENSSL_FIPS}
  if Assigned(_FIPS_mode_set) then begin
    Result := _FIPS_mode_set(onoff);
  end;
  {$ENDIF}
end;

function FIPS_mode() : TIdC_INT;  {$IFDEF INLINE}inline;{$ENDIF}
begin
  Result := 0;
  {$IFDEF OPENSSL_FIPS}
  if Assigned(_FIPS_mode) then begin
    Result := _FIPS_mode;
  end;
  {$ENDIF}
end;

function GetErrorMessage(const AErr : TIdC_ULONG) : AnsiString;
{$IFDEF USE_INLINE} inline; {$ENDIF}
var
  LErrMsg: array [0..160] of AnsiChar;
begin
  ERR_error_string(AErr, PAnsiChar(@LErrMsg));
  result := StrPas(PAnsiChar(@LErrMsg));
end;

{ EIdOpenSSLAPICryptoError }
class procedure EIdOpenSSLAPICryptoError.RaiseException(const AMsg : String = '');
begin
  RaiseExceptionCode(ERR_get_error(), AMsg);
end;

class procedure EIdOpenSSLAPICryptoError.RaiseExceptionCode(
  const AErrCode: TIdC_ULONG; const AMsg: String);
var
  LMsg: String;
  LException : EIdOpenSSLAPICryptoError;
begin
  if AMsg <> '' then begin
    LMsg := AMsg + sLineBreak + String(GetErrorMessage(AErrCode));
  end else begin
    LMsg := String(GetErrorMessage(AErrCode));
  end;
  LException := Create(LMsg);
  LException.FErrorCode := AErrCode;
  raise LException;
end;

{ EIdOpenSSLAPISSLError }

class procedure EIdOpenSSLAPISSLError.RaiseException(s: PSSL;
  const ARetCode: TIdC_INT; const AMsg: String);
var
  LErr : TIdC_INT;
  LErrQueue : TIdC_ULONG;
  LException : EIdOpenSSLAPISSLError;
  LErrStr : String;
begin
  if AMsg <> '' then begin
    LErrStr := AMsg + sLineBreak;
  end else begin
    LErrStr := '';
  end;
  LErr := SSL_get_error(s, ARetCode);
  case LErr of
    SSL_ERROR_SYSCALL :
    begin
      LErrQueue := ERR_get_error;
      if LErrQueue = 0 then begin
        if ARetCode = 0 then begin
          LException := Create(LErrStr + RSSSLEOFViolation);
          LException.FErrorCode := LErr;
          LException.FRetCode := ARetCode;
          raise LException;
        end;
        {Note that if LErrQueue returns 0 and ARetCode = -1, there probably
        is an error in the underlying socket so you should raise a socket error}
        if ARetCode = -1 then begin
          GStack.RaiseLastSocketError;
        end;
      end else begin
        EIdOSSLUnderlyingCryptoError.RaiseExceptionCode(LErrQueue, LErrStr + AMsg);
      end;
    end;
    SSL_ERROR_SSL : begin
      EIdOSSLUnderlyingCryptoError.RaiseException(LErrStr + AMsg);
    end
  else
    LException := Create(LErrStr + String(GetErrorMessage(LErr)));
    LException.FErrorCode := LErr;
    LException.FRetCode := ARetCode;
    raise LException;
  end;
end;

const
  {$IFDEF UNIX}
  {This is a workaround for some Linux distributions and a few other things
  where the symbolic link libbsl.so and libcrypto.so do not exist}
  SSL_DLL_name         = 'libssl'; {Do not localize}
  SSLCLIB_DLL_name     = 'libcrypto'; {Do not localize}
  SSLDLLVers : array [0..4] of string = ('','0.9.9','.0.9.8','.0.9.7','0.9.6');
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  SSL_DLL_name       = 'ssleay32.dll';  {Do not localize}
  //The following is a workaround for an alternative name for
  //one of the OpenSSL .DLL's.  If you compile the .DLL's using
  //mingw32, the SSL .dll might be named 'libssl32.dll' instead of
  //ssleay32.dll like you would expect.
  SSL_DLL_name_alt   = 'libssl32.dll';  {Do not localize}
  SSLCLIB_DLL_name   = 'libeay32.dll';  {Do not localize}
  {$ENDIF}
var
  hIdSSL    : Integer = 0;
  hIdCrypto : Integer = 0;

  FFailedFunctionLoadList : TStringList;

  {$IFDEF SYS_WIN}
  // LIBEAY functions - open SSL 0.9.6a
  RAND_screen : procedure cdecl = nil;
  {$ENDIF}

function GetCryptLibHandle : Integer;
begin
  Result := hIdCrypto;
end;

{ This constant's are used twice. First time in Load function and second time  }  {Do not localize}
{ in function WhichFailedToLoad. I belive that this reduce size of final       }
{ compiled file.                                                               }
const
{most of these are commented out because we aren't using them now.  I am keeping
them in case we use them later.}
  fn_sk_num = 'sk_num';   {Do not localize}
  fn_sk_value = 'sk_value';   {Do not localize}
  {CH fn_sk_set = 'sk_set'; }  {Do not localize}
  fn_sk_new = 'sk_new';   {Do not localize}
  fn_sk_new_null = 'sk_new_null'; {Do not localize}
  fn_sk_free = 'sk_free';   {Do not localize}
  fn_sk_pop_free = 'sk_pop_free';  {Do not localize}
  {CH fn_sk_insert = 'sk_insert'; }  {Do not localize}
  {CH fn_sk_delete = 'sk_delete'; }  {Do not localize}
  {CH fn_sk_delete_ptr = 'sk_delete_ptr'; }  {Do not localize}
  fn_sk_find = 'sk_find';  {Do not localize}
  fn_sk_push = 'sk_push';  {Do not localize}
  {CH fn_sk_unshift = 'sk_unshift'; }  {Do not localize}
  {CH fn_sk_shift = 'sk_shift'; }  {Do not localize}
  {CH fn_sk_pop = 'sk_pop'; }  {Do not localize}
  {CH fn_sk_zero = 'sk_zero'; }  {Do not localize}
  fn_sk_dup = 'sk_dup';  {Do not localize}
  {CH fn_sk_sort = 'sk_sort'; }  {Do not localize}
  fn_SSLeay_version = 'SSLeay_version';  {Do not localize}
  fn_SSLeay = 'SSLeay';   {Do not localize}
  {CH fn_OPENSSL_issetugid = 'OPENSSL_issetugid'; }{Do not localize}
  {CH fn_CONF_set_default_method = 'CONF_set_default_method'; } {Do not localize}
  {CH fn_CONF_set_nconf = 'CONF_set_nconf'; } {Do not localize}
  {CH fn_CONF_load = 'CONF_load'; } {Do not localize}
{$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_CONF_load_fp = 'CONF_load_fp'; } {Do not localize}
{$ENDIF}
  {CH fn_CONF_load_bio = 'CONF_load_bio'; } {Do not localize}
  {CH fn_CONF_get_section = 'CONF_get_section'; } {Do not localize}
  {CH fn_CONF_get_string = 'CONF_get_string'; } {Do not localize}
  {CH fn_CONF_get_number = 'CONF_get_number'; } {Do not localize}
  {CH fn_CONF_free = 'CONF_free'; }{Do not localize}
  {CH fn_CONF_dump_fp = 'CONF_dump_fp'; } {Do not localize}
  {CH fn_CONF_dump_bio = 'CONF_dump_bio'; } {Do not localize}
  {CH fn_NCONF_new = 'NCONF_new'; } {Do not localize}
  {CH fn_NCONF_default = 'NCONF_default'; } {Do not localize}
  {CH fn_NCONF_WIN32 = 'NCONF_WIN32'; } {Do not localize}
{$IFDEF OMIT_THIS} //* Just to give you an idea of what I have in mind */
  {CH fn_NCONF_XML = 'NCONF_XML''; } {Do not localize}
{$ENDIF}
  {CH fn_NCONF_free = 'NCONF_free'; } {Do not localize}
  {CH fn_NCONF_free_data = 'NCONF_free_data'; } {Do not localize}
  {CH fn_NCONF_load = 'NCONF_load'; } {Do not localize}
{$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_NCONF_load_fp = 'NCONF_load_fp'; }{Do not localize}
{$ENDIF}
  {CH fn_NCONF_load_bio = 'NCONF_load_bio'; {Do not localize}
  {CH fn_NCONF_get_section = 'NCONF_get_section'; {Do not localize}
  {CH fn_NCONF_get_string = 'NCONF_get_string'; {Do not localize}
  {CH fn_NCONF_get_number_e = 'NCONF_get_number_e'; {Do not localize}
  {CH fn_NCONF_dump_fp = 'NCONF_dump_fp'; } {Do not localize}
  {CH fn_NCONF_dump_bio = 'NCONF_dump_bio'; }{Do not localize}
  {CH fn_CONF_modules_load = 'CONF_modules_load'; } {Do not localize}
  {CH fn_CONF_modules_load_file = 'CONF_modules_load_file'; } {Do not localize}
  {CH fn_CONF_modules_unload = 'CONF_modules_unload'; } {Do not localize}
  {CH fn_CONF_modules_finish = 'CONF_modules_finish'; } {Do not localize}
  {CH fn_CONF_modules_free = 'CONF_modules_free'; } {Do not localize}
  {CH fn_CONF_module_add = 'CONF_module_add'; } {Do not localize}
  {CH fn_CONF_imodule_get_name = 'CONF_imodule_get_name'; } {Do not localize}
  {CH fn_CONF_imodule_get_value = 'CONF_imodule_get_value'; } {Do not localize}
  {CH fn_CONF_imodule_get_usr_data = 'CONF_imodule_get_usr_data'; } {Do not localize}
  {CH fn_CONF_imodule_set_usr_data = 'CONF_imodule_set_usr_data'; } {Do not localize}
  {CH fn_CONF_imodule_get_module = 'CONF_imodule_get_module'; } {Do not localize}
  {CH fn_CONF_imodule_get_flags = 'CONF_imodule_get_flags'; } {Do not localize}
  {CH fn_CONF_imodule_set_flags = 'CONF_imodule_set_flags'; } {Do not localize}
  {CH fn_CONF_module_get_usr_data = 'CONF_module_get_usr_data'; } {Do not localize}
  {CH fn_CONF_module_set_usr_data = 'CONF_module_set_usr_data'; } {Do not localize}
  {CH fn_ERR_load_CONF_strings = 'ERR_load_CONF_strings'; } {Do not localize}
  {CH fn_CONF_get1_default_config_file = 'CONF_get1_default_config_file'; } {Do not localize}
  {CH fn_CONF_parse_list = 'CONF_parse_list' ; }
  {CH fn_OPENSSL_load_builtin_modules = 'OPENSSL_load_builtin_modules'; } {Do not localize}
  {CH fn_CRYPTO_get_ex_new_index = 'CRYPTO_get_ex_new_index'; }  {Do not localize}
  {CH fn_CRYPTO_set_ex_data = 'CRYPTO_set_ex_data'; }  {Do not localize}
  {CH fn_CRYPTO_get_ex_data = 'CRYPTO_get_ex_data'; }  {Do not localize}
  {CH fn_CRYPTO_dup_ex_data = 'CRYPTO_dup_ex_data'; }  {Do not localize}
  {CH fn_CRYPTO_free_ex_data = 'CRYPTO_free_ex_data'; }  {Do not localize}
  {CH fn_CRYPTO_new_ex_data = 'CRYPTO_new_ex_data'; }  {Do not localize}
  fn_CRYPTO_mem_ctrl = 'CRYPTO_mem_ctrl';  {Do not localize}
  {CH fn_OPENSSL_issetugid = 'OPENSSL_issetugid'; } {Do not localize}
  {CH fn_CRYPTO_get_ex_data_implementation = 'CRYPTO_get_ex_data_implementation'; } {Do not localize}
  {CH fn_CRYPTO_set_ex_data_implementation = 'CRYPTO_set_ex_data_implementation'; } {Do not localize}
  {CH fn_CRYPTO_ex_data_new_class = 'CRYPTO_ex_data_new_class'; } {Do not localize}
  {CH fn_CRYPTO_get_locking_callback = 'CRYPTO_get_locking_callback'; } {Do not localize}
  {CH fn_CRYPTO_get_add_lock_callback = 'CRYPTO_get_add_lock_callback'; } {Do not localize}
  {CH fn_CRYPTO_get_new_dynlockid = 'CRYPTO_get_new_dynlockid'; } {Do not localize}
  {CH fn_CRYPTO_destroy_dynlockid = 'CRYPTO_destroy_dynlockid'; }  {Do not localize}
  {CH fn_CRYPTO_get_dynlock_value = 'CRYPTO_get_dynlock_value'; }  {Do not localize}
  {CH fn_CRYPTO_set_dynlock_create_callback = 'CRYPTO_set_dynlock_create_callback'; }  {Do not localize}
  {CH fn_CRYPTO_set_dynlock_lock_callback = 'CRYPTO_set_dynlock_lock_callback'; } {Do not localize}
  {CH fn_CRYPTO_set_dynlock_destroy_callback = 'CRYPTO_set_dynlock_destroy_callback'; } {Do not localize}
  {CH fn_CRYPTO_set_locked_mem_ex_functions = 'CRYPTO_set_locked_mem_ex_functions'; }  {Do not localize}
  {CH fn_CRYPTO_get_mem_ex_functions = 'CRYPTO_get_mem_ex_functions'; }  {Do not localize}
  {CH fn_CRYPTO_get_locked_mem_ex_functions = 'CRYPTO_get_locked_mem_ex_functions'; } {Do not localize}
  {CH fn_CRYPTO_get_mem_debug_functions = 'CRYPTO_get_mem_debug_functions'; }{Do not localize}
  {CH fn_CRYPTO_realloc_clean = 'CRYPTO_realloc_clean'; } {Do not localize}
  {CH fn_OPENSSL_cleanse = 'OPENSSL_cleanse'; } {Do not localize}
  {CH fn_CRYPTO_set_mem_debug_options = 'CRYPTO_set_mem_debug_options'; } {Do not localize}
  {CH fn_CRYPTO_get_mem_debug_options = 'CRYPTO_get_mem_debug_options'; } {Do not localize}
  {CH fn_CRYPTO_push_info_ = 'CRYPTO_push_info_'; } {Do not localize}
  {CH fn_CRYPTO_pop_info = 'CRYPTO_pop_info'; } {Do not localize}
  {CH fn_CRYPTO_remove_all_info = 'CRYPTO_remove_all_info'; } {Do not localize}
  {CH fn_OpenSSLDie = 'OpenSSLDie'; } {Do not localize}
  {CH fn_OPENSSL_ia32cap_loc = 'OPENSSL_ia32cap_loc'; { {Do not localize}
  {CH fn_CRYPTO_get_new_lockid = 'CRYPTO_get_new_lockid'; }  {Do not localize}
  fn_CRYPTO_num_locks = 'CRYPTO_num_locks';  {Do not localize}
  {CH fn_CRYPTO_lock = 'CRYPTO_lock'; }  {Do not localize}
  fn_CRYPTO_set_locking_callback = 'CRYPTO_set_locking_callback';  {Do not localize}
  {CH fn_CRYPTO_set_add_lock_callback = 'CRYPTO_set_add_lock_callback'; }  {Do not localize}
  fn_CRYPTO_set_id_callback = 'CRYPTO_set_id_callback';  {Do not localize}
  {CH fn_CRYPTO_thread_id = 'CRYPTO_thread_id'; }  {Do not localize}
  {CH fn_CRYPTO_get_lock_name = 'CRYPTO_get_lock_name'; }  {Do not localize}
  {CH fn_CRYPTO_add_lock = 'CRYPTO_add_lock'; }  {Do not localize}
  {CH fn_int_CRYPTO_set_do_dynlock_callback = 'int_CRYPTO_set_do_dynlock_callback'; } {Do not localize}
  //OpenSSL 1.0.0 - use these instead of the depreciated CRYPTO_set_id_callback
  fn_CRYPTO_THREADID_set_numeric = 'CRYPTO_THREADID_set_numeric';  {Do not localize}
  fn_CRYPTO_THREADID_set_pointer = 'CRYPTO_THREADID_set_pointer';  {Do not localize}
  fn_CRYPTO_THREADID_set_callback = 'CRYPTO_THREADID_set_callback'; {Do not localize}
  //end section
  fn_CRYPTO_set_mem_functions = 'CRYPTO_set_mem_functions';  {Do not localize}
  {CH fn_CRYPTO_set_mem_info_functions = 'CRYPTO_set_mem_info_functions'; } {Do not localize}
  {CH fn_CRYPTO_get_mem_functions = 'CRYPTO_get_mem_functions'; }  {Do not localize}
  {CH fn_CRYPTO_set_locked_mem_functions = 'CRYPTO_set_locked_mem_functions'; }  {Do not localize}
  {CH fn_CRYPTO_get_locked_mem_functions = 'CRYPTO_get_locked_mem_functions'; }  {Do not localize}
  {CH fn_CRYPTO_malloc_locked = 'CRYPTO_malloc_locked'; }  {Do not localize}
  {CH fn_CRYPTO_free_locked = 'CRYPTO_free_locked'; }  {Do not localize}
  fn_CRYPTO_malloc = 'CRYPTO_malloc';  {Do not localize}
  fn_CRYPTO_free = 'CRYPTO_free';  {Do not localize}
  {CH fn_CRYPTO_realloc = 'CRYPTO_realloc'; }  {Do not localize}
  {CH fn_CRYPTO_remalloc = 'CRYPTO_remalloc'; }  {Do not localize}
  {CH fn_CRYPTO_dbg_malloc = 'CRYPTO_dbg_malloc'; }  {Do not localize}
  {CH fn_CRYPTO_dbg_realloc = 'CRYPTO_dbg_realloc'; }  {Do not localize}
  {CH fn_CRYPTO_dbg_free = 'CRYPTO_dbg_free'; }  {Do not localize}
  {CH fn_CRYPTO_dbg_remalloc = 'CRYPTO_dbg_remalloc'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_CRYPTO_mem_leaks_fp = 'CRYPTO_mem_leaks_fp'; }  {Do not localize}
  {$ENDIF}
  fn_CRYPTO_mem_leaks = 'CRYPTO_mem_leaks';  {Do not localize}
  {CH fn_CRYPTO_mem_leaks_cb = 'CRYPTO_mem_leaks_cb'; }  {Do not localize}
  fn_CRYPTO_cleanup_all_ex_data = 'CRYPTO_cleanup_all_ex_data'; {Do not localize}
  fn_CRYPTO_set_mem_debug_functions = 'CRYPTO_set_mem_debug_functions'; {Do not localize}
  {CH fn_CRYPTO_dbg_set_options = 'CRYPTO_dbg_set_options'; } {Do not localize}
  {CH fn_CRYPTO_dbg_get_options = 'CRYPTO_dbg_get_options'; } {Do not localize}
  {CH fn_CRYPTO_dbg_push_info = 'CRYPTO_dbg_push_info'; } {Do not localize}
  {CH fn_CRYPTO_dbg_pop_info = 'CRYPTO_dbg_pop_info'; } {Do not localize}
  {CH fn_CRYPTO_dbg_remove_all_info = 'CRYPTO_dbg_remove_all_info'; } {Do not localize}
  fn_ERR_load_CRYPTO_strings = 'ERR_load_CRYPTO_strings';  {Do not localize}
  {CH fn_OPENSSL_init = 'OPENSSL_init';  } {Do not localize}
  {CH fn_lh_new = 'lh_new'; }  {Do not localize}
  {CH fn_lh_free = 'lh_free'; }  {Do not localize}
  {CH fn_lh_insert = 'lh_insert'; }  {Do not localize}
  {CH fn_lh_delete = 'lh_delete'; }  {Do not localize}
  {CH fn_lh_retrieve = 'lh_retrieve'; }  {Do not localize}
  {CH fn_lh_doall = 'lh_doall'; }  {Do not localize}
  {CH fn_lh_doall_arg = 'lh_doall_arg'; }  {Do not localize}
  {CH fn_lh_strhash = 'lh_strhash'; }  {Do not localize}
  {CH fn_lh_stats = 'lh_stats'; }  {Do not localize}
  {CH fn_lh_node_stats = 'lh_node_stats'; }  {Do not localize}
  {CH fn_lh_node_usage_stats = 'lh_node_usage_stats'; }  {Do not localize}
  {CH fn_BUF_MEM_new = 'BUF_MEM_new'; }  {Do not localize}
  {CH fn_BUF_MEM_free = 'BUF_MEM_free'; }  {Do not localize}
  {CH fn_BUF_MEM_grow = 'BUF_MEM_grow'; }  {Do not localize}
  {CH fn_BUF_strdup = 'BUF_strdup'; }  {Do not localize}
  {CH fn_ERR_load_BUF_strings = 'ERR_load_BUF_strings'; }  {Do not localize}
  {CH fn_BIO_ctrl_pending = 'BIO_ctrl_pending'; }  {Do not localize}
  {CH fn_BIO_ctrl_wpending = 'BIO_ctrl_wpending'; }  {Do not localize}
  {CH fn_BIO_ctrl_get_write_guarantee = 'BIO_ctrl_get_write_guarantee'; }  {Do not localize}
  {CH fn_BIO_ctrl_get_read_request = 'BIO_ctrl_get_read_request'; }  {Do not localize}
  {CH fn_BIO_set_ex_data = 'BIO_set_ex_data'; }  {Do not localize}
  {CH fn_BIO_get_ex_data = 'BIO_get_ex_data'; }  {Do not localize}
  {CH fn_BIO_get_ex_new_index = 'BIO_get_ex_new_index'; }  {Do not localize}
  fn_BIO_s_file = 'BIO_s_file';  {Do not localize}
  fn_BIO_new_file = 'BIO_new_file';  {Do not localize}
  {CH fn_BIO_new_fp = 'BIO_new_fp'; }  {Do not localize}
  fn_BIO_new = 'BIO_new';  {Do not localize}
  fn_BIO_new_mem_buf = 'BIO_new_mem_buf'; {Do not localize}
  {CH fn_BIO_set = 'BIO_set'; }  {Do not localize}
  fn_BIO_free = 'BIO_free';  {Do not localize}
  fn_BIO_read = 'BIO_read';  {Do not localize}
  {CH fn_BIO_gets = 'BIO_gets'; }  {Do not localize}
  fn_BIO_write = 'BIO_write';  {Do not localize}
  fn_BIO_puts = 'BIO_puts';  {Do not localize}
  fn_BIO_ctrl = 'BIO_ctrl';  {Do not localize}
  fn_BIO_ptr_ctrl = 'BIO_ptr_ctrl';   {Do not localize}
  fn_BIO_int_ctrl = 'BIO_int_ctrl';  {Do not localize}
  {CH fn_BIO_push = 'BIO_push'; }  {Do not localize}
  {CH fn_BIO_pop = 'BIO_pop'; }  {Do not localize}
  {CH fn_BIO_free_all = 'BIO_free_all'; }  {Do not localize}
  {CH fn_BIO_find_type = 'BIO_find_type'; }  {Do not localize}
  {CH fn_BIO_get_retry_BIO = 'BIO_get_retry_BIO'; }  {Do not localize}
  {CH fn_BIO_get_retry_reason = 'BIO_get_retry_reason'; }  {Do not localize}
  {CH fn_BIO_dup_chain = 'BIO_dup_chain'; }  {Do not localize}
  {CH fn_BIO_debug_callback = 'BIO_debug_callback'; }  {Do not localize}

  fn_BIO_s_mem = 'BIO_s_mem';  {Do not localize}
  {CH fn_BIO_s_socket = 'BIO_s_socket'; }  {Do not localize}
  {CH fn_BIO_s_connect = 'BIO_s_connect'; }  {Do not localize}
  {CH fn_BIO_s_accept = 'BIO_s_accept'; }  {Do not localize}
  {CH fn_BIO_s_fd = 'BIO_s_fd'; }  {Do not localize}
  {CH fn_BIO_s_bio = 'BIO_s_bio'; }  {Do not localize}
  {CH fn_BIO_s_null = 'BIO_s_null'; }  {Do not localize}
  {CH fn_BIO_f_null = 'BIO_f_null'; }  {Do not localize}
  {CH fn_BIO_f_buffer = 'BIO_f_buffer'; }  {Do not localize}
  {CH fn_BIO_f_nbio_test = 'BIO_f_nbio_test'; }  {Do not localize}
  {CH fn_BIO_sock_should_retry = 'BIO_sock_should_retry'; }  {Do not localize}
  {CH fn_BIO_sock_non_fatal_error = 'BIO_sock_non_fatal_error'; }  {Do not localize}
  {CH fn_BIO_fd_should_retry = 'BIO_fd_should_retry'; }  {Do not localize}
  {CH fn_BIO_fd_non_fatal_error = 'BIO_fd_non_fatal_error'; }  {Do not localize}
  {CH fn_BIO_dump = 'BIO_dump'; }  {Do not localize}
  {CH fn_BIO_gethostbyname = 'BIO_gethostbyname'; }  {Do not localize}
  {CH fn_BIO_sock_error = 'BIO_sock_error'; }  {Do not localize}
  {CH fn_BIO_socket_ioctl = 'BIO_socket_ioctl'; }  {Do not localize}
  {CH fn_BIO_socket_nbio = 'BIO_socket_nbio'; }  {Do not localize}
  {CH fn_BIO_get_port = 'BIO_get_port'; }  {Do not localize}
  {CH fn_BIO_get_host_ip = 'BIO_get_host_ip'; }  {Do not localize}
  {CH fn_BIO_get_accept_socket = 'BIO_get_accept_socket'; }  {Do not localize}
  {CH fn_BIO_accept = 'BIO_accept'; }  {Do not localize}
  {CH fn_BIO_sock_init = 'BIO_sock_init'; }  {Do not localize}
  {CH fn_BIO_sock_cleanup = 'BIO_sock_cleanup'; }  {Do not localize}
  {CH fn_BIO_set_tcp_ndelay = 'BIO_set_tcp_ndelay'; }  {Do not localize}
  {CH fn_ERR_load_BIO_strings = 'ERR_load_BIO_strings'; }  {Do not localize}
  {CH fn_BIO_new_socket = 'BIO_new_socket'; }  {Do not localize}
  {CH fn_BIO_new_fd = 'BIO_new_fd'; }  {Do not localize}
  {CH fn_BIO_new_connect = 'BIO_new_connect'; }  {Do not localize}
  {CH fn_BIO_new_accept = 'BIO_new_accept'; }  {Do not localize}
  {CH fn_BIO_new_bio_pair = 'BIO_new_bio_pair'; }  {Do not localize}
  {CH fn_BIO_copy_next_retry = 'BIO_copy_next_retry'; }  {Do not localize}
  {CH fn_BIO_ghbn_ctrl = 'BIO_ghbn_ctrl'; }  {Do not localize}
  {CH fn_COMP_CTX_new = 'COMP_CTX_new';} {Do not localize}
  {CH fn_COMP_CTX_free = 'COMP_CTX_free'; } {Do not localize}
  {CH fn_COMP_compress_block = 'COMP_compress_block'; } {Do not localize}
  {CH fn_COMP_expand_block = 'COMP_expand_block'; } {Do not localize}
  {CH fn_COMP_rle = 'COMP_rle'; } {Do not localize}
  {CH fn_COMP_zlib = 'COMP_zlib'; } {Do not localize}
  {CH fn_COMP_zlib_cleanup = 'COMP_zlib_cleanup'; } {Do not localized}
  {$IFDEF HEADER_BIO_H}
    {$IFDEF ZLIB}
  {CH fn_BIO_f_zlib = 'BIO_f_zlib'; } {Do not localize}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD2}
  {CH fn_MD2_options = 'MD2_options'; }  {Do not localize}
    {$IFDEF OPENSSL_FIPS}
  {CH fn_private_MD2_Init = 'private_MD2_Init'; } {Do not localize}
    {$ENDIF}
  {CH fn_MD2_Init = 'MD2_Init'; }  {Do not localize}
  {CH fn_MD2_Update = 'MD2_Update'; }  {Do not localize}
  {CH fn_MD2_Final = 'MD2_Final'; }  {Do not localize}
  {CH fn_MD2 = 'MD2'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD4}
    {$IFDEF OPENSSL_FIPS}
  {CH fn_private_MD4_Init = 'private_MD4_Init'; } {Do not localize}
    {$ENDIF}
  {CH fn_MD4_Init = 'MD4_Init'; } {Do not localize}
  {CH fn_MD4_Update = 'MD4_Update'; } {Do not localize}
  {CH fn_MD4_Final = 'MD4_Final'; } {Do not localize}
  {CH fn_MD4 = 'MD4'; } {Do not localize}
  {CH fn_MD4_Transform = 'MD4_Transform'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD5}
    {$IFDEF OPENSSL_FIPS}
  {CH fn_private_MD5_Init = 'private_MD5_Init'; } {Do not localize}
    {$ENDIF}
  {CH fn_MD5_Init = 'MD5_Init'; }  {Do not localize}
  {CH fn_MD5_Update = 'MD5_Update'; }  {Do not localize}
  {CH fn_MD5_Final = 'MD5_Final'; }  {Do not localize}
  {CH fn_MD5 = 'MD5'; }  {Do not localize}
  {CH fn_MD5_Transform = 'MD5_Transform'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA}
    {$IFNDEF OPENSSL_NO_SHA0}
      {$IFDEF OPENSSL_FIPS}
  {CH fn_private_SHA_Init = 'private_SHA_Init'; } {Do not localize}
      {$ENDIF}
  {CH fn_SHA_Init = 'SHA_Init'; }  {Do not localize}
  {CH fn_SHA_Update = 'SHA_Update'; }  {Do not localize}
  {CH fn_SHA_Final = 'SHA_Final'; }  {Do not localize}
  {CH fn_SHA = 'SHA'; }  {Do not localize}
  {CH fn_SHA_Transform = 'SHA_Transform'; }  {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_SHA1}
  {CH fn_SHA1_Init = 'SHA1_Init'; }  {Do not localize}
  {CH fn_SHA1_Update = 'SHA1_Update'; }  {Do not localize}
  {CH fn_SHA1_Final = 'SHA1_Final'; }  {Do not localize}
  {CH fn_SHA1 = 'SHA1'; }  {Do not localize}
  {CH fn_SHA1_Transform = 'SHA1_Transform'; }  {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_SHA256}
  {CH fn_SHA224_Init = 'SHA224_Init'; } {Do not localize}
  {CH fn_SHA224_Update = 'SHA224_Update'; } {Do not localize}
  {CH fn_SHA224_Final = 'SHA224_Final'; } {Do not localize}
  {CH fn_SHA224 = 'SHA224'; } {Do not localize}
  {CH fn_SHA256_Init = 'SHA256_Init'; } {Do not localize}
  {CH fn_SHA256_Update = 'SHA256_Update'; } {Do not localize}
  {CH fn_SHA256_Final = 'SHA256_Final'; } {Do not localize}
  {CH fn_SHA256 = 'SHA256'; } {Do not localize}
  {CH fn_SHA256_Transform = 'SHA256_Transform'; } {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_SHA512}
  {CH fn_SHA384_Init = 'SHA384_Init'; } {Do not localize}
  {CH fn_SHA384_Update = 'SHA384_Update'; } {Do not localize}
  {CH fn_SHA384_Final = 'SHA384_Final'; } {Do not localize}
  {CH fn_SHA384 = 'SHA384'; } {Do not localize}
  {CH fn_SHA512_Init = 'SHA512_Init'; } {Do not localize}
  {CH fn_SHA512_Update = 'SHA512_Update'; } {Do not localize}
  {CH fn_SHA512_Final = 'SHA512_Final'; } {Do not localize}
  {CH fn_SHA512 = 'SHA512'; } {Do not localize}
  {CH fn_SHA512_Transform = 'SHA512_Transform'; } {Do not localize}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RIPEMD}
    {$IFDEF OPENSSL_FIPS}
  {CH fn_private_RIPEMD160_Init = 'private_RIPEMD160_Init'; } {Do not localize}
     {$ENDIF}
  {CH fn_RIPEMD160_Init = 'RIPEMD160_Init'; }  {Do not localize}
  {CH fn_RIPEMD160_Update = 'RIPEMD160_Update'; }  {Do not localize}
  {CH fn_RIPEMD160_Final = 'RIPEMD160_Final'; }  {Do not localize}
  {CH fn_RIPEMD160 = 'RIPEMD160'; }  {Do not localize}
  {CH fn_RIPEMD160_Transform = 'RIPEMD160_Transform'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_HMAC}
  fn_HMAC_CTX_init = 'HMAC_CTX_init';  {Do not localize}
  fn_HMAC_CTX_cleanup = 'HMAC_CTX_cleanup';  {Do not localize}
  {CH fn_HMAC_Init = 'HMAC_Init'; } {Do not localize}
  fn_HMAC_Init_ex = 'HMAC_Init_ex';  {Do not localize}
  fn_HMAC_Update = 'HMAC_Update';  {Do not localize}
  fn_HMAC_Final = 'HMAC_Final';  {Do not localize}
  {CH fn_HMAC = 'HMAC'; } {Do not localize}
  {CH fn_HMAC_CTX_set_flags = 'HMAC_CTX_set_flags'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF HEADER_TMDIFF_H}
  {CH fn_ms_time_new = 'ms_time_new'; } {Do not localize}
  {CH fn_ms_time_free = 'ms_time_free'; } {Do not localize}
  {CH fn_ms_time_get = 'ms_time_get'; } {Do not localize}
  {CH fn_ms_time_diff = 'ms_time_diff'; } {Do not localize}
  {CH fn_ms_time_cmp = 'ms_time_cmp'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_AES}
  {CH fn_AES_options = 'AES_options'; }{Do not localize}
  {CH fn_AES_set_encrypt_key = 'AES_set_encrypt_key'; }{Do not localize}
  {CH fn_AES_set_decrypt_key = 'AES_set_decrypt_key'; }{Do not localize}
  {CH fn_AES_encrypt = 'AES_encrypt'; }{Do not localize}
  {CH fn_AES_decrypt = 'AES_decrypt'; } {Do not localize}
  {CH fn_AES_ecb_encrypt = 'AES_ecb_encrypt'; } {Do not localize}
  {CH fn_AES_cbc_encrypt = 'AES_cbc_encrypt'; } {Do not localize}
  {CH fn_AES_cfb128_encrypt = 'AES_cfb128_encrypt'; } {Do not localize}
  {CH fn_AES_cfb1_encrypt = 'AES_cfb1_encrypt'; } {Do not localize}
  {CH fn_AES_cfb8_encrypt = 'AES_cfb8_encrypt'; } {Do not localize}
  {CH fn_AES_cfbr_encrypt_block = 'AES_cfbr_encrypt_block'; } {Do not localize}
  {CH fn_AES_ofb128_encrypt = 'AES_ofb128_encrypt'; } {Do not localize}
  {CH fn_AES_ctr128_encrypt = 'AES_ctr128_encrypt'; } {Do not localize}
  {CH fn_AES_ige_encrypt = 'AES_ige_encrypt'; } {Do not localize}
  {CH fn_AES_bi_ige_encrypt = 'AES_bi_ige_encrypt'; } {Do not localize}
  {CH fn_AES_wrap_key = 'AES_wrap_key'; } {Do not localize}
  {CH fn_AES_unwrap_key = 'AES_unwrap_key'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DES}
  {CH fn_des_options = 'DES_options'; }  {Do not localize}
  {CH fn_des_ecb3_encrypt = 'DES_ecb3_encrypt'; }  {Do not localize}
  {CH fn_des_cbc_cksum = 'DES_cbc_cksum'; }  {Do not localize}
  {CH fn_des_cbc_encrypt = 'DES_cbc_encrypt'; }  {Do not localize}
  {CH fn_des_ncbc_encrypt = 'DES_ncbc_encrypt'; }  {Do not localize}
  {CH fn_des_xcbc_encrypt = 'DES_xcbc_encrypt'; }  {Do not localize}
  {CH fn_des_cfb_encrypt = 'DES_cfb_encrypt'; }  {Do not localize}
  fn_des_ecb_encrypt = 'DES_ecb_encrypt';  {Do not localize}
  fnold_des_ecb_encrypt = 'DES_ecb_encrypt'; {Do not localize}
  {CH fn_des_encrypt = 'DES_encrypt'; }  {Do not localize}
  {CH fn_des_encrypt2 = 'DES_encrypt2'; }  {Do not localize}
  {CH fn_des_encrypt3 = 'DES_encrypt3'; }  {Do not localize}
  {CH fn_des_decrypt3 = 'DES_decrypt3'; }  {Do not localize}
  {CH fn_des_ede3_cbc_encrypt = 'DES_ede3_cbc_encrypt'; }  {Do not localize}
  {CH fn_des_ede3_cbcm_encrypt = 'DES_ede3_cbcm_encrypt'; }  {Do not localize}
  {CH fn_des_ede3_cfb64_encrypt = 'DES_ede3_cfb64_encrypt'; }  {Do not localize}
  {CH fn_des_ede3_ofb64_encrypt = 'DES_ede3_ofb64_encrypt'; }  {Do not localize}
  {$IFDEF USE_THIS}
  {CH fn_des_xwhite_in2out = 'DES_xwhite_in2out'; }  {Do not localize}
  {$ENDIF}
  {CH fn_des_enc_read = 'DES_enc_read'; }  {Do not localize}
  {CH fn_des_enc_write = 'DES_enc_write'; }  {Do not localize}
  {CH fn_des_fcrypt = 'DES_fcrypt'; }  {Do not localize}
  {CH fn_crypt = 'crypt'; }  {Do not localize}
  {CH fn_des_ofb_encrypt = 'DES_ofb_encrypt'; }  {Do not localize}
  {CH fn_des_pcbc_encrypt = 'DES_pcbc_encrypt'; }  {Do not localize}
  {CH fn_des_quad_cksum = 'DES_quad_cksum'; }  {Do not localize}
  {CH fn_des_random_seed = 'DES_random_seed'; }  {Do not localize}
  {CH fn_des_random_key = 'DES_random_key'; }  {Do not localize}
  {CH fn_des_read_password = 'DES_read_password'; }  {Do not localize}
  {CH fn_des_read_2passwords = 'DES_read_2passwords'; }  {Do not localize}
  {CH fn_des_read_pw_string = 'DES_read_pw_string'; }  {Do not localize}
  fn_des_set_odd_parity = 'DES_set_odd_parity';  {Do not localize}
  fnold_des_set_odd_parity = 'DES_set_odd_parity';  {Do not localize}
  {CH fn_des_is_weak_key = 'DES_is_weak_key'; }  {Do not localize}
  fn_des_set_key = 'DES_set_key';  {Do not localize}
  fnold_des_set_key = '_ossl_old_des_set_key'; {Do not localize}
  {CH fn_des_key_sched = 'DES_key_sched'; }  {Do not localize}
  {CH fn_des_string_to_key = 'DES_string_to_key'; }  {Do not localize}
  {CH fn_des_string_to_2keys = 'DES_string_to_2keys'; }  {Do not localize}
  {CH fn_des_cfb64_encrypt = 'DES_cfb64_encrypt'; }  {Do not localize}
  {CH fn_des_ofb64_encrypt = 'DES_ofb64_encrypt'; }  {Do not localize}
  {CH fn_des_read_pw = 'DES_read_pw'; }  {Do not localize}
  {CH fn_des_cblock_print_file = 'DES_cblock_print_file'; }  {Do not localize}
   //des_old.h
  {CH fn__ossl_old_des_options = '_ossl_old_des_options'; {Do not localize}
  {CH fn__ossl_old_des_ecb3_encrypt = '_ossl_old_des_ecb3_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_cbc_cksum = '_ossl_old_des_cbc_cksum'; {Do not localize}
  {CH fn__ossl_old_des_cbc_encrypt = '_ossl_old_des_cbc_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_ncbc_encrypt = '_ossl_old_des_ncbc_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_xcbc_encrypt = '_ossl_old_des_xcbc_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_cfb_encrypt = '_ossl_old_des_cfb_encrypt'; {Do not localize}
  fn__ossl_old_des_ecb_encrypt = '_ossl_old_des_ecb_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_encrypt = '_ossl_old_des_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_encrypt2 = '_ossl_old_des_encrypt2'; {Do not localize}
  {CH fn__ossl_old_des_encrypt3 = '_ossl_old_des_encrypt3'; {Do not localize}
  {CH fn__ossl_old_des_decrypt3 = '_ossl_old_des_decrypt3'; {Do not localize}
  {CH fn__ossl_old_des_ede3_cbc_encrypt = '_ossl_old_des_ede3_cbc_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_ede3_cfb64_encrypt = '_ossl_old_des_ede3_cfb64_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_ede3_ofb64_encrypt = '_ossl_old_des_ede3_ofb64_encrypt'; {Do not localize}
    {$IFDEF USE_THIS}
  {CH fn__ossl_old_des_xwhite_in2out = '_ossl_old_des_xwhite_in2out'; {Do not localize}
    {$ENDIF}
  {CH fn__ossl_old_des_enc_read = '_ossl_old_des_enc_read'; {Do not localize}
  {CH fn__ossl_old_des_enc_write = '_ossl_old_des_enc_write'; {Do not localize}
  {CH fn__ossl_old_des_fcrypt = '_ossl_old_des_fcrypt'; {Do not localize}
  {CH fn__ossl_old_des_crypt = '_ossl_old_des_crypt'; {Do not localize}
    {$IFNDEF PERL5}
      {$IFNDEF NeXT}
  {CH fn__ossl_old_crypt = '_ossl_old_crypt'; {Do not localize}
      {$ENDIF}
    {$ENDIF}
  {CH fn__ossl_old_des_ofb_encrypt = '_ossl_old_des_ofb_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_pcbc_encrypt = '_ossl_old_des_pcbc_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_quad_cksum = '_ossl_old_des_quad_cksum'; {Do not localize}
  {CH fn__ossl_old_des_random_seed = '_ossl_old_des_random_seed'; {Do not localize}
  {CH fn__ossl_old_des_random_key = '_ossl_old_des_random_key'; {Do not localize}
  {CH fn__ossl_old_des_read_password = '_ossl_old_des_read_password'; {Do not localize}
  {CH fn__ossl_old_des_read_2passwords = '_ossl_old_des_read_2passwords'; {Do not localize}
  fn__ossl_old_des_set_odd_parity = '_ossl_old_des_set_odd_parity'; {Do not localize}
  {CH fn__ossl_old_des_is_weak_key = '_ossl_old_des_is_weak_key'; {Do not localize}
  fn__ossl_old_des_set_key = '_ossl_old_des_set_key'; {Do not localize}
  {CH fn__ossl_old_des_key_sched = '_ossl_old_des_key_sched'; {Do not localize}
  {CH fn__ossl_old_des_string_to_key = '_ossl_old_des_string_to_key'; {Do not localize}
  {CH fn__ossl_old_des_string_to_2keys = '_ossl_old_des_string_to_2keys'; {Do not localize}
  {CH fn__ossl_old_des_cfb64_encrypt = '_ossl_old_des_cfb64_encrypt'; {Do not localize}
  {CH fn__ossl_old_des_ofb64_encrypt = '_ossl_old_des_ofb64_encrypt'; {Do not localize}
  {CH fn__ossl_096_des_random_seed = '_ossl_096_des_random_seed'; {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC4}
  {CH fn_RC4_options = 'RC4_options'; } {Do not localize}
    {$IFDEF OPENSSL_FIPS}
  {CH private_RC4_set_key = 'private_RC4_set_key'; } {Do not localize}
    {$ENDIF}
  {CH fn_RC4_set_key = 'RC4_set_key'; }  {Do not localize}
  {CH fn_RC4 = 'RC4'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC2}
    {$IFDEF OPENSSL_FIPS}
  {CH fn_private_RC2_set_key = 'private_RC2_set_key'; } {Do not localize}
    {$ENDIF}
  {CH fn_RC2_set_key = 'RC2_set_key'; }  {Do not localize}
  {CH fn_RC2_ecb_encrypt = 'RC2_ecb_encrypt'; }  {Do not localize}
  {CH fn_RC2_encrypt = 'RC2_encrypt'; }  {Do not localize}
  {CH fn_RC2_decrypt = 'RC2_decrypt'; }  {Do not localize}
  {CH fn_RC2_cbc_encrypt = 'RC2_cbc_encrypt'; }  {Do not localize}
  {CH fn_RC2_cfb64_encrypt = 'RC2_cfb64_encrypt'; }  {Do not localize}
  {CH fn_RC2_ofb64_encrypt = 'RC2_ofb64_encrypt'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC5}
  {CH fn_RC5_32_set_key = 'RC5_32_set_key'; }  {Do not localize}
  {CH fn_RC5_32_ecb_encrypt = 'RC5_32_ecb_encrypt'; }  {Do not localize}
  {CH fn_RC5_32_encrypt = 'RC5_32_encrypt'; }  {Do not localize}
  {CH fn_RC5_32_decrypt = 'RC5_32_decrypt'; }  {Do not localize}
  {CH fn_RC5_32_cbc_encrypt = 'RC5_32_cbc_encrypt'; }  {Do not localize}
  {CH fn_RC5_32_cfb64_encrypt = 'RC5_32_cfb64_encrypt'; }  {Do not localize}
  {CH fn_RC5_32_ofb64_encrypt = 'RC5_32_ofb64_encrypt'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_BF}
    {$IFDEF FIPS}
  {CH fn_private_BF_set_key = 'private_BF_set_key'; } {Do not localize}
    {$ENDIF}
  {CH fn_BF_set_key = 'BF_set_key'; }  {Do not localize}
  {CH fn_BF_ecb_encrypt = 'BF_ecb_encrypt'; }  {Do not localize}
  {CH fn_BF_encrypt = 'BF_encrypt'; }  {Do not localize}
  {CH fn_BF_decrypt = 'BF_decrypt'; }  {Do not localize}
  {CH fn_BF_cbc_encrypt = 'BF_cbc_encrypt'; }  {Do not localize}
  {CH fn_BF_cfb64_encrypt = 'BF_cfb64_encrypt'; }  {Do not localize}
  {CH fn_BF_ofb64_encrypt = 'BF_ofb64_encrypt'; }  {Do not localize}
  {CH fn_BF_options = 'BF_options'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_CAST}
     {$IFDEF OPENSSL_FIPS}
  {CH fn_private_CAST_set_key = 'private_CAST_set_key';  } {Do not localize}
     {$ENDIF}
  {CH fn_CAST_set_key = 'CAST_set_key'; }  {Do not localize}
  {CH fn_CAST_ecb_encrypt = 'CAST_ecb_encrypt'; }  {Do not localize}
  {CH fn_CAST_encrypt = 'CAST_encrypt'; }  {Do not localize}
  {CH fn_CAST_decrypt = 'CAST_decrypt'; }  {Do not localize}
  {CH fn_CAST_cbc_encrypt = 'CAST_cbc_encrypt'; }  {Do not localize}
  {CH fn_CAST_cfb64_encrypt = 'CAST_cfb64_encrypt'; }  {Do not localize}
  {CH fn_CAST_ofb64_encrypt = 'CAST_ofb64_encrypt'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_IDEA}
  {CH fn_idea_options = 'idea_options'; }  {Do not localize}
  {CH fn_idea_ecb_encrypt = 'idea_ecb_encrypt'; }  {Do not localize}
  {CH fn_idea_set_encrypt_key = 'idea_set_encrypt_key'; }  {Do not localize}
  {CH fn_idea_set_decrypt_key = 'idea_set_decrypt_key'; }  {Do not localize}
  {CH fn_idea_cbc_encrypt = 'idea_cbc_encrypt'; }  {Do not localize}
  {CH fn_idea_cfb64_encrypt = 'idea_cfb64_encrypt'; }  {Do not localize}
  {CH fn_idea_ofb64_encrypt = 'idea_ofb64_encrypt'; }  {Do not localize}
  {CH fn_idea_encrypt = 'idea_encrypt'; }  {Do not localize}
    {$IFDEF OPENSSL_FIPS}
  {CH fn_private_idea_set_encrypt_key = 'private_idea_set_encrypt_key'; } {Do not localize}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD2}
  {CH fn_MDC2_Init = 'MDC2_Init'; }  {Do not localize}
  {CH fn_MDC2_Update = 'MDC2_Update'; }  {Do not localize}
  {CH fn_MDC2_Final = 'MDC2_Final'; }  {Do not localize}
  {CH fn_MDC2 = 'MDC2'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RSA}
  fn_RSA_new = 'RSA_new';   {Do not localize}
  {CH fn_RSA_new_method = 'RSA_new_method'; }  {Do not localize}
  fn_RSA_size = 'RSA_size';  {Do not localize}
  fn_RSA_generate_key = 'RSA_generate_key';  {Do not localize}
  fn_RSA_generate_key_ex = 'RSA_generate_key_ex';  {Do not localize}
  {CH fn_RSA_X931_derive_ex = 'RSA_X931_derive_ex'; } {Do not localize}
  {CH fn_RSA_X931_generate_key_ex = 'RSA_X931_generate_key_ex'; } {Do not localize}
  fn_RSA_check_key = 'RSA_check_key';  {Do not localize}
  fn_RSA_public_encrypt = 'RSA_public_encrypt';   {Do not localize}
  {CH fn_RSA_private_encrypt = 'RSA_private_encrypt'; }  {Do not localize}
  {CH fn_RSA_public_decrypt = 'RSA_public_decrypt'; }  {Do not localize}
  fn_RSA_private_decrypt = 'RSA_private_decrypt';   {Do not localize}
  fn_RSA_free = 'RSA_free';  {Do not localize}
  {CH fn_RSA_flags = 'RSA_flags'; }  {Do not localize}
  {$IFDEF OPENSSL_FIPS}
  {CH fn_FIPS_rsa_new = 'FIPS_rsa_new'; } {Do not localize}
  {CH fn_FIPS_rsa_free = 'FIPS_rsa_free'; } {Do not localize}
  {$ENDIF}
  {CH fn_RSA_set_default_method = 'RSA_set_default_method'; }  {Do not localize}
  {CH fn_RSA_get_default_method = 'RSA_get_default_method'; }  {Do not localize}
  {CH fn_RSA_get_method = 'RSA_get_method'; }  {Do not localize}
  {CH fn_RSA_set_method = 'RSA_set_method'; }  {Do not localize}
  {CH fn_RSA_memory_lock = 'RSA_memory_lock'; }  {Do not localize}
  {CH fn_RSA_PKCS1_SSLeay = 'RSA_PKCS1_SSLeay'; }  {Do not localize}
  {CH fn_ERR_load_RSA_strings = 'ERR_load_RSA_strings'; }  {Do not localize}
  fn_d2i_RSAPublicKey = 'd2i_RSAPublicKey';   {Do not localize}
  fn_i2d_RSAPublicKey = 'i2d_RSAPublicKey';   {Do not localize}
  fn_d2i_RSAPrivateKey = 'd2i_RSAPrivateKey';   {Do not localize}
  fn_i2d_RSAPrivateKey = 'i2d_RSAPrivateKey';   {Do not localize}
    {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_RSA_print_fp = 'RSA_print_fp'; }  {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_RSA_print = 'RSA_print'; }  {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_RC4}
  {CH fn_i2d_RSA_NET = 'i2d_RSA_NET'; }{Do not localize}
  {CH fn_d2i_RSA_NET = 'd2i_RSA_NET'; }{Do not localize}
  {CH fn_i2d_Netscape_RSA = 'i2d_Netscape_RSA'; }  {Do not localize}
  {CH fn_d2i_Netscape_RSA = 'd2i_Netscape_RSA'; }  {Do not localize}
    {$ENDIF}
  {CH fn_d2i_Netscape_RSA_2 = 'd2i_Netscape_RSA_2'; }  {Do not localize}
  {CH fn_RSA_sign = 'RSA_sign'; }  {Do not localize}
  {CH fn_RSA_verify = 'RSA_verify'; }  {Do not localize}
  {CH fn_RSA_sign_ASN1_OCTET_STRING = 'RSA_sign_ASN1_OCTET_STRING'; }  {Do not localize}
  {CH fn_RSA_verify_ASN1_OCTET_STRING = 'RSA_verify_ASN1_OCTET_STRING'; }  {Do not localize}
  {CH fn_RSA_blinding_on = 'RSA_blinding_on'; }  {Do not localize}
  {CH fn_RSA_blinding_off = 'RSA_blinding_off'; }  {Do not localize}
  {CH fn_RSA_padding_add_PKCS1_type_1 = 'RSA_padding_add_PKCS1_type_1'; }  {Do not localize}
  {CH fn_RSA_padding_check_PKCS1_type_1 = 'RSA_padding_check_PKCS1_type_1'; }  {Do not localize}
  {CH fn_RSA_padding_add_PKCS1_type_2 = 'RSA_padding_add_PKCS1_type_2'; }  {Do not localize}
  {CH fn_RSA_padding_check_PKCS1_type_2 = 'RSA_padding_check_PKCS1_type_2'; }  {Do not localize}
  {CH fn_RSA_padding_add_PKCS1_OAEP = 'RSA_padding_add_PKCS1_OAEP'; }  {Do not localize}
  {CH fn_RSA_padding_check_PKCS1_OAEP = 'RSA_padding_check_PKCS1_OAEP'; }  {Do not localize}
  {CH fn_RSA_padding_add_SSLv23 = 'RSA_padding_add_SSLv23'; }  {Do not localize}
  {CH fn_RSA_padding_check_SSLv23 = 'RSA_padding_check_SSLv23'; }  {Do not localize}
  {CH fn_RSA_padding_add_none = 'RSA_padding_add_none'; }  {Do not localize}
  {CH fn_RSA_padding_check_none = 'RSA_padding_check_none'; }  {Do not localize}
  {CH fn_RSA_get_ex_new_index = 'RSA_get_ex_new_index'; }  {Do not localize}
  {CH fn_RSA_set_ex_data = 'RSA_set_ex_data'; }  {Do not localize}
  {CH fn_RSA_get_ex_data = 'RSA_get_ex_data'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DH}
  {CH fn_DH_OpenSSL = 'DH_OpenSSL'; } {Do not localize}
  {CH fn_DH_set_default_method = 'DH_set_default_method'; } {Do not localize}
  {CH fn_DH_set_method = 'DH_set_method'; } {Do not localize}
  {CH fn_DH_new_method = 'DH_new_method'; } {Do not localize}
  {CH fn_DH_new = 'DH_new'; }  {Do not localize}
  {CH fn_DH_up_ref = 'DH_up_ref'; } {Do not localize}
  {CH fn_DH_free = 'DH_free'; }  {Do not localize}
  {CH fn_DH_size = 'DH_size'; }  {Do not localize}
    {$IFNDEF OPENSSL_NO_DEPRECATED}
  {CH fn_DH_generate_parameters = 'DH_generate_parameters'; }  {Do not localize}
    {$ENDIF}
  {CH fn_DH_generate_parameters_ex = 'DH_generate_parameters_ex'; } {Do not localize}
  {CH fn_DH_get_ex_new_index = 'DH_get_ex_new_index'; } {Do not localize}
  {CH fn_DH_set_ex_data = 'DH_set_ex_data'; } {Do not localize}
  {CH fn_DH_get_ex_data = 'DH_get_ex_data'; } {Do not localize}
  {CH fn_DH_check = 'DH_check'; }  {Do not localize}
  {CH fn_DH_check_pub_key = 'DH_check_pub_key'; } {Do not localize}
  {CH fn_DH_generate_key = 'DH_generate_key'; }  {Do not localize}
  {CH fn_DH_compute_key = 'DH_compute_key'; }  {Do not localize}
  fn_d2i_DHparams = 'd2i_DHparams';   {Do not localize}
  fn_i2d_DHparams = 'i2d_DHparams';   {Do not localize}
  {CH fn_DH_OpenSSL = 'DH_OpenSSL'; } {Do not localize}
  {$IFDEF OPENSSL_FIPS}
  {CH fn_FIPS_dh_new = 'FIPS_dh_new'; } {Do not localize}
  {CH fn_FIPS_dh_free = 'FIPS_dh_free'; } {Do not localize}
  {$ENDIF}
    {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_DHparams_print_fp = 'DHparams_print_fp'; }  {Do not localize}
    {$ENDIF}
  {CH fn_DHparams_print = 'DHparams_print'; }  {Do not localize}
  {$ENDIF}
  {CH fn_ERR_load_DH_strings = 'ERR_load_DH_strings'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_DSA}
  {CH fn_DSA_SIG_new = 'DSA_SIG_new'; }  {Do not localize}
  {CH fn_DSA_SIG_free = 'DSA_SIG_free'; }  {Do not localize}
  {CH fn_i2d_DSA_SIG = 'i2d_DSA_SIG'; }  {Do not localize}
  {CH fn_d2i_DSA_SIG = 'd2i_DSA_SIG'; }  {Do not localize}
  {CH fn_DSA_do_sign = 'DSA_do_sign'; }  {Do not localize}
  {CH fn_DSA_do_verify = 'DSA_do_verify'; }  {Do not localize}
    {$IFDEF OPENSSL_FIPS}
  {CH fn_FIPS_dsa_new = 'FIPS_dsa_new'; } {Do not localize}
  {CH fn_FIPS_dsa_free = 'FIPS_dsa_free'; } {Co not localize}
    {$ENDIF}
  {CH fn_DSA_new = 'DSA_new'; }  {Do not localize}
  {CH fn_DSA_size = 'DSA_size'; }  {Do not localize}
  {CH fn_DSA_sign_setup = 'DSA_sign_setup'; }  {Do not localize}
  {CH fn_DSA_sign = 'DSA_sign'; }  {Do not localize}
  {CH fn_DSA_verify = 'DSA_verify'; }  {Do not localize}
  {CH fn_DSA_free = 'DSA_free'; }  {Do not localize}
  {CH fn_ERR_load_DSA_strings = 'ERR_load_DSA_strings'; }  {Do not localize}

    {$IFNDEF OPENSSL_NO_DEPRECATED}
  {CH fn_DSA_generate_parameters = 'DSA_generate_parameters'; }  {Do not localize}
    {$ENDIF}
  {CH fn_DSA_generate_parameters_ex = 'DSA_generate_parameters_ex'; } {Do not localize}
  {CH fn_DSA_generate_key = 'DSA_generate_key'; }  {Do not localize}
   fn_d2i_DSAPublicKey = 'd2i_DSAPublicKey';  {Do not localize}
   fn_i2d_DSAPublicKey = 'i2d_DSAPublicKey';   {Do not localize}
   fn_d2i_DSAPrivateKey = 'd2i_DSAPrivateKey';   {Do not localize}
  fn_i2d_DSAPrivateKey = 'i2d_DSAPrivateKey';   {Do not localize}
  fn_i2d_DSAparams = 'i2d_DSAparams';   {Do not localize}
  fn_d2i_DSAparams = 'd2i_DSAparams';   {Do not localize}
    {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_DSAparams_print = 'DSAparams_print'; }  {Do not localize}
  {CH fn_DSA_print = 'DSA_print'; }  {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_DSAparams_print_fp = 'DSAparams_print_fp'; }  {Do not localize}
  {CH fn_DSA_print_fp = 'DSA_print_fp'; }  {Do not localize}
    {$ENDIF}
  {CH fn_DSA_is_prime = 'DSA_is_prime'; }  {Do not localize}
    {$IFNDEF OPENSSL_NO_DH}
  {CH fn_DSA_dup_DH = 'DSA_dup_DH'; }  {Do not localize}
    {$ENDIF}
    {$IFDEF OPENSSL_FIPS}
  {CH fn_FIPS_dsa_sig_encode = 'FIPS_dsa_sig_encode'; } {Do not localize}
  {CH fn_FIPS_dsa_sig_decode = 'FIPS_dsa_sig_decode'; } {Do not localize}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_EC}
  {CH fn_EC_GFp_simple_method = 'EC_GFp_simple_method'; } {Do not localize}
  {CH fn_EC_GFp_mont_method = 'EC_GFp_mont_method'; } {Do not localize}
  {CH fn_EC_GFp_nist_method = 'EC_GFp_nist_method'; } {Do not localize}
  {CH fn_EC_GF2m_simple_method = 'EC_GF2m_simple_method'; } {Do not localize}
  {CH fn_EC_GROUP_new = 'EC_GROUP_new'; } {Do not localize}
  {CH fn_EC_GROUP_free = 'EC_GROUP_free'; } {Do not localize}
  {CH fn_EC_GROUP_clear_free = 'EC_GROUP_clear_free'; } {Do not localize}
  {CH fn_EC_GROUP_copy = 'EC_GROUP_copy'; } {Do not localize}
  {CH fn_EC_GROUP_dup = 'EC_GROUP_dup'; } {Do not localize}
  {CH fn_EC_GROUP_method_of = 'EC_GROUP_method_of'; } {Do not localize}
  {CH fn_EC_METHOD_get_field_type = 'EC_METHOD_get_field_type'; } {Do not localize}
  {CH fn_EC_GROUP_set_generator = 'EC_GROUP_set_generator'; } {Do not localize}
  {CH fn_EC_GROUP_get0_generator = 'EC_GROUP_get0_generator'; } {Do not localize}
  {CH fn_EC_GROUP_get_order = 'EC_GROUP_get_order'; } {Do not localize}
  {CH fn_EC_GROUP_get_cofactor = 'EC_GROUP_get_cofactor'; } {Do not localize}
  {CH fn_EC_GROUP_set_curve_name ='EC_GROUP_set_curve_name'; } {Do not localize}
  {CH fn_EC_GROUP_get_curve_name = 'EC_GROUP_get_curve_name'; } {Do not localize}
  {CH fn_EC_GROUP_set_asn1_flag = 'EC_GROUP_set_asn1_flag'; } {Do not localize}
  {CH fn_EC_GROUP_get_asn1_flag = 'EC_GROUP_get_asn1_flag'; } {Do not localize}
  {CH fn_EC_GROUP_set_point_conversion_form = 'EC_GROUP_set_point_conversion_form'; } {Do not localize}
  {CH fn_EC_GROUP_get_point_conversion_form = 'EC_GROUP_get_point_conversion_form'; } {Do not localize}
  {CH fn_EC_GROUP_get0_seed = 'EC_GROUP_get0_seed'; } {Do not localize}
  {CH fn_EC_GROUP_get_seed_len = 'EC_GROUP_get_seed_len'; } {Do not localize}
  {CH fn_EC_GROUP_set_seed = 'EC_GROUP_set_seed'; } {Do not localize}
  {CH fn_EC_GROUP_set_curve_GFp = 'EC_GROUP_set_curve_GFp'; } {Do not localize}
  {CH fn_EC_GROUP_get_curve_GFp = 'EC_GROUP_get_curve_GFp'; } {Do not localize}
  {CH fn_EC_GROUP_set_curve_GF2m = 'EC_GROUP_set_curve_GF2m'; } {Do not localize}
  {CH fn_EC_GROUP_get_curve_GF2m = 'EC_GROUP_get_curve_GF2m'; } {Do not localize}
  {CH fn_EC_GROUP_get_degree = 'EC_GROUP_get_degree'; } {Do not localize}
  {CH fn_EC_GROUP_check = 'EC_GROUP_check'; } {Do not localize}
  {CH fn_EC_GROUP_check_discriminant = 'EC_GROUP_check_discriminant'; } {Do not localize}
  {CH fn_EC_GROUP_cmp = 'EC_GROUP_cmp'; } {Do not localize}
  {CH fn_EC_GROUP_new_curve_GFp = 'EC_GROUP_new_curve_GFp'; } {Do not localize}
  {CH fn_EC_GROUP_new_curve_GF2m = 'EC_GROUP_new_curve_GF2m'; } {Do not localize}
  {CH fn_EC_GROUP_new_by_curve_name = 'EC_GROUP_new_by_curve_name'; } {Do not localize}
  {CH fn_EC_get_builtin_curves = 'EC_get_builtin_curves'; } {Do not localize}
  {CH fn_EC_POINT_new = 'EC_POINT_new'; } {Do not localize}
  {CH fn_EC_POINT_free  = 'EC_POINT_free'; } {Do not localize}
  {CH fn_EC_POINT_clear_free  = 'EC_POINT_clear_free'; } {Do not localize}
  {CH fn_EC_POINT_copy = 'EC_POINT_copy'; } {Do not localize}
  {CH fn_EC_POINT_dup = 'EC_POINT_dup'; } {Do not localize}
  {CH fn_EC_POINT_method_of = 'EC_POINT_method_of'; } {Do not localize}
  {CH fn_EC_POINT_set_to_infinity = 'EC_POINT_set_to_infinity'; } {Do not localize}
  {CH fn_EC_POINT_set_Jprojective_coordinates_GFp = 'EC_POINT_set_Jprojective_coordinates_GFp'; } {Do not localize}
  {CH fn_EC_POINT_get_Jprojective_coordinates_GFp = 'EC_POINT_get_Jprojective_coordinates_GFp'; } {Do not localize}
  {CH fn_EC_POINT_set_affine_coordinates_GFp = 'EC_POINT_set_affine_coordinates_GFp'; } {Do not localize}
  {CH fn_EC_POINT_get_affine_coordinates_GFp = 'EC_POINT_get_affine_coordinates_GFp'; } {Do not localize}
  {CH fn_EC_POINT_set_compressed_coordinates_GFp = 'EC_POINT_set_compressed_coordinates_GFp'; } {Do not localize}
  {CH fn_EC_POINT_set_affine_coordinates_GF2m = 'EC_POINT_set_affine_coordinates_GF2m'; } {Do not localize}
  {CH fn_EC_POINT_set_compressed_coordinates_GF2m = 'EC_POINT_set_compressed_coordinates_GF2m'; } {Do not localize}
  {CH fn_EC_POINT_point2oct = 'EC_POINT_point2oct'; } {Do not localize}
  {CH fn_EC_POINT_oct2point = 'EC_POINT_oct2point'; } {Do not localize}
  {CH fn_EC_POINT_point2bn = 'EC_POINT_point2bn'; } {Do not localize}
  {CH fn_EC_POINT_bn2point = 'EC_POINT_bn2point'; } {Do not localize}
  {CH fn_EC_POINT_point2hex = 'EC_POINT_point2hex'; } {Do not localize}
  {CH fn_EC_POINT_hex2point = 'EC_POINT_hex2point'; } {Do not localize}
  {CH fn_EC_POINT_add = 'EC_POINT_add'; } {Do not localize}
  {CH fn_EC_POINT_dbl = 'EC_POINT_dbl'; } {Do not localize}
  {CH fn_EC_POINT_invert = 'EC_POINT_invert'; } {Do not localize}
  {CH fn_EC_POINT_is_at_infinity = 'EC_POINT_is_at_infinity'; } {Do not localize}
  {CH fn_EC_POINT_is_on_curve = 'EC_POINT_is_on_curve'; } {Do not localize}
  {CH fn_EC_POINT_cmp = 'EC_POINT_cmp'; } {Do not localize}
  {CH fn_EC_POINT_make_affine = 'EC_POINT_make_affine'; } {Do not localize}
  {CH fn_EC_POINTs_make_affine = 'EC_POINTs_make_affine'; } {Do not localize}
  {CH fn_EC_POINTs_mul = 'EC_POINTs_mul'; } {Do not localize}
  {CH fn_EC_POINT_mul = 'EC_POINT_mul'; } {Do not localize}
  {CH fn_EC_GROUP_precompute_mult = 'EC_GROUP_precompute_mult'; } {Do not localize}
  {CH fn_EC_GROUP_have_precompute_mult = 'EC_GROUP_have_precompute_mult'; } {Do not localize}
  {CH fn_EC_GROUP_get_basis_type = 'EC_GROUP_get_basis_type'; } {Do not localize}
  {CH fn_EC_GROUP_get_trinomial_basis = 'EC_GROUP_get_trinomial_basis'; } {Do not localize}
  {CH fn_EC_GROUP_get_pentanomial_basis = 'EC_GROUP_get_pentanomial_basis'; } {Do not localize}
  {CH fn_d2i_ECPKParameters = 'd2i_ECPKParameters'; } {Do not localize}
  {CH fn_i2d_ECPKParameters = 'i2d_ECPKParameters'; } {Do not localize}
    {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_ECPKParameters_print = 'ECPKParameters_print'; } {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_ECPKParameters_print_fp = 'ECPKParameters_print_fp'; }  {Do not localize}
    {$ENDIF}
  {CH fn_EC_KEY_new = 'EC_KEY_new'; } {Do not localize}
  {CH fn_EC_KEY_new_by_curve_name = 'EC_KEY_new_by_curve_name'; } {Do not localize}
  {CH fn_EC_KEY_free = 'EC_KEY_free'; } {Do not localize}
  {CH fn_EC_KEY_copy = 'EC_KEY_copy'; } {Do not localize}
  {CH fn_EC_KEY_dup = 'EC_KEY_dup'; } {Do not localize}
  {CH fn_EC_KEY_up_ref = 'EC_KEY_up_ref'; } {Do not localize}
  {CH fn_EC_KEY_get0_group = 'EC_KEY_get0_group'; } {Do not localize}
  {CH fn_EC_KEY_set_group = 'EC_KEY_set_group'; } {Do not localize}
  {CH fn_EC_KEY_get0_private_key = 'EC_KEY_get0_private_key'; } {Do not localize}
  {CH fn_EC_KEY_set_private_key = 'EC_KEY_set_private_key'; } {Do not localize}
  {CH fn_EC_KEY_get0_public_key = 'EC_KEY_get0_public_key'; } {Do not localize}
  {CH fn_EC_KEY_set_public_key = 'EC_KEY_set_public_key'; } {Do not localize}
  {CH fn_EC_KEY_get_enc_flags = 'EC_KEY_get_enc_flags'; } {Do not localize}
  {CH fn_EC_KEY_set_enc_flags = 'EC_KEY_set_enc_flags'; } {Do not localize}
  {CH fn_EC_KEY_get_conv_form = 'EC_KEY_get_conv_form'; } {Do not localize}
  {CH fn_EC_KEY_set_conv_form = 'EC_KEY_set_conv_form'; } {Do not localize}
  {CH fn_EC_KEY_get_key_method_data = 'EC_KEY_get_key_method_data'; } {Do not localize}
  {CH fn_EC_KEY_insert_key_method_data = 'EC_KEY_insert_key_method_data'; } {Do not localize}
  {CH fn_EC_KEY_set_asn1_flag = 'EC_KEY_set_asn1_flag'; } {Do not localize}
  {CH fn_EC_KEY_precompute_mult = 'EC_KEY_precompute_mult'; } {Do not localize}
  {CH fn_EC_KEY_generate_key  = 'EC_KEY_generate_key'; } {Do not localize}
  {CH fn_EC_KEY_check_key = 'EC_KEY_check_key'; } {Do not localize}
  {CH fn_d2i_ECPrivateKey = 'd2i_ECPrivateKey'; } {Do not localize}
  {CH fn_i2d_ECPrivateKey = 'i2d_ECPrivateKey'; } {Do not localize}
  {CH fn_d2i_ECParameters = 'd2i_ECParameters'; } {Do not localize}
  {CH fn_i2d_ECParameters = 'i2d_ECParameters'; } {Do not localize}
  {CH fn_o2i_ECPublicKey = 'o2i_ECPublicKey'; } {Do not localize}
  {CH fn_i2o_ECPublicKey = 'i2o_ECPublicKey'; } {Do not localize}
    {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_ECParameters_print = 'ECParameters_print'; } {Do not localize}
  {CH fn_EC_KEY_print = 'EC_KEY_print'; } {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_ECParameters_print_fp = 'ECParameters_print_fp'; } {Do not localize}
  {CH fn_EC_KEY_print_fp = 'EC_KEY_print_fp'; } {Do not localize}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_ECDSA}
  {CH fn_ECDSA_SIG_new = 'ECDSA_SIG_new'; } {Do not localize}
  {CH fn_ECDSA_SIG_free = 'ECDSA_SIG_free'; } {Do not localize}
  {CH fn_i2d_ECDSA_SIG = 'i2d_ECDSA_SIG'; } {Do not localize}
  {CH fn_d2i_ECDSA_SIG = 'd2i_ECDSA_SIG'; } {Do not localize}
  {CH fn_ECDSA_do_sign = 'ECDSA_do_sign'; } {Do not localize}
  {CH fn_ECDSA_do_sign_ex = 'ECDSA_do_sign_ex'; } {Do not localize}
  {CH fn_ECDSA_do_verify = 'ECDSA_do_verify'; } {Do not localize}
  {CH fn_ECDSA_OpenSSL = 'ECDSA_OpenSSL'; } {Do not localize}
  {CH fn_ECDSA_set_default_method = 'ECDSA_set_default_method'; } {Do not localize}
  {CH fn_ECDSA_get_default_method = 'ECDSA_get_default_method'; } {Do not localize}
  {CH fn_ECDSA_set_method = 'ECDSA_set_method'; } {Do not localize}
  {CH fn_ECDSA_size = 'ECDSA_size'; } {Do not localize}
  {CH fn_ECDSA_sign_setup = 'ECDSA_sign_setup'; } {Do not localize}
  {CH fn_ECDSA_sign = 'ECDSA_sign'; } {Do not localize}
  {CH fn_ECDSA_sign_ex = 'ECDSA_sign_ex'; } {Do not localize}
  {CH fn_ECDSA_verify = 'ECDSA_verify'; } {Do not localize}
  {CH fn_ECDSA_get_ex_new_index = 'ECDSA_get_ex_new_index'; } {Do not localize}
  {CH fn_ECDSA_set_ex_data = 'ECDSA_set_ex_data'; } {Do not localize}
  {CH fn_ECDSA_get_ex_data = 'ECDSA_get_ex_data'; } {Do not localize}
  {CH fn_ERR_load_ECDSA_strings = 'ERR_load_ECDSA_strings'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_ECDH}
  {CH fn_ECDH_OpenSSL = 'ECDH_OpenSSL'; } {Do not localize}
  {CH fn_ECDH_set_default_method = 'ECDH_set_default_method'; } {Do not localize}
  {CH fn_ECDH_get_default_method = 'ECDH_get_default_method'; } {Do not localize}
  {CH fn_ECDH_set_method = 'ECDH_set_method'; } {Do not localize}
  {CH fn_ECDH_compute_key = 'ECDH_compute_key'; } {Do not localize}
  {CH fn_ECDH_get_ex_new_index = 'ECDH_get_ex_new_index'; } {Do not localize}
  {CH fn_ECDH_set_ex_data = 'ECDH_set_ex_data'; } {Do not localize}
  {CH fn_ECDH_get_ex_data = 'ECDH_get_ex_data'; } {Do not localize}
  {CH fn_ERR_load_ECDH_strings = 'ERR_load_ECDH_strings'; } {Do not localize}
  {$ENDIF}
  {CH fn_BN_value_one = 'BN_value_one'; }  {Do not localize}
  {CH fn_BN_options = 'BN_options'; }  {Do not localize}
  {CH fn_BN_CTX_new = 'BN_CTX_new'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_DEPRECATED}
  {CH fn_BN_CTX_init = 'BN_CTX_init'; }  {Do not localize}
  {$ENDIF}
  {CH fn_BN_CTX_free = 'BN_CTX_free'; }  {Do not localize}
  {CH fn_BN_rand = 'BN_rand'; }  {Do not localize}
  {CH fn_BN_pseudo_rand = 'BN_pseudo_rand';  } {Do not localize}
  {CH fn_BN_rand_range = 'BN_rand_range';  } {Do not localize}
  {CH fn_BN_pseudo_rand_range = 'BN_pseudo_rand_range';  } {Do not localize}
  {CH fn_BN_num_bits = 'BN_num_bits'; }  {Do not localize}
  {CH fn_BN_num_bits_word = 'BN_num_bits_word'; }  {Do not localize}
  {CH fn_BN_new = 'BN_new'; }  {Do not localize}
  {CH fn_BN_init = 'BN_init'; }  {Do not localize}
  {CH fn_BN_clear_free = 'BN_clear_free'; }  {Do not localize}
  {CH fn_BN_copy = 'BN_copy'; }  {Do not localize}
  {CH fn_BN_bin2bn = 'BN_bin2bn'; }  {Do not localize}
  {CH fn_BN_bn2bin = 'BN_bn2bin'; }  {Do not localize}
  {CH fn_BN_mpi2bn = 'BN_mpi2bn'; }  {Do not localize}
  {CH fn_BN_bn2mpi = 'BN_bn2mpi'; }  {Do not localize}
  {CH fn_BN_sub = 'BN_sub'; }  {Do not localize}
  {CH fn_BN_usub = 'BN_usub'; }  {Do not localize}
  {CH fn_BN_uadd = 'BN_uadd'; }  {Do not localize}
  {CH fn_BN_add = 'BN_add'; }  {Do not localize}
  {CH fn_BN_mod = 'BN_mod'; }  {Do not localize}
  {CH fn_BN_div = 'BN_div'; }  {Do not localize}
  {CH fn_BN_mul = 'BN_mul'; }  {Do not localize}
  {CH fn_BN_sqr = 'BN_sqr'; }  {Do not localize}
  {CH fn_BN_mod_word = 'BN_mod_word'; }  {Do not localize}
  {CH fn_BN_div_word = 'BN_div_word'; }  {Do not localize}
  {CH fn_BN_mul_word = 'BN_mul_word'; }  {Do not localize}
  {CH fn_BN_add_word = 'BN_add_word'; }  {Do not localize}
  {CH fn_BN_sub_word = 'BN_sub_word'; }  {Do not localize}
  {CH fn_BN_set_word = 'BN_set_word'; }  {Do not localize}
  {CH fn_BN_get_word = 'BN_get_word'; }  {Do not localize}
  {CH fn_BN_cmp = 'BN_cmp'; }  {Do not localize}
  {CH fn_BN_free = 'BN_free'; }  {Do not localize}
  {CH fn_BN_is_bit_set = 'BN_is_bit_set'; }  {Do not localize}
  {CH fn_BN_lshift = 'BN_lshift'; }  {Do not localize}
  {CH fn_BN_lshift1 = 'BN_lshift1'; }  {Do not localize}
  {CH fn_BN_exp = 'BN_exp'; }  {Do not localize}
  {CH fn_BN_mod_exp = 'BN_mod_exp'; }  {Do not localize}
  {CH fn_BN_mod_exp_mont = 'BN_mod_exp_mont'; }  {Do not localize}
  {CH fn_BN_mod_exp2_mont = 'BN_mod_exp2_mont'; }  {Do not localize}
  {CH fn_BN_mod_exp_simple = 'BN_mod_exp_simple'; }  {Do not localize}
  {CH fn_BN_mask_bits = 'BN_mask_bits'; }  {Do not localize}
  {CH fn_BN_mod_mul = 'BN_mod_mul'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_BN_print_fp = 'BN_print_fp'; }  {Do not localize}
  {$ENDIF}
  {CH fn_BN_print = 'BN_print'; }  {Do not localize}
  {CH fn_BN_reciprocal = 'BN_reciprocal'; }  {Do not localize}
  {CH fn_BN_rshift = 'BN_rshift'; }  {Do not localize}
  {CH fn_BN_rshift1 = 'BN_rshift1'; }  {Do not localize}
  {CH fn_BN_clear = 'BN_clear'; }  {Do not localize}
  {CH fn_bn_expand2 = 'bn_expand2'; }  {Do not localize}
  {CH fn_BN_dup = 'BN_dup'; }  {Do not localize}
  {CH fn_BN_ucmp = 'BN_ucmp'; }  {Do not localize}
  {CH fn_BN_set_bit = 'BN_set_bit'; }  {Do not localize}
  {CH fn_BN_clear_bit = 'BN_clear_bit'; }  {Do not localize}
  fn_BN_bn2hex = 'BN_bn2hex';   {Do not localize}
  {CH fn_BN_bn2dec = 'BN_bn2dec'; }  {Do not localize}
  fn_BN_hex2bn = 'BN_hex2bn';   {Do not localize}
  {CH fn_BN_dec2bn = 'BN_dec2bn'; }  {Do not localize}
  {CH fn_BN_gcd = 'BN_gcd'; }  {Do not localize}
  {CH fn_BN_mod_inverse = 'BN_mod_inverse'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_DEPRECATED}
  {CH fn_BN_generate_prime = 'BN_generate_prime'; }  {Do not localize}
  {CH fn_BN_is_prime = 'BN_is_prime'; }  {Do not localize}
  {CH fn_BN_is_prime_fasttest = 'BN_is_prime_fasttest'; } {Do not localize}
  {$ENDIF}
  {CH fn_ERR_load_BN_strings = 'ERR_load_BN_strings'; }  {Do not localize}
  {CH fn_bn_mul_add_words = 'bn_mul_add_words'; }  {Do not localize}
  {CH fn_bn_mul_words = 'bn_mul_words'; }  {Do not localize}
  {CH fn_bn_sqr_words = 'bn_sqr_words'; }  {Do not localize}
  {CH fn_bn_div_words = 'bn_div_words'; }  {Do not localize}
  {CH fn_bn_add_words = 'bn_add_words'; }  {Do not localize}
  {CH fn_bn_sub_words = 'bn_sub_words'; }  {Do not localize}
  {CH fn_BN_MONT_CTX_new = 'BN_MONT_CTX_new'; }  {Do not localize}
  {CH fn_BN_MONT_CTX_init = 'BN_MONT_CTX_init'; }  {Do not localize}
  {CH fn_BN_mod_mul_montgomery = 'BN_mod_mul_montgomery'; }  {Do not localize}
  {CH fn_BN_from_montgomery = 'BN_from_montgomery'; }  {Do not localize}
  {CH fn_BN_MONT_CTX_free = 'BN_MONT_CTX_free'; }  {Do not localize}
  {CH fn_BN_MONT_CTX_set = 'BN_MONT_CTX_set'; }  {Do not localize}
  {CH fn_BN_MONT_CTX_copy = 'BN_MONT_CTX_copy'; }  {Do not localize}
  {CH fn_BN_BLINDING_new = 'BN_BLINDING_new'; }  {Do not localize}
  {CH fn_BN_BLINDING_free = 'BN_BLINDING_free'; }  {Do not localize}
  {CH fn_BN_BLINDING_update = 'BN_BLINDING_update'; }  {Do not localize}
  {CH fn_BN_BLINDING_convert = 'BN_BLINDING_convert'; }  {Do not localize}
  {CH fn_BN_BLINDING_invert = 'BN_BLINDING_invert'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_DEPRECATED}
  {CH fn_BN_set_params = 'BN_set_params'; }  {Do not localize}
  {CH fn_BN_get_params = 'BN_get_params'; }  {Do not localize}
  {$ENDIF}
  {CH fn_BN_RECP_CTX_init = 'BN_RECP_CTX_init'; }  {Do not localize}
  {CH fn_BN_RECP_CTX_new = 'BN_RECP_CTX_new'; }  {Do not localize}
  {CH fn_BN_RECP_CTX_free = 'BN_RECP_CTX_free'; }  {Do not localize}
  {CH fn_BN_RECP_CTX_set = 'BN_RECP_CTX_set'; }  {Do not localize}
  {CH fn_BN_mod_mul_reciprocal = 'BN_mod_mul_reciprocal'; }  {Do not localize}
  {CH fn_BN_mod_exp_recp = 'BN_mod_exp_recp'; }  {Do not localize}
  {CH fn_BN_div_recp = 'BN_div_recp'; }  {Do not localize}
  {CH fn_BN_GF2m_add = 'BN_GF2m_add'; } {Do not localize}
  {CH fn_BN_GF2m_mod = 'BN_GF2m_mod'; } {Do not localize}
  {CH fn_BN_GF2m_mod_mul = 'BN_GF2m_mod_mul'; } {Do not localize}
  {CH fn_BN_GF2m_mod_sqr = 'BN_GF2m_mod_sqr'; } {Do not localize}
  {CH fn_BN_GF2m_mod_inv = 'BN_GF2m_mod_inv'; } {Do not localize}
  {CH fn_BN_GF2m_mod_div = 'BN_GF2m_mod_div'; } {Do not localize}
  {CH fn_BN_GF2m_mod_exp = 'BN_GF2m_mod_exp'; } {Do not localize}
  {CH fn_BN_GF2m_mod_sqrt = 'BN_GF2m_mod_sqrt'; } {Do not localize}
  {CH fn_BN_GF2m_mod_solve_quad = 'BN_GF2m_mod_solve_quad'; } {Do not localize}
  {CH fn_BN_GF2m_mod_arr = 'BN_GF2m_mod_arr'; } {Do not localize}
  {CH fn_BN_GF2m_mod_mul_arr = 'BN_GF2m_mod_mul_arr'; } {Do not localize}
  {CH fn_BN_GF2m_mod_sqr_arr = 'BN_GF2m_mod_sqr_arr'; } {Do not localize}
  {CH fn_BN_GF2m_mod_inv_arr = 'BN_GF2m_mod_inv_arr'; } {Do not localize}
  {CH fn_BN_GF2m_mod_div_arr = 'BN_GF2m_mod_div_arr'; } {Do not localize}
  {CH fn_BN_GF2m_mod_exp_arr = 'BN_GF2m_mod_exp_arr'; } {Do not localize}
  {CH fn_BN_GF2m_mod_sqrt_arr = 'BN_GF2m_mod_sqrt_arr'; } {Do not localize}
  {CH fn_BN_GF2m_mod_solve_quad_arr = 'BN_GF2m_mod_solve_quad_arr'; } {Do not localize}
  {CH fn_BN_GF2m_poly2arr = 'BN_GF2m_poly2arr'; } {Do not localize}
  {CH fn_BN_GF2m_arr2poly = 'BN_GF2m_arr2poly'; } {Do not localize}
  // faster mod functions for the 'NIST primes'
  // 0 <= a < p^2
  {CH fn_BN_nist_mod_192 = 'BN_nist_mod_192'; } {Do not localize}
  {CH fn_BN_nist_mod_224 = 'BN_nist_mod_224'; } {Do not localize}
  {CH fn_BN_nist_mod_256 = 'BN_nist_mod_256'; } {Do not localize}
  {CH fn_BN_nist_mod_384 = 'BN_nist_mod_384'; } {Do not localize}
  {CH fn_BN_nist_mod_521 = 'BN_nist_mod_521'; } {Do not localize}
  {CH fn_BN_get0_nist_prime_192 = 'BN_get0_nist_prime_192'; } {Do not localize}
  {CH fn_BN_get0_nist_prime_224 = 'BN_get0_nist_prime_224'; } {Do not localize}
  {CH fn_BN_get0_nist_prime_256 = 'BN_get0_nist_prime_256'; } {Do not localize}
  {CH fn_BN_get0_nist_prime_384 = 'BN_get0_nist_prime_384'; } {Do not localize}
  {CH fn_BN_get0_nist_prime_521 = 'BN_get0_nist_prime_521'; } {Do not localize}
  //
  {CH fn_get_rfc2409_prime_768 = 'get_rfc2409_prime_768'; } {Do not localize}
  {CH fn_get_rfc2409_prime_1024 = 'get_rfc2409_prime_1024'; } {Do not localize}
  {CH fn_get_rfc3526_prime_1536 = 'get_rfc3526_prime_1536'; } {Do not localize}
  {CH fn_get_rfc3526_prime_2048 = 'get_rfc3526_prime_2048'; } {Do not localize}
  {CH fn_get_rfc3526_prime_3072 = 'get_rfc3526_prime_3072'; } {Do not localize}
  {CH fn_get_rfc3526_prime_4096 = 'get_rfc3526_prime_4096'; } {Do not localize}
  {CH fn_get_rfc3526_prime_6144 = 'get_rfc3526_prime_6144'; } {Do not localize}
  {CH fn_get_rfc3526_prime_8192 = 'get_rfc3526_prime_8192'; } {Do not localize}
  {CH fn_BN_bntest_rand = 'BN_bntest_rand'; } {Do not localize}
  {CH fn_sk_ASN1_TYPE_new = 'sk_ASN1_TYPE_new'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_new_null = 'sk_ASN1_TYPE_new_null'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_free = 'sk_ASN1_TYPE_free'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_num = 'sk_ASN1_TYPE_num'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_value = 'sk_ASN1_TYPE_value'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_set = 'sk_ASN1_TYPE_set'; }  {Do not localize}
  {CH fn_ASN1_TYPE_set1 = 'ASN1_TYPE_set1'; } {Do not localize}
  {CH fn_sk_ASN1_TYPE_zero = 'sk_ASN1_TYPE_zero'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_push = 'sk_ASN1_TYPE_push'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_unshift = 'sk_ASN1_TYPE_unshift'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_find = 'sk_ASN1_TYPE_find'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_delete = 'sk_ASN1_TYPE_delete'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_delete_ptr = 'sk_ASN1_TYPE_delete_ptr'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_insert = 'sk_ASN1_TYPE_insert'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_dup = 'sk_ASN1_TYPE_dup'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_pop_free = 'sk_ASN1_TYPE_pop_free'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_shift = 'sk_ASN1_TYPE_shift'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_pop = 'sk_ASN1_TYPE_pop'; }  {Do not localize}
  {CH fn_sk_ASN1_TYPE_sort = 'sk_ASN1_TYPE_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_ASN1_TYPE = 'i2d_ASN1_SET_OF_ASN1_TYPE'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_ASN1_TYPE = 'd2i_ASN1_SET_OF_ASN1_TYPE'; }  {Do not localize}
  {CH fn_ASN1_TYPE_new = 'ASN1_TYPE_new'; }  {Do not localize}
  {CH fn_ASN1_TYPE_free = 'ASN1_TYPE_free'; }  {Do not localize}
  {CH fn_i2d_ASN1_TYPE = 'i2d_ASN1_TYPE'; }  {Do not localize}
  {CH fn_d2i_ASN1_TYPE = 'd2i_ASN1_TYPE'; }  {Do not localize}
  {CH fn_ASN1_TYPE_get = 'ASN1_TYPE_get'; }  {Do not localize}
  {CH fn_ASN1_TYPE_set = 'ASN1_TYPE_set'; }  {Do not localize}
  {CH fn_ASN1_TYPE_set1 = 'ASN1_TYPE_set1'; } {Do not localize}
  {CH fn_ASN1_OBJECT_new = 'ASN1_OBJECT_new'; }  {Do not localize}
  {CH fn_ASN1_OBJECT_free = 'ASN1_OBJECT_free'; }  {Do not localize}
  {CH fn_i2d_ASN1_OBJECT = 'i2d_ASN1_OBJECT'; }  {Do not localize}
  {CH fn_d2i_ASN1_OBJECT = 'd2i_ASN1_OBJECT'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_new = 'sk_ASN1_OBJECT_new'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_new_null = 'sk_ASN1_OBJECT_new_null'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_free = 'sk_ASN1_OBJECT_free'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_num = 'sk_ASN1_OBJECT_num'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_value = 'sk_ASN1_OBJECT_value'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_set = 'sk_ASN1_OBJECT_set'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_zero = 'sk_ASN1_OBJECT_zero'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_push = 'sk_ASN1_OBJECT_push'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_unshift = 'sk_ASN1_OBJECT_unshift'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_find = 'sk_ASN1_OBJECT_find'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_delete = 'sk_ASN1_OBJECT_delete'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_delete_ptr = 'sk_ASN1_OBJECT_delete_ptr'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_insert = 'sk_ASN1_OBJECT_insert'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_dup = 'sk_ASN1_OBJECT_dup'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_pop_free = 'sk_ASN1_OBJECT_pop_free'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_shift = 'sk_ASN1_OBJECT_shift'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_pop = 'sk_ASN1_OBJECT_pop'; }  {Do not localize}
  {CH fn_sk_ASN1_OBJECT_sort = 'sk_ASN1_OBJECT_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_ASN1_OBJECT = 'i2d_ASN1_SET_OF_ASN1_OBJECT'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_ASN1_OBJECT = 'd2i_ASN1_SET_OF_ASN1_OBJECT'; }  {Do not localize}
  {CH fn_ASN1_STRING_new = 'ASN1_STRING_new'; }  {Do not localize}
  fn_ASN1_STRING_free = 'ASN1_STRING_free';  {Do not localize}
  {CH fn_ASN1_STRING_dup = 'ASN1_STRING_dup'; }  {Do not localize}
  fn_ASN1_STRING_type_new = 'ASN1_STRING_type_new';  {Do not localize}
  {CH fn_ASN1_STRING_cmp = 'ASN1_STRING_cmp'; }  {Do not localize}
  {CH fn_ASN1_STRING_set = 'ASN1_STRING_set'; }  {Do not localize}
  {CH fn_ASN1_STRING_set0 = 'ASN1_STRING_set0'; } {Do not localize}
  {CH fn_i2d_ASN1_BIT_STRING = 'i2d_ASN1_BIT_STRING'; }  {Do not localize}
  {CH fn_d2i_ASN1_BIT_STRING = 'd2i_ASN1_BIT_STRING'; }  {Do not localize}
  {CH fn_ASN1_BIT_STRING_set_bit = 'ASN1_BIT_STRING_set_bit'; }  {Do not localize}
  {CH fn_ASN1_BIT_STRING_get_bit = 'ASN1_BIT_STRING_get_bit'; }  {Do not localize}
  {CH fn_i2d_ASN1_BOOLEAN = 'i2d_ASN1_BOOLEAN'; }  {Do not localize}
  {CH fn_d2i_ASN1_BOOLEAN = 'd2i_ASN1_BOOLEAN'; }  {Do not localize}
  {CH fn_i2d_ASN1_INTEGER = 'i2d_ASN1_INTEGER'; }  {Do not localize}
  {CH fn_d2i_ASN1_INTEGER = 'd2i_ASN1_INTEGER'; }  {Do not localize}
  {CH fn_d2i_ASN1_UINTEGER = 'd2i_ASN1_UINTEGER'; }  {Do not localize}
  {CH fn_i2d_ASN1_ENUMERATED = 'i2d_ASN1_ENUMERATED'; }  {Do not localize}
  {CH fn_d2i_ASN1_ENUMERATED = 'd2i_ASN1_ENUMERATED'; }  {Do not localize}
  {CH fn_ASN1_UTCTIME_check = 'ASN1_UTCTIME_check'; }  {Do not localize}
  {CH fn_ASN1_UTCTIME_set = 'ASN1_UTCTIME_set'; }  {Do not localize}
  {CH fn_ASN1_UTCTIME_set_string = 'ASN1_UTCTIME_set_string'; }  {Do not localize}
  {CH fn_ASN1_GENERALIZEDTIME_check = 'ASN1_GENERALIZEDTIME_check'; }  {Do not localize}
  {CH fn_ASN1_GENERALIZEDTIME_set = 'ASN1_GENERALIZEDTIME_set'; }  {Do not localize}
  {CH fn_ASN1_GENERALIZEDTIME_set_string = 'ASN1_GENERALIZEDTIME_set_string'; }  {Do not localize}
  {CH fn_i2d_ASN1_OCTET_STRING = 'i2d_ASN1_OCTET_STRING'; }  {Do not localize}
  {CH fn_d2i_ASN1_OCTET_STRING = 'd2i_ASN1_OCTET_STRING'; }  {Do not localize}
  {CH fn_i2d_ASN1_VISIBLESTRING = 'i2d_ASN1_VISIBLESTRING'; }  {Do not localize}
  {CH fn_d2i_ASN1_VISIBLESTRING = 'd2i_ASN1_VISIBLESTRING'; }  {Do not localize}
  {CH fn_i2d_ASN1_UTF8STRING = 'i2d_ASN1_UTF8STRING'; }  {Do not localize}
  {CH fn_d2i_ASN1_UTF8STRING = 'd2i_ASN1_UTF8STRING'; }  {Do not localize}
  {CH fn_i2d_ASN1_BMPSTRING = 'i2d_ASN1_BMPSTRING'; }  {Do not localize}
  {CH fn_d2i_ASN1_BMPSTRING = 'd2i_ASN1_BMPSTRING'; }  {Do not localize}
  {CH fn_i2d_ASN1_PRINTABLE = 'i2d_ASN1_PRINTABLE'; }  {Do not localize}
  {CH fn_d2i_ASN1_PRINTABLE = 'd2i_ASN1_PRINTABLE'; }  {Do not localize}
  {CH fn_d2i_ASN1_PRINTABLESTRING = 'd2i_ASN1_PRINTABLESTRING'; }  {Do not localize}
  {CH fn_i2d_DIRECTORYSTRING = 'i2d_DIRECTORYSTRING'; }  {Do not localize}
  {CH fn_d2i_DIRECTORYSTRING = 'd2i_DIRECTORYSTRING'; }  {Do not localize}
  {CH fn_i2d_DISPLAYTEXT = 'i2d_DISPLAYTEXT'; }  {Do not localize}
  {CH fn_d2i_DISPLAYTEXT = 'd2i_DISPLAYTEXT'; }  {Do not localize}
  {CH fn_d2i_ASN1_T61STRING = 'd2i_ASN1_T61STRING'; }  {Do not localize}
  {CH fn_i2d_ASN1_IA5STRING = 'i2d_ASN1_IA5STRING'; }  {Do not localize}
  {CH fn_d2i_ASN1_IA5STRING = 'd2i_ASN1_IA5STRING'; }  {Do not localize}
  {CH fn_i2d_ASN1_UTCTIME = 'i2d_ASN1_UTCTIME'; }  {Do not localize}
  {CH fn_d2i_ASN1_UTCTIME = 'd2i_ASN1_UTCTIME'; }  {Do not localize}
  {CH fn_i2d_ASN1_GENERALIZEDTIME = 'i2d_ASN1_GENERALIZEDTIME'; }  {Do not localize}
  {CH fn_d2i_ASN1_GENERALIZEDTIME = 'd2i_ASN1_GENERALIZEDTIME'; }  {Do not localize}
  {CH fn_i2d_ASN1_TIME = 'i2d_ASN1_TIME'; }  {Do not localize}
  {CH fn_d2i_ASN1_TIME = 'd2i_ASN1_TIME'; }  {Do not localize}
  {CH fn_ASN1_TIME_set = 'ASN1_TIME_set'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET = 'i2d_ASN1_SET'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET = 'd2i_ASN1_SET'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_i2a_ASN1_INTEGER = 'i2a_ASN1_INTEGER'; }  {Do not localize}
  {CH fn_a2i_ASN1_INTEGER = 'a2i_ASN1_INTEGER'; }  {Do not localize}
  {CH fn_i2a_ASN1_ENUMERATED = 'i2a_ASN1_ENUMERATED'; }  {Do not localize}
  {CH fn_a2i_ASN1_ENUMERATED = 'a2i_ASN1_ENUMERATED'; }  {Do not localize}
  {CH fn_i2a_ASN1_OBJECT = 'i2a_ASN1_OBJECT'; }  {Do not localize}
  {CH fn_a2i_ASN1_STRING = 'a2i_ASN1_STRING'; }  {Do not localize}
  {CH fn_i2a_ASN1_STRING = 'i2a_ASN1_STRING'; }  {Do not localize}
  {$ENDIF}
  {CH fn_i2t_ASN1_OBJECT = 'i2t_ASN1_OBJECT'; }  {Do not localize}
  {CH fn_a2d_ASN1_OBJECT = 'a2d_ASN1_OBJECT'; }  {Do not localize}
  {CH fn_ASN1_OBJECT_create = 'ASN1_OBJECT_create'; }  {Do not localize}
  fn_ASN1_INTEGER_set = 'ASN1_INTEGER_set';  {Do not localize}
  fn_ASN1_INTEGER_get = 'ASN1_INTEGER_get';  {Do not localize}
  {CH fn_BN_to_ASN1_INTEGER = 'BN_to_ASN1_INTEGER'; }  {Do not localize}
  {CH fn_ASN1_INTEGER_to_BN = 'ASN1_INTEGER_to_BN'; }  {Do not localize}
  {CH fn_ASN1_ENUMERATED_set = 'ASN1_ENUMERATED_set'; }  {Do not localize}
  {CH fn_ASN1_ENUMERATED_get = 'ASN1_ENUMERATED_get'; }  {Do not localize}
  {CH fn_BN_to_ASN1_ENUMERATED = 'BN_to_ASN1_ENUMERATED'; }  {Do not localize}
  {CH fn_ASN1_ENUMERATED_to_BN = 'ASN1_ENUMERATED_to_BN'; }  {Do not localize}
  {CH fn_ASN1_PRINTABLE_type = 'ASN1_PRINTABLE_type'; }  {Do not localize}
  {CH fn_i2d_ASN1_bytes = 'i2d_ASN1_bytes'; }  {Do not localize}
  {CH fn_d2i_ASN1_bytes = 'd2i_ASN1_bytes'; }  {Do not localize}
  {CH fn_d2i_ASN1_type_bytes = 'd2i_ASN1_type_bytes'; }  {Do not localize}
  {CH fn_asn1_Finish = 'asn1_Finish'; }  {Do not localize}
  {CH fn_ASN1_get_object = 'ASN1_get_object'; }  {Do not localize}
  {CH fn_ASN1_check_infinite_end = 'ASN1_check_infinite_end'; }  {Do not localize}
  {CH fn_ASN1_put_object = 'ASN1_put_object'; }  {Do not localize}
  {CH fn_ASN1_object_size = 'ASN1_object_size'; }  {Do not localize}
   fn_ASN1_dup = 'ASN1_dup';   {Do not localize}
  {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_ASN1_d2i_fp = 'ASN1_d2i_fp'; }  {Do not localize}
  {CH fn_ASN1_i2d_fp = 'ASN1_i2d_fp'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_ASN1_d2i_bio = 'ASN1_d2i_bio'; }  {Do not localize}
  {CH fn_ASN1_item_d2i_bio = 'ASN1_item_d2i_bio'; } {Do not localize}
  {CH fn_ASN1_i2d_bio = 'ASN1_i2d_bio'; }  {Do not localize}
  {CH fn_ASN1_item_i2d_bio = 'ASN1_item_i2d_bio'; } {Do not localize}
  {CH fn_ASN1_UTCTIME_print = 'ASN1_UTCTIME_print'; }  {Do not localize}
  {CH fn_ASN1_GENERALIZEDTIME_print = 'ASN1_GENERALIZEDTIME_print'; }  {Do not localize}
  {CH fn_ASN1_TIME_print = 'ASN1_TIME_print'; }  {Do not localize}
  {CH fn_ASN1_STRING_print = 'ASN1_STRING_print'; }  {Do not localize}
  {CH fn_ASN1_STRING_print_ex = 'ASN1_STRING_print_ex'; } {Do not localize}
  {CH fn_ASN1_parse = 'ASN1_parse'; }  {Do not localize}
  {CH fn_ASN1_parse_dump = 'ASN1_parse_dump'; } {Do not localize}
  {$ENDIF}
  {CH fn_ASN1_tag2str = 'ASN1_tag2str'; } {Do not localize}
  {CH fn_i2d_ASN1_HEADER = 'i2d_ASN1_HEADER'; }  {Do not localize}
  {CH fn_d2i_ASN1_HEADER = 'd2i_ASN1_HEADER'; }  {Do not localize}
  {CH fn_ASN1_HEADER_new = 'ASN1_HEADER_new'; }  {Do not localize}
  {CH fn_ASN1_HEADER_free = 'ASN1_HEADER_free'; }  {Do not localize}
  {CH fn_ASN1_UNIVERSALSTRING_to_string = 'ASN1_UNIVERSALSTRING_to_string'; }  {Do not localize}
  {CH fn_ERR_load_ASN1_strings = 'ERR_load_ASN1_strings'; }  {Do not localize}
  {CH fn_X509_asn1_meth = 'X509_asn1_meth'; }  {Do not localize}
  {CH fn_RSAPrivateKey_asn1_meth = 'RSAPrivateKey_asn1_meth'; }  {Do not localize}
  {CH fn_ASN1_IA5STRING_asn1_meth = 'ASN1_IA5STRING_asn1_meth'; }  {Do not localize}
  {CH fn_ASN1_BIT_STRING_asn1_meth = 'ASN1_BIT_STRING_asn1_meth'; }  {Do not localize}
  {CH fn_ASN1_TYPE_set_octetstring = 'ASN1_TYPE_set_octetstring'; }  {Do not localize}
  {CH fn_ASN1_TYPE_get_octetstring = 'ASN1_TYPE_get_octetstring'; }  {Do not localize}
  {CH fn_ASN1_TYPE_set_int_octetstring = 'ASN1_TYPE_set_int_octetstring'; }  {Do not localize}
  {CH fn_ASN1_TYPE_get_int_octetstring = 'ASN1_TYPE_get_int_octetstring'; }  {Do not localize}
  {CH fn_ASN1_seq_unpack = 'ASN1_seq_unpack'; }  {Do not localize}
  {CH fn_ASN1_seq_pack = 'ASN1_seq_pack'; }  {Do not localize}
  {CH fn_ASN1_unpack_string = 'ASN1_unpack_string'; }  {Do not localize}
  {CH fn_ASN1_pack_string = 'ASN1_pack_string'; }  {Do not localize}
  {CH fn_ASN1_item_unpack = 'ASN1_item_unpack'; } {Do not localize}
  {CH fn_ASN1_item_pack = 'ASN1_item_pack'; } {Do not localize}
  {CH fn_ASN1_STRING_set_default_mask = 'ASN1_STRING_set_default_mask'; } {Do not localize}
  {CH fn_ASN1_STRING_set_default_mask_asc = 'ASN1_STRING_set_default_mask_asc'; } {Do not localize}
  {CH fn_ASN1_STRING_get_default_mask = 'ASN1_STRING_get_default_mask'; } {Do not localize}
  {CH fn_ASN1_mbstring_copy = 'ASN1_mbstring_copy'; } {Do not localize}
  {CH fn_ASN1_mbstring_ncopy = 'ASN1_mbstring_ncopy'; } {Do not localize}
  {CH fn_ASN1_STRING_set_by_NID = 'ASN1_STRING_set_by_NID'; } {Do not localize}
  {CH fn_ASN1_STRING_TABLE_get = 'ASN1_STRING_TABLE_get'; {Do not localize}
  {CH fn_ASN1_STRING_TABLE_add = 'ASN1_STRING_TABLE_add'; } {Do not localize}
  {CH fn_ASN1_STRING_TABLE_cleanup = 'ASN1_STRING_TABLE_cleanup'; } {Do not localize}
  {CH fn_ASN1_item_new = 'ASN1_item_new'; } {Do not localize}
  {CH fn_ASN1_item_free = 'ASN1_item_free'; } {Do not localize}
  {CH fn_ASN1_item_d2i = 'ASN1_item_d2i'; } {Do not localize}
  {CH fn_ASN1_item_i2d = 'ASN1_item_i2d'; } {Do not localize}
  {CH fn_ASN1_item_ndef_i2d = 'ASN1_item_ndef_i2d'; } {Do not localize}
  {CH fn_ASN1_add_oid_module = 'ASN1_add_oid_module'; } {Do not localize}
  {CH fn_ASN1_generate_nconf = 'ASN1_generate_nconf'; } {Do not localize}
  {CH fn_ASN1_generate_v3 = 'ASN1_generate_v3'; } {Do not localize}
  {CH fn_int_smime_write_ASN1 = 'int_smime_write_ASN1'; } {Do not localize}
  {CH fn_SMIME_read_ASN1 = 'SMIME_read_ASN1'; } {Do not localize}
  {CH fn_OBJ_NAME_init = 'OBJ_NAME_init'; }  {Do not localize}
  {CH fn_OBJ_NAME_new_index = 'OBJ_NAME_new_index'; }  {Do not localize}
  {CH fn_OBJ_NAME_get = 'OBJ_NAME_get'; }  {Do not localize}
  {CH fn_OBJ_NAME_add = 'OBJ_NAME_add'; }  {Do not localize}
  {CH fn_OBJ_NAME_remove = 'OBJ_NAME_remove'; }  {Do not localize}
  {CH fn_OBJ_NAME_cleanup = 'OBJ_NAME_cleanup'; }  {Do not localize}
  {CH fn_OBJ_dup = 'OBJ_dup'; }  {Do not localize}
  fn_OBJ_nid2obj = 'OBJ_nid2obj';  {Do not localize}
  fn_OBJ_nid2ln = 'OBJ_nid2ln';  {Do not localize}
  fn_OBJ_nid2sn = 'OBJ_nid2sn';  {Do not localize}
  fn_OBJ_obj2nid = 'OBJ_obj2nid';  {Do not localize}
  {CH fn_OBJ_txt2obj = 'OBJ_txt2obj'; }  {Do not localize}
  {CH fn_OBJ_obj2txt = 'OBJ_obj2txt'; }  {Do not localize}
  {CH fn_OBJ_txt2nid = 'OBJ_txt2nid'; }  {Do not localize}
  {CH fn_OBJ_ln2nid = 'OBJ_ln2nid'; }  {Do not localize}
  {CH fn_OBJ_sn2nid = 'OBJ_sn2nid'; }  {Do not localize}
  {CH fn_OBJ_cmp = 'OBJ_cmp'; }  {Do not localize}
  {CH fn_OBJ_bsearch = 'OBJ_bsearch'; }  {Do not localize}
  {CH fn_ERR_load_OBJ_strings = 'ERR_load_OBJ_strings'; }  {Do not localize}
  {CH fn_OBJ_new_nid = 'OBJ_new_nid'; }  {Do not localize}
  {CH fn_OBJ_add_object = 'OBJ_add_object'; }  {Do not localize}
  {CH fn_OBJ_create = 'OBJ_create'; }  {Do not localize}
  {CH fn_OBJ_cleanup = 'OBJ_cleanup'; }  {Do not localize}
  {CH fn_OBJ_create_objects = 'OBJ_create_objects'; }  {Do not localize}
  {===}
  { fm_EVP_MD_type = 'EVP_MD_type'; } {Do not localize}
  { fn_EVP_MD_pkey_type = 'EVP_MD_pkey_type'; } {Do not localize}
  { fn_EVP_MD_size = 'EVP_MD_size'; } {Do not localize}
  { fn_EVP_MD_block_size = 'EVP_MD_block_size'; } {Do not localize}
  { fn_EVP_MD_CTX_md = 'EVP_MD_CTX_md';  } {Do not localize}
  { fn_EVP_CIPHER_nid = 'EVP_CIPHER_nid'; } {Do not localize}
  { fn_EVP_CIPHER_block_size = 'EVP_CIPHER_block_size';  } {Do not localize}
  { fn_EVP_CIPHER_key_length = 'EVP_CIPHER_key_length'; } {Do not localize}
  { fn_EVP_CIPHER_iv_length = 'EVP_CIPHER_iv_length'; } {Do not localize}
  { fn_EVP_CIPHER_flags = 'EVP_CIPHER_flags'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_cipher = 'EVP_CIPHER_CTX_cipher'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_nid = 'EVP_CIPHER_CTX_nid'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_block_size = 'EVP_CIPHER_CTX_block_size'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_key_length = 'EVP_CIPHER_CTX_key_length'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_iv_length = 'EVP_CIPHER_CTX_iv_length'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_get_app_data = 'EVP_CIPHER_CTX_get_app_data'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_set_app_data = 'EVP_CIPHER_CTX_set_app_data'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_flags = 'EVP_CIPHER_CTX_flags'; } {Do not localize}
  { fn_EVP_Cipher = 'EVP_Cipher'; } {Do not localize}
   fn_EVP_MD_CTX_init = 'EVP_MD_CTX_init'; {Do not localize}
   fn_EVP_MD_CTX_cleanup = 'EVP_MD_CTX_cleanup';  {Do not localize}
  { fn_EVP_MD_CTX_create = 'EVP_MD_CTX_create'; } {Do not localize}
  { fn_EVP_MD_CTX_destroy = 'EVP_MD_CTX_destroy'; } {Do not localize}
  { fn_EVP_MD_CTX_copy_ex = 'EVP_MD_CTX_copy_ex'; } {Do not localize}
  { fn_EVP_MD_CTX_set_flags = 'EVP_MD_CTX_set_flags'; } {Do not localize}
  { fn_EVP_MD_CTX_clear_flags = 'EVP_MD_CTX_clear_flags'; } {Do not localize}
  { fn_EVP_MD_CTX_test_flags = 'EVP_MD_CTX_test_flags'; } {Do not localize}
   fn_EVP_DigestInit_ex = 'EVP_DigestInit_ex';  {Do not localize}
   fn_EVP_DigestUpdate = 'EVP_DigestUpdate';  {Do not localize}
   fn_EVP_DigestFinal_ex = 'EVP_DigestFinal_ex';  {Do not localize}
  { fn_EVP_Digest = 'EVP_Digest'; } {Do not localize}
  {CH fn_EVP_MD_CTX_copy = 'EVP_MD_CTX_copy'; }  {Do not localize}
  {CH fn_EVP_DigestInit = 'EVP_DigestInit'; }  {Do not localize}
  {CH fn_EVP_DigestUpdate = 'EVP_DigestUpdate'; }  {Do not localize}
  {CH fn_EVP_DigestFinal = 'EVP_DigestFinal'; }  {Do not localize}
  {CH fn_EVP_read_pw_string = 'EVP_read_pw_string'; }  {Do not localize}
  {CH fn_EVP_set_pw_prompt = 'EVP_set_pw_prompt'; }  {Do not localize}
  {CH fn_EVP_get_pw_prompt = 'EVP_get_pw_prompt'; }  {Do not localize}
  {CH fn_EVP_BytesToKey = 'EVP_BytesToKey'; }  {Do not localize}
  {CH fn_EVP_CIPHER_CTX_set_flags = 'EVP_CIPHER_CTX_set_flags'; } {Do not localize}
  {CH fn_EVP_CIPHER_CTX_clear_flags = 'EVP_CIPHER_CTX_clear_flags'; } {Do not localize}
  {CH fn_EVP_CIPHER_CTX_test_flags = 'EVP_CIPHER_CTX_test_flags'; } {Do not localize}
  {CH fn_EVP_EncryptInit = 'EVP_EncryptInit'; }  {Do not localize}
  { fn_EVP_EncryptInit_ex = 'EVP_EncryptInit_ex'; } {Do not localize}
  {CH fn_EVP_EncryptUpdate = 'EVP_EncryptUpdate'; }  {Do not localize}
  {CH fn_EVP_EncryptFinal = 'EVP_EncryptFinal'; }  {Do not localize}
  {CH fn_EVP_EncryptFinal_ex = 'EVP_EncryptFinal_ex'; } {Do not localize}
  {CH fn_EVP_DecryptInit = 'EVP_DecryptInit'; }  {Do not localize}
  {CH fn_EVP_DecryptInit_ex = 'EVP_DecryptInit_ex'; }  {Do not localize}
  {CH fn_EVP_DecryptUpdate = 'EVP_DecryptUpdate'; }  {Do not localize}
  {CH fn_EVP_DecryptFinal = 'EVP_DecryptFinal'; }  {Do not localize}
  { fn_EVP_DecryptFinal_ex = 'EVP_DecryptFinal_ex'; } {Do not localize}
  {CH fn_EVP_CipherInit = 'EVP_CipherInit'; }  {Do not localize}
  { fn_EVP_CipherInit_ex = 'EVP_CipherInit_ex'; } {Do not localize}
  { fn_EVP_CipherUpdate = 'EVP_CipherUpdate'; }  {Do not localize}
  { fn_EVP_CipherFinal = 'EVP_CipherFinal'; }  {Do not localize}
  { fn_EVP_CipherFinal_ex = 'EVP_CipherFinal_ex'; } {Do not localize}

  {CH fn_EVP_SignFinal = 'EVP_SignFinal'; }  {Do not localize}
  {CH fn_EVP_VerifyFinal = 'EVP_VerifyFinal'; }  {Do not localize}
  {CH fn_EVP_OpenInit = 'EVP_OpenInit'; }  {Do not localize}
  {CH fn_EVP_OpenFinal = 'EVP_OpenFinal'; }  {Do not localize}
  {CH fn_EVP_SealInit = 'EVP_SealInit'; }  {Do not localize}
  {CH fn_EVP_SealFinal = 'EVP_SealFinal'; }  {Do not localize}
  {CH fn_EVP_EncodeInit = 'EVP_EncodeInit'; }  {Do not localize}
  {CH fn_EVP_EncodeUpdate = 'EVP_EncodeUpdate'; }  {Do not localize}
  {CH fn_EVP_EncodeFinal = 'EVP_EncodeFinal'; }  {Do not localize}
  {CH fn_EVP_EncodeBlock = 'EVP_EncodeBlock'; }  {Do not localize}
  {CH fn_EVP_DecodeInit = 'EVP_DecodeInit'; }  {Do not localize}
  {CH fn_EVP_DecodeUpdate = 'EVP_DecodeUpdate'; }  {Do not localize}
  {CH fn_EVP_DecodeFinal = 'EVP_DecodeFinal'; }  {Do not localize}
  {CH fn_EVP_DecodeBlock = 'EVP_DecodeBlock'; }  {Do not localize}
  {CH fn_EVP_CIPHER_CTX_init = 'EVP_CIPHER_CTX_init'; }  {Do not localize}
  {CH fn_EVP_CIPHER_CTX_cleanup = 'EVP_CIPHER_CTX_cleanup'; }  {Do not localize}
  { fn_EVP_CIPHER_CTX_new = 'EVP_CIPHER_CTX_new'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_set_key_length = 'EVP_CIPHER_CTX_set_key_length'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_ctrl = 'EVP_CIPHER_CTX_ctrl'; } {Do not localize}
  { fn_EVP_CIPHER_CTX_rand_key = 'EVP_CIPHER_CTX_rand_key'; } {Do not localize}
  {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_BIO_f_md = 'BIO_f_md'; }  {Do not localize}
  {CH fn_BIO_f_base64 = 'BIO_f_base64'; }  {Do not localize}
  {CH fn_BIO_f_cipher = 'BIO_f_cipher'; }  {Do not localize}
  {CH fn_BIO_f_reliable = 'BIO_f_reliable'; }  {Do not localize}
  {CH fn_BIO_set_cipher = 'BIO_set_cipher'; }  {Do not localize}
  {$ENDIF}
  {CH fn_EVP_md_null = 'EVP_md_null'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_MD2}
   fn_EVP_md2 = 'EVP_md2';   {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD4}
  fn_EVP_md4 = 'EVP_md4';   {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD5}
  fn_EVP_md5 = 'EVP_md5';  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA}
  {CH fn_EVP_sha = 'EVP_sha'; }  {Do not localize}
  fn_EVP_sha1 = 'EVP_sha1';  {Do not localize}
  {CH fn_EVP_dss = 'EVP_dss'; }  {Do not localize}
  {CH fn_EVP_dss1 = 'EVP_dss1'; }  {Do not localize}
  {CH fn_EVP_ecdsa = 'EVP_ecdsa'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA256}
  fn_EVP_sha512 = 'EVP_sha512'; {Do not localize}
  fn_EVP_sha384 = 'EVP_sha384'; {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA512}
  fn_EVP_sha256 = 'EVP_sha256'; {Do not localize}
  fn_EVP_sha224 = 'EVP_sha224'; {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MDC2}
  {CH fn_EVP_mdc2 = 'EVP_mdc2'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RIPEMD}
  {CH fn_EVP_ripemd160 = 'EVP_ripemd160'; }  {Do not localize}
  {$ENDIF}
  {CH fn_EVP_enc_null = 'EVP_enc_null'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_DES}
  {CH fn_EVP_des_ecb = 'EVP_des_ecb'; }  {Do not localize}
  {CH fn_EVP_des_ede = 'EVP_des_ede'; }  {Do not localize}
  {CH fn_EVP_des_ede3 = 'EVP_des_ede3'; }  {Do not localize}
    {$DEFINE EVP_des_cfb}
    {$DEFINE EVP_des_cfb64}
  {CH fn_EVP_des_cfb = 'EVP_des_cfb'; }  {Do not localize}
  {CH fn_EVP_des_ede_cfb = 'EVP_des_ede_cfb'; }  {Do not localize}
  {CH fn_EVP_des_ede3_cfb = 'EVP_des_ede3_cfb'; }  {Do not localize}
  {CH fn_EVP_des_ofb = 'EVP_des_ofb'; }  {Do not localize}
  {CH fn_EVP_des_ede_ofb = 'EVP_des_ede_ofb'; }  {Do not localize}
    {$DEFINE EVP_des_ede_cfb}
    {$DEFINE EVP_des_ede_cfb64}
  {CH fn_EVP_des_ede3_ofb = 'EVP_des_ede3_ofb'; }  {Do not localize}
  {CH fn_EVP_des_cbc = 'EVP_des_cbc'; }  {Do not localize}
  {CH fn_EVP_des_ede_cbc = 'EVP_des_ede_cbc'; }  {Do not localize}
  fn_EVP_des_ede3_cbc = 'EVP_des_ede3_cbc';  {Do not localize}
    {$DEFINE EVP_des_ede3_cfb}
    {$DEFINE EVP_des_ede3_cfb64}
  {CH fn_EVP_desx_cbc = 'EVP_desx_cbc'; }  {Do not localize}
  {CH fn_EVP_des_ede3_cfb8 = 'EVP_des_ede3_cfb8'; } {Do not localize}
  {$ENDIF}
  {$IFDEF OPENSSL_NO_RC4}
  {CH fn_EVP_rc4 = 'EVP_rc4'; }  {Do not localize}
  {CH fn_EVP_rc4_40 = 'EVP_rc4_40'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_IDEA}
  {CH fn_EVP_idea_ecb = 'EVP_idea_ecb'; }  {Do not localize}
  {CH fn_EVP_idea_cfb64 = 'EVP_idea_cfb64'; } {Do not localize}
    {$DEFINE EVP_idea_cfb}
    {$DEFINE EVP_idea_cfb64 }
  {CH fn_EVP_idea_cfb = 'EVP_idea_cfb'; }  {Do not localize}
  {CH fn_EVP_idea_ofb = 'EVP_idea_ofb'; }  {Do not localize}
  {CH fn_EVP_idea_cbc = 'EVP_idea_cbc'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_RC2}
  {CH fn_EVP_rc2_ecb = 'EVP_rc2_ecb'; }  {Do not localize}
  {CH fn_EVP_rc2_cbc = 'EVP_rc2_cbc'; }  {Do not localize}
  {CH fn_EVP_rc2_40_cbc = 'EVP_rc2_40_cbc'; }  {Do not localize}
  {CH fn_EVP_rc2_64_cbc = 'EVP_rc2_64_cbc'; }  {Do not localize}
  {CH fn_EVP_rc2_cfb64 = 'EVP_rc2_cfb64'; } {Do not localize}
  {CH fn_EVP_rc2_cfb = 'EVP_rc2_cfb'; }  {Do not localize}
    {$DEFINE EVP_rc2_cfb}
    {$DEFINE EVP_rc2_cfb64}
  {CH fn_EVP_rc2_ofb = 'EVP_rc2_ofb'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_BF}
  {CH fn_EVP_bf_ecb = 'EVP_bf_ecb'; }  {Do not localize}
  {CH fn_EVP_bf_cbc = 'EVP_bf_cbc'; }  {Do not localize}
  {CH fn_EVP_bf_cfb = 'EVP_bf_cfb'; }  {Do not localize}
  {CH fn_EVP_bf_cfb64 = 'EVP_bf_cfb64'; } {Do not localize}
    {$DEFINE EVP_bf_cfb}
    {$DEFINE EVP_bf_cfb64}
  {CH fn_EVP_bf_ofb = 'EVP_bf_ofb'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_CAST}
  {CH fn_EVP_cast5_ecb = 'EVP_cast5_ecb'; }  {Do not localize}
  {CH fn_EVP_cast5_cbc = 'EVP_cast5_cbc'; }  {Do not localize}
  {CH fn_EVP_cast5_cfb = 'EVP_cast5_cfb'; }  {Do not localize}
  {CH fn_EVP_cast5_cfb64 = 'EVP_cast5_cfb64'; } {Do not localize}
    {$DEFINE EVP_cast5_cfb}
    {$DEFINE EVP_cast5_cfb64}
  {CH fn_EVP_cast5_ofb = 'EVP_cast5_ofb'; }  {Do not localize}
  {$ENDIF}
  {$IFDEF OPENSSL_NO_RC5 }
  {CH fn_EVP_rc5_32_12_16_cbc = 'EVP_rc5_32_12_16_cbc'; }  {Do not localize}
  {CH fn_EVP_rc5_32_12_16_ecb = 'EVP_rc5_32_12_16_ecb'; }  {Do not localize}
  {CH fn_EVP_rc5_32_12_16_cfb = 'EVP_rc5_32_12_16_cfb'; }  {Do not localize}
  {CH fn_EVP_rc5_32_12_16_cfb64 = 'EVP_rc5_32_12_16_cfb64'; } {Do not localize}
     {$DEFINE EVP_rc5_32_12_16_cfb}
     {$DEFINE EVP_rc5_32_12_16_cfb64}
  {CH fn_EVP_rc5_32_12_16_ofb = 'EVP_rc5_32_12_16_ofb'; }  {Do not localize}
  {$ENDIF}
  {$IFDEF OPENSSL_NO_AES}
  {CH fn_EVP_aes_128_ecb = 'EVP_aes_128_ecb'; } {do not localize}
  {CH fn_EVP_aes_128_cbc = 'EVP_aes_128_cbc'; } {do not localize}
  {CH fn_EVP_aes_128_cfb1 = 'EVP_aes_128_cfb1'; } {do not localize}
  {CH fn_EVP_aes_128_cfb8 = 'EVP_aes_128_cfb8'; } {do not localize}
  {CH fn_EVP_aes_128_ofb = 'EVP_aes_128_ofb'; } {do not localize}
  {CH fn_EVP_aes_128_cfb128 = 'EVP_aes_128_cfb128'; } {do not localize}
    {$DEFINE EVP_aes_128_cfb}
    {$DEFINE EVP_aes_128_cfb128}
  {CH fn_EVP_aes_192_ecb = 'EVP_aes_192_ecb'; } {Do not localize}
  {CH fn_EVP_aes_192_cbc = 'EVP_aes_192_cbc'; } {Do not localize}
  {CH fn_EVP_aes_192_cfb1 = 'EVP_CIPHER *EVP_aes_192_cfb1'; } {Do not localize}
  {CH fn_EVP_aes_192_cfb8 = 'EVP_aes_192_cfb8'; } {Do not localize}
  {CH fn_EVP_aes_192_cfb128 = 'EVP_aes_192_cfb128'; } {Do not localize}
    {$DEFINE EVP_aes_192_cfb}
    {$DEFINE EVP_aes_192_cfb128}
  {CH fn_EVP_aes_192_ofb = 'EVP_aes_192_ofb'; } {Do not localize}
  {CH fn_EVP_aes_256_ecb = 'EVP_aes_256_ecb'; } {Do not localize}
  {CH fn_EVP_aes_256_cbc = 'EVP_aes_256_cbc'; } {Do not localize}
  {CH fn_EVP_aes_256_cfb1 = 'EVP_aes_256_cfb1'; } {Do not localize}
  {CH fn_EVP_aes_256_cfb8 = 'EVP_aes_256_cfb8'; } {Do not localize}
  {CH fn_EVP_aes_256_cfb128 = 'EVP_aes_256_cfb128'; } {Do not localize}
    {$DEFINE EVP_aes_256_cfb}
    {$DEFINE EVP_aes_256_cfb128}
  {CH fn_EVP_aes_256_ofb = 'EVP_aes_256_ofb'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_CAMELLIA}
  {CH fn_EVP_camellia_128_ecb = 'EVP_camellia_128_ecb'; } {Do not localize}
  {CH fn_EVP_camellia_128_cbc = 'EVP_camellia_128_cbc'; } {Do not localize}
  {CH fn_EVP_camellia_128_cfb1 = 'EVP_camellia_128_cfb1'; } {Do not localize}
  {CH fn_EVP_camellia_128_cfb8 = 'EVP_camellia_128_cfb8'; } {Do not localize}
  {CH fn_EVP_camellia_128_cfb128 = 'EVP_camellia_128_cfb128'; } {Do not localize}
    {$DEFINE EVP_camellia_128_cfb}
    {$DEFINE EVP_camellia_128_cfb128}
  {CH fn_EVP_camellia_128_ofb = 'EVP_camellia_128_ofb'; } {Do not localize}
  {CH fn_EVP_camellia_192_ecb = 'EVP_camellia_192_ecb'; } {Do not localize}
  {CH fn_EVP_camellia_192_cbc = 'EVP_camellia_192_cbc'; } {Do not localize}
  {CH fn_EVP_camellia_192_cfb1 = 'EVP_camellia_192_cfb1'; } {Do not localize}
  {CH fn_EVP_camellia_192_cfb8 = 'EVP_camellia_192_cfb8'; } {Do not localize}
  {CH fn_EVP_camellia_192_cfb128 = 'EVP_camellia_192_cfb128'; } {Do not localize}
    {$DEFINE define EVP_camellia_192_cfb}
    {$DEFINE EVP_camellia_192_cfb128}
  {CH fn_EVP_camellia_192_ofb = 'EVP_camellia_192_ofb'; } {Do not localize}
  {CH fn_EVP_camellia_256_ecb = 'EVP_camellia_256_ecb'; } {Do not localize}
  {CH fn_EVP_camellia_256_cbc = 'EVP_camellia_256_cbc'; } {Do not localize}
  {CH fn_EVP_camellia_256_cfb1 = 'EVP_camellia_256_cfb1'; } {Do not localize}
  {CH fn_EVP_camellia_256_cfb8 = 'EVP_camellia_256_cfb8'; } {Do not localize}
  {CH fn_EVP_camellia_256_cfb128 = 'EVP_camellia_256_cfb128'; } {Do not localize}
    {$DEFINE EVP_camellia_256_cfb}
    {$DEFINE EVP_camellia_256_cfb128}
  {CH fn_EVP_camellia_256_ofb = 'EVP_camellia_256_ofb'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SEED}
  {CH fn_EVP_seed_ecb = 'EVP_seed_ecb'; } {Do not localize}
  {CH fn_EVP_seed_cbc = 'EVP_seed_cbc'; } {Do not localize}
  {CH fn_EVP_seed_cfb128 = 'EVP_seed_cfb128'; } {Do not localize}
    {$DEFINE EVP_seed_cfb}
    {$DEFINE EVP_seed_cfb128}
  {CH fn_EVP_seed_ofb = 'EVP_seed_ofb'; } {Do not localize}
  {$ENDIF}
  fn_OPENSSL_add_all_algorithms_noconf = 'OPENSSL_add_all_algorithms_noconf';  {Do not localize}
  { fn_OPENSSL_add_all_algorithms_conf = 'OPENSSL_add_all_algorithms_conf'; }{Do not localize}
  fn_OpenSSL_add_all_algorithms = 'OpenSSL_add_all_algorithms';
  fn_OpenSSL_add_all_ciphers = 'OpenSSL_add_all_ciphers'; {Do not localize}
  fn_OpenSSL_add_all_digests = 'OpenSSL_add_all_digests'; {Do not localize}
  {CH fn_EVP_add_cipher = 'EVP_add_cipher'; }  {Do not localize}
  {CH fn_EVP_add_digest = 'EVP_add_digest'; }  {Do not localize}
  {CH fn_EVP_get_cipherbyname = 'EVP_get_cipherbyname'; }  {Do not localize}
  fn_EVP_get_digestbyname = 'EVP_get_digestbyname';  {Do not localize}
  fn_EVP_cleanup = 'EVP_cleanup';  {Do not localize}
  {CH fn_EVP_PKEY_decrypt = 'EVP_PKEY_decrypt'; }  {Do not localize}
  {CH fn_EVP_PKEY_encrypt = 'EVP_PKEY_encrypt'; }  {Do not localize}
  fn_EVP_PKEY_type = 'EVP_PKEY_type';  {Do not localize}
  {CH fn_EVP_PKEY_bits = 'EVP_PKEY_bits'; }  {Do not localize}
  {CH fn_EVP_PKEY_size = 'EVP_PKEY_size'; }  {Do not localize}
  fn_EVP_PKEY_assign = 'EVP_PKEY_assign';  {Do not localize}
  {$IFNDEF OPENSSL_NO_RSA}
  { fn_EVP_PKEY_set1_RSA = 'EVP_PKEY_set1_RSA'; } {Do not localize}
  { fn_EVP_PKEY_get1_RSA = 'EVP_PKEY_get1_RSA'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DSA}
  { fn_EVP_PKEY_set1_DSA = 'EVP_PKEY_set1_DSA'; } {Do not localize}
  { fn_EVP_PKEY_get1_DSA = 'EVP_PKEY_get1_DSA'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DH}
  { fn_EVP_PKEY_set1_DH = 'EVP_PKEY_set1_DH'; } {Do not localize}
  { fn_EVP_PKEY_get1_DH = 'EVP_PKEY_get1_DH'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_EC}
  { fn_EVP_PKEY_set1_EC_KEY = 'EVP_PKEY_set1_EC_KEY'; } {Do not localize}
  { fn_EVP_PKEY_get1_EC_KEY = 'EVP_PKEY_get1_EC_KEY'; } {Do not localize}
  {$ENDIF}
  fn_EVP_PKEY_new = 'EVP_PKEY_new';  {Do not localize}
  fn_EVP_PKEY_free = 'EVP_PKEY_free';  {Do not localize}
  fn_d2i_PublicKey = 'd2i_PublicKey';   {Do not localize}
  fn_i2d_PublicKey = 'i2d_PublicKey';   {Do not localize}
   fn_d2i_PrivateKey = 'd2i_PrivateKey';   {Do not localize}
  { fn_d2i_AutoPrivateKey = 'd2i_AutoPrivateKey';  {Do not localize}
   fn_i2d_PrivateKey = 'i2d_PrivateKey';   {Do not localize}
  {CH fn_EVP_PKEY_copy_parameters = 'EVP_PKEY_copy_parameters'; }  {Do not localize}
  {CH fn_EVP_PKEY_missing_parameters = 'EVP_PKEY_missing_parameters'; }  {Do not localize}
  {CH fn_EVP_PKEY_save_parameters = 'EVP_PKEY_save_parameters'; }  {Do not localize}
  {CH fn_EVP_PKEY_cmp_parameters = 'EVP_PKEY_cmp_parameters'; }  {Do not localize}
  { fn_EVP_PKEY_cmp = 'EVP_PKEY_cmp'; } {Do not localize}
  {CH fn_EVP_CIPHER_type = 'EVP_CIPHER_type'; }  {Do not localize}
  {CH fn_EVP_CIPHER_param_to_asn1 = 'EVP_CIPHER_param_to_asn1'; }  {Do not localize}
  {CH fn_EVP_CIPHER_asn1_to_param = 'EVP_CIPHER_asn1_to_param'; }  {Do not localize}
  {CH fn_EVP_CIPHER_set_asn1_iv = 'EVP_CIPHER_set_asn1_iv'; }  {Do not localize}
  {CH fn_EVP_CIPHER_get_asn1_iv = 'EVP_CIPHER_get_asn1_iv'; }  {Do not localize}
  {CH fn_PKCS5_PBE_keyivgen = 'PKCS5_PBE_keyivgen'; }  {Do not localize}
  {CH fn_PKCS5_PBKDF2_HMAC_SHA1 = 'PKCS5_PBKDF2_HMAC_SHA1'; }  {Do not localize}
  {CH fn_PKCS5_v2_PBE_keyivgen = 'PKCS5_v2_PBE_keyivgen'; }  {Do not localize}
  {CH fn_PKCS5_PBE_add = 'PKCS5_PBE_add'; }  {Do not localize}
  {CH fn_EVP_PBE_CipherInit = 'EVP_PBE_CipherInit'; }  {Do not localize}
  {CH fn_EVP_PBE_alg_add = 'EVP_PBE_alg_add'; }  {Do not localize}
  {CH fn_EVP_PBE_cleanup = 'EVP_PBE_cleanup'; }  {Do not localize}
  {$IFDEF OPENSSL_FIPS}
    {$IFNDEF OPENSSL_NO_ENGINE}
  {CH fn_EVP_MD_set_engine_callbacks = 'EVP_MD_set_engine_callbacks'; } {Do not localize}
  {CH fn_int_EVP_MD_init_engine_callbacks = 'int_EVP_MD_init_engine_callbacks'; } {Do not localize}
  {CH fn_int_EVP_CIPHER_set_engine_callbacks = 'int_EVP_CIPHER_set_engine_callbacks'; } {Do not localize}
  {CH fn_int_EVP_CIPHER_init_engine_callbacks = 'int_EVP_CIPHER_init_engine_callbacks'; } {Do not localize}
    {$ENDIF}
  {$ENDIF}
  {CH fn_EVP_add_alg_module = 'EVP_add_alg_module'; {Do not localize}
  {CH fn_ERR_load_EVP_strings = 'ERR_load_EVP_strings'; }  {Do not localize}
  {$IFDEF OPENSSL_FIPS}
  fn_FIPS_mode_set = 'FIPS_mode_set'; {Do not localize}
  fn_FIPS_mode = 'FIPS_mode'; {Do not localize}
   {CH fn_FIPS_rand_check = 'FIPS_rand_check'; } {Do not localize}
   {CH fn_FIPS_selftest_failed = 'FIPS_selftest_failed'; } {Do not localize}
  fn_FIPS_selftest_check = 'FIPS_selftest_check';  {Do not localize}
  {CH fn_FIPS_corrupt_sha1 = 'FIPS_corrupt_sha1'; } {Do not localize}
  {CH fn_FIPS_selftest_sha1 = 'FIPS_selftest_sha1'; } {Do not localize}
  {CH fb_FIPS_corrupt_aes = 'FIPS_corrupt_aes'; } {Do not localize}
  {CH fn_FIPS_selftest_aes = 'FIPS_selftest_aes'; } {Do not localize}
  {CH fn_FIPS_corrupt_des = 'FIPS_corrupt_des'; } {Do not localize}
  {CH fn_FIPS_selftest_des = 'FIPS_selftest_des'; } {Do not localize}
  {CH fn_FIPS_corrupt_rsa = 'FIPS_corrupt_rsa'; } {Do not localize}
  {CH fn_FIPS_corrupt_rsa_keygen = 'FIPS_corrupt_rsa_keygen'; } {Do not localize}
  {CH fn_FIPS_selftest_rsa = 'FIPS_selftest_rsa'; } {Do not localize}
  {CH fn_FIPS_corrupt_dsa = 'FIPS_corrupt_dsa'; } {Do not localize}
  {CH fn_FIPS_corrupt_dsa_keygen = 'FIPS_corrupt_dsa_keygen'; } {Do not localize}
  {CH fn_FIPS_selftest_dsa = 'FIPS_selftest_dsa'; } {Do not localize}
  {CH fn_FIPS_corrupt_rng = 'FIPS_corrupt_rng'; } {Do not localize}
  {CH fn_FIPS_rng_stick = 'FIPS_rng_stick'; } {Do not localize}
  {CH fn_FIPS_selftest_rng = 'FIPS_selftest_rng'; } {Do not localize}
  {CH fn_FIPS_selftest_hmac = 'FIPS_selftest_hmac'; } {Do not localize}
  {CH fn_fips_pkey_signature_test = 'fips_pkey_signature_test'; } {Do not localize}
  {CH fn_fips_cipher_test = 'fips_cipher_test';  } {Do not localize}
  //fips_rand.h
  {CH fn_FIPS_rand_set_key = 'FIPS_rand_set_key'; } {Do not localize}
  {CH fn_FIPS_rand_seed = 'FIPS_rand_seed; } {Do not localize}
  {CH fn_FIPS_rand_bytes = 'FIPS_rand_bytes'; } {Do not localize}
  {CH fn_FIPS_rand_test_mode = 'FIPS_rand_test_mode'; } {Do not localize}
  {CH fn_FIPS_rand_reset = 'FIPS_rand_reset'; } {Do not localize}
  {CH fn_FIPS_rand_set_dt = 'FIPS_rand_set_dt'; } {Do not localize}
  {CH fn_FIPS_rand_status = 'FIPS_rand_status';  } {Do not localize}
  {CH fn_FIPS_rand_method = 'FIPS_rand_method'; } {Do not localize}
  {$ENDIF}
  {CH fn_sk_X509_ALGOR_new = 'sk_X509_ALGOR_new'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_new_null = 'sk_X509_ALGOR_new_null'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_free = 'sk_X509_ALGOR_free'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_num = 'sk_X509_ALGOR_num'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_value = 'sk_X509_ALGOR_value'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_set = 'sk_X509_ALGOR_set'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_zero = 'sk_X509_ALGOR_zero'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_push = 'sk_X509_ALGOR_push'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_unshift = 'sk_X509_ALGOR_unshift'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_find = 'sk_X509_ALGOR_find'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_delete = 'sk_X509_ALGOR_delete'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_delete_ptr = 'sk_X509_ALGOR_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_insert = 'sk_X509_ALGOR_insert'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_dup = 'sk_X509_ALGOR_dup'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_pop_free = 'sk_X509_ALGOR_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_shift = 'sk_X509_ALGOR_shift'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_pop = 'sk_X509_ALGOR_pop'; }  {Do not localize}
  {CH fn_sk_X509_ALGOR_sort = 'sk_X509_ALGOR_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_X509_ALGOR = 'i2d_ASN1_SET_OF_X509_ALGOR'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_X509_ALGOR = 'd2i_ASN1_SET_OF_X509_ALGOR'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_new = 'sk_X509_NAME_ENTRY_new'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_new_null = 'sk_X509_NAME_ENTRY_new_null'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_free = 'sk_X509_NAME_ENTRY_free'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_num = 'sk_X509_NAME_ENTRY_num'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_value = 'sk_X509_NAME_ENTRY_value'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_set = 'sk_X509_NAME_ENTRY_set'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_zero = 'sk_X509_NAME_ENTRY_zero'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_push = 'sk_X509_NAME_ENTRY_push'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_unshift = 'sk_X509_NAME_ENTRY_unshift'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_find = 'sk_X509_NAME_ENTRY_find'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_delete = 'sk_X509_NAME_ENTRY_delete'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_delete_ptr = 'sk_X509_NAME_ENTRY_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_insert = 'sk_X509_NAME_ENTRY_insert'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_dup = 'sk_X509_NAME_ENTRY_dup'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_pop_free = 'sk_X509_NAME_ENTRY_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_shift = 'sk_X509_NAME_ENTRY_shift'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_pop = 'sk_X509_NAME_ENTRY_pop'; }  {Do not localize}
  {CH fn_sk_X509_NAME_ENTRY_sort = 'sk_X509_NAME_ENTRY_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_X509_NAME_ENTRY = 'i2d_ASN1_SET_OF_X509_NAME_ENTRY'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_X509_NAME_ENTRY = 'd2i_ASN1_SET_OF_X509_NAME_ENTRY'; }  {Do not localize}
  {CH fn_sk_X509_NAME_new = 'sk_X509_NAME_new'; }  {Do not localize}
  {CH fn_sk_X509_NAME_new_null = 'sk_X509_NAME_new_null'; }  {Do not localize}
  {CH fn_sk_X509_NAME_free = 'sk_X509_NAME_free'; }  {Do not localize}
  {CH fn_sk_X509_NAME_num = 'sk_X509_NAME_num'; }  {Do not localize}
  {CH fn_sk_X509_NAME_value = 'sk_X509_NAME_value'; }  {Do not localize}
  {CH fn_sk_X509_NAME_set = 'sk_X509_NAME_set'; }  {Do not localize}
  {CH fn_sk_X509_NAME_zero = 'sk_X509_NAME_zero'; }  {Do not localize}
  {CH fn_sk_X509_NAME_push = 'sk_X509_NAME_push'; }  {Do not localize}
  {CH fn_sk_X509_NAME_unshift = 'sk_X509_NAME_unshift'; }  {Do not localize}
  {CH fn_sk_X509_NAME_find = 'sk_X509_NAME_find'; }  {Do not localize}
  {CH fn_sk_X509_NAME_delete = 'sk_X509_NAME_delete'; }  {Do not localize}
  {CH fn_sk_X509_NAME_delete_ptr = 'sk_X509_NAME_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_NAME_insert = 'sk_X509_NAME_insert'; }  {Do not localize}
  {CH fn_sk_X509_NAME_dup = 'sk_X509_NAME_dup'; }  {Do not localize}
  {CH fn_sk_X509_NAME_pop_free = 'sk_X509_NAME_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_NAME_shift = 'sk_X509_NAME_shift'; }  {Do not localize}
  {CH fn_sk_X509_NAME_pop = 'sk_X509_NAME_pop'; }  {Do not localize}
  {CH fn_sk_X509_NAME_sort = 'sk_X509_NAME_sort'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_new = 'sk_X509_EXTENSION_new'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_new_null = 'sk_X509_EXTENSION_new_null'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_free = 'sk_X509_EXTENSION_free'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_num = 'sk_X509_EXTENSION_num'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_value = 'sk_X509_EXTENSION_value'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_set = 'sk_X509_EXTENSION_set'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_zero = 'sk_X509_EXTENSION_zero'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_push = 'sk_X509_EXTENSION_push'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_unshift = 'sk_X509_EXTENSION_unshift'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_find = 'sk_X509_EXTENSION_find'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_delete = 'sk_X509_EXTENSION_delete'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_delete_ptr = 'sk_X509_EXTENSION_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_insert = 'sk_X509_EXTENSION_insert'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_dup = 'sk_X509_EXTENSION_dup'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_pop_free = 'sk_X509_EXTENSION_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_shift = 'sk_X509_EXTENSION_shift'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_pop = 'sk_X509_EXTENSION_pop'; }  {Do not localize}
  {CH fn_sk_X509_EXTENSION_sort = 'sk_X509_EXTENSION_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_X509_EXTENSION = 'i2d_ASN1_SET_OF_X509_EXTENSION'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_X509_EXTENSION = 'd2i_ASN1_SET_OF_X509_EXTENSION'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_new = 'sk_X509_ATTRIBUTE_new'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_new_null = 'sk_X509_ATTRIBUTE_new_null'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_free = 'sk_X509_ATTRIBUTE_free'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_num = 'sk_X509_ATTRIBUTE_num'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_value = 'sk_X509_ATTRIBUTE_value'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_set = 'sk_X509_ATTRIBUTE_set'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_zero = 'sk_X509_ATTRIBUTE_zero'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_push = 'sk_X509_ATTRIBUTE_push'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_unshift = 'sk_X509_ATTRIBUTE_unshift'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_find = 'sk_X509_ATTRIBUTE_find'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_delete = 'sk_X509_ATTRIBUTE_delete'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_delete_ptr = 'sk_X509_ATTRIBUTE_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_insert = 'sk_X509_ATTRIBUTE_insert'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_dup = 'sk_X509_ATTRIBUTE_dup'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_pop_free = 'sk_X509_ATTRIBUTE_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_shift = 'sk_X509_ATTRIBUTE_shift'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_pop = 'sk_X509_ATTRIBUTE_pop'; }  {Do not localize}
  {CH fn_sk_X509_ATTRIBUTE_sort = 'sk_X509_ATTRIBUTE_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_X509_ATTRIBUTE = 'i2d_ASN1_SET_OF_X509_ATTRIBUTE'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_X509_ATTRIBUTE = 'd2i_ASN1_SET_OF_X509_ATTRIBUTE'; }  {Do not localize}
  {CH fn_sk_X509_new = 'sk_X509_new'; }  {Do not localize}
  {CH fn_sk_X509_new_null = 'sk_X509_new_null'; }  {Do not localize}
  {CH fn_sk_X509_free = 'sk_X509_free'; }  {Do not localize}
  {CH fn_sk_X509_num = 'sk_X509_num'; }  {Do not localize}
  {CH fn_sk_X509_value = 'sk_X509_value'; }  {Do not localize}
  {CH fn_sk_X509_set = 'sk_X509_set'; }  {Do not localize}
  {CH fn_sk_X509_zero = 'sk_X509_zero'; }  {Do not localize}
  {CH fn_sk_X509_push = 'sk_X509_push'; }  {Do not localize}
  {CH fn_sk_X509_unshift = 'sk_X509_unshift'; }  {Do not localize}
  {CH fn_sk_X509_find = 'sk_X509_find'; }  {Do not localize}
  {CH fn_sk_X509_delete = 'sk_X509_delete'; }  {Do not localize}
  {CH fn_sk_X509_delete_ptr = 'sk_X509_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_insert = 'sk_X509_insert'; }  {Do not localize}
  {CH fn_sk_X509_dup = 'sk_X509_dup'; }  {Do not localize}
  {CH fn_sk_X509_pop_free = 'sk_X509_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_shift = 'sk_X509_shift'; }  {Do not localize}
  {CH fn_sk_X509_pop = 'sk_X509_pop'; }  {Do not localize}
  {CH fn_sk_X509_sort = 'sk_X509_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_X509 = 'i2d_ASN1_SET_OF_X509'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_X509 = 'd2i_ASN1_SET_OF_X509'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_new = 'sk_X509_REVOKED_new'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_new_null = 'sk_X509_REVOKED_new_null'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_free = 'sk_X509_REVOKED_free'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_num = 'sk_X509_REVOKED_num'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_value = 'sk_X509_REVOKED_value'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_set = 'sk_X509_REVOKED_set'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_zero = 'sk_X509_REVOKED_zero'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_push = 'sk_X509_REVOKED_push'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_unshift = 'sk_X509_REVOKED_unshift'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_find = 'sk_X509_REVOKED_find'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_delete = 'sk_X509_REVOKED_delete'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_delete_ptr = 'sk_X509_REVOKED_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_insert = 'sk_X509_REVOKED_insert'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_dup = 'sk_X509_REVOKED_dup'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_pop_free = 'sk_X509_REVOKED_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_shift = 'sk_X509_REVOKED_shift'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_pop = 'sk_X509_REVOKED_pop'; }  {Do not localize}
  {CH fn_sk_X509_REVOKED_sort = 'sk_X509_REVOKED_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_X509_REVOKED = 'i2d_ASN1_SET_OF_X509_REVOKED'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_X509_REVOKED = 'd2i_ASN1_SET_OF_X509_REVOKED'; }  {Do not localize}
  {CH fn_sk_X509_CRL_new = 'sk_X509_CRL_new'; }  {Do not localize}
  {CH fn_sk_X509_CRL_new_null = 'sk_X509_CRL_new_null'; }  {Do not localize}
  {CH fn_sk_X509_CRL_free = 'sk_X509_CRL_free'; }  {Do not localize}
  {CH fn_sk_X509_CRL_num = 'sk_X509_CRL_num'; }  {Do not localize}
  {CH fn_sk_X509_CRL_value = 'sk_X509_CRL_value'; }  {Do not localize}
  {CH fn_sk_X509_CRL_set = 'sk_X509_CRL_set'; }  {Do not localize}
  {CH fn_sk_X509_CRL_zero = 'sk_X509_CRL_zero'; }  {Do not localize}
  {CH fn_sk_X509_CRL_push = 'sk_X509_CRL_push'; }  {Do not localize}
  {CH fn_sk_X509_CRL_unshift = 'sk_X509_CRL_unshift'; }  {Do not localize}
  {CH fn_sk_X509_CRL_find = 'sk_X509_CRL_find'; }  {Do not localize}
  {CH fn_sk_X509_CRL_delete = 'sk_X509_CRL_delete'; }  {Do not localize}
  {CH fn_sk_X509_CRL_delete_ptr = 'sk_X509_CRL_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_CRL_insert = 'sk_X509_CRL_insert'; }  {Do not localize}
  {CH fn_sk_X509_CRL_dup = 'sk_X509_CRL_dup'; }  {Do not localize}
  {CH fn_sk_X509_CRL_pop_free = 'sk_X509_CRL_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_CRL_shift = 'sk_X509_CRL_shift'; }  {Do not localize}
  {CH fn_sk_X509_CRL_pop = 'sk_X509_CRL_pop'; }  {Do not localize}
  {CH fn_sk_X509_CRL_sort = 'sk_X509_CRL_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_X509_CRL = 'i2d_ASN1_SET_OF_X509_CRL'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_X509_CRL = 'd2i_ASN1_SET_OF_X509_CRL'; }  {Do not localize}
  {CH fn_sk_X509_INFO_new = 'sk_X509_INFO_new'; }  {Do not localize}
  {CH fn_sk_X509_INFO_new_null = 'sk_X509_INFO_new_null'; }  {Do not localize}
  {CH fn_sk_X509_INFO_free = 'sk_X509_INFO_free'; }  {Do not localize}
  {CH fn_sk_X509_INFO_num = 'sk_X509_INFO_num'; }  {Do not localize}
  {CH fn_sk_X509_INFO_value = 'sk_X509_INFO_value'; }  {Do not localize}
  {CH fn_sk_X509_INFO_set = 'sk_X509_INFO_set'; }  {Do not localize}
  {CH fn_sk_X509_INFO_zero = 'sk_X509_INFO_zero'; }  {Do not localize}
  {CH fn_sk_X509_INFO_push = 'sk_X509_INFO_push'; }  {Do not localize}
  {CH fn_sk_X509_INFO_unshift = 'sk_X509_INFO_unshift'; }  {Do not localize}
  {CH fn_sk_X509_INFO_find = 'sk_X509_INFO_find'; }  {Do not localize}
  {CH fn_sk_X509_INFO_delete = 'sk_X509_INFO_delete'; }  {Do not localize}
  {CH fn_sk_X509_INFO_delete_ptr = 'sk_X509_INFO_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_INFO_insert = 'sk_X509_INFO_insert'; }  {Do not localize}
  {CH fn_sk_X509_INFO_dup = 'sk_X509_INFO_dup'; }  {Do not localize}
  {CH fn_sk_X509_INFO_pop_free = 'sk_X509_INFO_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_INFO_shift = 'sk_X509_INFO_shift'; }  {Do not localize}
  {CH fn_sk_X509_INFO_pop = 'sk_X509_INFO_pop'; }  {Do not localize}
  {CH fn_sk_X509_INFO_sort = 'sk_X509_INFO_sort'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_new = 'sk_X509_LOOKUP_new'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_new_null = 'sk_X509_LOOKUP_new_null'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_free = 'sk_X509_LOOKUP_free'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_num = 'sk_X509_LOOKUP_num'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_value = 'sk_X509_LOOKUP_value'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_set = 'sk_X509_LOOKUP_set'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_zero = 'sk_X509_LOOKUP_zero'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_push = 'sk_X509_LOOKUP_push'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_unshift = 'sk_X509_LOOKUP_unshift'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_find = 'sk_X509_LOOKUP_find'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_delete = 'sk_X509_LOOKUP_delete'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_delete_ptr = 'sk_X509_LOOKUP_delete_ptr'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_insert = 'sk_X509_LOOKUP_insert'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_dup = 'sk_X509_LOOKUP_dup'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_pop_free = 'sk_X509_LOOKUP_pop_free'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_shift = 'sk_X509_LOOKUP_shift'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_pop = 'sk_X509_LOOKUP_pop'; }  {Do not localize}
  {CH fn_sk_X509_LOOKUP_sort = 'sk_X509_LOOKUP_sort'; }  {Do not localize}
  {CH fn_X509_OBJECT_retrieve_by_subject = 'X509_OBJECT_retrieve_by_subject'; }  {Do not localize}
  {CH fn_X509_OBJECT_up_ref_count = 'X509_OBJECT_up_ref_count'; }  {Do not localize}
  {CH fn_X509_OBJECT_free_contents = 'X509_OBJECT_free_contents'; }  {Do not localize}
  {CH fn_X509_STORE_new = 'X509_STORE_new'; }  {Do not localize}
  {CH fn_X509_STORE_free = 'X509_STORE_free'; }  {Do not localize}
  {CH fn_X509_STORE_CTX_init = 'X509_STORE_CTX_init'; }  {Do not localize}
  {CH fn_X509_STORE_CTX_cleanup = 'X509_STORE_CTX_cleanup'; }  {Do not localize}
  fn_X509_STORE_add_lookup = 'X509_STORE_add_lookup';   {Do not localize}
  {CH fn_X509_LOOKUP_hash_dir = 'X509_LOOKUP_hash_dir'; }  {Do not localize}
  {CH fn_X509_LOOKUP_file = 'X509_LOOKUP_file'; }  {Do not localize}
  fn_X509_STORE_add_cert = 'X509_STORE_add_cert';   {Do not localize}
  fn_X509_STORE_add_crl = 'X509_STORE_add_crl';   {Do not localize}
  {CH fn_X509_STORE_get_by_subject = 'X509_STORE_get_by_subject'; }  {Do not localize}
   fn_X509_LOOKUP_ctrl = 'X509_LOOKUP_ctrl';   {Do not localize}
  {CH fn_X509_load_cert_file = 'X509_load_cert_file'; }  {Do not localize}
  {CH fn_X509_load_crl_file = 'X509_load_crl_file'; }  {Do not localize}
  {CH fn_X509_LOOKUP_new = 'X509_LOOKUP_new'; }  {Do not localize}
  {CH fn_X509_LOOKUP_free = 'X509_LOOKUP_free'; }  {Do not localize}
  {CH fn_X509_LOOKUP_init = 'X509_LOOKUP_init'; }  {Do not localize}
  {CH fn_X509_LOOKUP_by_subject = 'X509_LOOKUP_by_subject'; }  {Do not localize}
  {CH fn_X509_LOOKUP_by_issuer_serial = 'X509_LOOKUP_by_issuer_serial'; }  {Do not localize}
  {CH fn_X509_LOOKUP_by_fingerprint = 'X509_LOOKUP_by_fingerprint'; }  {Do not localize}
  {CH fn_X509_LOOKUP_by_alias = 'X509_LOOKUP_by_alias'; }  {Do not localize}
  {CH fn_X509_LOOKUP_shutdown = 'X509_LOOKUP_shutdown'; }  {Do not localize}
  fn_X509_STORE_load_locations = 'X509_STORE_load_locations';   {Do not localize}
  {CH fn_X509_STORE_set_default_paths = 'X509_STORE_set_default_paths'; }  {Do not localize}
  {CH fn_X509_STORE_CTX_get_ex_new_index = 'X509_STORE_CTX_get_ex_new_index'; }  {Do not localize}
  {CH fn_X509_STORE_CTX_set_ex_data = 'X509_STORE_CTX_set_ex_data'; }  {Do not localize}
  fn_X509_STORE_CTX_get_ex_data = 'X509_STORE_CTX_get_ex_data';  {Do not localize}
  fn_X509_STORE_CTX_get_error = 'X509_STORE_CTX_get_error';  {Do not localize}
  fn_X509_STORE_CTX_set_error = 'X509_STORE_CTX_set_error';  {Do not localize}
  fn_X509_STORE_CTX_get_error_depth = 'X509_STORE_CTX_get_error_depth';  {Do not localize}
  fn_X509_STORE_CTX_get_current_cert = 'X509_STORE_CTX_get_current_cert';  {Do not localize}
  {CH fn_X509_STORE_CTX_get_chain = 'X509_STORE_CTX_get_chain'; }  {Do not localize}
  {CH fn_X509_STORE_CTX_set_cert = 'X509_STORE_CTX_set_cert'; }  {Do not localize}
  {CH fn_X509_STORE_CTX_set_chain = 'X509_STORE_CTX_set_chain'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_new = 'sk_PKCS7_SIGNER_INFO_new'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_new_null = 'sk_PKCS7_SIGNER_INFO_new_null'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_free = 'sk_PKCS7_SIGNER_INFO_free'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_num = 'sk_PKCS7_SIGNER_INFO_num'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_value = 'sk_PKCS7_SIGNER_INFO_value'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_set = 'sk_PKCS7_SIGNER_INFO_set'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_zero = 'sk_PKCS7_SIGNER_INFO_zero'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_push = 'sk_PKCS7_SIGNER_INFO_push'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_unshift = 'sk_PKCS7_SIGNER_INFO_unshift'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_find = 'sk_PKCS7_SIGNER_INFO_find'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_delete = 'sk_PKCS7_SIGNER_INFO_delete'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_delete_ptr = 'sk_PKCS7_SIGNER_INFO_delete_ptr'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_insert = 'sk_PKCS7_SIGNER_INFO_insert'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_dup = 'sk_PKCS7_SIGNER_INFO_dup'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_pop_free = 'sk_PKCS7_SIGNER_INFO_pop_free'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_shift = 'sk_PKCS7_SIGNER_INFO_shift'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_pop = 'sk_PKCS7_SIGNER_INFO_pop'; }  {Do not localize}
  {CH fn_sk_PKCS7_SIGNER_INFO_sort = 'sk_PKCS7_SIGNER_INFO_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_PKCS7_SIGNER_INFO = 'i2d_ASN1_SET_OF_PKCS7_SIGNER_INFO'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_PKCS7_SIGNER_INFO = 'd2i_ASN1_SET_OF_PKCS7_SIGNER_INFO'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_new = 'sk_PKCS7_RECIP_INFO_new'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_new_null = 'sk_PKCS7_RECIP_INFO_new_null'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_free = 'sk_PKCS7_RECIP_INFO_free'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_num = 'sk_PKCS7_RECIP_INFO_num'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_value = 'sk_PKCS7_RECIP_INFO_value'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_set = 'sk_PKCS7_RECIP_INFO_set'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_zero = 'sk_PKCS7_RECIP_INFO_zero'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_push = 'sk_PKCS7_RECIP_INFO_push'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_unshift = 'sk_PKCS7_RECIP_INFO_unshift'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_find = 'sk_PKCS7_RECIP_INFO_find'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_delete = 'sk_PKCS7_RECIP_INFO_delete'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_delete_ptr = 'sk_PKCS7_RECIP_INFO_delete_ptr'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_insert = 'sk_PKCS7_RECIP_INFO_insert'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_dup = 'sk_PKCS7_RECIP_INFO_dup'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_pop_free = 'sk_PKCS7_RECIP_INFO_pop_free'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_shift = 'sk_PKCS7_RECIP_INFO_shift'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_pop = 'sk_PKCS7_RECIP_INFO_pop'; }  {Do not localize}
  {CH fn_sk_PKCS7_RECIP_INFO_sort = 'sk_PKCS7_RECIP_INFO_sort'; }  {Do not localize}
  {CH fn_i2d_ASN1_SET_OF_PKCS7_RECIP_INFO = 'i2d_ASN1_SET_OF_PKCS7_RECIP_INFO'; }  {Do not localize}
  {CH fn_d2i_ASN1_SET_OF_PKCS7_RECIP_INFO = 'd2i_ASN1_SET_OF_PKCS7_RECIP_INFO'; }  {Do not localize}
  {CH fn_PKCS7_ISSUER_AND_SERIAL_new = 'PKCS7_ISSUER_AND_SERIAL_new'; }  {Do not localize}
  {CH fn_PKCS7_ISSUER_AND_SERIAL_free = 'PKCS7_ISSUER_AND_SERIAL_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_ISSUER_AND_SERIAL = 'i2d_PKCS7_ISSUER_AND_SERIAL'; }  {Do not localize}
  {CH fn_d2i_PKCS7_ISSUER_AND_SERIAL = 'd2i_PKCS7_ISSUER_AND_SERIAL'; }  {Do not localize}
  {CH fn_PKCS7_ISSUER_AND_SERIAL_digest = 'PKCS7_ISSUER_AND_SERIAL_digest'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_d2i_PKCS7_fp = 'd2i_PKCS7_fp'; }  {Do not localize}
  {CH fn_i2d_PKCS7_fp = 'i2d_PKCS7_fp'; }  {Do not localize}
  {$ENDIF}
  {CH fn_PKCS7_dup = 'PKCS7_dup'; }  {Do not localize}
  {CH fn_d2i_PKCS7_bio = 'd2i_PKCS7_bio'; }  {Do not localize}
  {CH fn_i2d_PKCS7_bio = 'i2d_PKCS7_bio'; }  {Do not localize}
  {CH fn_PKCS7_SIGNER_INFO_new = 'PKCS7_SIGNER_INFO_new'; }  {Do not localize}
  {CH fn_PKCS7_SIGNER_INFO_free = 'PKCS7_SIGNER_INFO_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_SIGNER_INFO = 'i2d_PKCS7_SIGNER_INFO'; }  {Do not localize}
  {CH fn_d2i_PKCS7_SIGNER_INFO = 'd2i_PKCS7_SIGNER_INFO'; }  {Do not localize}
  {CH fn_PKCS7_RECIP_INFO_new = 'PKCS7_RECIP_INFO_new'; }  {Do not localize}
  {CH fn_PKCS7_RECIP_INFO_free = 'PKCS7_RECIP_INFO_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_RECIP_INFO = 'i2d_PKCS7_RECIP_INFO'; }  {Do not localize}
  {CH fn_d2i_PKCS7_RECIP_INFO = 'd2i_PKCS7_RECIP_INFO'; }  {Do not localize}
  {CH fn_PKCS7_SIGNED_new = 'PKCS7_SIGNED_new'; }  {Do not localize}
  {CH fn_PKCS7_SIGNED_free = 'PKCS7_SIGNED_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_SIGNED = 'i2d_PKCS7_SIGNED'; }  {Do not localize}
  {CH fn_d2i_PKCS7_SIGNED = 'd2i_PKCS7_SIGNED'; }  {Do not localize}
  {CH fn_PKCS7_ENC_CONTENT_new = 'PKCS7_ENC_CONTENT_new'; }  {Do not localize}
  {CH fn_PKCS7_ENC_CONTENT_free = 'PKCS7_ENC_CONTENT_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_ENC_CONTENT = 'i2d_PKCS7_ENC_CONTENT'; }  {Do not localize}
  {CH fn_d2i_PKCS7_ENC_CONTENT = 'd2i_PKCS7_ENC_CONTENT'; }  {Do not localize}
  {CH fn_PKCS7_ENVELOPE_new = 'PKCS7_ENVELOPE_new'; }  {Do not localize}
  {CH fn_PKCS7_ENVELOPE_free = 'PKCS7_ENVELOPE_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_ENVELOPE = 'i2d_PKCS7_ENVELOPE'; }  {Do not localize}
  {CH fn_d2i_PKCS7_ENVELOPE = 'd2i_PKCS7_ENVELOPE'; }  {Do not localize}
  {CH fn_PKCS7_SIGN_ENVELOPE_new = 'PKCS7_SIGN_ENVELOPE_new'; }  {Do not localize}
  {CH fn_PKCS7_SIGN_ENVELOPE_free = 'PKCS7_SIGN_ENVELOPE_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_SIGN_ENVELOPE = 'i2d_PKCS7_SIGN_ENVELOPE'; }  {Do not localize}
  {CH fn_d2i_PKCS7_SIGN_ENVELOPE = 'd2i_PKCS7_SIGN_ENVELOPE'; }  {Do not localize}
  {CH fn_PKCS7_DIGEST_new = 'PKCS7_DIGEST_new'; }  {Do not localize}
  {CH fn_PKCS7_DIGEST_free = 'PKCS7_DIGEST_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_DIGEST = 'i2d_PKCS7_DIGEST'; }  {Do not localize}
  {CH fn_d2i_PKCS7_DIGEST = 'd2i_PKCS7_DIGEST'; }  {Do not localize}
  {CH fn_PKCS7_ENCRYPT_new = 'PKCS7_ENCRYPT_new'; }  {Do not localize}
  {CH fn_PKCS7_ENCRYPT_free = 'PKCS7_ENCRYPT_free'; }  {Do not localize}
  {CH fn_i2d_PKCS7_ENCRYPT = 'i2d_PKCS7_ENCRYPT'; }  {Do not localize}
  {CH fn_d2i_PKCS7_ENCRYPT = 'd2i_PKCS7_ENCRYPT'; }  {Do not localize}
  {CH fn_PKCS7_new = 'PKCS7_new'; }  {Do not localize}
  {CH fn_PKCS7_free = 'PKCS7_free'; }  {Do not localize}
  {CH fn_PKCS7_content_free = 'PKCS7_content_free'; }  {Do not localize}
  fn_i2d_PKCS7 = 'i2d_PKCS7';   {Do not localize}
   fn_d2i_PKCS7 = 'd2i_PKCS7';   {Do not localize}
  {CH fn_ERR_load_PKCS7_strings = 'ERR_load_PKCS7_strings'; }  {Do not localize}
  {CH fn_PKCS7_ctrl = 'PKCS7_ctrl'; }  {Do not localize}
  {CH fn_PKCS7_set_type = 'PKCS7_set_type'; }  {Do not localize}
  {CH fn_PKCS7_set_content = 'PKCS7_set_content'; }  {Do not localize}
  {CH fn_PKCS7_SIGNER_INFO_set = 'PKCS7_SIGNER_INFO_set'; }  {Do not localize}
  {CH fn_PKCS7_add_signer = 'PKCS7_add_signer'; }  {Do not localize}
  {CH fn_PKCS7_add_certificate = 'PKCS7_add_certificate'; }  {Do not localize}
  {CH fn_PKCS7_add_crl = 'PKCS7_add_crl'; }  {Do not localize}
  {CH fn_PKCS7_content_new = 'PKCS7_content_new'; }  {Do not localize}
  {CH fn_PKCS7_dataVerify = 'PKCS7_dataVerify'; }  {Do not localize}
  {CH fn_PKCS7_signatureVerify = 'PKCS7_signatureVerify'; }  {Do not localize}
  {CH fn_PKCS7_dataInit = 'PKCS7_dataInit'; }  {Do not localize}
  {CH fn_PKCS7_dataFinal = 'PKCS7_dataFinal'; }  {Do not localize}
  {CH fn_PKCS7_dataDecode = 'PKCS7_dataDecode'; }  {Do not localize}
  {CH fn_PKCS7_add_signature = 'PKCS7_add_signature'; }  {Do not localize}
  {CH fn_PKCS7_cert_from_signer_info = 'PKCS7_cert_from_signer_info'; }  {Do not localize}
  {CH fn_PKCS7_get_signer_info = 'PKCS7_get_signer_info'; }  {Do not localize}
  {CH fn_PKCS7_add_recipient = 'PKCS7_add_recipient'; }  {Do not localize}
  {CH fn_PKCS7_add_recipient_info = 'PKCS7_add_recipient_info'; }  {Do not localize}
  {CH fn_PKCS7_RECIP_INFO_set = 'PKCS7_RECIP_INFO_set'; }  {Do not localize}
  {CH fn_PKCS7_set_cipher = 'PKCS7_set_cipher'; }  {Do not localize}
  {CH fn_PKCS7_get_issuer_and_serial = 'PKCS7_get_issuer_and_serial'; }  {Do not localize}
  {CH fn_PKCS7_digest_from_attributes = 'PKCS7_digest_from_attributes'; }  {Do not localize}
  {CH fn_PKCS7_add_signed_attribute = 'PKCS7_add_signed_attribute'; }  {Do not localize}
  {CH fn_PKCS7_add_attribute = 'PKCS7_add_attribute'; }  {Do not localize}
  {CH fn_PKCS7_get_attribute = 'PKCS7_get_attribute'; }  {Do not localize}
  {CH fn_PKCS7_get_signed_attribute = 'PKCS7_get_signed_attribute'; }  {Do not localize}
  {CH fn_PKCS7_set_signed_attributes = 'PKCS7_set_signed_attributes'; }  {Do not localize}
  {CH fn_PKCS7_set_attributes = 'PKCS7_set_attributes'; }  {Do not localize}
  {CH fn_X509_verify_cert_error_string = 'X509_verify_cert_error_string'; }  {Do not localize}
  {CH fn_X509_verify = 'X509_verify'; }  {Do not localize}
  {CH fn_X509_REQ_verify = 'X509_REQ_verify'; }  {Do not localize}
  {CH fn_X509_CRL_verify = 'X509_CRL_verify'; }  {Do not localize}
  {CH fn_NETSCAPE_SPKI_verify = 'NETSCAPE_SPKI_verify'; }  {Do not localize}
  fn_X509_sign = 'X509_sign';  {Do not localize}
  fn_X509_REQ_sign = 'X509_REQ_sign';  {Do not localize}
  fn_X509V3_set_ctx = 'X509V3_set_ctx'; {Do not localize}
  fn_X509V3_EXT_conf_nid = 'X509V3_EXT_conf_nid'; {Do not localize}
  fn_X509_REQ_add_extensions = 'X509_REQ_add_extensions'; {Do not localize}
  {CH fn_X509_CRL_sign = 'X509_CRL_sign'; }  {Do not localize}
  {CH fn_NETSCAPE_SPKI_sign = 'NETSCAPE_SPKI_sign'; }  {Do not localize}
  fn_X509_digest = 'X509_digest';  {Do not localize}
  {CH fn_X509_NAME_digest = 'X509_NAME_digest'; }  {Do not localize}
  {CH fn_d2i_X509_fp = 'd2i_X509_fp'; }  {Do not localize}
  {CH fn_i2d_X509_fp = 'i2d_X509_fp'; }  {Do not localize}
  {CH fn_d2i_X509_CRL_fp = 'd2i_X509_CRL_fp'; }  {Do not localize}
  {CH fn_i2d_X509_CRL_fp = 'i2d_X509_CRL_fp'; }  {Do not localize}
  {CH fn_d2i_X509_REQ_fp = 'd2i_X509_REQ_fp'; }  {Do not localize}
  {CH fn_i2d_X509_REQ_fp = 'i2d_X509_REQ_fp'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_RSA}
  {CH fn_d2i_RSAPrivateKey_fp = 'd2i_RSAPrivateKey_fp'; }  {Do not localize}
  {CH fn_i2d_RSAPrivateKey_fp = 'i2d_RSAPrivateKey_fp'; }  {Do not localize}
  {CH fn_d2i_RSAPublicKey_fp = 'd2i_RSAPublicKey_fp'; }  {Do not localize}
  {CH fn_i2d_RSAPublicKey_fp = 'i2d_RSAPublicKey_fp'; }  {Do not localize}
  {CH fn_d2i_RSA_PUBKEY_fp = 'd2i_RSA_PUBKEY_fp'; } {Do not localize}
  {CH fn_i2d_RSA_PUBKEY_fp = 'i2d_RSA_PUBKEY_fp'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DSA}
  {CH fn_d2i_DSA_PUBKEY_fp = 'd2i_DSA_PUBKEY_fp'; } {Do not localize}
  {CH fn_i2d_DSA_PUBKEY_fp = 'i2d_DSA_PUBKEY_fp'; } {Do not localize}
  {CH fn_d2i_DSAPrivateKey_fp = 'd2i_DSAPrivateKey_fp'; }  {Do not localize}
  {CH fn_i2d_DSAPrivateKey_fp = 'i2d_DSAPrivateKey_fp'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_EC}
  {CH fn_d2i_EC_PUBKEY_fp = 'd2i_EC_PUBKEY_fp'; } {Do not localize}
  {CH fn_i2d_EC_PUBKEY_fp = 'i2d_EC_PUBKEY_fp'; } {Do not localize}
  {CH fn_d2i_ECPrivateKey_fp = 'd2i_ECPrivateKey_fp'; } {Do not localize}
  {CH fn_i2d_ECPrivateKey_fp = 'i2d_ECPrivateKey_fp'; } {Do not localize}
  {$ENDIF}
  {CH fn_d2i_PKCS8_fp = 'd2i_PKCS8_fp'; }  {Do not localize}
  {CH fn_i2d_PKCS8_fp = 'i2d_PKCS8_fp'; }  {Do not localize}
  {CH fn_d2i_PKCS8_PRIV_KEY_INFO_fp = 'd2i_PKCS8_PRIV_KEY_INFO_fp'; }  {Do not localize}
  {CH fn_i2d_PKCS8_PRIV_KEY_INFO_fp = 'i2d_PKCS8_PRIV_KEY_INFO_fp'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_BIO}
  fn_d2i_X509_bio = 'd2i_X509_bio';  {Do not localize}
  fn_i2d_X509_bio = 'i2d_X509_bio';  {Do not localize}
  fn_i2d_PrivateKey_bio = 'i2d_PrivateKey_bio'; {Do not localize}
  fn_d2i_X509_CRL_bio = 'd2i_X509_CRL_bio';   {Do not localize}
  fn_i2d_X509_CRL_bio = 'i2d_X509_CRL_bio';   {Do not localize}
  fn_d2i_X509_REQ_bio = 'd2i_X509_REQ_bio';   {Do not localize}
  fn_i2d_X509_REQ_bio = 'i2d_X509_REQ_bio';  {Do not localize}
    {$IFNDEF OPENSSL_NO_RSA}
  fn_d2i_RSAPrivateKey_bio = 'd2i_RSAPrivateKey_bio';  {Do not localize}
  fn_i2d_RSAPrivateKey_bio = 'i2d_RSAPrivateKey_bio';  {Do not localize}
  fn_d2i_RSAPublicKey_bio = 'd2i_RSAPublicKey_bio';   {Do not localize}
  fn_i2d_RSAPublicKey_bio = 'i2d_RSAPublicKey_bio';   {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_DSA}
  {CH fn_d2i_DSA_PUBKEY_bio = 'd2i_DSA_PUBKEY_bio'; } {Do not localize}
  {CH fn_i2d_DSA_PUBKEY_bio = 'i2d_DSA_PUBKEY_bio'; } {Do not localize}
  {CH fn_d2i_DSAPrivateKey_bio = 'd2i_DSAPrivateKey_bio'; }  {Do not localize}
  {CH fn_i2d_DSAPrivateKey_bio = 'i2d_DSAPrivateKey_bio'; }  {Do not localize}
    {$ENDIF}
    {$IFNDEF OPENSSL_NO_EC}
  {CH fn_d2i_EC_PUBKEY_bio = 'd2i_EC_PUBKEY_bio'; } {Do not localize}
  {CH fn_i2d_EC_PUBKEY_bio = 'i2d_EC_PUBKEY_bio'; } {Do not localize}
  {CH fn_d2i_ECPrivateKey_bio = 'd2i_ECPrivateKey_bio'; } {Do not localize}
  {CH fn_i2d_ECPrivateKey_bio = 'i2d_ECPrivateKey_bio'; } {Do not localize}
    {$ENDIF}
  {CH fn_d2i_PKCS8_bio = 'd2i_PKCS8_bio'; }  {Do not localize}
  {CH fn_i2d_PKCS8_bio = 'i2d_PKCS8_bio'; }  {Do not localize}
  {CH fn_d2i_PKCS8_PRIV_KEY_INFO_bio = 'd2i_PKCS8_PRIV_KEY_INFO_bio'; }  {Do not localize}
  {CH fn_i2d_PKCS8_PRIV_KEY_INFO_bio = 'i2d_PKCS8_PRIV_KEY_INFO_bio'; }  {Do not localize}
  fn_d2i_PrivateKey_bio = 'd2i_PrivateKey_bio';  {Do not localize}
  {CH fn_i2d_PUBKEY_bio = 'i2d_PUBKEY_bio'; } {Do not localize}
  {CH fn_d2i_PUBKEY_bio = 'd2i_PUBKEY_bio'; } {Do not localize}
  {$ENDIF}
  {CH fn_X509_dup = 'X509_dup'; }  {Do not localize}
  {CH fn_X509_ATTRIBUTE_dup = 'X509_ATTRIBUTE_dup'; }  {Do not localize}
  {CH fn_X509_EXTENSION_dup = 'X509_EXTENSION_dup'; }  {Do not localize}
  {CH fn_X509_CRL_dup = 'X509_CRL_dup'; }  {Do not localize}
  {CH fn_X509_REQ_dup = 'X509_REQ_dup'; }  {Do not localize}
  {CH fn_X509_ALGOR_dup = 'X509_ALGOR_dup'; }  {Do not localize}
  {CH fn_X509_NAME_dup = 'X509_NAME_dup'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_dup = 'X509_NAME_ENTRY_dup'; }  {Do not localize}
  {CH fn_RSAPublicKey_dup = 'RSAPublicKey_dup'; }  {Do not localize}
  {CH fn_RSAPrivateKey_dup = 'RSAPrivateKey_dup'; }  {Do not localize}
  {CH fn_X509_cmp_current_time = 'X509_cmp_current_time'; }  {Do not localize}
  fn_X509_gmtime_adj = 'X509_gmtime_adj';  {Do not localize}
  {CH fn_X509_get_default_cert_area = 'X509_get_default_cert_area'; }  {Do not localize}
  {CH fn_X509_get_default_cert_dir = 'X509_get_default_cert_dir'; }  {Do not localize}
   fn_X509_get_default_cert_file = 'X509_get_default_cert_file';   {Do not localize}
  {CH fn_X509_get_default_cert_dir_env = 'X509_get_default_cert_dir_env'; }  {Do not localize}
  fn_X509_get_default_cert_file_env = 'X509_get_default_cert_file_env';   {Do not localize}
  {CH fn_X509_get_default_private_dir = 'X509_get_default_private_dir'; }  {Do not localize}
  fn_X509_to_X509_REQ = 'X509_to_X509_REQ';  {Do not localize}
  {CH fn_X509_REQ_to_X509 = 'X509_REQ_to_X509'; }  {Do not localize}
  fn_X509_NAME_add_entry_by_txt = 'X509_NAME_add_entry_by_txt'; {Do not localize}
  {CH fn_ERR_load_X509_strings = 'ERR_load_X509_strings'; }  {Do not localize}
  {CH fn_X509_ALGOR_new = 'X509_ALGOR_new'; }  {Do not localize}
  {CH fn_X509_ALGOR_free = 'X509_ALGOR_free'; }  {Do not localize}
  {CH fn_i2d_X509_ALGOR = 'i2d_X509_ALGOR'; }  {Do not localize}
  {CH fn_d2i_X509_ALGOR = 'd2i_X509_ALGOR'; }  {Do not localize}
  {CH fn_X509_VAL_new = 'X509_VAL_new'; }  {Do not localize}
  {CH fn_X509_VAL_free = 'X509_VAL_free'; }  {Do not localize}
  {CH fn_i2d_X509_VAL = 'i2d_X509_VAL'; }  {Do not localize}
  {CH fn_d2i_X509_VAL = 'd2i_X509_VAL'; }  {Do not localize}
  {CH fn_X509_PUBKEY_new = 'X509_PUBKEY_new'; }  {Do not localize}
  {CH fn_X509_PUBKEY_free = 'X509_PUBKEY_free'; }  {Do not localize}
  {CH fn_i2d_X509_PUBKEY = 'i2d_X509_PUBKEY'; }  {Do not localize}
  {CH fn_d2i_X509_PUBKEY = 'd2i_X509_PUBKEY'; }  {Do not localize}
  {CH fn_X509_PUBKEY_set = 'X509_PUBKEY_set'; }  {Do not localize}
  {CH fn_X509_PUBKEY_get = 'X509_PUBKEY_get'; }  {Do not localize}
  {CH fn_X509_get_pubkey_parameters = 'X509_get_pubkey_parameters'; }  {Do not localize}
  {CH fn_X509_SIG_new = 'X509_SIG_new'; }  {Do not localize}
  {CH fn_X509_SIG_free = 'X509_SIG_free'; }  {Do not localize}
  {CH fn_i2d_X509_SIG = 'i2d_X509_SIG'; }  {Do not localize}
  {CH fn_d2i_X509_SIG = 'd2i_X509_SIG'; }  {Do not localize}
  {CH fn_X509_REQ_INFO_new = 'X509_REQ_INFO_new'; }  {Do not localize}
  {CH fn_X509_REQ_INFO_free = 'X509_REQ_INFO_free'; }  {Do not localize}
  {CH fn_i2d_X509_REQ_INFO = 'i2d_X509_REQ_INFO'; }  {Do not localize}
  {CH fn_d2i_X509_REQ_INFO = 'd2i_X509_REQ_INFO'; }  {Do not localize}
  fn_X509_REQ_new = 'X509_REQ_new';  {Do not localize}
  fn_X509_REQ_free = 'X509_REQ_free';  {Do not localize}
  fn_i2d_X509_REQ = 'i2d_X509_REQ';   {Do not localize}
  fn_d2i_X509_REQ = 'd2i_X509_REQ';   {Do not localize}
  {CH fn_X509_ATTRIBUTE_new = 'X509_ATTRIBUTE_new'; }  {Do not localize}
  {CH fn_X509_ATTRIBUTE_free = 'X509_ATTRIBUTE_free'; }  {Do not localize}
  {CH fn_i2d_X509_ATTRIBUTE = 'i2d_X509_ATTRIBUTE'; }  {Do not localize}
  {CH fn_d2i_X509_ATTRIBUTE = 'd2i_X509_ATTRIBUTE'; }  {Do not localize}
  {CH fn_X509_ATTRIBUTE_create = 'X509_ATTRIBUTE_create'; }  {Do not localize}
  {CH fn_X509_EXTENSION_new = 'X509_EXTENSION_new'; }  {Do not localize}
  fn_X509_EXTENSION_free = 'X509_EXTENSION_free';  {Do not localize}
  {CH fn_i2d_X509_EXTENSION = 'i2d_X509_EXTENSION'; }  {Do not localize}
  {CH fn_d2i_X509_EXTENSION = 'd2i_X509_EXTENSION'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_new = 'X509_NAME_ENTRY_new'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_free = 'X509_NAME_ENTRY_free'; }  {Do not localize}
  fn_i2d_X509_NAME_ENTRY = 'i2d_X509_NAME_ENTRY';   {Do not localize}
  fn_d2i_X509_NAME_ENTRY = 'd2i_X509_NAME_ENTRY';   {Do not localize}
  fn_X509_NAME_new = 'X509_NAME_new';   {Do not localize}
  fn_X509_NAME_free = 'X509_NAME_free';   {Do not localize}
   fn_i2d_X509_NAME = 'i2d_X509_NAME';   {Do not localize}
  fn_d2i_X509_NAME = 'd2i_X509_NAME';   {Do not localize}
  {CH fn_X509_NAME_set = 'X509_NAME_set'; }  {Do not localize}
  {CH fn_X509_CINF_new = 'X509_CINF_new'; }  {Do not localize}
  {CH fn_X509_CINF_free = 'X509_CINF_free'; }  {Do not localize}
  {CH fn_i2d_X509_CINF = 'i2d_X509_CINF'; }  {Do not localize}
  {CH fn_d2i_X509_CINF = 'd2i_X509_CINF'; }  {Do not localize}
  fn_X509_new = 'X509_new';  {Do not localize}
  fn_X509_free = 'X509_free';  {Do not localize}
  fn_i2d_X509 = 'i2d_X509';  {Do not localize}
  fn_d2i_X509 = 'd2i_X509';  {Do not localize}
  {CH fn_X509_REVOKED_new = 'X509_REVOKED_new'; }  {Do not localize}
  {CH fn_X509_REVOKED_free = 'X509_REVOKED_free'; }  {Do not localize}
  {CH fn_i2d_X509_REVOKED = 'i2d_X509_REVOKED'; }  {Do not localize}
  {CH fn_d2i_X509_REVOKED = 'd2i_X509_REVOKED'; }  {Do not localize}
  {CH fn_X509_CRL_INFO_new = 'X509_CRL_INFO_new'; }  {Do not localize}
  {CH fn_X509_CRL_INFO_free = 'X509_CRL_INFO_free'; }  {Do not localize}
  {CH fn_i2d_X509_CRL_INFO = 'i2d_X509_CRL_INFO'; }  {Do not localize}
  {CH fn_d2i_X509_CRL_INFO = 'd2i_X509_CRL_INFO'; }  {Do not localize}
  {CH fn_X509_CRL_new = 'X509_CRL_new'; }  {Do not localize}
  {CH fn_X509_CRL_free = 'X509_CRL_free'; }  {Do not localize}
  fn_i2d_X509_CRL = 'i2d_X509_CRL';   {Do not localize}
  fn_d2i_X509_CRL = 'd2i_X509_CRL';   {Do not localize}
  {CH fn_X509_PKEY_new = 'X509_PKEY_new'; }  {Do not localize}
  {CH fn_X509_PKEY_free = 'X509_PKEY_free'; }  {Do not localize}
  {CH fn_i2d_X509_PKEY = 'i2d_X509_PKEY'; }  {Do not localize}
  {CH fn_d2i_X509_PKEY = 'd2i_X509_PKEY'; }  {Do not localize}
  {CH fn_NETSCAPE_SPKI_new = 'NETSCAPE_SPKI_new'; }  {Do not localize}
  {CH fn_NETSCAPE_SPKI_free = 'NETSCAPE_SPKI_free'; }  {Do not localize}
  {CH fn_i2d_NETSCAPE_SPKI = 'i2d_NETSCAPE_SPKI'; }  {Do not localize}
  {CH fn_d2i_NETSCAPE_SPKI = 'd2i_NETSCAPE_SPKI'; }  {Do not localize}
  {CH fn_NETSCAPE_SPKAC_new = 'NETSCAPE_SPKAC_new'; }  {Do not localize}
  {CH fn_NETSCAPE_SPKAC_free = 'NETSCAPE_SPKAC_free'; }  {Do not localize}
  {CH fn_i2d_NETSCAPE_SPKAC = 'i2d_NETSCAPE_SPKAC'; }  {Do not localize}
  {CH fn_d2i_NETSCAPE_SPKAC = 'd2i_NETSCAPE_SPKAC'; }  {Do not localize}
   fn_i2d_NETSCAPE_CERT_SEQUENCE = 'i2d_NETSCAPE_CERT_SEQUENCE';   {Do not localize}
   fn_d2i_NETSCAPE_CERT_SEQUENCE = 'd2i_NETSCAPE_CERT_SEQUENCE';   {Do not localize}

  {CH fn_NETSCAPE_CERT_SEQUENCE_new = 'NETSCAPE_CERT_SEQUENCE_new'; }  {Do not localize}
  {CH fn_NETSCAPE_CERT_SEQUENCE_free = 'NETSCAPE_CERT_SEQUENCE_free'; }  {Do not localize}
  {CH fn_X509_INFO_new = 'X509_INFO_new'; }  {Do not localize}
  fn_X509_INFO_free = 'X509_INFO_free';   {Do not localize}
  fn_X509_NAME_oneline = 'X509_NAME_oneline';  {Do not localize}
  {CH fn_ASN1_verify = 'ASN1_verify'; }  {Do not localize}
  {CH fn_ASN1_digest = 'ASN1_digest'; }  {Do not localize}
  {CH fn_ASN1_sign = 'ASN1_sign'; }  {Do not localize}
  fn_X509_set_version = 'X509_set_version';  {Do not localize}
  {CH fn_X509_set_serialNumber = 'X509_set_serialNumber'; }  {Do not localize}
  fn_X509_get_serialNumber = 'X509_get_serialNumber';  {Do not localize}
  fn_X509_set_issuer_name = 'X509_set_issuer_name';  {Do not localize}
  fn_X509_get_issuer_name = 'X509_get_issuer_name';  {Do not localize}
  fn_X509_set_subject_name = 'X509_set_subject_name';  {Do not localize}
  fn_X509_get_subject_name = 'X509_get_subject_name';  {Do not localize}
  fn_X509_set_notBefore = 'X509_set_notBefore';  {Do not localize}
  fn_X509_set_notAfter = 'X509_set_notAfter';  {Do not localize}
  fn_X509_set_pubkey = 'X509_set_pubkey';  {Do not localize}
  {CH fn_X509_get_pubkey = 'X509_get_pubkey'; }  {Do not localize}
  {CH fn_X509_certificate_type = 'X509_certificate_type'; }  {Do not localize}
  {CH fn_X509_REQ_set_version = 'X509_REQ_set_version'; }  {Do not localize}
  {CH fn_X509_REQ_set_subject_name = 'X509_REQ_set_subject_name'; }  {Do not localize}
  fn_X509_REQ_set_pubkey = 'X509_REQ_set_pubkey';  {Do not localize}
  {CH fn_X509_REQ_get_pubkey = 'X509_REQ_get_pubkey'; }  {Do not localize}
  {CH fn_X509_check_private_key = 'X509_check_private_key'; }  {Do not localize}
  {CH fn_X509_issuer_and_serial_cmp = 'X509_issuer_and_serial_cmp'; }  {Do not localize}
  {CH fn_X509_issuer_and_serial_hash = 'X509_issuer_and_serial_hash'; }  {Do not localize}
  {CH fn_X509_issuer_name_cmp = 'X509_issuer_name_cmp'; }  {Do not localize}
  {CH fn_X509_issuer_name_hash = 'X509_issuer_name_hash'; }  {Do not localize}
  {CH fn_X509_subject_name_cmp = 'X509_subject_name_cmp'; }  {Do not localize}
  {CH fn_X509_subject_name_hash = 'X509_subject_name_hash'; }  {Do not localize}
  {CH fn_X509_NAME_cmp = 'X509_NAME_cmp'; }  {Do not localize}
  fn_X509_NAME_hash = 'X509_NAME_hash';  {Do not localize}
  {CH fn_X509_CRL_cmp = 'X509_CRL_cmp'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_X509_print_ex_fp = 'X509_print_ex_fp'; } {Do not localize}
  {CH fn_X509_print_fp = 'X509_print_fp'; } {Do not localize}
  {CH fn_X509_CRL_print_fp = 'X509_CRL_print_fp'; }  {Do not localize}
  {CH fn_X509_REQ_print_fp = 'X509_REQ_print_fp'; }  {Do not localize}
  {CH fn_X509_NAME_print_ex_fp = 'X509_NAME_print_ex_fp'; } {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_X509_NAME_print = 'X509_NAME_print'; }  {Do not localize}
  {CH fn_X509_NAME_print_ex = 'X509_NAME_print_ex'; } {Do not localize}
  {CH fn_X509_print_ex = 'X509_print_ex'; } {Do not localize}
  fn_X509_print = 'X509_print';  {Do not localize}
  {CH fn_X509_ocspid_print = 'X509_ocspid_print'; } {Do not localize}
  {CH fn_X509_CERT_AUX_print = 'X509_CERT_AUX_print'; } {Do not localize}
  {CH fn_X509_CRL_print = 'X509_CRL_print'; }  {Do not localize}
  {CH fn_X509_REQ_print = 'X509_REQ_print'; }  {Do not localize}
  {CH fn_X509_REQ_print_ex = 'X509_REQ_print_ex'; } {Do not localize}
  {$ENDIF}
  {CH fn_X509_NAME_entry_count = 'X509_NAME_entry_count'; }  {Do not localize}
  {CH fn_X509_NAME_get_text_by_NID = 'X509_NAME_get_text_by_NID'; }  {Do not localize}
  {CH fn_X509_NAME_get_text_by_OBJ = 'X509_NAME_get_text_by_OBJ'; }  {Do not localize}
  {CH fn_X509_NAME_get_index_by_NID = 'X509_NAME_get_index_by_NID'; }  {Do not localize}
  {CH fn_X509_NAME_get_index_by_OBJ = 'X509_NAME_get_index_by_OBJ'; }  {Do not localize}
  {CH fn_X509_NAME_get_entry = 'X509_NAME_get_entry'; }  {Do not localize}
  {CH fn_X509_NAME_delete_entry = 'X509_NAME_delete_entry'; }  {Do not localize}
  {CH fn_X509_NAME_add_entry = 'X509_NAME_add_entry'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_create_by_NID = 'X509_NAME_ENTRY_create_by_NID'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_create_by_OBJ = 'X509_NAME_ENTRY_create_by_OBJ'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_set_object = 'X509_NAME_ENTRY_set_object'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_set_data = 'X509_NAME_ENTRY_set_data'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_get_object = 'X509_NAME_ENTRY_get_object'; }  {Do not localize}
  {CH fn_X509_NAME_ENTRY_get_data = 'X509_NAME_ENTRY_get_data'; }  {Do not localize}
  {CH fn_X509v3_get_ext_count = 'X509v3_get_ext_count'; }  {Do not localize}
  {CH fn_X509v3_get_ext_by_NID = 'X509v3_get_ext_by_NID'; }  {Do not localize}
  {CH fn_X509v3_get_ext_by_OBJ = 'X509v3_get_ext_by_OBJ'; }  {Do not localize}
  {CH fn_X509v3_get_ext_by_critical = 'X509v3_get_ext_by_critical'; }  {Do not localize}
  {CH fn_X509v3_get_ext = 'X509v3_get_ext'; }  {Do not localize}
  {CH fn_X509v3_delete_ext = 'X509v3_delete_ext'; }  {Do not localize}
  {CH fn_X509v3_add_ext = 'X509v3_add_ext'; }  {Do not localize}
  {CH fn_X509_get_ext_count = 'X509_get_ext_count'; }  {Do not localize}
  {CH fn_X509_get_ext_by_NID = 'X509_get_ext_by_NID'; }  {Do not localize}
  {CH fn_X509_get_ext_by_OBJ = 'X509_get_ext_by_OBJ'; }  {Do not localize}
  {CH fn_X509_get_ext_by_critical = 'X509_get_ext_by_critical'; }  {Do not localize}
  {CH fn_X509_get_ext = 'X509_get_ext'; }  {Do not localize}
  {CH fn_X509_delete_ext = 'X509_delete_ext'; }  {Do not localize}
  fn_X509_add_ext = 'X509_add_ext';  {Do not localize}
  {CH fn_X509_CRL_get_ext_count = 'X509_CRL_get_ext_count'; }  {Do not localize}
  {CH fn_X509_CRL_get_ext_by_NID = 'X509_CRL_get_ext_by_NID'; }  {Do not localize}
  {CH fn_X509_CRL_get_ext_by_OBJ = 'X509_CRL_get_ext_by_OBJ'; }  {Do not localize}
  {CH fn_X509_CRL_get_ext_by_critical = 'X509_CRL_get_ext_by_critical'; }  {Do not localize}
  {CH fn_X509_CRL_get_ext = 'X509_CRL_get_ext'; }  {Do not localize}
  {CH fn_X509_CRL_delete_ext = 'X509_CRL_delete_ext'; }  {Do not localize}
  {CH fn_X509_CRL_add_ext = 'X509_CRL_add_ext'; }  {Do not localize}
  {CH fn_X509_REVOKED_get_ext_count = 'X509_REVOKED_get_ext_count'; }  {Do not localize}
  {CH fn_X509_REVOKED_get_ext_by_NID = 'X509_REVOKED_get_ext_by_NID'; }  {Do not localize}
  {CH fn_X509_REVOKED_get_ext_by_OBJ = 'X509_REVOKED_get_ext_by_OBJ'; }  {Do not localize}
  {CH fn_X509_REVOKED_get_ext_by_critical = 'X509_REVOKED_get_ext_by_critical'; }  {Do not localize}
  {CH fn_X509_REVOKED_get_ext = 'X509_REVOKED_get_ext'; }  {Do not localize}
  {CH fn_X509_REVOKED_delete_ext = 'X509_REVOKED_delete_ext'; }  {Do not localize}
  {CH fn_X509_REVOKED_add_ext = 'X509_REVOKED_add_ext'; }  {Do not localize}
  fn_X509_EXTENSION_create_by_NID = 'X509_EXTENSION_create_by_NID';  {Do not localize}
  {CH fn_X509_EXTENSION_create_by_OBJ = 'X509_EXTENSION_create_by_OBJ'; }  {Do not localize}
  {CH fn_X509_EXTENSION_set_object = 'X509_EXTENSION_set_object'; }  {Do not localize}
  {CH fn_X509_EXTENSION_set_critical = 'X509_EXTENSION_set_critical'; }  {Do not localize}
  {CH fn_X509_EXTENSION_set_data = 'X509_EXTENSION_set_data'; }  {Do not localize}
  {CH fn_X509_EXTENSION_get_object = 'X509_EXTENSION_get_object'; }  {Do not localize}
  {CH fn_X509_EXTENSION_get_data = 'X509_EXTENSION_get_data'; }  {Do not localize}
  {CH fn_X509_EXTENSION_get_critical = 'X509_EXTENSION_get_critical'; }  {Do not localize}
  {CH fn_X509_verify_cert = 'X509_verify_cert'; }  {Do not localize}
  {CH fn_X509_find_by_issuer_and_serial = 'X509_find_by_issuer_and_serial'; }  {Do not localize}
  {CH fn_X509_find_by_subject = 'X509_find_by_subject'; }  {Do not localize}
  {CH fn_i2d_PBEPARAM = 'i2d_PBEPARAM'; }  {Do not localize}
  {CH fn_PBEPARAM_new = 'PBEPARAM_new'; }  {Do not localize}
  {CH fn_d2i_PBEPARAM = 'd2i_PBEPARAM'; }  {Do not localize}
  {CH fn_PBEPARAM_free = 'PBEPARAM_free'; }  {Do not localize}
  {CH fn_PKCS5_pbe_set = 'PKCS5_pbe_set'; }  {Do not localize}
  {CH fn_PKCS5_pbe2_set = 'PKCS5_pbe2_set'; }  {Do not localize}
  {CH fn_i2d_PBKDF2PARAM = 'i2d_PBKDF2PARAM'; }  {Do not localize}
  {CH fn_PBKDF2PARAM_new = 'PBKDF2PARAM_new'; }  {Do not localize}
  {CH fn_d2i_PBKDF2PARAM = 'd2i_PBKDF2PARAM'; }  {Do not localize}
  {CH fn_PBKDF2PARAM_free = 'PBKDF2PARAM_free'; }  {Do not localize}
  {CH fn_i2d_PBE2PARAM = 'i2d_PBE2PARAM'; }  {Do not localize}
  {CH fn_PBE2PARAM_new = 'PBE2PARAM_new'; }  {Do not localize}
  {CH fn_d2i_PBE2PARAM = 'd2i_PBE2PARAM'; }  {Do not localize}
  {CH fn_PBE2PARAM_free = 'PBE2PARAM_free'; }  {Do not localize}
  {CH fn_i2d_PKCS8_PRIV_KEY_INFO = 'i2d_PKCS8_PRIV_KEY_INFO'; }  {Do not localize}
  {CH fn_PKCS8_PRIV_KEY_INFO_new = 'PKCS8_PRIV_KEY_INFO_new'; }  {Do not localize}
  {CH fn_d2i_PKCS8_PRIV_KEY_INFO = 'd2i_PKCS8_PRIV_KEY_INFO'; }  {Do not localize}
  {CH fn_PKCS8_PRIV_KEY_INFO_free = 'PKCS8_PRIV_KEY_INFO_free'; }  {Do not localize}
  {CH fn_EVP_PKCS82PKEY = 'EVP_PKCS82PKEY'; }  {Do not localize}
  {CH fn_EVP_PKEY2PKCS8 = 'EVP_PKEY2PKCS8'; }  {Do not localize}
  {CH fn_PKCS8_set_broken = 'PKCS8_set_broken'; }  {Do not localize}
  {CH fn_ERR_load_PEM_strings = 'ERR_load_PEM_strings'; }  {Do not localize}
  {CH fn_PEM_get_EVP_CIPHER_INFO = 'PEM_get_EVP_CIPHER_INFO'; }  {Do not localize}
  {CH fn_PEM_do_header = 'PEM_do_header'; }  {Do not localize}
  {CH fn_PEM_read_bio = 'PEM_read_bio'; }  {Do not localize}
  {CH fn_PEM_write_bio = 'PEM_write_bio'; }  {Do not localize}
  fn_PEM_ASN1_read_bio = 'PEM_ASN1_read_bio';  {Do not localize}
  fn_PEM_ASN1_write_bio = 'PEM_ASN1_write_bio';  {Do not localize}
  fn_PEM_X509_INFO_read_bio = 'PEM_X509_INFO_read_bio';   {Do not localize}
  {CH fn_PEM_X509_INFO_write_bio = 'PEM_X509_INFO_write_bio'; }  {Do not localize}
  {CH fn_PEM_read = 'PEM_read'; }  {Do not localize}
  {CH fn_PEM_write = 'PEM_write'; }  {Do not localize}
  {CH fn_PEM_ASN1_read = 'PEM_ASN1_read'; }  {Do not localize}
  {CH fn_PEM_ASN1_write = 'PEM_ASN1_write'; }  {Do not localize}
  {CH fn_PEM_X509_INFO_read = 'PEM_X509_INFO_read'; }  {Do not localize}
  {CH fn_PEM_SealInit = 'PEM_SealInit'; }  {Do not localize}
  {CH fn_PEM_SealUpdate = 'PEM_SealUpdate'; }  {Do not localize}
  {CH fn_PEM_SealFinal = 'PEM_SealFinal'; }  {Do not localize}
  {CH fn_PEM_SignInit = 'PEM_SignInit'; }  {Do not localize}
  {CH fn_PEM_SignUpdate = 'PEM_SignUpdate'; }  {Do not localize}
  {CH fn_PEM_SignFinal = 'PEM_SignFinal'; }  {Do not localize}
  {CH fn_PEM_proc_type = 'PEM_proc_type'; }  {Do not localize}
  {CH fn_PEM_dek_info = 'PEM_dek_info'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_BIO}
    {$IFNDEF SSLEAY_MACROS}
  fn_PEM_read_bio_X509 = 'PEM_read_bio_X509';   {Do not localize}
  fn_PEM_write_bio_X509 = 'PEM_write_bio_X509';   {Do not localize}
  fn_PEM_read_bio_X509_REQ = 'PEM_read_bio_X509_REQ';   {Do not localize}
  fn_PEM_write_bio_X509_REQ = 'PEM_write_bio_X509_REQ';  {Do not localize}
  fn_PEM_read_bio_X509_CRL = 'PEM_read_bio_X509_CRL';   {Do not localize}
  fn_PEM_write_bio_X509_CRL = 'PEM_write_bio_X509_CRL';   {Do not localize}
  fn_PEM_read_bio_PKCS7 = 'PEM_read_bio_PKCS7';   {Do not localize}
  fn_PEM_write_bio_PKCS7 = 'PEM_write_bio_PKCS7';   {Do not localize}
  fn_PEM_read_bio_NETSCAPE_CERT_SEQUENCE = 'PEM_read_bio_NETSCAPE_CERT_SEQUENCE';   {Do not localize}
  fn_PEM_write_bio_NETSCAPE_CERT_SEQUENCE = 'PEM_write_bio_NETSCAPE_CERT_SEQUENCE';   {Do not localize}
  fn_PEM_read_bio_PKCS8 = 'PEM_read_bio_PKCS8';   {Do not localize}
  fn_PEM_write_bio_PKCS8 = 'PEM_write_bio_PKCS8';   {Do not localize}
  fn_PEM_read_bio_PKCS8_PRIV_KEY_INFO = 'PEM_read_bio_PKCS8_PRIV_KEY_INFO';   {Do not localize}
  fn_PEM_write_bio_PKCS8_PRIV_KEY_INFO = 'PEM_write_bio_PKCS8_PRIV_KEY_INFO';   {Do not localize}
  fn_PEM_read_bio_RSAPrivateKey = 'PEM_read_bio_RSAPrivateKey';   {Do not localize}
  fn_PEM_write_bio_RSAPrivateKey = 'PEM_write_bio_RSAPrivateKey';   {Do not localize}
  fn_PEM_read_bio_RSAPublicKey = 'PEM_read_bio_RSAPublicKey';   {Do not localize}
  fn_PEM_write_bio_RSAPublicKey = 'PEM_write_bio_RSAPublicKey';   {Do not localize}
  fn_PEM_read_bio_DSAPrivateKey = 'PEM_read_bio_DSAPrivateKey';   {Do not localize}
  fn_PEM_write_bio_DSAPrivateKey = 'PEM_write_bio_DSAPrivateKey';   {Do not localize}
  fn_PEM_read_bio_DSAparams = 'PEM_read_bio_DSAparams';  {Do not localize}
  fn_PEM_write_bio_DSAparams = 'PEM_write_bio_DSAparams';   {Do not localize}
  fn_PEM_read_bio_DHparams = 'PEM_read_bio_DHparams';   {Do not localize}
  fn_PEM_write_bio_DHparams = 'PEM_write_bio_DHparams';   {Do not localize}
  fn_PEM_read_bio_PrivateKey = 'PEM_read_bio_PrivateKey';  {Do not localize}
  fn_PEM_write_bio_PrivateKey = 'PEM_write_bio_PrivateKey';   {Do not localize}
  fn_PEM_write_bio_PKCS8PrivateKey = 'PEM_write_bio_PKCS8PrivateKey';  {Do not localize}
    {$ENDIF}
  {$ENDIF}
  fn_PEM_read_bio_X509_AUX = 'PEM_read_bio_X509_AUX';  {Do not localize}
  {CH fn_PEM_read_X509 = 'PEM_read_X509'; }  {Do not localize}
  {CH fn_PEM_write_X509 = 'PEM_write_X509'; }  {Do not localize}
  {CH fn_PEM_read_X509_REQ = 'PEM_read_X509_REQ'; }  {Do not localize}
  {CH fn_PEM_write_X509_REQ = 'PEM_write_X509_REQ'; }  {Do not localize}
  {CH fn_PEM_read_X509_CRL = 'PEM_read_X509_CRL'; }  {Do not localize}
  {CH fn_PEM_write_X509_CRL = 'PEM_write_X509_CRL'; }  {Do not localize}
  {CH fn_PEM_read_PKCS7 = 'PEM_read_PKCS7'; }  {Do not localize}
  {CH fn_PEM_write_PKCS7 = 'PEM_write_PKCS7'; }  {Do not localize}
  {CH fn_PEM_read_NETSCAPE_CERT_SEQUENCE = 'PEM_read_NETSCAPE_CERT_SEQUENCE'; }  {Do not localize}
  {CH fn_PEM_write_NETSCAPE_CERT_SEQUENCE = 'PEM_write_NETSCAPE_CERT_SEQUENCE'; }  {Do not localize}
  {CH fn_PEM_read_PKCS8 = 'PEM_read_PKCS8'; }  {Do not localize}
  {CH fn_PEM_write_PKCS8 = 'PEM_write_PKCS8'; }  {Do not localize}
  {CH fn_PEM_read_PKCS8_PRIV_KEY_INFO = 'PEM_read_PKCS8_PRIV_KEY_INFO'; }  {Do not localize}
  {CH fn_PEM_write_PKCS8_PRIV_KEY_INFO = 'PEM_write_PKCS8_PRIV_KEY_INFO'; }  {Do not localize}
  {CH fn_PEM_read_RSAPrivateKey = 'PEM_read_RSAPrivateKey'; }  {Do not localize}
  {CH fn_PEM_write_RSAPrivateKey = 'PEM_write_RSAPrivateKey'; }  {Do not localize}
  {CH fn_PEM_read_RSAPublicKey = 'PEM_read_RSAPublicKey'; }  {Do not localize}
  {CH fn_PEM_write_RSAPublicKey = 'PEM_write_RSAPublicKey'; }  {Do not localize}
  {CH fn_PEM_read_DSAPrivateKey = 'PEM_read_DSAPrivateKey'; }  {Do not localize}
  {CH fn_PEM_write_DSAPrivateKey = 'PEM_write_DSAPrivateKey'; }  {Do not localize}
  {CH fn_PEM_read_DSAparams = 'PEM_read_DSAparams'; }  {Do not localize}
  {CH fn_PEM_write_DSAparams = 'PEM_write_DSAparams'; }  {Do not localize}
  {CH fn_PEM_read_DHparams = 'PEM_read_DHparams'; }  {Do not localize}
  {CH fn_PEM_write_DHparams = 'PEM_write_DHparams'; }  {Do not localize}
  {CH fn_PEM_read_PrivateKey = 'PEM_read_PrivateKey'; }  {Do not localize}
  {CH fn_PEM_write_PrivateKey = 'PEM_write_PrivateKey'; }  {Do not localize}
  {CH fn_PEM_write_PKCS8PrivateKey = 'PEM_write_PKCS8PrivateKey'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_new = 'sk_SSL_CIPHER_new'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_new_null = 'sk_SSL_CIPHER_new_null'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_free = 'sk_SSL_CIPHER_free'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_num = 'sk_SSL_CIPHER_num'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_value = 'sk_SSL_CIPHER_value'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_set = 'sk_SSL_CIPHER_set'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_zero = 'sk_SSL_CIPHER_zero'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_push = 'sk_SSL_CIPHER_push'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_unshift = 'sk_SSL_CIPHER_unshift'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_find = 'sk_SSL_CIPHER_find'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_delete = 'sk_SSL_CIPHER_delete'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_delete_ptr = 'sk_SSL_CIPHER_delete_ptr'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_insert = 'sk_SSL_CIPHER_insert'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_dup = 'sk_SSL_CIPHER_dup'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_pop_free = 'sk_SSL_CIPHER_pop_free'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_shift = 'sk_SSL_CIPHER_shift'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_pop = 'sk_SSL_CIPHER_pop'; }  {Do not localize}
  {CH fn_sk_SSL_CIPHER_sort = 'sk_SSL_CIPHER_sort'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_new = 'sk_SSL_COMP_new'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_new_null = 'sk_SSL_COMP_new_null'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_free = 'sk_SSL_COMP_free'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_num = 'sk_SSL_COMP_num'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_value = 'sk_SSL_COMP_value'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_set = 'sk_SSL_COMP_set'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_zero = 'sk_SSL_COMP_zero'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_push = 'sk_SSL_COMP_push'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_unshift = 'sk_SSL_COMP_unshift'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_find = 'sk_SSL_COMP_find'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_delete = 'sk_SSL_COMP_delete'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_delete_ptr = 'sk_SSL_COMP_delete_ptr'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_insert = 'sk_SSL_COMP_insert'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_dup = 'sk_SSL_COMP_dup'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_pop_free = 'sk_SSL_COMP_pop_free'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_shift = 'sk_SSL_COMP_shift'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_pop = 'sk_SSL_COMP_pop'; }  {Do not localize}
  {CH fn_sk_SSL_COMP_sort = 'sk_SSL_COMP_sort'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_BIO_f_ssl = 'BIO_f_ssl'; }  {Do not localize}
  {CH fn_BIO_new_ssl = 'BIO_new_ssl'; }  {Do not localize}
  {CH fn_BIO_new_ssl_connect = 'BIO_new_ssl_connect'; }  {Do not localize}
  {CH fn_BIO_new_buffer_ssl_connect = 'BIO_new_buffer_ssl_connect'; }  {Do not localize}
  {CH fn_BIO_ssl_copy_session_id = 'BIO_ssl_copy_session_id'; }  {Do not localize}
  {CH fn_BIO_ssl_shutdown = 'BIO_ssl_shutdown'; }  {Do not localize}
  {$ENDIF}
  fn_SSL_CTX_set_cipher_list = 'SSL_CTX_set_cipher_list';  {Do not localize}
  fn_SSL_CTX_new = 'SSL_CTX_new';  {Do not localize}
  fn_SSL_CTX_free = 'SSL_CTX_free';  {Do not localize}
  fn_SSL_callback_ctrl = 'SSL_callback_ctrl';  {Do not localize}
  fn_SSL_CTX_callback_ctrl = 'SSL_CTX_callback_ctrl'; {Do not localize}
  {CH fn_SSL_CTX_set_timeout = 'SSL_CTX_set_timeout'; }  {Do not localize}
  {CH fn_SSL_CTX_get_timeout = 'SSL_CTX_get_timeout'; }  {Do not localize}
  {CH fn_SSL_CTX_get_cert_store = 'SSL_CTX_get_cert_store'; }  {Do not localize}
  {CH fn_SSL_CTX_set_cert_store = 'SSL_CTX_set_cert_store'; }  {Do not localize}
  {CH fn_SSL_want = 'SSL_want'; }  {Do not localize}
  {CH fn_SSL_clear = 'SSL_clear'; }  {Do not localize}
  {CH fn_SSL_CTX_flush_sessions = 'SSL_CTX_flush_sessions'; }  {Do not localize}
  fn_SSL_get_current_cipher = 'SSL_get_current_cipher';  {Do not localize}
  fn_SSL_CIPHER_get_bits = 'SSL_CIPHER_get_bits';  {Do not localize}
  fn_SSL_CIPHER_get_version = 'SSL_CIPHER_get_version';  {Do not localize}
  fn_SSL_CIPHER_get_name = 'SSL_CIPHER_get_name';  {Do not localize}
  {CH fn_SSL_get_fd = 'SSL_get_fd'; }  {Do not localize}
  {CH fn_SSL_get_cipher_list = 'SSL_get_cipher_list'; }  {Do not localize}
  {CH fn_SSL_get_shared_ciphers = 'SSL_get_shared_ciphers'; }  {Do not localize}
  {CH fn_SSL_get_read_ahead = 'SSL_get_read_ahead'; }  {Do not localize}
  fn_SSL_pending = 'SSL_pending';  {Do not localize}
  {$IFNDEF OPENSSL_NO_SOCK}
  fn_SSL_set_fd = 'SSL_set_fd';  {Do not localize}
  {CH fn_SSL_set_rfd = 'SSL_set_rfd'; }  {Do not localize}
  {CH fn_SSL_set_wfd = 'SSL_set_wfd'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_SSL_set_bio = 'SSL_set_bio'; }  {Do not localize}
  {CH fn_SSL_get_rbio = 'SSL_get_rbio'; }  {Do not localize}
  {CH fn_SSL_get_wbio = 'SSL_get_wbio'; }  {Do not localize}
  {$ENDIF}
  {CH fn_SSL_set_cipher_list = 'SSL_set_cipher_list'; }  {Do not localize}
  {CH fn_SSL_set_read_ahead = 'SSL_set_read_ahead'; }  {Do not localize}
  {CH fn_SSL_get_verify_mode = 'SSL_get_verify_mode'; }  {Do not localize}
  {CH fn_SSL_get_verify_depth = 'SSL_get_verify_depth'; }  {Do not localize}
  {CH fn_SSL_set_verify = 'SSL_set_verify'; }  {Do not localize}
  {CH fn_SSL_set_verify_depth = 'SSL_set_verify_depth'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_RSA}
  {CH fn_SSL_use_RSAPrivateKey = 'SSL_use_RSAPrivateKey'; }  {Do not localize}
  {CH fn_SSL_use_RSAPrivateKey_ASN1 = 'SSL_use_RSAPrivateKey_ASN1'; }  {Do not localize}
  {$ENDIF}
  {CH fn_SSL_use_PrivateKey = 'SSL_use_PrivateKey'; }  {Do not localize}
  {CH fn_SSL_use_PrivateKey_ASN1 = 'SSL_use_PrivateKey_ASN1'; {Do not localize}
  {CH fn_SSL_use_certificate = 'SSL_use_certificate'; }  {Do not localize}
  {CH fn_SSL_use_certificate_ASN1 = 'SSL_use_certificate_ASN1'; }  {Do not localize}
  {CH fn_SSL_use_RSAPrivateKey_file = 'SSL_use_RSAPrivateKey_file'; }  {Do not localize}
  {CH fn_SSL_use_PrivateKey_file = 'SSL_use_PrivateKey_file'; }  {Do not localize}
  {CH fn_SSL_use_certificate_file = 'SSL_use_certificate_file'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_RSA}
  {CH fn_SSL_CTX_use_RSAPrivateKey_file = 'SSL_CTX_use_RSAPrivateKey_file'; }  {Do not localize}
  {$ENDIF}
  fn_SSL_CTX_use_PrivateKey_file = 'SSL_CTX_use_PrivateKey_file';  {Do not localize}
  fn_SSL_CTX_use_certificate_file = 'SSL_CTX_use_certificate_file';  {Do not localize}
  {$ifndef OPENSSL_NO_ENGINE}
  {CH fn_SSL_CTX_set_client_cert_engine = 'SSL_CTX_set_client_cert_engine'; } {Do not localize}
  {$endif}
  {CH fn_SSL_CTX_use_certificate_chain_file = 'SSL_CTX_use_certificate_chain_file'; }  {Do not localize}
  fn_SSL_load_client_CA_file = 'SSL_load_client_CA_file';  {Do not localize}
  {CH fn_SSL_add_file_cert_subjects_to_stack = 'SSL_add_file_cert_subjects_to_stack'; }  {Do not localize}
  {CH fn_ERR_load_SSL_strings = 'ERR_load_SSL_strings'; }  {Do not localize}
  fn_SSL_load_error_strings = 'SSL_load_error_strings';  {Do not localize}
  {CH fn_SSL_state_string = 'SSL_state_string'; }  {Do not localize}
  {CH fn_SSL_rstate_string = 'SSL_rstate_string'; }  {Do not localize}
  fn_SSL_state_string_long = 'SSL_state_string_long';  {Do not localize}
  {CH fn_SSL_rstate_string_long = 'SSL_rstate_string_long'; }  {Do not localize}
  {CH fn_SSL_SESSION_get_time = 'SSL_SESSION_get_time'; }  {Do not localize}
  {CH fn_SSL_SESSION_set_time = 'SSL_SESSION_set_time'; }  {Do not localize}
  {CH fn_SSL_SESSION_get_timeout = 'SSL_SESSION_get_timeout'; }  {Do not localize}
  {CH fn_SSL_SESSION_set_timeout = 'SSL_SESSION_set_timeout'; }  {Do not localize}
  {CH fn_SSL_copy_session_id = 'SSL_copy_session_id'; }  {Do not localize}
  {CH fn_SSL_SESSION_new = 'SSL_SESSION_new'; }  {Do not localize}
  {CH fn_SSL_SESSION_hash = 'SSL_SESSION_hash'; }  {Do not localize}
  {CH fn_SSL_SESSION_cmp = 'SSL_SESSION_cmp'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_FP_API}
  {CH fn_SSL_SESSION_print_fp = 'SSL_SESSION_print_fp'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_BIO}
  {CH fn_SSL_SESSION_print = 'SSL_SESSION_print'; }  {Do not localize}
  {$ENDIF}
  {CH fn_SSL_SESSION_free = 'SSL_SESSION_free'; }  {Do not localize}
  {CH fn_i2d_SSL_SESSION = 'i2d_SSL_SESSION'; }  {Do not localize}
  {CH fn_SSL_set_session = 'SSL_set_session'; }  {Do not localize}
  {CH fn_SSL_CTX_add_session = 'SSL_CTX_add_session'; }  {Do not localize}
  {CH fn_SSL_CTX_remove_session = 'SSL_CTX_remove_session'; }  {Do not localize}
  {CH fn_d2i_SSL_SESSION = 'd2i_SSL_SESSION'; }  {Do not localize}
  fn_SSL_get_peer_certificate = 'SSL_get_peer_certificate';  {Do not localize}
  {CH fn_SSL_get_peer_cert_chain = 'SSL_get_peer_cert_chain'; }  {Do not localize}
  {CH fn_SSL_CTX_get_verify_mode = 'SSL_CTX_get_verify_mode'; }  {Do not localize}
  fn_SSL_CTX_get_verify_depth = 'SSL_CTX_get_verify_depth';  {Do not localize}
  fn_SSL_CTX_set_verify = 'SSL_CTX_set_verify';  {Do not localize}
  fn_SSL_CTX_set_verify_depth = 'SSL_CTX_set_verify_depth';  {Do not localize}
  {CH fn_SSL_CTX_set_cert_verify_callback = 'SSL_CTX_set_cert_verify_callback'; }  {Do not localize}
  {CH fn_SSL_CTX_use_RSAPrivateKey = 'SSL_CTX_use_RSAPrivateKey'; }  {Do not localize}
  {CH fn_SSL_CTX_use_RSAPrivateKey_ASN1 = 'SSL_CTX_use_RSAPrivateKey_ASN1'; }  {Do not localize}
  fn_SSL_CTX_use_PrivateKey = 'SSL_CTX_use_PrivateKey';  {Do not localize}
  {CH fn_SSL_CTX_use_PrivateKey_ASN1 = 'SSL_CTX_use_PrivateKey_ASN1'; }  {Do not localize}
  fn_SSL_CTX_use_certificate = 'SSL_CTX_use_certificate';  {Do not localize}
  {CH fn_SSL_CTX_use_certificate_ASN1 = 'SSL_CTX_use_certificate_ASN1'; }  {Do not localize}
  fn_SSL_CTX_set_default_passwd_cb = 'SSL_CTX_set_default_passwd_cb';  {Do not localize}
  fn_SSL_CTX_set_default_passwd_cb_userdata = 'SSL_CTX_set_default_passwd_cb_userdata';  {Do not localize}
  fn_SSL_CTX_check_private_key = 'SSL_CTX_check_private_key';  {Do not localize}
  {CH fn_SSL_check_private_key = 'SSL_check_private_key'; }  {Do not localize}
  fn_SSL_CTX_set_session_id_context = 'SSL_CTX_set_session_id_context';  {Do not localize}
  fn_SSL_new = 'SSL_new';  {Do not localize}
  {CH fn_SSL_set_session_id_context = 'SSL_set_session_id_context'; }  {Do not localize}
  fn_SSL_free = 'SSL_free';  {Do not localize}
  fn_SSL_accept = 'SSL_accept';  {Do not localize}
  fn_SSL_connect = 'SSL_connect';  {Do not localize}
  fn_SSL_read = 'SSL_read';  {Do not localize}
  fn_SSL_peek = 'SSL_peek';  {Do not localize}
  fn_SSL_write = 'SSL_write';  {Do not localize}
  fn_SSL_ctrl = 'SSL_ctrl';   {Do not localize}
  fn_SSL_CTX_ctrl = 'SSL_CTX_ctrl';  {Do not localize}
  fn_SSL_get_error = 'SSL_get_error';  {Do not localize}
  {CH fn_SSL_get_version = 'SSL_get_version'; }  {Do not localize}
  {CH fn_SSL_CTX_set_ssl_version = 'SSL_CTX_set_ssl_version'; }  {Do not localize}
  fn_SSLv2_method = 'SSLv2_method';  {Do not localize}
  fn_SSLv2_server_method = 'SSLv2_server_method';  {Do not localize}
  fn_SSLv2_client_method = 'SSLv2_client_method';  {Do not localize}
  fn_SSLv3_method = 'SSLv3_method';  {Do not localize}
  fn_SSLv3_server_method = 'SSLv3_server_method';  {Do not localize}
  fn_SSLv3_client_method = 'SSLv3_client_method';  {Do not localize}
  fn_SSLv23_method = 'SSLv23_method';  {Do not localize}
  fn_SSLv23_server_method = 'SSLv23_server_method';  {Do not localize}
  fn_SSLv23_client_method = 'SSLv23_client_method';  {Do not localize}
  fn_TLSv1_method = 'TLSv1_method';  {Do not localize}
  fn_TLSv1_server_method = 'TLSv1_server_method';  {Do not localize}
  fn_TLSv1_client_method = 'TLSv1_client_method';  {Do not localize}
  fn_DTLSv1_method = 'DTLSv1_method'; {Do not localize}
  fn_DTLSv1_server_method = 'DTLSv1_server_method'; {Do not localize}
  fn_DTLSv1_client_method = 'DTLSv1_client_method'; {Do not localize}
  {CH fn_SSL_get_ciphers = 'SSL_get_ciphers'; }  {Do not localize}
  {CH fn_SSL_do_handshake = 'SSL_do_handshake'; }  {Do not localize}
  {CH fn_SSL_renegotiate = 'SSL_renegotiate'; }  {Do not localize}
  fn_SSL_shutdown = 'SSL_shutdown';  {Do not localize}
  {CH fn_SSL_get_ssl_method = 'SSL_get_ssl_method'; }  {Do not localize}
  {CH fn_SSL_set_ssl_method = 'SSL_set_ssl_method'; }  {Do not localize}
   fn_SSL_alert_type_string_long = 'SSL_alert_type_string_long';   {Do not localize}
  {CH fn_SSL_alert_type_string = 'SSL_alert_type_string'; }  {Do not localize}
  fn_SSL_alert_desc_string_long = 'SSL_alert_desc_string_long';   {Do not localize}
  {CH fn_SSL_alert_desc_string = 'SSL_alert_desc_string'; }  {Do not localize}
  {CH fn_SSL_set_client_CA_list = 'SSL_set_client_CA_list'; }  {Do not localize}
  fn_SSL_CTX_set_client_CA_list = 'SSL_CTX_set_client_CA_list';  {Do not localize}
  {CH fn_SSL_get_client_CA_list = 'SSL_get_client_CA_list'; }  {Do not localize}
  {CH fn_SSL_CTX_get_client_CA_list = 'SSL_CTX_get_client_CA_list'; }  {Do not localize}
  {CH fn_SSL_add_client_CA = 'SSL_add_client_CA'; }  {Do not localize}
  {CH fn_SSL_CTX_add_client_CA = 'SSL_CTX_add_client_CA'; }  {Do not localize}
  fn_SSL_set_connect_state = 'SSL_set_connect_state';  {Do not localize}
  fn_SSL_set_accept_state = 'SSL_set_accept_state';  {Do not localize}
  {CH fn_SSL_get_default_timeout = 'SSL_get_default_timeout'; }  {Do not localize}
  {CH fn_SSL_library_init = 'SSL_library_init'; }  {Do not localize}
  fn_SSL_CIPHER_description = 'SSL_CIPHER_description';  {Do not localize}
  {CH fn_SSL_dup_CA_list = 'SSL_dup_CA_list'; }  {Do not localize}
  {CH fn_SSL_dup = 'SSL_dup'; }  {Do not localize}
  {CH fn_SSL_get_certificate = 'SSL_get_certificate'; }  {Do not localize}
  {CH fn_SSL_get_privatekey = 'SSL_get_privatekey'; }  {Do not localize}
  {CH fn_SSL_CTX_set_quiet_shutdown = 'SSL_CTX_set_quiet_shutdown'; }  {Do not localize}
  {CH fn_SSL_CTX_get_quiet_shutdown = 'SSL_CTX_get_quiet_shutdown'; }  {Do not localize}
  {CH fn_SSL_set_quiet_shutdown = 'SSL_set_quiet_shutdown'; }  {Do not localize}
  {CH fn_SSL_get_quiet_shutdown = 'SSL_get_quiet_shutdown'; }  {Do not localize}
  fn_SSL_set_shutdown = 'SSL_set_shutdown';  {Do not localize}
  {CH fn_SSL_get_shutdown = 'SSL_get_shutdown'; }  {Do not localize}
  {CH fn_SSL_version = 'SSL_version'; }  {Do not localize}
  fn_SSL_CTX_set_default_verify_paths = 'SSL_CTX_set_default_verify_paths';  {Do not localize}
  fn_SSL_CTX_load_verify_locations = 'SSL_CTX_load_verify_locations';  {Do not localize}
  fn_SSL_get_session = 'SSL_get_session';  {Do not localize}
  {CH fn_SSL_get_SSL_CTX = 'SSL_get_SSL_CTX'; }  {Do not localize}
  {CH fn_SSL_set_SSL_CTX = 'SSL_set_SSL_CTX'; }  {Do not localize}
  {CH fn_OPENSSL_isservice = 'OPENSSL_isservice'; }{Do not localize}
  {CH fn_SSL_set_info_callback = 'SSL_set_info_callback'; }  {Do not localize}
  {CH fn_SSL_state = 'SSL_state'; }  {Do not localize}
  {CH fn_SSL_set_verify_result = 'SSL_set_verify_result'; }  {Do not localize}
  {CH fn_SSL_get_verify_result = 'SSL_get_verify_result'; }  {Do not localize}
  fn_SSL_set_ex_data = 'SSL_set_ex_data';  {Do not localize}
  fn_SSL_get_ex_data = 'SSL_get_ex_data';  {Do not localize}
  {CH fn_SSL_get_ex_new_index = 'SSL_get_ex_new_index'; }  {Do not localize}
  {CH fn_SSL_SESSION_set_ex_data = 'SSL_SESSION_set_ex_data'; }  {Do not localize}
  {CH fn_SSL_SESSION_get_ex_data = 'SSL_SESSION_get_ex_data'; }  {Do not localize}
  {CH fn_SSL_SESSION_get_ex_new_index = 'SSL_SESSION_get_ex_new_index'; }  {Do not localize}
  {CH fn_SSL_CTX_set_ex_data = 'SSL_CTX_set_ex_data'; }  {Do not localize}
  {CH fn_SSL_CTX_get_ex_data = 'SSL_CTX_get_ex_data'; }  {Do not localize}
  {CH fn_SSL_CTX_get_ex_new_index = 'SSL_CTX_get_ex_new_index'; }  {Do not localize}
  {CH fn_SSL_get_ex_data_X509_STORE_CTX_idx = 'SSL_get_ex_data_X509_STORE_CTX_idx'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_RSA}
  {CH fn_SSL_CTX_set_tmp_rsa_callback = 'SSL_CTX_set_tmp_rsa_callback'; }  {Do not localize}
  {CH fn_SSL_set_tmp_rsa_callback = 'SSL_set_tmp_rsa_callback'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DH}
  {CH fn_SSL_CTX_set_tmp_dh_callback = 'SSL_CTX_set_tmp_dh_callback'; }  {Do not localize}
  {CH fn_SSL_set_tmp_dh_callback = 'SSL_set_tmp_dh_callback'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_ECDH}
  {CH fn_SSL_CTX_set_tmp_ecdh_callback = 'SSL_CTX_set_tmp_ecdh_callback'; } {Do not localize}
  {CH fn_SSL_set_tmp_ecdh_callback = 'SSL_set_tmp_ecdh_callback'; } {Do not localize}
  {$ENDIF}
  {CH fn_SSL_COMP_add_compression_method = 'SSL_COMP_add_compression_method'; }  {Do not localize}
  {CH fn_SSL_get_current_expansion = 'SSL_get_current_expansion'; } {Do not localize}
  {CH fn_SSL_COMP_get_name = 'SSL_COMP_get_name'; } {Do not localize}
  fn_SSL_COMP_get_compression_methods = 'SSL_COMP_get_compression_methods'; {Do not localize}
  // GREGOR
  //fn_SSLeay_add_ssl_algorithms = 'mi_SSLeay_add_ssl_algorithms';  {Do not localize}
  //why does the function name not match?
  //
  // RLebeau: because it is not an actual function of its own to begin with.
  // It is a precompiler macro that maps to another function
  fn_SSLeay_add_ssl_algorithms = 'SSL_library_init';   {Do not localize}
  fn_SSL_SESSION_get_id = 'SSL_SESSION_get_id';  {Do not localize}
  {CH fn_SSL_is_init_finished = 'mi_SSL_is_init_finished'; }  {Do not localize}
  {CH fn_SSL_in_init = 'mi_SSL_in_init'; }  {Do not localize}
  {CH fn_SSL_in_before = 'mi_SSL_in_before'; }  {Do not localize}
  {CH fn_SSL_in_connect_init = 'mi_SSL_in_connect_init'; }  {Do not localize}
  {CH fn_SSL_in_accept_init = 'mi_SSL_in_accept_init'; }  {Do not localize}
  {CH fn_fopen = 'mi_fopen'; }  {Do not localize}
  {CH fn_fclose = 'mi_fclose'; }  {Do not localize}
  //
  fn_PKCS12_create = 'PKCS12_create'; {Do not localize}
  fn_i2d_PKCS12_bio = 'i2d_PKCS12_bio'; {Do not localize}
  fn_PKCS12_free = 'PKCS12_free'; {Do not localize}
  {CH fn_RAND_set_rand_method = 'RAND_set_rand_method'; } {Do not localize}
  {CH fn_RAND_get_rand_method = 'RAND_get_rand_method'; } {Do not localize}
  {$IFNDEF OPENSSL_NO_ENGINE}
  {CH fn_RAND_set_rand_engine = 'RAND_set_rand_engine'; } {Do not localize}
  {$ENDIF}
  {CH fn_RAND_SSLeay = 'RAND_SSLeay'; } {Do not localize}
  {CH fn_RAND_cleanup = 'RAND_cleanup'; } {Do not localize}
  {CH fn_RAND_bytes = 'RAND_bytes'; } {Do not localize}
  {CH fn_RAND_pseudo_bytes = 'RAND_pseudo_bytes'; } {Do not localize}
  {CH fn_RAND_seed = 'RAND_seed'; } {Do not localize}
  {CH fn_RAND_add = 'RAND_add'; } {Do not localize}
  {CH fn_RAND_load_file = 'RAND_load_file'; } {Do not localize}
  {CH fn_RAND_write_file = 'RAND_write_file'; } {Do not localize}
  {CH fn_RAND_file_name = 'RAND_file_name'; } {Do not localize}
  {CH fn_RAND_status = 'RAND_status'; } {Do not localize}
  {CH fn_RAND_query_egd_bytes = 'RAND_query_egd_bytes'; } {Do not localize}
  {CH fn_RAND_egd = 'RAND_egd'; } {Do not localize}
  {CH fn_RAND_egd_bytes = 'RAND_egd_bytes'; } {Do not localize}
  {CH fn_RAND_poll = 'RAND_poll'; } {Do not localize}
  {$IFDEF SYS_WIN}
  //GREGOR
  fn_RAND_screen = 'RAND_screen';  {Do not localize}
  {CH fn_RAND_event = 'RAND_event'; } {Do not localize}
  {$ENDIF}
  {CH fn_ERR_load_RAND_strings = 'ERR_load_RAND_strings'; } {Do not localize}
  //experimental
  fn_ERR_put_error = 'ERR_put_error';  {Do not localize}
  fn_ERR_get_error = 'ERR_get_error';  {Do not localize}
{CH fn_ERR_get_error_line = 'ERR_get_error_line'; }  {Do not localize}
{CH fn_ERR_get_error_line_data = 'ERR_get_error_line_data'; }  {Do not localize}
  fn_ERR_peek_error = 'ERR_peek_error';  {Do not localize}
  fn_ERR_peek_last_error = 'ERR_peek_last_error'; {Do not localize}
  {CH fn_ERR_peek_error_line = 'ERR_peek_error_line'; } {Do not localize}
{CH fn_ERR_peek_error_line_data = 'ERR_peek_error_line_data'; } {Do not localize}
  fn_ERR_peek_last_error_line = 'ERR_peek_last_error_line'; {Do not localize}
{CH fn_ERR_peek_last_error_line_data = 'ERR_peek_last_error_line_data'; } {Do not localize}
  fn_ERR_clear_error = 'ERR_clear_error';  {Do not localize}
  fn_ERR_error_string = 'ERR_error_string';  {Do not localize}
  fn_ERR_error_string_n = 'ERR_error_string_n';  {Do not localize}
  fn_ERR_lib_error_string = 'ERR_lib_error_string';  {Do not localize}
  fn_ERR_func_error_string = 'ERR_func_error_string';  {Do not localize}
  fn_ERR_reason_error_string = 'ERR_reason_error_string'; {Do not localize}
{CH fn_ERR_print_errors_cb = 'ERR_print_errors_cb'; } {Do not localize}
  {$IFNDEF OPENSSL_NO_FP_API}
{CH fn_ERR_print_errors_fp = 'ERR_print_errors_fp'; }  {Do not localize}
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_BIO}
{CH fn_ERR_print_errors = 'ERR_print_errors'; }  {Do not localize}
{CH fn_ERR_add_error_data = 'ERR_add_error_data'; }  {Do not localize}
  {$ENDIF}
  fn_ERR_load_ERR_strings = 'ERR_load_ERR_strings';  {Do not localize}
  fn_ERR_free_strings = 'ERR_free_strings';  {do not localize}
  fn_ERR_remove_thread_state = 'ERR_remove_thread_state';  {Do not localize}
  fn_ERR_remove_state = 'ERR_remove_state';  {do not localize}
{CH fn_ERR_unload_strings = 'ERR_unload_strings'; } {Do not localize}
{CH fn_ERR_load_ERR_strings = 'ERR_load_ERR_strings'; } {Do not localize}
{CH fn_ERR_load_crypto_strings = 'ERR_load_crypto_strings'; } {Do not localize}
{CH fn_ERR_free_strings = 'ERR_free_strings'; } {Do not localize}
{CH fn_ERR_remove_state = 'ERR_remove_state'; }  {Do not localize}
{CH fn_ERR_get_state = 'ERR_get_state'; }  {Do not localize}
  {$IFNDEF OPENSSL_NO_LHASH}
  {CH fn_ERR_get_string_table = 'ERR_get_string_table';  } {Do not localize}
  {CH fn_ERR_get_err_state_table = 'ERR_get_err_state_table'; } {Do not localize}
  {CH fn_ERR_release_err_state_table = 'ERR_release_err_state_table'; } {Do not localize}
  {$ENDIF}
  {CH fn_ERR_get_next_error_library = 'ERR_get_next_error_library'; } {Do not localize}
  {CH fn_ERR_set_mark = 'ERR_set_mark'; } {Do not localize}
  {CH fn_ERR_pop_to_mark = 'ERR_pop_to_mark'; } {Do not localize}
  {$IFDEF OPENSSL_FIPS}
  {CH fn_int_ERR_set_state_func = 'int_ERR_set_state_func'; } {Do not localize}
  {CH fn_int_ERR_lib_init = 'int_ERR_lib_init'; } {Do not localize}
  {$ENDIF}
  {CH fn_UI_new = 'UI_new'; } {Do not localize}
  {CH fn_UI_new_method = 'UI_new_method'; } {Do not localize}
  {CH fn_UI_free = 'UI_free'; } {Do not localize}
  {CH fn_UI_add_input_string = 'UI_add_input_string'; } {Do not localize}
  {CH fn_UI_dup_input_string = 'UI_dup_input_string'; } {Do not localize}
  {CH fn_UI_add_verify_string = 'UI_add_verify_string'; } {Do not localize}
  {CH fn_UI_dup_verify_string = 'UI_dup_verify_string'; } {Do not localize}
  {CH fn_UI_add_input_boolean = 'UI_add_input_boolean'; } {Do not localize}
  {CH fn_UI_dup_input_boolean = 'UI_dup_input_boolean'; } {Do not localize}
  {CH fn_UI_add_info_string = 'UI_add_info_string'; } {Do not localize}
  {CH fn_UI_dup_info_string = 'UI_dup_info_string'; } {Do not localize}
  {CH fn_UI_add_error_string = 'UI_add_error_string'; } {Do not localize}
  {CH fn_UI_dup_error_string = 'UI_dup_error_string'; } {Do not localize}
  {CH fn_UI_construct_prompt = 'UI_construct_prompt'; } {Do not localize}
  {CH fn_UI_add_user_data = 'UI_add_user_data'; } {Do not localize}
  {CH fn_UI_get0_user_data = 'UI_get0_user_data'; } {Do not localize}
  {CH fn_UI_get0_resul = 'UI_get0_resul'; } {Do not localize}
  {CH fn_UI_process = 'UI_process'; } {Do not localize}
  {CH fn_UI_ctrl = 'UI_ctrl'; } {Do not localize}
  {CH fn_UI_get_ex_new_index = 'UI_get_ex_new_index'; } {Do not localize}
  {CH fn_UI_set_ex_data = 'UI_set_ex_data'; } {Do not localize}
  {CH fn_UI_get_ex_data = 'UI_get_ex_data'; } {Do not localize}
  {CH fn_UI_set_default_method = 'UI_set_default_method'; } {Do not localize}
  {CH fn_UI_get_method = 'UI_get_method'; } {Do not localize}
  {CH fn_UI_set_method = 'UI_set_method'; } {Do not localize}
  {CH fn_UI_OpenSSL = 'UI_OpenSSL'; } {Do not localize}
  {CH fn_UI_create_method = 'UI_create_method'; } {Do not localize}
  {CH fn_UI_destroy_method = 'UI_destroy_method'; } {Do not localize}
  {CH fn_UI_method_set_opener = 'UI_method_set_opener'; } {Do not localize}
  {CH fn_UI_method_set_writer = 'UI_method_set_writer'; } {Do not localize}
  {CH fn_UI_method_set_flusher = 'UI_method_set_flusher'; } {Do not localize}
  {CH fn_UI_method_set_reader = 'UI_method_set_reader'; } {Do not localize}
  {CH fn_UI_method_set_closer = 'UI_method_set_closer'; } {Do not localize}
  {CH fn_UI_get_string_type = 'UI_get_string_type'; } {Do not localize}
  {CH fn_UI_get_input_flags = 'UI_get_input_flags'; } {Do not localize}
  {CH fn_UI_get0_output_string = 'UI_get0_output_string'; } {Do not localize}
  {CH fn_UI_get0_action_string = 'UI_get0_action_string'; } {Do not localize}
  {CH fn_UI_get0_result_string = 'UI_get0_result_string'; } {Do not localize}
  {CH fn_UI_get0_test_string = 'UI_get0_test_string'; } {Do not localize}
  {CH fn_UI_get_result_minsize = 'UI_get_result_minsize'; } {Do not localize}
  {CH fn_UI_get_result_maxsize = 'UI_get_result_maxsize'; } {Do not localize}
  {CH fn_UI_set_result = 'UI_set_result'; } {Do not localize}
  {CH fn_UI_UTIL_read_pw_string = 'UI_UTIL_read_pw_string'; } {Do not localize}
  {CH fn_UI_UTIL_read_pw = 'UI_UTIL_read_pw'; } {Do not localize}
  {CH fn_ERR_load_UI_strings = 'ERR_load_UI_strings'; } {Do not localize}
  {$IFNDEF OPENSSL_NO_ENGINE}
  {CH fn_ENGINE_get_first = 'ENGINE_get_first'; } {Do not localize}
  {CH fn_ENGINE_get_last = 'ENGINE_get_last'; }  {Do not localize}
  {CH fn_ENGINE_get_next = 'ENGINE_get_next'; }  {Do not localize}
  {CH fn_ENGINE_get_prev = 'ENGINE_get_prev'; }  {Do not localize}
  {CH fn_ENGINE_add = 'ENGINE_add'; } {Do not localize}
  {CH fn_ENGINE_remove = 'ENGINE_remove'; } {Do not localize}
  {CH fn_ENGINE_by_id = 'ENGINE_by_id'; } {Do not localize}
  {CH fn_ENGINE_load_openssl = 'ENGINE_load_openssl'; } {Do not localize}
  {CH fn_ENGINE_load_dynamic = 'ENGINE_load_dynamic'; } {Do not localize}
  {$IFNDEF OPENSSL_NO_STATIC_ENGINE}
  {CH fn_ENGINE_load_4758cca = 'ENGINE_load_4758cca'; }  {Do not localize}
  {CH fn_ENGINE_load_aep = 'ENGINE_load_aep'; } {Do not localize}
  {CH fn_ENGINE_load_atalla = 'ENGINE_load_atalla'; } {Do not localize}
  {CH fn_ENGINE_load_chil = 'ENGINE_load_chil'; } {Do not localize}
  {CH fn_ENGINE_load_cswift = 'ENGINE_load_cswift'; }  {Do not localize}
    {$IFNDEF OPENSSL_NO_GMP}
  {CH fn_ENGINE_load_gmp = 'ENGINE_load_gmp'; }  {Do not localize}
    {$ENDIF}
  {CH fn_ENGINE_load_nuron = 'ENGINE_load_nuron'; }  {Do not localize}
  {CH fn_ENGINE_load_sureware = 'ENGINE_load_sureware'; }  {Do not localize}
  {CH fn_ENGINE_load_ubsec = 'ENGINE_load_ubsec'; } {Do not localize}
  {$ENDIF}
  {CH fn_ENGINE_load_cryptodev = 'ENGINE_load_cryptodev'; } {Do not localize}
  {CH fn_ENGINE_load_padlock = 'ENGINE_load_padlock'; } {Do not localize}
  {CH fn_ENGINE_load_builtin_engines = 'ENGINE_load_builtin_engines'; } {Do not localize}
  {$IFDEF WIN32_OR_WIN64}
    {$IFNDEF OPENSSL_NO_CAPIENG}
  {CH fn_ENGINE_load_capi = 'ENGINE_load_capi'; } {Do not localize}
    {$ENDIF}
  {$ENDIF}
  {CH fn_ENGINE_get_table_flags = 'ENGINE_get_table_flags'; } {Do not localize}
  {CH fn_ENGINE_set_table_flags = 'ENGINE_set_table_flags'; }  {Do not localize}
  {CH fn_ENGINE_register_RSA = 'ENGINE_register_RSA'; } {Do not localize}
  {CH fn_ENGINE_unregister_RSA = 'ENGINE_unregister_RSA'; } {Do not localize}
  {CH fn_ENGINE_register_all_RSA = 'ENGINE_register_all_RSA'; } {Do not localize}
  {CH fn_ENGINE_register_DSA = 'ENGINE_register_DSA'; } {Do not localize}
  {CH fn_ENGINE_unregister_DSA = 'ENGINE_unregister_DSA'; } {Do not localize}
  {CH fn_ENGINE_register_all_DSA = 'ENGINE_register_all_DSA'; } {Do not localize}
  {CH fn_ENGINE_register_ECDH = 'ENGINE_register_ECDH'; } {Do not localize}
  {CH fn_ENGINE_unregister_ECDH = 'ENGINE_unregister_ECDH'; } {Do not localize}
  {CH fn_ENGINE_register_all_ECDH = 'ENGINE_register_all_ECDH'; } {Do not localize}
  {CH fn_ENGINE_register_ECDSA = 'ENGINE_register_ECDSA'; } {Do not localize}
  {CH fn_ENGINE_unregister_ECDSA = 'ENGINE_unregister_ECDSA'; } {Do not localize}
  {CH fn_ENGINE_register_all_ECDSA = 'ENGINE_register_all_ECDSA'; } {Do not localize}
  {CH fn_ENGINE_register_DH = 'ENGINE_register_DH'; } {Do not localize}
  {CH fn_ENGINE_unregister_DH = 'ENGINE_unregister_DH'; } {Do not localize}
  {CH fn_ENGINE_register_all_DH = 'ENGINE_register_all_DH'; } {Do not localize}
  {CH fn_ENGINE_register_RAND = 'ENGINE_register_RAND'; } {Do not localize}
  {CH fn_ENGINE_unregister_RAND = 'ENGINE_unregister_RAND'; } {Do not localize}
  {CH fn_ENGINE_register_all_RAND = 'ENGINE_register_all_RAND'; } {Do not localize}
  {CH fn_ENGINE_register_STORE = 'ENGINE_register_STORE'; { {Do not localize}
  {CH fn_ENGINE_unregister_STORE = 'ENGINE_unregister_STORE'; } {Do not localize}
  {CH fn_ENGINE_register_all_STORE = 'ENGINE_register_all_STORE'; } {Do not localize}
  {CH fn_ENGINE_register_ciphers = 'ENGINE_register_ciphers'; } {Do not localize}
  {CH fn_ENGINE_unregister_ciphers = 'ENGINE_unregister_ciphers'; } {Do not localize}
  {CH fn_ENGINE_register_all_ciphers = 'ENGINE_register_all_ciphers'; } {Do not localize}
  {CH fn_ENGINE_register_digests = 'ENGINE_register_digests'; } {Do not localize}
  {CH fn_ENGINE_unregister_digests = 'ENGINE_unregister_digests'; } {Do not localize}
  {CH fn_ENGINE_register_all_digests= 'ENGINE_register_all_digests'; } {Do not localize}
  {CH fn_ENGINE_register_complete = 'ENGINE_register_complete'; } {Do not localize}
  {CH fn_ENGINE_register_all_complete = 'ENGINE_register_all_complete'; } {Do not localize}
  {CH fn_ENGINE_ctrl = 'ENGINE_ctrl'; } {Do not localize}
  {CH fn_ENGINE_cmd_is_executable = 'ENGINE_cmd_is_executable'; } {Do not localize}
  {CH fn_ENGINE_ctrl_cmd = 'ENGINE_ctrl_cmd'; } {Do not localize}
  {CH fn_ENGINE_ctrl_cmd_string = 'ENGINE_ctrl_cmd_string'; }  {Do not localize}
  {CH fn_ENGINE_new = 'ENGINE_new'; } {Do not localize}
  {CH fn_ENGINE_free = 'ENGINE_free'; } {Do not localize}
  {CH fn_ENGINE_up_ref = 'ENGINE_up_ref'; } {Do not localize}
  {CH fn_ENGINE_set_id = 'ENGINE_set_id'; } {Do not localize}
  {CH fn_ENGINE_set_name = 'ENGINE_set_name'; } {Do not localize}
  {CH fn_ENGINE_set_RSA = 'ENGINE_set_RSA'; } {Do not localize}
  {CH fn_ENGINE_set_DSA = 'ENGINE_set_DSA'; } {Do not localize}
  {CH fn_ENGINE_set_ECDH = 'ENGINE_set_ECDH'; } {Do not localize}
  {CH fn_ENGINE_set_ECDSA = 'ENGINE_set_ECDSA'; } {Do not localize}
  {CH fn_ENGINE_set_DH = 'ENGINE_set_DH'; }  {Do not localize}
  {CH fn_ENGINE_set_RAND = 'ENGINE_set_RAND'; }  {Do not localize}
  {CH fn_ENGINE_set_STORE = 'ENGINE_set_STORE'; }  {Do not localize}
  {CH fn_ENGINE_set_destroy_function = 'ENGINE_set_destroy_function'; }  {Do not localize}
  {CH fn_ENGINE_set_init_function = 'ENGINE_set_init_function'; } {Do not localize}
  {CH fn_ENGINE_set_finish_function = 'ENGINE_set_finish_function'; }  {Do not localize}
  {CH fn_ENGINE_set_ctrl_function = 'ENGINE_set_ctrl_function'; }  {Do not localize}
  {CH fn_ENGINE_set_load_privkey_function = 'ENGINE_set_load_privkey_function'; }  {Do not localize}
  {CH fn_ENGINE_set_load_pubkey_function = 'ENGINE_set_load_pubkey_function'; }  {Do not localize}
  {CH fn_ENGINE_set_load_ssl_client_cert_function = 'ENGINE_set_load_ssl_client_cert_function'; } {Do not localize}
  {CH fn_ENGINE_set_ciphers = 'ENGINE_set_ciphers'; } {Do not localize}
  {CH fn_ENGINE_set_digests = 'ENGINE_set_digests'; } {Do not localize}
  {CH fn_ENGINE_set_flags = 'ENGINE_set_flags'; } {Do not localize}
  {CH fn_ENGINE_set_cmd_defns = 'ENGINE_set_cmd_defns'; } {Do not localize}
  {CH fn_ENGINE_get_ex_new_index = 'ENGINE_get_ex_new_index'; } {Do not localize}
  {CH fn_ENGINE_set_ex_data = 'ENGINE_set_ex_data'; } {Do not localize}
  {CH fn_ENGINE_get_ex_data = 'ENGINE_get_ex_data'; }  {Do not localize}
  {CH fn_ENGINE_cleanup = 'ENGINE_cleanup'; } {Do not localize}
  {CH fn_ENGINE_get_id = 'ENGINE_get_id'; }  {Do not localize}
  {CH fn_ENGINE_get_name = 'ENGINE_get_name'; }  {Do not localize}
  {CH fn_ENGINE_get_RSA = 'ENGINE_get_RSA'; }  {Do not localize}
  {CH fn_ENGINE_get_DSA = 'ENGINE_get_DSA'; }   {Do not localize}
  {CH fn_ENGINE_get_ECDH = 'ENGINE_get_ECDH'; }  {Do not localize}
  {CH fn_ENGINE_get_ECDSA = 'ENGINE_get_ECDSA'; }  {Do not localize}
  {CH fn_ENGINE_get_DH = 'ENGINE_get_DH'; }  {Do not localize}
  {CH fn_ENGINE_get_RAND = 'ENGINE_get_RAND'; }  {Do not localize}
  {CH fn_ENGINE_get_STORE = 'ENGINE_get_STORE'; }  {Do not localize}
  {CH fn_ENGINE_get_destroy_function = 'ENGINE_get_destroy_function'; } {Do not localize}
  {CH fn_ENGINE_get_init_function = 'ENGINE_get_init_function'; }  {Do not localize}
  {CH fn_ENGINE_get_finish_function = 'ENGINE_get_finish_function'; }   {Do not localize}
  {CH fn_ENGINE_get_ctrl_function = 'ENGINE_get_ctrl_function'; }  {Do not localize}
  {CH fn_ENGINE_get_load_privkey_function = 'ENGINE_get_load_privkey_function'; }  {Do not localize}
  {CH fn_ENGINE_get_load_pubkey_function = 'ENGINE_get_load_pubkey_function'; }  {Do not localize}
  {CH fn_ENGINE_get_ssl_client_cert_function = 'ENGINE_get_ssl_client_cert_function'; }  {Do not localize}
  {CH fn_ENGINE_get_ciphers = 'ENGINE_get_ciphers'; }  {Do not localize}
  {CH fn_ENGINE_get_digests = 'ENGINE_get_digests'; }   {Do not localize}
  {CH fn_ENGINE_get_cipher = 'ENGINE_get_cipher'; }  {Do not localize}
  {CH fn_ENGINE_get_digest = 'ENGINE_get_digest'; }  {Do not localize}
  {CH fn_ENGINE_get_cmd_defns = 'ENGINE_get_cmd_defns'; }  {Do not localize}
  {CH fn_ENGINE_get_flags = 'ENGINE_get_flags'; }  {Do not localize}
  {CH fn_ENGINE_init = 'ENGINE_init'; }  {Do not localize}
  {CH fn_ENGINE_finish = 'ENGINE_finish'; }  {Do not localize}
  {CH fn_ENGINE_load_private_key = 'ENGINE_load_private_key'; } {Do not localize}
  {CH fn_ENGINE_load_public_key = 'ENGINE_load_public_key'; }  {Do not localize}
  {CH fn_ENGINE_load_ssl_client_cert = 'ENGINE_load_ssl_client_cert'; }  {Do not localize}
  {CH fn_ENGINE_get_default_RSA = 'ENGINE_get_default_RSA'; }  {Do not localize}
  {CH fn_ENGINE_get_default_DSA = 'ENGINE_get_default_DSA'; }  {Do not localize}
  {CH fn_ENGINE_get_default_ECDH = 'ENGINE_get_default_ECDH'; }  {Do not localize}
  {CH fn_ENGINE_get_default_ECDSA = 'ENGINE_get_default_ECDSA'; }  {Do not localize}
  {CH fn_ENGINE_get_default_DH = 'ENGINE_get_default_DH'; }  {Do not localize}
  {CH fn_ENGINE_get_default_RAND = 'ENGINE_get_default_RAND'; }  {Do not localize}
  {CH fn_ENGINE_get_cipher_engine = 'ENGINE_get_cipher_engine'; }  {Do not localize}
  {CH fn_ENGINE_get_digest_engine = 'ENGINE_get_digest_engine'; }  {Do not localize}
  {CH fn_ENGINE_set_default_RSA = 'ENGINE_set_default_RSA'; }  {Do not localize}
  {CH fn_ENGINE_set_default_string = 'ENGINE_set_default_string'; } {Do not localize}
  {CH fn_ENGINE_set_default_DSA = 'ENGINE_set_default_DSA'; }  {Do not localize}
  {CH fn_ENGINE_set_default_ECDH = 'ENGINE_set_default_ECDH'; }  {Do not localize}
  {CH fn_ENGINE_set_default_ECDSA = 'ENGINE_set_default_ECDSA'; }  {Do not localize}
  {CH fn_ENGINE_set_default_DH = 'ENGINE_set_default_DH'; }  {do not localize}
  {CH fn_ENGINE_set_default_RAND = 'ENGINE_set_default_RAND'; }  {Do not localize}
  {CH fn_ENGINE_set_default_ciphers = 'ENGINE_set_default_ciphers'; }  {Do not localize}
  {CH fn_ENGINE_set_default_digests = 'ENGINE_set_default_digests'; }  {Do not localize}
  {CH fn_ENGINE_set_default = 'ENGINE_set_default'; }   {Do not localize}
  {CH fn_ENGINE_add_conf_module = 'ENGINE_add_conf_module'; }  {Do not localize}
  {CH fn_ENGINE_get_static_state = 'ENGINE_get_static_state'; }  {Do not localize}
  {$IFDEF OPENBSD}
  {CH fn_ENGINE_setup_bsd_cryptodev = 'ENGINE_setup_bsd_cryptodev'; }  {Do not localize}
  {$ENDIF}
  {$IFDEF FREEBSD}
  {CH fn_ENGINE_setup_bsd_cryptodev = 'ENGINE_setup_bsd_cryptodev'; }  {Do not localize}
  {$ENDIF}
  {CH fn_ERR_load_ENGINE_strings = 'ERR_load_ENGINE_strings'; }  {Do not localize}
  {$ENDIF}
  {$IFDEF OPENSSL_EXPORT_VAR_AS_FUNCTION}
  //These have a gl prefix because they may not be functions in some platforms.
  //They are functions in Win32 because DLL's can't export global variables
  //while Unix shared objects may expose them.
  {CH gl_ASN1_OBJECT_it = 'ASN1_OBJECT_it'; } {do not localize}
  {CH gl_ASN1_OCTET_STRING_NDEF_it = 'ASN1_OCTET_STRING_NDEF_it'; } {Do not localize}
  {CH gl_ASN1_BOOLEAN_it = 'ASN1_BOOLEAN_it'; } {Do not localize}
  {CH gl_ASN1_SEQUENCE_it = 'ASN1_SEQUENCE_it'; } {Do not localize}
  {CH gl_CBIGNUM_it = 'CBIGNUM_it'; } {Do not localize}
  {CH gl_BIGNUM_it = 'BIGNUM_it'; } {Do not localize}
  {CH gl_LONG_it = 'LONG_it'; } {Do not localize}
  {CH gl_ZLONG_it = 'ZLONG_it'; } {Do not localize}
  {CH gl_POLICY_MAPPING_it = 'POLICY_MAPPING_it'; } {Do not localize}
  {CH gl_POLICY_MAPPINGS_it = 'POLICY_MAPPINGS_it'; }  {Do not localize}
  {CH gl_GENERAL_SUBTREE_it = 'GENERAL_SUBTREE_it'; } {Do not localize}
  {CH gl_NAME_CONSTRAINTS_it = 'NAME_CONSTRAINTS_it'; } {Do not localize}
  {CH gl_POLICY_CONSTRAINTS_it = 'POLICY_CONSTRAINTS_it'; } {Do not localize}
  {$ENDIF}


{ IMPORTANT!!!

WindowsCE only has a Unicode (WideChar) version of GetProcAddress.  We could use
a version of GetProcAddress in the FreePascal dynlibs unit but that does a
conversion from ASCII to Unicode which might not be necessary since most calls
pass a constant anyway.
}
function LoadFunction(const FceName: {$IFDEF UNDER_CE}TIdUnicodeString{$ELSE}string{$ENDIF}; const ACritical : Boolean = True): Pointer;
begin
  Result := {$IFDEF WIN32_OR_WIN64_OR_WINCE}Windows.{$ENDIF}GetProcAddress(hIdSSL, {$IFDEF UNDER_CE}PWideChar{$ELSE}PChar{$ENDIF}(FceName));
  if ACritical then
  begin
    if Result = nil then begin
      FFailedFunctionLoadList.Add(FceName);
    end;
  end;
end;

function LoadFunctionCLib(const FceName: {$IFDEF UNDER_CE}TIdUnicodeString{$ELSE}string{$ENDIF}; const ACritical : Boolean = True): Pointer;
begin
  Result := {$IFDEF WIN32_OR_WIN64_OR_WINCE}Windows.{$ENDIF}GetProcAddress(hIdCrypto, {$IFDEF UNDER_CE}PWideChar{$ELSE}PChar{$ENDIF}(FceName));
  if ACritical then
  begin
    if Result = nil then begin
      FFailedFunctionLoadList.Add(FceName);
    end;
  end;
end;

// Id_ossl_old_des_set_odd_parity
{
IMPORTANT!!!

Indy DES support probably had been written to use some old "des_" functions.
The OpenSSL developers changed that interface to a new "des_*" API.  They have some
 "_ossl_old_des_*" for backwards compatability with the old functions
 which are defined in des_old.h. 
}
function LoadOldCLib(const AOldName, ANewName : {$IFDEF UNDER_CE}TIdUnicodeString{$ELSE}String{$ENDIF}; const ACritical : Boolean = True): Pointer;
begin
  Result := {$IFDEF WIN32_OR_WIN64_OR_WINCE}Windows.{$ENDIF}GetProcAddress(hIdCrypto, {$IFDEF UNDER_CE}PWideChar{$ELSE}PChar{$ENDIF}(AOldName));
  if Result = nil then begin
     Result := {$IFDEF WIN32_OR_WIN64_OR_WINCE}Windows.{$ENDIF}GetProcAddress(hIdCrypto, {$IFDEF UNDER_CE}PWideChar{$ELSE}PChar{$ENDIF}(ANewName));
     if ACritical then begin
        if Result = nil then begin
            FFailedFunctionLoadList.Add(AOldName);
        end;
     end;
  end;
end;

// remove this function, it is not used
function ErrMsg(AErr : TIdC_ULONG) : AnsiString;
var
  LString: AnsiString;
Begin
  SetLength(LString, 300);
  ERR_error_string_n(AErr, PAnsiChar(LString), 300);
  Result := PAnsiChar(LString);
end;

function Load: Boolean;
begin
  Assert(FFailedFunctionLoadList<>nil);
  FFailedFunctionLoadList.Clear;
  {$IFDEF KYLIXCOMPAT}
  // Workaround that is required under Linux (changed RTLD_GLOBAL with RTLD_LAZY Note: also work with LoadLibrary())
  if hIdCrypto = 0 then begin
    hIdCrypto := HackLoad(SSLCLIB_DLL_name, SSLDLLVers);
  end;
  if hIdSSL = 0 then begin
    hIdSSL := HackLoad(SSL_DLL_name, SSLDLLVers);
  end;
  {$ENDIF}
    Result := True;
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
    {$IFDEF FPC}
  //On Windows, you should use SafeLoadLibrary because
  //the LoadLibrary API call messes with the FPU control word.
  if hIdCrypto = 0 then begin
    hIdCrypto := SafeLoadLibrary(SSLCLIB_DLL_name);
  end;
  if hIdSSL = 0 then begin
    hIdSSL := SafeLoadLibrary(SSL_DLL_name);
    //This is a workaround for mingw32-compiled SSL .DLL which
    //might be named 'libssl32.dll'.
    if hIdSSL = 0 then begin
      hIdSSL := SafeLoadLibrary(SSL_DLL_name_alt);
    end;
  end else begin
    Exit;
  end;
    {$ELSE}
  if hIdCrypto = 0 then begin
    hIdCrypto := SafeLoadLibrary(SSLCLIB_DLL_name);
  end;
  if hIdSSL = 0 then begin
    hIdSSL := SafeLoadLibrary(SSL_DLL_name);
    //This is a workaround for mingw32-compiled SSL .DLL which
    //might be named 'libssl32.dll'.
    if hIdSSL = 0 then begin
      hIdSSL := SafeLoadLibrary(SSL_DLL_name_alt);
    end;    
  end else begin
    Exit;
  end;	
    {$ENDIF}
  {$ENDIF}
  {$IFDEF USE_BASEUNIX}
  if hIdCrypto = 0 then begin
   hIdCrypto := HMODULE(HackLoad(SSLCLIB_DLL_name, SSLDLLVers));
  end;
  if hIdSSL = 0 then begin
    hIdSSL := HMODULE(HackLoad(SSL_DLL_name, SSLDLLVers));
  end;
  {$ENDIF}
  {$IFDEF USE_VCL_POSIX}
  if hIdCrypto = 0 then begin
	hIdCrypto := HMODULE(HackLoad(SSLCLIB_DLL_name, SSLDLLVers));
  end;
  if hIdSSL = 0 then begin
    hIdSSL := HMODULE(HackLoad(SSL_DLL_name, SSLDLLVers));
  end else begin
    Exit;
  end;
  {$ENDIF}
  @SSL_CTX_set_cipher_list := LoadFunction(fn_SSL_CTX_set_cipher_list);
  @SSL_CTX_new := LoadFunction(fn_SSL_CTX_new);
  @SSL_CTX_free := LoadFunction(fn_SSL_CTX_free);
  @SSL_set_fd := LoadFunction(fn_SSL_set_fd);
  @SSL_CTX_use_PrivateKey_file := LoadFunction(fn_SSL_CTX_use_PrivateKey_file);
  @SSL_CTX_use_PrivateKey := LoadFunction(fn_SSL_CTX_use_PrivateKey);
  @SSL_CTX_use_certificate := LoadFunction(fn_SSL_CTX_use_certificate);
  @SSL_CTX_use_certificate_file := LoadFunction(fn_SSL_CTX_use_certificate_file);
  @SSL_load_error_strings := LoadFunction(fn_SSL_load_error_strings);
  @SSL_state_string_long := LoadFunction(fn_SSL_state_string_long);
  @SSL_alert_desc_string_long := LoadFunction(fn_SSL_alert_desc_string_long);
  @SSL_alert_type_string_long := LoadFunction(fn_SSL_alert_type_string_long);

  @SSL_get_peer_certificate := LoadFunction(fn_SSL_get_peer_certificate);
  @SSL_CTX_set_verify := LoadFunction(fn_SSL_CTX_set_verify);
  @SSL_CTX_set_verify_depth := LoadFunction(fn_SSL_CTX_set_verify_depth);
  @SSL_CTX_get_verify_depth := LoadFunction(fn_SSL_CTX_get_verify_depth);
  @SSL_CTX_set_default_passwd_cb := LoadFunction(fn_SSL_CTX_set_default_passwd_cb);
  @SSL_CTX_set_default_passwd_cb_userdata:= LoadFunction(fn_SSL_CTX_set_default_passwd_cb_userdata);
  @SSL_CTX_check_private_key := LoadFunction(fn_SSL_CTX_check_private_key);
  @SSL_new := LoadFunction(fn_SSL_new);
  @SSL_free := LoadFunction(fn_SSL_free);
  @SSL_accept := LoadFunction(fn_SSL_accept);
  @SSL_connect := LoadFunction(fn_SSL_connect);
  @SSL_read := LoadFunction(fn_SSL_read);
  @SSL_peek := LoadFunction(fn_SSL_peek);
  @SSL_pending := LoadFunction(fn_SSL_pending);
  @SSL_write := LoadFunction(fn_SSL_write);
  @SSL_ctrl := LoadFunction(fn_SSL_ctrl);
  @SSL_callback_ctrl := LoadFunction(fn_SSL_callback_ctrl);
  @SSL_CTX_ctrl := LoadFunction(fn_SSL_CTX_ctrl);
  @SSL_CTX_callback_ctrl := LoadFunction(fn_SSL_CTX_callback_ctrl);
  @SSL_get_error := LoadFunction(fn_SSL_get_error);
  @SSLv2_method := LoadFunction(fn_SSLv2_method);
  @SSLv2_server_method := LoadFunction(fn_SSLv2_server_method);
  @SSLv2_client_method := LoadFunction(fn_SSLv2_client_method);
  @SSLv3_method := LoadFunction(fn_SSLv3_method);
  @SSLv3_server_method := LoadFunction(fn_SSLv3_server_method);
  @SSLv3_client_method := LoadFunction(fn_SSLv3_client_method);
  @SSLv23_method := LoadFunction(fn_SSLv23_method);
  @SSLv23_server_method := LoadFunction(fn_SSLv23_server_method);
  @SSLv23_client_method := LoadFunction(fn_SSLv23_client_method);
  @TLSv1_method := LoadFunction(fn_TLSv1_method);
  @TLSv1_server_method := LoadFunction(fn_TLSv1_server_method);
  @TLSv1_client_method := LoadFunction(fn_TLSv1_client_method);
  @DTLSv1_method := LoadFunction(fn_DTLSv1_method, False);
  @DTLSv1_server_method := LoadFunction(fn_DTLSv1_server_method, False);
  @DTLSv1_client_method := LoadFunction(fn_DTLSv1_client_method, False);
  @SSL_shutdown := LoadFunction(fn_SSL_shutdown);
  @SSL_set_connect_state := LoadFunction(fn_SSL_set_connect_state);
  @set_accept_state := LoadFunction(fn_SSL_set_accept_state);
  @SSL_set_shutdown := LoadFunction(fn_SSL_set_shutdown);
  @SSL_CTX_load_verify_locations := LoadFunction(fn_SSL_CTX_load_verify_locations);
  @SSL_get_session := LoadFunction(fn_SSL_get_session);
  @SSLeay_add_ssl_algorithms := LoadFunction(fn_SSLeay_add_ssl_algorithms);
  @SSL_SESSION_get_id := LoadFunction(fn_SSL_SESSION_get_id,False);
  // CRYPTO LIB
  @_SSLeay_version := LoadFunctionCLib(fn_SSLeay_version);
  @SSLeay := LoadFunctionCLib(fn_SSLeay);
  @d2i_X509_NAME := LoadFunctionCLib(fn_d2i_X509_NAME);
  @i2d_X509_NAME := LoadFunctionCLib(fn_i2d_X509_NAME);
  @X509_NAME_oneline := LoadFunctionCLib(fn_X509_NAME_oneline);
  @X509_NAME_hash := LoadFunctionCLib(fn_X509_NAME_hash);
  @X509_set_issuer_name := LoadFunctionCLib(fn_X509_set_issuer_name);
  @X509_get_issuer_name := LoadFunctionCLib(fn_X509_get_issuer_name);
  @X509_set_subject_name := LoadFunctionCLib(fn_X509_set_subject_name);
  @X509_get_subject_name := LoadFunctionCLib(fn_X509_get_subject_name);
  @X509_digest := LoadFunctionCLib(fn_X509_digest);
  @X509_LOOKUP_ctrl := LoadFunctionCLib( fn_X509_LOOKUP_ctrl );
  @X509_STORE_add_cert := LoadFunctionCLib(fn_X509_STORE_add_cert);
  @X509_STORE_add_crl := LoadFunctionCLib(fn_X509_STORE_add_crl);
  @X509_STORE_CTX_get_ex_data := LoadFunctionCLib(fn_X509_STORE_CTX_get_ex_data);
  @X509_STORE_CTX_get_error := LoadFunctionCLib(fn_X509_STORE_CTX_get_error);
  @X509_STORE_CTX_set_error := LoadFunctionCLib(fn_X509_STORE_CTX_set_error);
  @X509_STORE_CTX_get_error_depth := LoadFunctionCLib(fn_X509_STORE_CTX_get_error_depth);
  @X509_STORE_CTX_get_current_cert := LoadFunctionCLib(fn_X509_STORE_CTX_get_current_cert);
  @X509_STORE_add_lookup := LoadFunctionCLib(fn_X509_STORE_add_lookup);
  @X509_STORE_load_locations := LoadFunctionClib(fn_X509_STORE_load_locations);
  @i2d_DSAPrivateKey := LoadFunctionClib(fn_i2d_DSAPrivateKey);
  @d2i_DSAPrivateKey := LoadFunctionCLib(fn_d2i_DSAPrivateKey);
  @d2i_PrivateKey := LoadFunctionCLib(fn_d2i_PrivateKey);
  @d2i_PrivateKey_bio := LoadFunctionCLib(fn_d2i_PrivateKey_bio);
  @X509_sign := LoadFunctionCLib(fn_X509_sign);
  @X509_REQ_sign := LoadFunctionCLib(fn_X509_REQ_sign);
  @X509_REQ_add_extensions := LoadFunctionCLib(fn_X509_REQ_add_extensions);
  @X509V3_EXT_conf_nid := LoadFunctionCLib(fn_X509V3_EXT_conf_nid);
  @X509_EXTENSION_create_by_NID := LoadFunctionCLib(fn_X509_EXTENSION_create_by_NID);
  @X509V3_set_ctx := LoadFunctionCLib(fn_X509V3_set_ctx);
  @X509_EXTENSION_free := LoadFunctionCLib(fn_X509_EXTENSION_free);
  @X509_add_ext := LoadFunctionCLib(fn_X509_add_ext);
    {$IFNDEF OPENSSL_NO_BIO}
  //X509_print
  @X509_print := LoadFunctionCLib(fn_X509_print, False );
  {$ENDIF}
  {$IFDEF SYS_WIN}
  @RAND_screen := LoadFunctionCLib(fn_RAND_screen);
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DES}
  // 3DES
  @DES_set_odd_parity := LoadFunctionCLib(fn_DES_set_odd_parity);
  @DES_set_key := LoadFunctionCLib(fn_DES_set_key);
  @DES_ecb_encrypt := LoadFunctionCLib(fn_DES_ecb_encrypt);
  @Id_ossl_old_des_set_odd_parity := LoadOldCLib(fnold_des_set_odd_parity,fn__ossl_old_des_set_odd_parity);
  @Id_ossl_old_des_set_key := LoadOldCLib(fnold_des_set_key,fn__ossl_old_des_set_key);
  @Id_ossl_old_des_ecb_encrypt := LoadOldCLib(fnold_des_ecb_encrypt,fn__ossl_old_des_ecb_encrypt);
  {$ENDIF}
  // More SSL functions
  @SSL_set_ex_data := LoadFunction(fn_SSL_set_ex_data);
  @SSL_get_ex_data := LoadFunction(fn_SSL_get_ex_data);
  @SSL_load_client_CA_file := LoadFunction(fn_SSL_load_client_CA_file);
  @SSL_CTX_set_client_CA_list := LoadFunction(fn_SSL_CTX_set_client_CA_list);
  @SSL_CTX_set_default_verify_paths := LoadFunction(fn_SSL_CTX_set_default_verify_paths);
  @SSL_CTX_set_session_id_context := LoadFunction(fn_SSL_CTX_set_session_id_context);
  @SSL_CIPHER_description := LoadFunction(fn_SSL_CIPHER_description);
  @SSL_get_current_cipher := LoadFunction(fn_SSL_get_current_cipher);
  @SSL_CIPHER_get_name := LoadFunction(fn_SSL_CIPHER_get_name);
  @SSL_CIPHER_get_version := LoadFunction(fn_SSL_CIPHER_get_version);
  @SSL_CIPHER_get_bits  := LoadFunction(fn_SSL_CIPHER_get_bits);
  // Thread safe
  @_CRYPTO_num_locks := LoadFunctionCLib(fn_CRYPTO_num_locks);
  @CRYPTO_set_locking_callback := LoadFunctionCLib(fn_CRYPTO_set_locking_callback);
  {$IFNDEF WIN32_OR_WIN64}
{
In OpenSSL 1.0.0, you should use these callback functions instead of the
depreciated set_id_callback.  They are not in the older 0.9.8 OpenSSL series so
we have to handle both cases.
}
  @CRYPTO_THREADID_set_callback := LoadFunctionCLib(fn_CRYPTO_THREADID_set_callback,False);
  @CRYPTO_THREADID_set_numeric := LoadFunctionClib(fn_CRYPTO_THREADID_set_numeric,False);
  @CRYPTO_THREADID_set_pointer := LoadFunctionClib(fn_CRYPTO_THREADID_set_pointer,False);  {Do not localize}
  if not assigned(CRYPTO_THREADID_set_callback) then begin
    @CRYPTO_set_id_callback := LoadFunctionCLib(fn_CRYPTO_set_id_callback);
  end;
  {$ENDIF}
  @ERR_put_error := LoadFunctionCLib(fn_ERR_put_error);
  @ERR_get_error := LoadFunctionCLib(fn_ERR_get_error);
  @ERR_peek_error := LoadFunctionCLib(fn_ERR_peek_error);
  @ERR_peek_last_error := LoadFunctionCLib(fn_ERR_peek_last_error);
  @ERR_clear_error := LoadFunctionCLib(fn_ERR_clear_error);
  @ERR_error_string := LoadFunctionCLib(fn_ERR_error_string);
  @ERR_error_string_n := LoadFunctionCLib(fn_ERR_error_string_n);
  @ERR_lib_error_string := LoadFunctionCLib( fn_ERR_lib_error_string );
  @ERR_func_error_string := LoadFunctionCLib( fn_ERR_func_error_string );
  @ERR_reason_error_string := LoadFunctionCLib( fn_ERR_reason_error_string );
  @ERR_load_ERR_strings := LoadFunctionCLib( fn_ERR_load_ERR_strings);
  @ERR_load_crypto_strings := LoadFunctionCLib(fn_ERR_load_crypto_strings);
  @ERR_free_strings := LoadFunctionCLib(fn_ERR_free_strings);
  @ERR_remove_thread_state := LoadFunctionCLib(fn_ERR_remove_thread_state,False);
  if not Assigned(ERR_remove_thread_state) then begin
    @ERR_remove_state := LoadFunctionCLib(fn_ERR_remove_state);
  end;
  @CRYPTO_cleanup_all_ex_data := LoadFunctionCLib(fn_CRYPTO_cleanup_all_ex_data);
  @SSL_COMP_get_compression_methods := LoadFunction(fn_SSL_COMP_get_compression_methods);
  @sk_pop_free := LoadFunctionCLib(fn_sk_pop_free);
  //RSA
  @RSA_free := LoadFunctionCLib(fn_RSA_free);
  @RSA_generate_key := LoadFunctionClib(fn_RSA_generate_key);
  @RSA_check_key := LoadFunctionCLib(fn_RSA_check_key);
  @RSA_generate_key_ex := LoadFunctionCLib(fn_RSA_generate_key_ex);
  @RSA_new := LoadFunctionCLib(fn_RSA_new);
  @RSA_size := LoadFunctionCLib(fn_RSA_size);
  @RSA_private_decrypt := LoadFunctionCLib(fn_RSA_private_decrypt);
  @RSA_public_encrypt := LoadFunctionCLib(fn_RSA_public_encrypt);
  //BN
  @BN_hex2bn := LoadFunctionCLib(fn_BN_hex2bn);
  @BN_bn2hex := LoadFunctionCLib(fn_BN_bn2hex);
  //BIO
  @BIO_new := LoadFunctionCLib(fn_BIO_new);
  @BIO_free := LoadFunctionCLib(fn_BIO_free);
  @BIO_new_mem_buf := LoadFunctionCLib(fn_BIO_new_mem_buf);
  @BIO_s_mem := LoadFunctionCLib(fn_BIO_s_mem);
  @BIO_s_file := LoadFunctionCLib(fn_BIO_s_file);
  @BIO_ctrl := LoadFunctionCLib(fn_BIO_ctrl);
  @BIO_int_ctrl := LoadFunctionCLib( fn_BIO_int_ctrl);
  @BIO_ptr_ctrl := LoadFunctionCLib( fn_BIO_ptr_ctrl );
  @BIO_new_file := LoadFunctionCLib(fn_BIO_new_file);
  @BIO_puts := LoadFunctionCLib(fn_BIO_puts);
  @BIO_read := LoadFunctionCLib(fn_BIO_read);
  @BIO_write := LoadFunctionCLib(fn_BIO_write);
  //i2d
  @i2d_X509_bio := LoadFunctionCLib(fn_i2d_X509_bio);
  @i2d_PrivateKey_bio := LoadFunctionCLib(fn_i2d_PrivateKey_bio);
  @d2i_X509_bio := LoadFunctionCLib(fn_d2i_X509_bio);
  @i2d_X509_REQ_bio := LoadFunctionClib(fn_i2d_X509_REQ_bio);
  @i2d_PKCS7 := LoadFunctionClib(fn_i2d_PKCS7);
  @d2i_PKCS7 := LoadFunctionCLib(fn_d2i_PKCS7);
  @i2d_X509 := LoadFunctionCLib(fn_i2d_X509);
  @d2i_X509 := LoadFunctionClib(fn_d2i_X509);
  @i2d_X509_REQ := LoadFunctionClib(fn_i2d_X509_REQ);
  @d2i_X509_REQ := LoadFunctionClib(fn_d2i_X509_REQ );
  @i2d_X509_CRL := LoadFunctionClib(fn_i2d_X509_CRL );
  @d2i_X509_CRL := LoadFunctionClib(fn_d2i_X509_CRL );
  @i2d_RSAPrivateKey := LoadFunctionCLib(fn_i2d_RSAPrivateKey );
  @d2i_RSAPrivateKey := LoadFunctionCLib(fn_d2i_RSAPrivateKey );
  @i2d_RSAPublicKey := LoadFunctionCLib(fn_i2d_RSAPublicKey);
  @d2i_RSAPublicKey := LoadFunctionClib(fn_d2i_RSAPublicKey);
  @i2d_PrivateKey := LoadFunctionCLib(fn_i2d_PrivateKey);
  @d2i_PrivateKey := LoadFunctionCLib(fn_d2i_PrivateKey);

  @i2d_DSAparams := LoadFunctionCLib(fn_i2d_DSAparams);
  @d2i_DSAparams := LoadFunctionClib(fn_d2i_DSAparams);
  @i2d_DHparams := LoadFunctionCLib(fn_i2d_DHparams);
  @d2i_DHparams := LoadFunctionClib(fn_d2i_DHparams);
  @i2d_NETSCAPE_CERT_SEQUENCE := LoadFunctionClib(fn_i2d_NETSCAPE_CERT_SEQUENCE);
  @d2i_NETSCAPE_CERT_SEQUENCE := LoadFunctionClib(fn_i2d_NETSCAPE_CERT_SEQUENCE);

  //X509
  @X509_get_default_cert_file := LoadFunctionCLib(fn_X509_get_default_cert_file);
  @X509_get_default_cert_file_env := LoadFunctionCLib(fn_X509_get_default_cert_file_env);
  @X509_new := LoadFunctionCLib(fn_X509_new);
  @X509_free := LoadFunctionCLib(fn_X509_free);
  @X509_REQ_new := LoadFunctionCLib(fn_X509_REQ_new);
  @X509_REQ_free := LoadFunctionCLib(fn_X509_REQ_free);
  @X509_to_X509_REQ := LoadFunctionCLib(fn_X509_to_X509_REQ);
  @X509_NAME_new := LoadFunctionCLib(fn_X509_NAME_new);
  @X509_NAME_free := LoadFunctionCLib(fn_X509_NAME_free);
  @X509_NAME_add_entry_by_txt := LoadFunctionCLib(fn_X509_NAME_add_entry_by_txt);
  @X509_INFO_free := LoadFunctionCLib(fn_X509_INFO_free);
  @X509_set_version := LoadFunctionCLib(fn_X509_set_version);
  @X509_get_serialNumber := LoadFunctionCLib(fn_X509_get_serialNumber);
  @X509_gmtime_adj := LoadFunctionCLib(fn_X509_gmtime_adj);
  @X509_set_notBefore := LoadFunctionCLib(fn_X509_set_notBefore);
  @X509_set_notAfter := LoadFunctionCLib(fn_X509_set_notAfter);
  @X509_set_pubkey := LoadFunctionCLib(fn_X509_set_pubkey);
  @X509_REQ_set_pubkey := LoadFunctionCLib(fn_X509_REQ_set_pubkey);
  //PEM
  {$IFNDEF SSLEAY_MACROS}
  @_PEM_read_bio_X509 := LoadFunctionCLib(fn_PEM_read_bio_X509, False);
  @_PEM_read_bio_X509_REQ := LoadFunctionClib(fn_PEM_read_bio_X509_REQ, False);
  @_PEM_read_bio_X509_CRL := LoadFunctionClib(fn_PEM_read_bio_X509_CRL, False);
  @_PEM_read_bio_RSAPrivateKey := LoadFunctionCLib(fn_PEM_read_bio_RSAPrivateKey, False);
  @_PEM_read_bio_RSAPublicKey := LoadFunctionCLib(fn_PEM_read_bio_RSAPublicKey, False);
  @_PEM_read_bio_DSAPrivateKey :=  LoadFunctionCLib(fn_PEM_read_bio_DSAPrivateKey, False);
  @_PEM_read_bio_PrivateKey := LoadFunctionClib (fn_PEM_read_bio_PrivateKey,False);
  @_PEM_read_bio_PKCS7 := LoadFunctionClib (fn_PEM_read_bio_PKCS7, False);
  @_PEM_read_bio_DHparams := LoadFunctionCLib(fn_PEM_read_bio_DHparams, False);
  @_PEM_read_bio_DSAparams := LoadFunctionClib(fn_PEM_read_bio_DSAparams, False);
  @_PEM_read_bio_NETSCAPE_CERT_SEQUENCE := LoadFunctionClib(fn_PEM_read_bio_NETSCAPE_CERT_SEQUENCE,False);
  @_PEM_write_bio_X509 := LoadFunctionCLib(fn_PEM_write_bio_X509,False);
  @_PEM_write_bio_X509_REQ := LoadFunctionCLib(fn_PEM_write_bio_X509_REQ,False);
  @_PEM_write_bio_X509_CRL := LoadFunctionCLib( fn_PEM_write_bio_X509_CRL,False);
  @_PEM_write_bio_RSAPublicKey := LoadFunctionCLib( fn_PEM_write_bio_RSAPublicKey,False);
  @_PEM_write_bio_DSAPrivateKey := LoadFunctionCLib( fn_PEM_write_bio_DSAPrivateKey,False);
  @_PEM_write_bio_PrivateKey := LoadFunctionClib( fn_PEM_write_bio_PrivateKey,False);
  @_PEM_write_bio_PKCS7 := LoadFunctionCLib( fn_PEM_write_bio_PKCS7,False);
  @_PEM_write_bio_DHparams := LoadFunctionCLib(fn_PEM_write_bio_DHparams,False);
  @_PEM_write_bio_DSAparams := LoadFunctionClib(fn_PEM_write_bio_DSAparams,False);
  @_PEM_write_bio_NETSCAPE_CERT_SEQUENCE := LoadFunctionClib(fn_PEM_write_bio_NETSCAPE_CERT_SEQUENCE,False);
  @_PEM_write_bio_PKCS8PrivateKey := LoadFunctionCLib(fn_PEM_write_bio_PKCS8PrivateKey,False);
  {$ELSE}
  @PEM_ASN1_write_bio := LoadFunctionCLib(fn_PEM_ASN1_write_bio,False);
  @PEM_ASN1_read_bio := LoadFunctionCLib(fn_PEM_ASN1_read_bio,False);
  {$ENDIF}
  @PEM_X509_INFO_read_bio := LoadFunctionCLib(fn_PEM_X509_INFO_read_bio);
  @PEM_read_bio_X509_AUX := LoadFunctionCLib(fn_PEM_read_bio_X509_AUX);
  //EVP
  {$IFNDEF OPENSSL_NO_DES}
  @EVP_des_ede3_cbc := LoadFunctionCLib(fn_EVP_des_ede3_cbc);
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA512}
  @EVP_sha512 := LoadFunctionCLib(fn_EVP_sha512,False);
  @EVP_sha384 := LoadFunctionCLib(fn_EVP_sha384,False);
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA256}
  @EVP_sha256 := LoadFunctionCLib(fn_EVP_sha256,False);
  @EVP_sha224 := LoadFunctionCLib(fn_EVP_sha224,False);
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA}
  @EVP_sha1 := LoadFunctionCLib(fn_EVP_sha1);
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD5}
  @EVP_md5 := LoadFunctionCLib(fn_EVP_md5);
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD4}
  @EVP_md4 := LoadFunctionCLib(fn_EVP_md4);
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD2}
  @EVP_md2 := LoadFunctionCLib(fn_EVP_md2);
  {$ENDIF}
  @EVP_MD_CTX_init := LoadFunctionCLib(fn_EVP_MD_CTX_init);
  @EVP_DigestInit_ex := LoadFunctionCLib(fn_EVP_DigestInit_ex);
  @EVP_DigestUpdate := LoadFunctionClib(fn_EVP_DigestUpdate);
  @EVP_DigestFinal_ex := LoadFunctionCLib(fn_EVP_DigestFinal_ex);
  @EVP_MD_CTX_cleanup := LoadFunctionCLib(fn_EVP_MD_CTX_cleanup);
  @EVP_PKEY_type := LoadFunctionCLib(fn_EVP_PKEY_type);
  @EVP_PKEY_new := LoadFunctionCLib(fn_EVP_PKEY_new);
  @EVP_PKEY_free := LoadFunctionCLib(fn_EVP_PKEY_free);
  @EVP_PKEY_assign := LoadFunctionCLib(fn_EVP_PKEY_assign);
  @EVP_get_digestbyname := LoadFunctionCLib(fn_EVP_get_digestbyname);
  //HMAC
{$IFNDEF OPENSSL_NO_HMAC}
  @HMAC_CTX_init := LoadFunctionCLib(fn_HMAC_CTX_init);
  @HMAC_Init_ex := LoadFunctionCLib(fn_HMAC_Init_ex);
  @HMAC_Update := LoadFunctionCLib(fn_HMAC_Update);
  @HMAC_Final := LoadFunctionCLib(fn_HMAC_Final);
  @HMAC_CTX_cleanup := LoadFunctionCLib(fn_HMAC_CTX_cleanup);
{$ENDIF}
  //OBJ
  @OBJ_obj2nid := LoadFunctionCLib(fn_OBJ_obj2nid);
  @OBJ_nid2obj := LoadFunctionCLib(fn_OBJ_nid2obj);
  @OBJ_nid2ln := LoadFunctionCLib(fn_OBJ_nid2ln);
  @OBJ_nid2sn := LoadFunctionCLib(fn_OBJ_nid2sn);
  //ASN1
  @ASN1_INTEGER_set := LoadFunctionCLib(fn_ASN1_INTEGER_set);
  @ASN1_INTEGER_get := LoadFunctionCLib(fn_ASN1_INTEGER_get);
  @ASN1_STRING_type_new := LoadFunctionCLib(fn_ASN1_STRING_type_new);
  @ASN1_STRING_free := LoadFunctionCLib(fn_ASN1_STRING_free);
  @ASN1_dup := LoadFunctionCLib(fn_ASN1_dup );
  @CRYPTO_set_mem_functions := LoadFunctionCLib(fn_CRYPTO_set_mem_functions);
  @CRYPTO_malloc := LoadFunctionCLib(fn_CRYPTO_malloc);
  @CRYPTO_free := LoadFunctionCLib(fn_CRYPTO_free);
  @CRYPTO_mem_leaks := LoadFunctionCLib(fn_CRYPTO_mem_leaks);
  @CRYPTO_mem_ctrl := LoadFunctionCLib(fn_CRYPTO_mem_ctrl);
  @CRYPTO_set_mem_debug_functions := LoadFunctionCLib(fn_CRYPTO_set_mem_debug_functions);
  //@CRYPTO_dbg_malloc := LoadFunctionCLib(fn_CRYPTO_dbg_malloc);
  //@CRYPTO_dbg_realloc := LoadFunctionCLib(fn_CRYPTO_dbg_realloc);
  //@CRYPTO_dbg_free := LoadFunctionCLib(fn_CRYPTO_dbg_free);
  //@CRYPTO_dbg_set_options := LoadFunctionCLib(fn_CRYPTO_dbg_set_options);
  //@CRYPTO_dbg_get_options := LoadFunctionCLib(fn_CRYPTO_dbg_get_options);
  @PKCS12_create := LoadFunctionCLib(fn_PKCS12_create);
  @i2d_PKCS12_bio := LoadFunctionCLib(fn_i2d_PKCS12_bio);
  @PKCS12_free := LoadFunctionCLib(fn_PKCS12_free);
  @OpenSSL_add_all_algorithms := LoadOldCLib(fn_OpenSSL_add_all_algorithms,
    fn_OPENSSL_add_all_algorithms_noconf);
  @OpenSSL_add_all_ciphers := LoadFunctionCLib(fn_OpenSSL_add_all_ciphers);
  @OpenSSL_add_all_digests := LoadFunctionCLib(fn_OpenSSL_add_all_digests);
  @EVP_cleanup := LoadFunctionCLib(fn_EVP_cleanup);

  @sk_num := LoadFunctionCLib(fn_sk_num);
  @sk_new := LoadFunctionCLib(fn_sk_new);
  @sk_new_null := LoadFunctionCLib(fn_sk_new_null);
  @sk_free := LoadFunctionCLib(fn_sk_free);
  @sk_push := LoadFunctionCLib(fn_sk_push);
  @sk_dup := LoadFunctionCLib(fn_sk_dup);
   @sk_find := LoadFunctionCLib(fn_sk_find);
   @sk_value := LoadFunctionCLib(fn_sk_value);
  {$IFDEF OPENSSL_FIPS}
  @_FIPS_mode_set := LoadFunctionCLib(fn_FIPS_mode_set,False);
  @_FIPS_mode := LoadFunctionCLib(fn_FIPS_mode,False);
  {$ENDIF}

  Result := (FFailedFunctionLoadList.Count = 0);
end;

procedure InitializeFuncPointers; {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  @SSL_CTX_set_cipher_list := nil;
  @SSL_CTX_new := nil;
  @SSL_CTX_free := nil;
  @SSL_set_fd := nil;
  @SSL_CTX_use_PrivateKey_file := nil;
  @SSL_CTX_use_PrivateKey := nil;
  @SSL_CTX_use_certificate := nil;
  @SSL_CTX_use_certificate_file := nil;
  @SSL_load_error_strings := nil;
  @SSL_state_string_long := nil;
  @SSL_load_error_strings := nil;
  @SSL_alert_type_string_long := nil;

  @SSL_get_peer_certificate := nil;
  @SSL_CTX_set_verify := nil;
  @SSL_CTX_set_verify_depth := nil;
  @SSL_CTX_get_verify_depth := nil;
  @SSL_CTX_set_default_passwd_cb := nil;
  @SSL_CTX_set_default_passwd_cb_userdata := nil;
  @SSL_CTX_check_private_key := nil;
  @SSL_new := nil;
  @SSL_free := nil;
  @SSL_accept := nil;
  @SSL_connect := nil;
  @SSL_read := nil;
  @SSL_peek := nil;
  @SSL_pending := nil;
  @SSL_write := nil;
  @SSL_ctrl := nil;
  @SSL_callback_ctrl := nil;
  @SSL_CTX_ctrl := nil;
  @SSL_CTX_callback_ctrl := nil;
  @SSL_get_error := nil;
  @SSLv2_method := nil;
  @SSLv2_server_method := nil;
  @SSLv2_client_method := nil;
  @SSLv3_method := nil;
  @SSLv3_server_method := nil;
  @SSLv3_client_method := nil;
  @SSLv23_method := nil;
  @SSLv23_server_method := nil;
  @SSLv23_client_method := nil;
  @TLSv1_method := nil;
  @TLSv1_server_method := nil;
  @TLSv1_client_method := nil;
  @DTLSv1_method := nil;
  @DTLSv1_server_method := nil;
  @DTLSv1_client_method := nil;
  @SSL_shutdown := nil;
  @SSL_set_connect_state := nil;
  @set_accept_state := nil;
  @SSL_set_shutdown := nil;
  @SSL_CTX_load_verify_locations := nil;
  @SSL_get_session := nil;
  @SSLeay_add_ssl_algorithms := nil;
  @SSL_SESSION_get_id := nil;
  // CRYPTO LIB
  @_SSLeay_version := nil;
  @SSLeay := nil;
  @X509_NAME_oneline := nil;
  @X509_NAME_hash := nil;
  @X509_set_issuer_name := nil;
  @X509_get_issuer_name := nil;
  @X509_set_subject_name := nil;
  @X509_get_subject_name := nil;
  @X509_digest := nil;
  @X509_LOOKUP_ctrl := nil;
  @X509_STORE_add_cert := nil;
  @X509_STORE_add_crl := nil;
  @X509_STORE_CTX_get_ex_data := nil;
  @X509_STORE_CTX_get_error := nil;
  @X509_STORE_CTX_set_error := nil;
  @X509_STORE_CTX_get_error_depth := nil;
  @X509_STORE_CTX_get_current_cert := nil;
  @X509_STORE_add_lookup := nil;
  @X509_STORE_load_locations := nil;
  @X509_sign := nil;
  @X509_REQ_sign := nil;
  @X509_REQ_add_extensions := nil;
  @X509V3_EXT_conf_nid := nil;
  @X509_EXTENSION_create_by_NID := nil;
  @X509V3_set_ctx := nil;
  @X509_EXTENSION_free := nil;
  @X509_add_ext := nil;
  {$IFNDEF OPENSSL_NO_BIO}
  //X509_print
  @X509_print := nil;
  {$ENDIF}
  {$IFDEF SYS_WIN}
  @RAND_screen := nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_DES}
  // 3DES
  @DES_set_odd_parity := nil;
  @DES_set_key := nil;
  @DES_ecb_encrypt := nil;
  @Id_ossl_old_des_set_odd_parity := nil;
  @Id_ossl_old_des_set_key := nil;
  @Id_ossl_old_des_ecb_encrypt := nil;
  {$ENDIF}
  // More SSL functions
  @SSL_set_ex_data := nil;
  @SSL_get_ex_data := nil;
  @SSL_load_client_CA_file := nil;
  @SSL_CTX_set_client_CA_list := nil;
  @SSL_CTX_set_default_verify_paths := nil;
  @SSL_CTX_set_session_id_context := nil;
  @SSL_CIPHER_description := nil;
  @SSL_get_current_cipher := nil;
  @SSL_CIPHER_get_name := nil;
  @SSL_CIPHER_get_version := nil;
  @SSL_CIPHER_get_bits  := nil;
  // Thread safe
  @_CRYPTO_num_locks := nil;
  @CRYPTO_set_locking_callback := nil;
  {$IFNDEF WIN32_OR_WIN64}
  @CRYPTO_THREADID_set_callback := nil;
  @CRYPTO_THREADID_set_numeric := nil;
  @CRYPTO_THREADID_set_pointer = nil;
  @CRYPTO_set_id_callback := nil;
  {$ENDIF}
  @ERR_put_error := nil;
  @ERR_get_error := nil;
  @ERR_peek_error := nil;
  @ERR_peek_last_error := nil;
  @ERR_clear_error := nil;
  @ERR_error_string := nil;
  @ERR_error_string_n := nil;
  @ERR_lib_error_string := nil;
  @ERR_func_error_string := nil;
  @ERR_reason_error_string := nil;
  @ERR_load_ERR_strings := nil;
  @ERR_load_crypto_strings := nil;
  @ERR_free_strings := nil;
  @ERR_remove_thread_state := nil;
  @ERR_remove_state := nil;
  @CRYPTO_cleanup_all_ex_data := nil;
  @SSL_COMP_get_compression_methods := nil;
  @sk_pop_free := nil;
  //RSA
  @RSA_new := nil;
  @RSA_free := nil;
  @RSA_size := nil;
  @RSA_generate_key := nil;
  @RSA_generate_key_ex := nil;
  @RSA_check_key := nil;
  @RSA_private_decrypt := nil;
  @RSA_public_encrypt := nil;
  //BIO
  @BIO_new := nil;
  @BIO_free := nil;
  @BIO_s_mem := nil;
  @BIO_s_file := nil;
  @BIO_new_mem_buf := nil;
  @BIO_ctrl := nil;
  @BIO_ptr_ctrl := nil;
  @BIO_int_ctrl := nil;
  @BIO_new_file := nil;
  @BIO_puts := nil;
  @BIO_read := nil;
  @BIO_write := nil;
  //BN
  @BN_hex2bn := nil;
  @BN_bn2hex := nil;
  //i2d
  @i2d_PKCS7 := nil;
  @d2i_PKCS7 := nil;
  @i2d_RSAPrivateKey := nil;
  @d2i_RSAPrivateKey := nil;
  @i2d_DSAPrivateKey := nil;
  @d2i_DSAPrivateKey := nil;
  @i2d_X509_bio := nil;
  @i2d_PrivateKey_bio := nil;
  @i2d_PrivateKey := nil;
  @d2i_PrivateKey := nil;
  @d2i_PrivateKey_bio := nil;
  @i2d_X509 := nil;
  @d2i_X509_bio := nil;
  @d2i_X509 := nil;
  @X509_NAME_new := nil;
  @X509_NAME_free := nil;
  @i2d_X509_REQ_bio := nil;
  @i2d_X509_REQ := nil;
  @d2i_X509_REQ := nil;
  @i2d_X509_NAME := nil;
  @d2i_X509_NAME := nil;
  @i2d_DSAparams := nil;
  @d2i_DSAparams := nil;
  @i2d_DHparams := nil;
  @d2i_DHparams := nil;
  @i2d_NETSCAPE_CERT_SEQUENCE := nil;
  @d2i_NETSCAPE_CERT_SEQUENCE := nil;
  //X509
  @X509_get_default_cert_file := nil;
  @X509_get_default_cert_file_env := nil;
  @X509_new := nil;
  @X509_free := nil;
  @X509_REQ_new := nil;
  @X509_REQ_free := nil;
  @X509_to_X509_REQ := nil;
  @X509_NAME_add_entry_by_txt := nil;
  @X509_INFO_free := nil;
  @X509_set_version := nil;
  @X509_get_serialNumber := nil;
  @X509_gmtime_adj := nil;
  @X509_set_notBefore := nil;
  @X509_set_notAfter := nil;
  @X509_set_pubkey := nil;
  @X509_REQ_set_pubkey := nil;
  //PEM
  {$IFNDEF SSLEAY_MACROS}
  @_PEM_read_bio_X509 := nil;
  @_PEM_read_bio_X509_REQ := nil;
  @_PEM_read_bio_X509_CRL := nil;
  @_PEM_read_bio_RSAPrivateKey := nil;
  @_PEM_read_bio_RSAPublicKey := nil;
  @_PEM_read_bio_DSAPrivateKey := nil;
  @_PEM_read_bio_PrivateKey := nil;
  @_PEM_read_bio_PKCS7 := nil;
  @_PEM_read_bio_DHparams := nil;
  @_PEM_read_bio_DSAparams := nil;
  @_PEM_read_bio_NETSCAPE_CERT_SEQUENCE := nil;
  @_PEM_write_bio_X509 := nil;
  @_PEM_write_bio_X509_REQ := nil;
  @_PEM_write_bio_X509_CRL := nil;
  @_PEM_write_bio_RSAPublicKey := nil;
  @_PEM_write_bio_RSAPrivateKey := nil;
  @_PEM_write_bio_DSAPrivateKey := nil;
  @_PEM_write_bio_PrivateKey := nil;
  @_PEM_write_bio_PKCS7 := nil;
  @_PEM_write_bio_DHparams := nil;
  @_PEM_write_bio_DSAparams := nil;
  @_PEM_write_bio_NETSCAPE_CERT_SEQUENCE := nil;

  @_PEM_write_bio_PKCS8PrivateKey := nil;

  {$ELSE}
  @PEM_ASN1_write_bio := nil;
  @PEM_ASN1_read_bio := nil;
  {$ENDIF}
  @PEM_X509_INFO_read_bio := nil;
  @PEM_read_bio_X509_AUX := nil;
  //EVP
  {$IFNDEF OPENSSL_NO_DES}
  @EVP_des_ede3_cbc := nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA512}
  @EVP_sha512 := nil;
  @EVP_sha384 := nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA256}
  @EVP_sha256 := nil;
  @EVP_sha224 := nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_SHA}
  @EVP_sha1 := nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD5}
  @EVP_md5 := nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD4}
  @EVP_md4 := nil;
  {$ENDIF}
  {$IFNDEF OPENSSL_NO_MD2}
  @EVP_md2 := nil;
  {$ENDIF}
  @EVP_MD_CTX_init := nil;
  @EVP_DigestInit_ex := nil;
  @EVP_DigestUpdate := nil;
  @EVP_DigestFinal_ex := nil;
  @EVP_MD_CTX_cleanup := nil;
  @EVP_PKEY_type := nil;
  @EVP_PKEY_new := nil;
  @EVP_PKEY_free := nil;
  @EVP_PKEY_assign := nil;
  @EVP_get_digestbyname := nil;
  //HMAC
{$IFNDEF OPENSSL_NO_HMAC}
  @HMAC_CTX_init := nil;
  @HMAC_Init_ex := nil;
  @HMAC_Update := nil;
  @HMAC_Final := nil;
  @HMAC_CTX_cleanup := nil;
{$ENDIF}
  //OBJ
  @OBJ_obj2nid := nil;
  @OBJ_nid2obj := nil;
  @OBJ_nid2ln := nil;
  @OBJ_nid2sn := nil;
  //ASN1
  @ASN1_INTEGER_set := nil;
  @ASN1_INTEGER_get := nil;
  @ASN1_STRING_type_new := nil;
  @ASN1_STRING_free := nil;
  @ASN1_dup := nil;
  @CRYPTO_set_mem_functions := nil;
  @CRYPTO_malloc := nil;
  @CRYPTO_free := nil;
  @CRYPTO_mem_leaks := nil;
  @CRYPTO_mem_ctrl := nil;
  @CRYPTO_set_mem_debug_functions := nil;
  //@CRYPTO_dbg_malloc := nil;
  //@CRYPTO_dbg_realloc := nil;
  //@CRYPTO_dbg_free := nil;
  //@CRYPTO_dbg_set_options := nil;
  //@CRYPTO_dbg_get_options := nil;
  @PKCS12_create := nil;
  @i2d_PKCS12_bio := nil;
  @PKCS12_free := nil;
  @OpenSSL_add_all_algorithms := nil;
  @OpenSSL_add_all_ciphers := nil;
  @OpenSSL_add_all_digests := nil;
  @EVP_cleanup := nil;
  @sk_new := nil;
  @sk_num := nil;
  @sk_new_null := nil;
  @sk_free := nil;
  @sk_push := nil;
  @sk_dup := nil;
  @sk_find := nil;
  @sk_value := nil;
  {$IFDEF OPENSSL_FIPS}
  @_FIPS_mode_set := nil;
  @_FIPS_mode := nil;
  {$ENDIF}
end;

procedure Unload;
var
  LStack: Pointer;
begin
  //this is a workaround for a known leak in the openssl library
  //present in 0.9.8a
  if SSLeay = $0090801f then begin //0x0090801fL
    LStack := SSL_COMP_get_compression_methods;
    sk_pop_free(LStack, @CRYPTO_free);
  end;
  CRYPTO_cleanup_all_ex_data;
  ERR_free_strings;
  if Assigned(ERR_remove_thread_state) then begin
    ERR_remove_thread_state(nil);
  end else begin
    ERR_remove_state(0);
  end;
  EVP_cleanup;
  if hIdSSL > 0 then begin
    {$IFDEF WIN32_OR_WIN64_OR_WINCE}Windows.{$ENDIF}FreeLibrary(hIdSSL);
    hIdSSL := 0;
  end;
  if hIdCrypto > 0 then begin
    {$IFDEF WIN32_OR_WIN64_OR_WINCE}Windows.{$ENDIF}FreeLibrary(hIdCrypto);
    hIdCrypto := 0;
  end;
  {$IFDEF USE_INVALIDATE_MOD_CACHE}
  InvalidateModuleCache;
  {$ENDIF}  
  {
  IMPORTANT!!

  We probably should reinitialize the functions to nil after the library is
  unloaded as some code will test for their presence with Assigned.
  }
  InitializeFuncPointers;
end;


function WhichFailedToLoad: string;
begin
  Assert(FFailedFunctionLoadList<>nil);
  if hIdSSL = 0 then begin
    Result := 'Failed to load ' + SSL_DLL_name + '.'  {Do not localize}
  end else begin
    Result := FFailedFunctionLoadList.CommaText;
  end;
end;

// Author : Gregor Ibich (gregor.ibic@intelicom.si)
// Pascal translation: Doychin Bondzhev (doichin@5group.com)

// Converts the following string representation into corresponding parts
// YYMMDDHHMMSS(+|-)HH( )MM
function UTC_Time_Decode(UCTtime : PASN1_UTCTIME; var year, month, day, hour, min, sec: Word;
  var tz_hour, tz_min: Integer): Integer;
var
  i, tz_dir: Integer;
  time_str: AnsiString;
begin
  Result := 1;
  if UCTtime^.length < 12 then begin
    Exit;
  end;
  SetString(time_str, UCTtime^.data, UCTtime^.length);
  // Check if first 12 chars are numbers
  if not IsNumeric(String(time_str), 12) then begin
    Exit;
  end;
  // Convert time from string to number
  year := IndyStrToInt(Copy(String(time_str), 1, 2)) + 1900;
  month := IndyStrToInt(Copy(String(time_str), 3, 2));
  day := IndyStrToInt(Copy(String(time_str), 5, 2));
  hour := IndyStrToInt(Copy(String(time_str), 7, 2));
  min := IndyStrToInt(Copy(String(time_str), 9, 2));
  sec := IndyStrToInt(Copy(String(time_str), 11, 2));
  // Fix year. This function is Y2k but isn't compatible with Y2k5 :-(    {Do not Localize}
  if year < 1950 then begin
    Inc(year, 100);
  end;
  // Check TZ
  tz_hour := 0;
  tz_min := 0;
  if CharIsInSet(String(time_str), 13, '-+') then begin    {Do not Localize}
    tz_dir := iif(CharEquals(String(time_str), 13, '-'), -1, 1);    {Do not Localize}
    for i := 14 to 18 do begin  // Check if numbers are numbers
      if i = 16 then begin
        Continue;
      end;
      if not IsNumeric(String(time_str[i])) then begin
        Exit;
      end;
    end;
    tz_hour := IndyStrToInt(String(Copy(time_str, 14, 15))) * tz_dir;
    tz_min  := IndyStrToInt(String(Copy(time_str, 17, 18))) * tz_dir;
  end;
end;

function SSL_set_app_data(s: PSSL; arg: Pointer): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_set_ex_data(s, 0, arg);
end;

function SSL_get_app_data(s: PSSL): Pointer;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_get_ex_data(s, 0);
end;

procedure InitializeRandom;
begin
  {$IFDEF SYS_WIN}
  if @RAND_screen <> nil then begin
    RAND_screen;
  end;
  {$ENDIF}
end;

function M_ASN1_STRING_length(x : PASN1_STRING): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := x^.length;
end;

procedure M_ASN1_STRING_length_set(x : PASN1_STRING; n : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  x^.length := n;
end;

function M_ASN1_STRING_type(x : PASN1_STRING) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := x^._type;
end;

function M_ASN1_STRING_data(x : PASN1_STRING) : PAnsiChar;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := x^.data;
end;

function X509_NAME_dup(xn : PX509_NAME) : PX509_NAME;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := ASN1_dup(i2d_of_Void(i2d_X509_NAME), d2i_of_void(d2i_X509_NAME), PAnsiChar(xn ) );
end;

function X509_STORE_CTX_get_app_data(ctx: PX509_STORE_CTX):Pointer;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := X509_STORE_CTX_get_ex_data(ctx, 0);
end;

function X509_get_version(x : PX509): TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := ASN1_INTEGER_get(x^.cert_info^.version);
end;

function X509_get_signature_type(x : PX509) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
{
http://groups.google.com/group/mailing.openssl.dev/browse_thread/thread/c1ab56fc4fb7af6a/98a2e94fe893aecf?lnk=st&q=X509_get_signature_type+&rnum=1&hl=en#98a2e94fe893aecf

Austin Krauss via RT wrote:

> D:\openssl-0.9.7b\out32dll\Release>openssl version -a
> OpenSSL 0.9.7b 10 Apr 2003
> built on: date not available
> platform: information not available
> options:  bn(64,32) md2(int) rc4(idx,int) des(idx,cisc,4,long) idea(int) blowfish(idx)
> compiler: information not available
> OPENSSLDIR: "/usr/local/ssl"

> Windows 2000 SP3 x86
> Visual C++ 6.0 SP5

> I'm running into a problem parsing the certificate that I've recieved from the peer. I'm trying to call X509_get_signature_type(...) to get the key algorithm used. After I went through this function with the debugger, I'm finding that "NID_sha1WithRSAEncryption" (which is correct by the way) is getting passed to EVP_PKEY_type(...). It seems as if there is not a EVP constant that maps to this particular NID and thus EVP_PKEY_type is returning NID_undef to my function.

As a addition to:
http://marc.theaimsgroup.com/?l=openssl-users&m=105074607225189&w=2
I would suggest that X509_get_signature_type(x) should
be changed to 'OBJ_obj2nid((x)->sig_alg->algorithm' (i.e. remove
the call to EVP_PKEY_type()) because currently this macro
returns the type of the key used for the signature generation
and *not* the type of the signature (i.e. key alg + hash alg).
The other solution would be to change EVP_PKEY_type() to
include the other RSA OIDs as well (from the usage of this macro
in OpenSSL the second alternative is simpler to implement, but
in this case the name of the macro should better be changed to
X509_get_signature_key_type() :-).

Regards,
Nils
}
begin
  Assert(x<>nil);
  Result := EVP_PKEY_type(OBJ_obj2nid(x.sig_alg.algorithm));
end;

function X509_REQ_get_subject_name(x:PX509_REQ):PX509_NAME;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Assert(x<>nil);
  Result := x^.req_info^.subject;
end;

//function X509_get_notBefore(x509: PX509):PASN1_UTCTIME;
function X509_get_notBefore(x509: PX509):PASN1_TIME;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Assert(x509<>nil);
  Result := x509.cert_info.validity.notBefore;
end;

//function X509_get_notAfter(x509: PX509):PASN1_UTCTIME;
function X509_get_notAfter(x509: PX509):PASN1_TIME;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Assert(x509<>nil);
  Result := x509.cert_info.validity.notAfter;
end;

function X509_REQ_get_version(x : PX509_REQ): TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := ASN1_INTEGER_get(x^.req_info^.version);
end;

function X509_CRL_get_version(x : PX509_CRL) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := ASN1_INTEGER_get(x^.crl^.version);
end;

function X509_CRL_get_lastUpdate(x : PX509_CRL) : PASN1_TIME;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := x^.crl^.lastUpdate;
end;

function X509_CRL_get_nextUpdate(x : PX509_CRL) : PASN1_TIME;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := x^.crl^.nextUpdate;
end;

function X509_CRL_get_issuer(x : PX509_CRL) : PX509_NAME;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := x^.crl^.issuer
end;

function X509_CRL_get_REVOKED(x : PX509_CRL) : PSTACK_OF_X509_REVOKED;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := x^.crl^.revoked;
end;

procedure SSL_CTX_set_info_callback(ctx: PSSL_CTX; cb: PSSL_CTX_info_callback);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Assert(ctx<>nil);
  ctx.info_callback := cb;
end;

//* Note: SSL[_CTX]_set_{options,mode} use |= op on the previous value,
// * they cannot be used to clear bits. */

function SSL_CTX_set_options(ctx: PSSL_CTX; op: TIdC_LONG):TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_OPTIONS, op, nil);
end;

function SSL_CTX_clear_options(ctx : PSSL_CTX; op : TIdC_LONG):TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx,SSL_CTRL_CLEAR_OPTIONS,op,nil);
end;

function SSL_CTX_get_options(ctx: PSSL_CTX) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_OPTIONS,0,nil);
end;

function SSL_set_options(ssl: PSSL; op : TIdC_LONG): TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_OPTIONS,op,nil);
end;

function SSL_clear_mode(ssl : PSSL; op : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl,SSL_CTRL_CLEAR_MODE,op,nil);
end;

function SSL_get_options(ssl : PSSL): TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_OPTIONS,0,nil);
end;

function SSL_CTX_set_mode(ctx : PSSL_CTX; op : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_MODE, op,nil);
end;

function SSL_CTX_clear_mode(ctx : PSSL_CTX; op : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx,SSL_CTRL_CLEAR_MODE,op,nil);
end;

function SSL_CTX_get_mode(ctx : PSSL_CTX) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_MODE,0,nil);
end;

function SSL_set_mtu(ssl : PSSL; mtu : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_SET_MTU, mtu, nil);
end;

function SSL_get_secure_renegotiation_support(ssl : PSSL) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_GET_RI_SUPPORT, 0, nil);
end;
//

function SSL_CTX_sess_number(ctx : PSSL_CTX) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_NUMBER,0,nil);
end;

function SSL_CTX_sess_connect(ctx : PSSL_CTX) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_CONNECT, 0,nil);
end;

function SSL_CTX_sess_connect_good(ctx : PSSL_CTX): TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_CONNECT_GOOD, 0, nil);
end;

function SSL_CTX_sess_connect_renegotiate(ctx : PSSL_CTX): TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_CONNECT_RENEGOTIATE, 0, nil);
end;

function SSL_CTX_sess_accept(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_ACCEPT, 0, nil);
end;

function SSL_CTX_sess_accept_renegotiate(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_ACCEPT_RENEGOTIATE, 0, nil);
end;

function SSL_CTX_sess_accept_good(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_ACCEPT_GOOD, 0, nil);
end;

function SSL_CTX_sess_hits(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_HIT, 0, nil);
end;

function SSL_CTX_sess_cb_hits(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_CB_HIT, 0, nil);
end;

function SSL_CTX_sess_misses(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_MISSES, 0, nil);
end;

function SSL_CTX_sess_timeouts(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_TIMEOUTS, 0, nil);
end;

function SSL_CTX_sess_cache_full(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SESS_CACHE_FULL, 0, nil);
end;

function SSL_CTX_sess_set_cache_size(ctx : PSSL_CTX; t : TIdC_LONG) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SET_SESS_CACHE_SIZE, t, nil);
end;

function SSL_CTX_sess_get_cache_size(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_GET_SESS_CACHE_SIZE, 0, nil);
end;

function SSL_CTX_set_session_cache_mode(ctx : PSSL_CTX; m : TIdC_LONG) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SET_SESS_CACHE_MODE, m, nil);
end;

function SSL_CTX_get_session_cache_mode(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_GET_SESS_CACHE_MODE, 0, nil);
end;

function SSL_CTX_get_read_ahead(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_GET_READ_AHEAD,0,nil);
end;

function SSL_CTX_set_read_ahead(ctx : PSSL_CTX; m : TIdC_LONG) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_ctrl(ctx, SSL_CTRL_SET_READ_AHEAD, m,nil);
end;

function SSL_CTX_get_max_cert_list(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
   Result := SSL_CTX_ctrl(ctx, SSL_CTRL_GET_MAX_CERT_LIST,0,nil);
end;

function SSL_CTX_set_max_cert_list(ctx : PSSL_CTX; m : TIdC_LONG) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
   Result := SSL_CTX_ctrl(ctx, SSL_CTRL_GET_MAX_CERT_LIST,m,nil);
end;

function SSL_get_max_cert_list(ssl : PSSL) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_GET_MAX_CERT_LIST, 0, nil);
end;

function SSL_set_max_cert_list(ssl : PSSL; m : TIdC_LONG) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_SET_MAX_CERT_LIST, m, nil);
end;

function DTLSv1_get_timeout(ssl : PSSL; var arg : timeval) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result :=	SSL_ctrl(ssl,DTLS_CTRL_GET_TIMEOUT,0, @arg);
end;

function DTLSv1_handle_timeout(ssl : PSSL) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result :=	SSL_ctrl(ssl,DTLS_CTRL_HANDLE_TIMEOUT,0, nil);
end;

function DTLSv1_listen(ssl : PSSL; var peer : sockaddr) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_ctrl(ssl,DTLS_CTRL_LISTEN,0, @peer);
end;

function SSL_session_reused(ssl : PSSL) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_ctrl(ssl,SSL_CTRL_GET_SESSION_REUSED,0,nil);
end;

function SSL_num_renegotiations(ssl : PSSL) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_ctrl(ssl,SSL_CTRL_GET_NUM_RENEGOTIATIONS,0,nil);
end;

function SSL_clear_num_renegotiations(ssl : PSSL) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_ctrl(ssl,SSL_CTRL_CLEAR_NUM_RENEGOTIATIONS,0,nil);
end;

function SSL_total_renegotiations(ssl : PSSL) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_ctrl(ssl,SSL_CTRL_GET_TOTAL_RENEGOTIATIONS,0,nil);
end;

function SSL_CTX_need_tmp_RSA(ctx : PSSL_CTX) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_CTX_ctrl(ctx,SSL_CTRL_NEED_TMP_RSA,0,nil);
end;

function SSL_CTX_set_tmp_rsa(ctx  : PSSL_CTX; rsa : PRSA) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_CTX_ctrl(ctx,SSL_CTRL_SET_TMP_RSA,0,rsa);
end;

function SSL_CTX_set_tmp_dh(ctx : PSSL_CTX; dh : PDH) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_CTX_ctrl(ctx,SSL_CTRL_SET_TMP_DH,0,dh);
end;

function SSL_CTX_set_tmp_ecdh(ctx : PSSL_CTX; ecdh : PEC_KEY) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_CTX_ctrl(ctx,SSL_CTRL_SET_TMP_ECDH,0,ecdh);
end;

function SSL_need_tmp_RSA(ssl : PSSL) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_ctrl(ssl,SSL_CTRL_NEED_TMP_RSA,0,nil);
end;

procedure SSL_set_tmp_rsa(ssl : PSSL; rsa : PRSA);
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	SSL_ctrl(ssl,SSL_CTRL_SET_TMP_RSA,0,rsa);
end;

function SSL_set_tmp_dh(ssl : PSSL;dh : PDH) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_ctrl(ssl,SSL_CTRL_SET_TMP_DH,0,dh);
end;

function SSL_set_tmp_ecdh(ssl : PSSL; ecdh : PEC_KEY) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_ctrl(ssl,SSL_CTRL_SET_TMP_ECDH,0,ecdh);
end;

function SSL_CTX_add_extra_chain_cert(ctx : PSSL_CTX; x509 : PX509) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := SSL_CTX_ctrl(ctx,SSL_CTRL_EXTRA_CHAIN_CERT,0,x509);
end;

{$IFNDEF OPENSSL_NO_TLSEXT}
function SSL_set_tlsext_host_name(s : PSSL; name : AnsiString) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(s, SSL_CTRL_SET_TLSEXT_HOSTNAME, TLSEXT_NAMETYPE_host_name,PAnsiChar(name));
end;

function SSL_set_tlsext_debug_callback(ssl : PSSL; cb : SSL_callback_ctrl_fp) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_callback_ctrl(ssl,SSL_CTRL_SET_TLSEXT_DEBUG_CB,cb);
end;

function SSL_set_tlsext_debug_arg(ssl : PSSL; arg : Pointer) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_SET_TLSEXT_DEBUG_ARG,0,arg);
end;

function SSL_set_tlsext_status_type(ssl : PSSL; _type : TIdC_LONG):TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_SET_TLSEXT_STATUS_REQ_TYPE,_type,nil);
end;

function SSL_get_tlsext_status_exts(ssl : PSSL; arg : Pointer): TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_GET_TLSEXT_STATUS_REQ_EXTS,0,arg);
end;

function SSL_set_tlsext_status_exts(ssl : PSSL; arg : Pointer):TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_SET_TLSEXT_STATUS_REQ_EXTS, 0, arg);
end;

function SSL_get_tlsext_status_ids(ssl : PSSL; arg : Pointer) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_GET_TLSEXT_STATUS_REQ_IDS,0, arg);
end;

function SSL_set_tlsext_status_ids(ssl : PSSL; arg : Pointer) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_SET_TLSEXT_STATUS_REQ_IDS,0,arg);
end;

function SSL_get_tlsext_status_ocsp_resp(ssl : PSSL; arg : Pointer) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_GET_TLSEXT_STATUS_REQ_OCSP_RESP,0,arg);
end;

function SSL_set_tlsext_status_ocsp_resp(ssl : PSSL; arg : Pointer; arglen : TIdC_LONG) : TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_ctrl(ssl, SSL_CTRL_SET_TLSEXT_STATUS_REQ_OCSP_RESP,arglen,arg);
end;

function SSL_CTX_set_tlsext_servername_callback(ctx : PSSL_CTX; cb :SSL_callback_ctrl_fp):TIdC_LONG;
 {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := SSL_CTX_callback_ctrl(ctx, SSL_CTRL_SET_TLSEXT_SERVERNAME_CB, cb);
end;
{$ENDIF}

function SSL_CTX_get_version(ctx: PSSL_CTX):TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Assert(ctx<>nil);
  Result := ctx^.method^.version;
end;

//* BIO_s_connect() and BIO_s_socks4a_connect() */

function BIO_set_conn_hostname(b : PBIO; name : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_CONNECT,0,name);
end;

function BIO_set_conn_port(b : PBIO; port : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_CONNECT,1,port);
end;

function BIO_set_conn_ip(b : PBIO; ip : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result :=  BIO_ctrl(b,BIO_C_SET_CONNECT,2,ip);
end;

function BIO_set_conn_int_port(b : PBIO; port : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_CONNECT,3,port);
end;

function BIO_get_conn_hostname(b : PBIO) : PAnsiChar;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,0);
end;

function BIO_get_conn_port(b : PBIO) : PAnsiChar;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,1);
end;

function BIO_get_conn_ip(b : PBIO) : PAnsiChar;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,2);
end;

function BIO_get_conn_int_port(b : PBIO) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_int_ctrl(b,BIO_C_GET_CONNECT,3,0);
end;

function BIO_set_nbio(b : PBIO; n : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_NBIO,n,nil);
end;

//* BIO_s_accept_socket() */
function BIO_set_accept_port(b : PBIO; name : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_ACCEPT,0,name);
end;

function BIO_get_accept_port(b : PBIO) : PAnsiChar;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := BIO_ptr_ctrl(b,BIO_C_GET_ACCEPT,0);
end;

//* #define BIO_set_nbio(b,n)	BIO_ctrl(b,BIO_C_SET_NBIO,(n),NULL) */
function BIO_set_nbio_accept(b : PBIO; n : TIdC_INT) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  if n <> 0 then begin
    Result := BIO_ctrl(b,BIO_C_SET_ACCEPT,1,PAnsiChar('a'));
  end else begin
    Result := BIO_ctrl(b,BIO_C_SET_ACCEPT,1,nil);
  end;
end;

function BIO_set_accept_bios(b : PBIO; bio : PBIO) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_ACCEPT,2,PAnsiChar(bio));
end;

function BIO_set_bind_mode(b : PBIO; mode : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_BIND_MODE,mode,nil);
end;

function BIO_get_bind_mode(b : PBIO; mode : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_GET_BIND_MODE,0,nil);
end;

function BIO_do_handshake(b : PBIO) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := BIO_ctrl(b,BIO_C_DO_STATE_MACHINE,0,nil);
end;

function BIO_do_connect(b : PBIO) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_do_handshake(b);
end;

function BIO_do_accept(b : PBIO) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_do_handshake(b)
end;

//* BIO_s_proxy_client() */
function BIO_set_url(b : PBIO; url : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := BIO_ctrl(b,BIO_C_SET_PROXY_PARAM,0,url);
end;

function BIO_set_proxies(b : PBIO; p : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_PROXY_PARAM,1,p);
end;

//* BIO_set_nbio(b,n) */
function BIO_set_filter_bio(b : PBIO; s : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_PROXY_PARAM,2,s);
end;

//* BIO *BIO_get_filter_bio(BIO *bio); */
//function BIO_set_proxy_cb(b : PBIO,cb) : TIdC_LONG;
//begin
//BIO_callback_ctrl(b,BIO_C_SET_PROXY_PARAM,3,(void *(*cb)()))
//end;

function BIO_set_proxy_header(b : PBIO; sk : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_PROXY_PARAM,4,sk);
end;

function BIO_set_no_connect_return(b : PBIO; b2 : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_int_ctrl(b,BIO_C_SET_PROXY_PARAM,5,b2);
end;

function BIO_get_proxy_header(b : PBIO; skp : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
   Result := BIO_ctrl(b,BIO_C_GET_PROXY_PARAM,0,skp);
end;

function BIO_get_proxies(b : PBIO; pxy_p : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
   Result := BIO_ctrl(b,BIO_C_GET_PROXY_PARAM,1,pxy_p);
end;

function BIO_get_url(b : PBIO; url : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := BIO_ctrl(b,BIO_C_GET_PROXY_PARAM,2,url);
end;

function BIO_get_no_connect_return(b : PBIO) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_GET_PROXY_PARAM,5,nil);
end;

function BIO_set_fd(b : PBIO; fd,c : TIdC_INT) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_int_ctrl(b,BIO_C_SET_FD,c,fd);
end;

function BIO_get_fd(b : PBIO; c : TIdC_INT) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_GET_FD,0,@c);
end;

//function BIO_set_fp(b : PBIO; fp : PAnsiChar; c : TIdC_LONG) : TIdC_LONG;
//{$IFDEF USE_INLINE} inline; {$ENDIF}
//begin
//  Result := BIO_ctrl(b,BIO_C_SET_FILE_PTR,c,fp);
//end;

//function BIO_get_fp(b : PBIO; fpp : PAnsiChar) : TIdC_LONG;
//{$IFDEF USE_INLINE} inline; {$ENDIF}
//begin
//  Result := BIO_ctrl(b,BIO_C_GET_FILE_PTR,0,fpp);
//end;

function BIO_seek(b : PBIO; ofs : TIdC_LONG) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_FILE_SEEK,ofs,nil);
end;

function BIO_tell(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_FILE_TELL,0,nil);
end;

//* name is cast to lose const, but might be better to route through a function
//  so we can do it safely */
{$IFDEF CONST_STRICT}
///* If you are wondering why this isn't defined, its because CONST_STRICT is
// * purely a compile-time kludge to allow const to be checked.
// */
//int BIO_read_filename(BIO *b,const char *name);
{$ELSE}
function BIO_read_filename(b : PBIO; name : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSE or BIO_FP_READ,name);
end;
{$ENDIF}

function BIO_write_filename(b : PBIO; name : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSE or BIO_FP_WRITE,name);
end;

function BIO_append_filename(b : PBIO; name : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSE or BIO_FP_APPEND,name);
end;

function BIO_rw_filename(b : PBIO; name : PAnsiChar) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSE or BIO_FP_READ or BIO_FP_WRITE,name);
end;

///* WARNING WARNING, this ups the reference count on the read bio of the
// * SSL structure.  This is because the ssl read BIO is now pointed to by
// * the next_bio field in the bio.  So when you free the BIO, make sure
// * you are doing a BIO_free_all() to catch the underlying BIO. */
function BIO_set_ssl(b : PBIO; ssl : PSSL; c : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result :=  BIO_ctrl(b,BIO_C_SET_SSL,c,ssl);
end;

function BIO_get_ssl(b : PBIO; sslp : PSSL) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_GET_SSL,0,sslp);
end;

function BIO_set_ssl_mode(b : PBIO; client : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SSL_MODE,client,nil);
end;

function BIO_set_ssl_renegotiate_bytes(b : PBIO; num : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_SET_SSL_RENEGOTIATE_BYTES,num,nil);
end;

function BIO_get_num_renegotiates(b : PBIO) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_GET_SSL_NUM_RENEGOTIATES,0,nil);
end;

function BIO_set_ssl_renegotiate_timeout(b : PBIO; seconds : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
 Result := BIO_ctrl(b,BIO_C_SET_SSL_RENEGOTIATE_TIMEOUT,seconds,nil);
end;

function BIO_get_mem_data(b : PBIO; out pp : Pointer) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := BIO_ctrl(b,BIO_CTRL_INFO,0,pp);
end;

function BIO_set_mem_buf(b : PBIO; bm : PAnsiChar; c : TIdC_INT) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_C_SET_BUF_MEM, c, bm);
end;

function BIO_get_mem_ptr(b: PBIO; out pp: Pointer) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_C_GET_BUF_MEM_PTR, 0, pp);
end;

procedure BIO_set_mem_eof_return(b : PBIO; const v : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  BIO_ctrl(b,BIO_C_SET_BUF_MEM_EOF_RETURN,v,nil);
end;

//* For the BIO_f_buffer() type */
function BIO_get_buffer_num_lines(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	Result := BIO_ctrl(b,BIO_C_GET_BUFF_NUM_LINES,0,nil);
end;

procedure BIO_set_buffer_size(b : PBIO; const size : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
	BIO_ctrl(b,BIO_C_SET_BUFF_SIZE,size,nil);
end;

//* Don't use the next one unless you know what you are doing :-) */
function BIO_dup_state(b : PBIO; ret : PBIO) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_DUP,0,ret);
end;

function BIO_reset(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_RESET,0,nil);
end;

function BIO_eof(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_EOF,0,nil);
end;

function BIO_set_close(b: PBIO; c: TIdC_LONG): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_CTRL_SET_CLOSE, c, nil);
end;

function BIO_get_close(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_CTRL_GET_CLOSE, 0, nil);
end;

function BIO_pending(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_PENDING,0,nil);
end;

function BIO_wpending(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_WPENDING,0,nil);
end;

function BIO_flush(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_FLUSH,0,nil);
end;

//* For the BIO_f_buffer() type */
function BIO_buffer_get_num_lines(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_GET,0,nil);
end;

function BIO_get_info_callback(b : PBIO; var cbp : Pbio_info_cb) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_GET_CALLBACK,0, @cbp);
end;

function BIO_set_info_callback(b : PBIO; cb : Pbio_info_cb) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
 Result := BIO_callback_ctrl(b,BIO_CTRL_SET_CALLBACK,cb);
end;

//* For BIO_s_bio() */
//function(bp : PBIO; cmd : TIdC_INT; larg : TIdC_LONG; iArg : TIdC_INT) : TIdC_LONG cdecl = nil;
//BIO_set_read_buffer_size(b,size) BIO_int_ctrl(b,BIO_C_SET_BUFF_SIZE,size,0)
function BIO_set_read_buffer_size(b : PBIO; size : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_int_ctrl(b,BIO_C_SET_BUFF_SIZE,size,0);
end;

function BIO_set_write_buffer_size(b : PBIO; size : TIdC_LONG) : TIdC_LONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_int_ctrl(b,BIO_C_SET_BUFF_SIZE,size,1);
end;

//#define BIO_make_bio_pair(b1,b2)   (int)BIO_ctrl(b1,BIO_C_MAKE_BIO_PAIR,0,b2)
function BIO_make_bio_pair(b1, b2 : PBIO ): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b1,BIO_C_MAKE_BIO_PAIR,0,b2);
end;

//#define BIO_destroy_bio_pair(b)    (int)BIO_ctrl(b,BIO_C_DESTROY_BIO_PAIR,0,NULL)
function BIO_destroy_bio_pair(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
   Result := BIO_ctrl(b,BIO_C_DESTROY_BIO_PAIR,0,nil);
end;

//#define BIO_shutdown_wr(b) (int)BIO_ctrl(b, BIO_C_SHUTDOWN_WR, 0, NULL)
function BIO_shutdown_wr(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_C_SHUTDOWN_WR, 0, nil);
end;

///* macros with inappropriate type -- but ...pending macros use int too: */
//#define BIO_get_write_guarantee(b) (int)BIO_ctrl(b,BIO_C_GET_WRITE_GUARANTEE,0,NULL)
function BIO_get_write_guarantee(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_C_GET_WRITE_GUARANTEE,0,nil);
end;

//#define BIO_get_read_request(b)    (int)BIO_ctrl(b,BIO_C_GET_READ_REQUEST,0,NULL)
function BIO_get_read_request(b : PBIO) : TIdC_INT;
begin
  Result := BIO_ctrl(b,BIO_C_GET_READ_REQUEST,0,nil);
end;

//* ctrl macros for dgram */
function _BIO_ctrl_dgram_connect(b : PBIO; peer : Sockaddr) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b,BIO_CTRL_DGRAM_CONNECT,0,@peer);
end;

function BIO_ctrl_set_connected(b : PBIO; state : TIdC_INT; peer : Sockaddr) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_CTRL_DGRAM_SET_CONNECTED, state, @peer);
end;

function BIO_dgram_recv_timedout(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_CTRL_DGRAM_GET_RECV_TIMER_EXP, 0, nil);
end;

function BIO_dgram_send_timedout(b : PBIO) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_CTRL_DGRAM_GET_SEND_TIMER_EXP, 0, nil);
end;

function BIO_dgram_get_peer(b : PBIO; var peer : SockAddr) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_CTRL_DGRAM_GET_PEER, 0, @peer)
end;

function BIO_dgram_set_peer(b : PBIO; peer : SockAddr) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := BIO_ctrl(b, BIO_CTRL_DGRAM_SET_PEER, 0, @peer);
end;

{$IFDEF SSLEAY_MACROS}
//You should do the PEM_read_bio and PEM_write_bio functions like this
//because OpenSSL has a define for either using Macros or the native
//functions.

function PEM_read_bio_X509(bp: PBIO; x: PPX509; cb: ppem_password_cb; u: Pointer): PX509;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio(d2i_of_void(d2i_X509), PEM_STRING_X509, bp, PPointer(x), cb, u);
end;

function PEM_read_bio_X509_REQ(bp :PBIO; x : PPX509_REQ; cb :ppem_password_cb; u: Pointer) : PX509_REQ;
{$IFDEF USE_INLINE} inline; {$ENDIF}
//PEM_ASN1_read_bio( (char *(*)())d2i_X509_REQ,PEM_STRING_X509_REQ,bp,(char **)x,cb,u)
begin
  Result := PEM_ASN1_read_bio(d2i_of_void(d2i_X509_REQ),PEM_STRING_X509_REQ,bp, Pointer(x), cb, u);
end;

//#define	PEM_read_bio_X509_CRL(bp,x,cb,u) (X509_CRL *)PEM_ASN1_read_bio( \
//	(char *(*)())d2i_X509_CRL,PEM_STRING_X509_CRL,bp,(char **)x,cb,u)
function PEM_read_bio_X509_CRL(bp : PBIO; x : PPX509_CRL;cb : ppem_password_cb; u: Pointer) : PX509_CRL;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio(d2i_of_void(d2i_X509_CRL), PEM_STRING_X509_CRL, bp, Pointer(x), cb, u);
end;

//#define	PEM_read_bio_RSAPrivateKey(bp,x,cb,u) (RSA *)PEM_ASN1_read_bio( \
//	(char *(*)())d2i_RSAPrivateKey,PEM_STRING_RSA,bp,(char **)x,cb,u)
function PEM_read_bio_RSAPrivateKey(bp : PBIO; x : PPRSA; cb : ppem_password_cb; u: Pointer) : PRSA;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio(d2i_of_void(d2i_RSAPrivateKey), PEM_STRING_RSA, bp, Pointer(x), cb, u);
end;

//#define	PEM_read_bio_RSAPublicKey(bp,x,cb,u) (RSA *)PEM_ASN1_read_bio( \
//	(char *(*)())d2i_RSAPublicKey,PEM_STRING_RSA_PUBLIC,bp,(char **)x,cb,u)
function PEM_read_bio_RSAPublicKey(bp : PBIO; x : PPRSA; cb : ppem_password_cb; u: Pointer) : PRSA;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio(d2i_of_void(d2i_RSAPublicKey),PEM_STRING_RSA_PUBLIC, bp, Pointer(x),cb, u);
end;

//#define	PEM_read_bio_DSAPrivateKey(bp,x,cb,u) (DSA *)PEM_ASN1_read_bio( \
//	(char *(*)())d2i_DSAPrivateKey,PEM_STRING_DSA,bp,(char **)x,cb,u)
function PEM_read_bio_DSAPrivateKey(bp : PBIO; x : PPDSA; cb : ppem_password_cb; u : Pointer) : PDSA;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio( d2i_of_void(d2i_DSAPrivateKey),PEM_STRING_DSA,bp,Pointer(x),cb,u);
end;

//#define	PEM_read_bio_PrivateKey(bp,x,cb,u) (EVP_PKEY *)PEM_ASN1_read_bio( \
//	(char *(*)())d2i_PrivateKey,PEM_STRING_EVP_PKEY,bp,(char **)x,cb,u)
function PEM_read_bio_PrivateKey(bp : PBIO; x : PPEVP_PKEY; cb : ppem_password_cb; u : Pointer) : PEVP_PKEY;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio( d2i_of_void(d2i_PrivateKey), PEM_STRING_EVP_PKEY, bp, Pointer(x),cb, u);
end;

//#define	PEM_read_bio_PKCS7(bp,x,cb,u) (PKCS7 *)PEM_ASN1_read_bio( \
//	(char *(*)())d2i_PKCS7,PEM_STRING_PKCS7,bp,(char **)x,cb,u)
function PEM_read_bio_PKCS7(bp : PBIO; x : PPPKCS7; cb : ppem_password_cb; u : Pointer) : PPKCS7;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio( d2i_of_void(d2i_PKCS7), PEM_STRING_PKCS7,bp,Pointer(x),cb, u);
end;

//#define	PEM_read_bio_DHparams(bp,x,cb,u) (DH *)PEM_ASN1_read_bio( \
//	(char *(*)())d2i_DHparams,PEM_STRING_DHPARAMS,bp,(char **)x,cb,u)
function PEM_read_bio_DHparams(bp : PBIO; x : PPDH; cb : ppem_password_cb; u : Pointer) : PDH;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio(d2i_of_void(d2i_DHparams),PEM_STRING_DHPARAMS,bp,Pointer(x),cb,u);
end;

//#define	PEM_read_bio_DSAparams(bp,x,cb,u) (DSA *)PEM_ASN1_read_bio( \
//	(char *(*)())d2i_DSAparams,PEM_STRING_DSAPARAMS,bp,(char **)x,cb,u)

function PEM_read_bio_DSAparams(bp : PBIO; x : PPDSA; cb : ppem_password_cb; u : Pointer) : PDSA;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio( d2i_of_void(d2i_DSAparams),PEM_STRING_DSAPARAMS,bp,Pointer(x),cb,u);
end;

//#define PEM_read_bio_NETSCAPE_CERT_SEQUENCE(bp,x,cb,u) \
//		(NETSCAPE_CERT_SEQUENCE *)PEM_ASN1_read_bio( \
//        (char *(*)())d2i_NETSCAPE_CERT_SEQUENCE,PEM_STRING_X509,bp,\
//							(char **)x,cb,u)
function PEM_read_bio_NETSCAPE_CERT_SEQUENCE(bp : PBIO; x : PPNETSCAPE_CERT_SEQUENCE;
  cb : ppem_password_cb; u : Pointer) : PNETSCAPE_CERT_SEQUENCE;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := PEM_ASN1_read_bio( d2i_of_void(d2i_NETSCAPE_CERT_SEQUENCE),PEM_STRING_X509,bp,Pointer(x),cb, u);
end;

function PEM_write_bio_X509(bp: PBIO; x: PX509): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio( i2d_of_void(i2d_X509), PEM_STRING_X509, bp, PAnsiChar(x), nil, nil, 0, nil, nil);
  Assert(Result<>0);
end;

function PEM_write_bio_X509_REQ(bp: PBIO; x: PX509_REQ): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_X509_REQ), PEM_STRING_X509_REQ, bp, PAnsiChar(x), nil, nil, 0, nil, nil);
  Assert(Result<>0);
end;

function PEM_write_bio_X509_CRL(bp : PBIO; x : PX509_CRL) : TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_X509_CRL), PEM_STRING_X509_CRL, bp, PAnsiChar(x), nil, nil, 0, nil, nil);
  Assert(Result<>0);
end;

function  PEM_write_bio_RSAPrivateKey(bp : PBIO; x : PRSA; const enc : PEVP_CIPHER;
  kstr : PAnsiChar; klen : TIdC_INT; cb : ppem_password_cb; u : POinter) : TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_RSAPrivateKey), PEM_STRING_RSA, bp, PAnsiChar(x), enc,kstr,klen,cb,u);
  Assert(Result<>0);
end;

function PEM_write_bio_RSAPublicKey(bp : PBIO; x : PRSA) : TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_RSAPublicKey), PEM_STRING_RSA_PUBLIC, bp, PAnsiChar(x), nil, nil, 0, nil, nil);
  Assert(Result<>0);
end;

function PEM_write_bio_DSAPrivateKey( bp : PBIO; x : PDSA; const enc : PEVP_CIPHER;
  kstr :PAnsiChar; klen : TIdC_INT; cb : Ppem_password_cb; u : Pointer) : TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_DSAPrivateKey), PEM_STRING_DSA, bp, PAnsiChar(x), enc,kstr,klen,cb,u);
  Assert(Result<>0);
end;

function PEM_write_bio_PrivateKey(bp : PBIO; x : PEVP_PKEY; const enc : PEVP_CIPHER;
  kstr :PAnsiChar; klen : TIdC_INT; cb : Ppem_password_cb; u : Pointer) : TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  if x^._type = EVP_PKEY_DSA then begin
    Result := PEM_ASN1_write_bio(i2d_of_void(i2d_PrivateKey),PEM_STRING_DSA,bp, Pointer(x),enc,kstr,klen,cb,u);
  end else begin
    Result := PEM_ASN1_write_bio(i2d_of_void(i2d_PrivateKey),PEM_STRING_RSA,bp, Pointer(x),enc,kstr,klen,cb,u);
  end;
  Assert(Result<>0);
end;

function PEM_write_bio_PKCS7(bp : PBIO; x : PPKCS7) : TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_PKCS7), PEM_STRING_PKCS7, bp, PAnsiChar(x), nil, nil, 0, nil, nil);
  Assert(Result<>0);
end;

function PEM_write_bio_DHparams(bp : PBIO; x : PDH): TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_DHparams), PEM_STRING_DHPARAMS, bp, PAnsiChar(x), nil, nil, 0, nil, nil);
  Assert(Result<>0);
end;

function PEM_write_bio_DSAparams(bp : PBIO; x : PDSA) : TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_DSAparams), PEM_STRING_DSAPARAMS, bp, PAnsiChar(x), nil, nil, 0, nil, nil);
  Assert(Result<>0);
end;

function PEM_write_bio_NETSCAPE_CERT_SEQUENCE(bp : PBIO; x : PDSA) : TIdC_INT;
begin
  Assert(bp<>nil);
  Assert(x<>nil);
  Result := PEM_ASN1_write_bio(i2d_of_void(i2d_NETSCAPE_CERT_SEQUENCE), PEM_STRING_X509, bp, PAnsiChar(x), nil, nil, 0, nil, nil);
  Assert(Result<>0);
end;

{$ELSE}

function PEM_read_bio_X509(bp: PBIO; x: PPX509; cb: ppem_password_cb; u: Pointer): PX509;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_X509(bp, x, cb, u);
end;

function PEM_read_bio_X509_REQ(bp :PBIO; x : PPX509_REQ; cb :ppem_password_cb; u: Pointer) : PX509_REQ;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_X509_REQ(bp, x, cb, u);
end;

function PEM_read_bio_X509_CRL(bp : PBIO; x : PPX509_CRL;cb : ppem_password_cb; u: Pointer) : PX509_CRL;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_X509_CRL(bp, x, cb, u);
end;

function PEM_read_bio_RSAPrivateKey(bp : PBIO; x : PPRSA; cb : ppem_password_cb; u: Pointer) : PRSA;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_RSAPrivateKey(bp, x, cb, u);
end;

function PEM_read_bio_RSAPublicKey(bp : PBIO; x : PPRSA; cb : ppem_password_cb; u: Pointer) : PRSA;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_RSAPublicKey(bp, x, cb, u);
end;

function PEM_read_bio_DSAPrivateKey(bp : PBIO; x : PPDSA; cb : ppem_password_cb; u : Pointer) : PDSA;{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_DSAPrivateKey(bp, x, cb, u);
end;

function PEM_read_bio_PrivateKey(bp : PBIO; x : PPEVP_PKEY; cb : ppem_password_cb; u : Pointer) : PEVP_PKEY;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_PrivateKey(bp, x, cb, u);
end;

function PEM_read_bio_PKCS7(bp : PBIO; x : PPPKCS7; cb : ppem_password_cb; u : Pointer) : PPKCS7;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_PKCS7(bp, x, cb, u);
end;

function PEM_read_bio_DHparams(bp : PBIO; x : PPDH; cb : ppem_password_cb; u : Pointer) : PDH;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_DHparams(bp, x, cb, u);
end;

function PEM_read_bio_DSAparams(bp : PBIO; x : PPDSA; cb : ppem_password_cb; u : Pointer) : PDSA;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_DSAparams(bp, x, cb, u);
end;

function PEM_read_bio_NETSCAPE_CERT_SEQUENCE(bp : PBIO; x : PPNETSCAPE_CERT_SEQUENCE;
  cb : ppem_password_cb; u : Pointer) : PNETSCAPE_CERT_SEQUENCE;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_read_bio_NETSCAPE_CERT_SEQUENCE(bp, x, cb, u);
end;

function PEM_write_bio_X509(bp: PBIO; x: PX509): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_X509(bp, x);
end;

function PEM_write_bio_X509_REQ(bp: PBIO; x: PX509_REQ): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_X509_REQ(bp, x);
end;

function PEM_write_bio_X509_CRL(bp : PBIO; x : PX509_CRL) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_X509_CRL(bp, x);
end;

function PEM_write_bio_RSAPublicKey(bp : PBIO; x : PRSA) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_RSAPublicKey(bp,x);
end;

function  PEM_write_bio_RSAPrivateKey(bp : PBIO; x : PRSA; const enc : PEVP_CIPHER;
  kstr : PAnsiChar; klen : TIdC_INT; cb : ppem_password_cb; u : POinter) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_RSAPrivateKey(bp,x,enc,kstr,klen,cb, u);
end;

function PEM_write_bio_DSAPrivateKey( bp : PBIO; x : PDSA; const enc : PEVP_CIPHER;
  kstr :PAnsiChar; klen : TIdC_INT; cb : Ppem_password_cb; u : Pointer) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_DSAPrivateKey( bp, x, enc, kstr, klen, cb, u);
end;

function PEM_write_bio_PrivateKey(bp : PBIO; x : PEVP_PKEY; const enc : PEVP_CIPHER;
  kstr :PAnsiChar; klen : TIdC_INT; cb : Ppem_password_cb; u : Pointer) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_PrivateKey(bp,x, enc, kstr, klen, cb, u);
end;

function PEM_write_bio_PKCS7(bp : PBIO; x : PPKCS7) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_PKCS7(bp, x);
end;

function PEM_write_bio_DHparams(bp : PBIO; x : PDH): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_DHparams(bp, x);
end;

function PEM_write_bio_DSAparams(bp : PBIO; x : PDSA) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_DSAparams(bp, x);
end;

function PEM_write_bio_NETSCAPE_CERT_SEQUENCE(bp : PBIO; x : PDSA) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := _PEM_write_bio_NETSCAPE_CERT_SEQUENCE(bp, x);
end;
{$ENDIF}


function OPENSSL_malloc(aSize:TIdC_INT):Pointer;
{$IFDEF USE_INLINE} inline; {$ENDIF}
//can also use CRYPTO_mem_leaks(bio)
begin
  Result := CRYPTO_malloc(aSize, '', 0);
end;

procedure CRYPTO_SetMemCheck(const aEnabled: Boolean);
{$IFDEF USE_INLINE} inline; {$ENDIF}
//compile openssl with -DCRYPTO_MDEBUG
{$IFOPT C+} // detect assertions
var
  r: Integer;
{$ENDIF}
begin
  //compile openssl with -DCRYPTO_MDEBUG
  {$IFOPT C+}r :={$ENDIF} CRYPTO_mem_ctrl(iif(aEnabled, CRYPTO_MEM_CHECK_ON, CRYPTO_MEM_CHECK_OFF));
  {$IFOPT C+}Assert(r<>0);{$ENDIF}
end;

{$IFNDEF OPENSSL_NO_RSA}
function EVP_PKEY_assign_RSA(pkey: PEVP_PKEY; rsa: PAnsiChar): TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := EVP_PKEY_assign(pkey, EVP_PKEY_RSA, rsa);
end;
{$ENDIF}

{$IFNDEF OPENSSL_NO_DSA}
function EVP_PKEY_assign_DSA(pkey : PEVP_PKEY; dsa : PAnsiChar) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := EVP_PKEY_assign(pkey,EVP_PKEY_DSA,	dsa);
end;
{$ENDIF}

{$IFNDEF OPENSSL_NO_DH}
function EVP_PKEY_assign_DH(pkey : PEVP_PKEY; dh : PAnsiChar) : TIdC_INT;
begin
  Result := EVP_PKEY_assign(pkey,EVP_PKEY_DH,dh);
end;
{$ENDIF}

{$IFNDEF OPENSSL_NO_EC}
function EVP_PKEY_assign_EC_KEY(pkey : PEVP_PKEY; eckey : PAnsiChar) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := EVP_PKEY_assign(pkey,EVP_PKEY_EC,eckey);
end;
{$ENDIF}

procedure X509V3_set_ctx_nodb(ctx: X509V3_CTX);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ctx.db := nil;
end;

///* Borland C seems too stupid to be able to shift and do longs in
// * the pre-processor :-( */
//#define ERR_PACK(l,f,r)		(((((unsigned long)l)&0xffL)*0x1000000)| \
//				((((unsigned long)f)&0xfffL)*0x1000)| \
//				((((unsigned long)r)&0xfffL)))
function ERR_PACK(l, f, r : TIdC_INT) : TIdC_ULONG;
begin
  Result := ((TIdC_ULONG(l) and $ff) * $1000000) or
    ((TIdC_ULONG(f) and $fff) * $1000) or
    (TIdC_ULONG(r) and $fff);
end;

function ERR_GET_LIB(const l : TIdC_INT) : TIdC_ULONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := (l shr 24) and $ff;
end;

function ERR_GET_FUNC(const l : TIdC_INT) : TIdC_ULONG;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := (l shr 12) and $fff;
end;

function  ERR_FATAL_ERROR(const l : TIdC_INT) : Boolean;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := (l and ERR_R_FATAL) > 0;
end;

function ERR_GET_REASON(const l : TIdC_INT) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := l and $fff;
end;

//__FILE__,__LINE__ preprocessor macros are not available in Pascal.
//so we can't pass error location info in the last two parameters.
procedure SYSerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_SYS,f,r,nil,0);
end;

procedure BNerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
   ERR_PUT_error(ERR_LIB_BN,f,r,nil,0);
end;

procedure RSAerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_RSA,f,r,nil,0);
end;

procedure DHerrr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
   ERR_PUT_error(ERR_LIB_DH,f,r,nil,0);
end;

procedure EVPerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_EVP,f,r,nil,0);
end;

procedure BUFerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_BUF,f,r,nil,0);
end;

procedure OBJerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_OBJ,f,r,nil,0);
end;

procedure PEMerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_PEM,f,r,nil,0);
end;

procedure DSAerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_DSA,f,r,nil,0);
end;

procedure X509err(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_X509,f,r,nil,0);
end;

procedure ASN1err(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
 ERR_PUT_error(ERR_LIB_ASN1,f,r,nil,0);
end;

procedure CONFerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_CONF,f,r,nil,0);
end;

procedure CRYPTOerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_CRYPTO,f,r,nil,0);
end;

procedure ECerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_EC,f,r,nil,0);
end;

procedure SSLerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_SSL,f,r,nil,0);
end;

procedure BIOerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_BIO,f,r,nil,0);
end;

procedure PKCS7err(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_PKCS7,f,r,nil,0);
end;

procedure X509V3err(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_X509V3,f,r,nil,0);
end;

procedure PKCS12err(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_PKCS12,f,r,nil,0);
end;

procedure RANDerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_RAND,f,r,nil,0);
end;

procedure DSOerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_DSO,f,r,nil,0);
end;

procedure ENGINEerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_ENGINE,f,r,nil,0);
end;

procedure OCSPerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_OCSP,f,r,nil,0);
end;

procedure UIerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_UI,f,r,nil,0);
end;

procedure COMPerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_COMP,f,r,nil,0);
end;

procedure ECDSAerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_ECDSA,f,r,nil,0);
end;

procedure ECDHerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_ECDH,f,r,nil,0);
end;

procedure STOREerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_STORE,f,r,nil,0);
end;

procedure FIPSerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_FIPS,f,r,nil,0);
end;

procedure CMSerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_CMS,f,r,nil,0);
end;

procedure JPAKEerr(const f,r : TIdC_INT);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  ERR_PUT_error(ERR_LIB_JPAKE,f,r,nil,0);
end;

function X509_LOOKUP_load_file(x : PX509_LOOKUP; name : PAnsiChar; _type : TIdC_LONG) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := X509_LOOKUP_ctrl(x, X509_L_FILE_LOAD, name, _type, nil);
end;

function X509_LOOKUP_add_dir(x : PX509_LOOKUP; name : PAnsiChar; _type : TIdC_LONG) : TIdC_INT;
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  Result := X509_LOOKUP_ctrl(x, X509_L_ADD_DIR, name, _type, nil);
end;

initialization
  FFailedFunctionLoadList := TStringList.Create;
  SetFIPSMode := OpenSSLSetFIPSMode;
  GetFIPSMode := OpenSSLGetFIPSMode;
  IsHashingIntfAvail := OpenSSLIsHashingIntfAvail;

  IsMD2HashIntfAvail := OpenSSLIsMD2HashIntfAvail;
  GetMD2HashInst := OpenSSLGetMD2HashInst;
  IsMD4HashIntfAvail := OpenSSLIsMD4HashIntfAvail;
  GetMD4HashInst := OpenSSLGetMD4HashInst;
  IsMD5HashIntfAvail := OpenSSLIsMD5HashIntfAvail;
  GetMD5HashInst := OpenSSLGetMD5HashInst;
  IsSHA1HashIntfAvail := OpenSSLIsSHA1HashIntfAvail;
  GetSHA1HashInst := OpenSSLGetSHA1HashInst;
  IsSHA224HashIntfAvail := OpenSSLIsSHA224HashIntfAvail;
  GetSHA224HashInst := OpenSSLGetSHA224HashInst;
  IsSHA256HashIntfAvail := OpenSSLIsSHA256HashIntfAvail;
  GetSHA256HashInst := OpenSSLGetSHA256HashInst;
  IsSHA384HashIntfAvail := OpenSSLIsSHA384HashIntfAvail;
  GetSHA384HashInst := OpenSSLGetSHA384HashInst;
  IsSHA512HashIntfAvail := OpenSSLIsSHA512HashIntfAvail;
  GetSHA512HashInst := OpenSSLGetSHA512HashInst;
  UpdateHashInst := OpenSSLUpdateHashInst;
  FinalHashInst := OpenSSLFinalHashInst;
  IsHMACAvail := OpenSSLIsHMACAvail;
  IsHMACMD5Avail := OpenSSLIsHMACMD5Avail;
  GetHMACMD5HashInst := OpenSSLGetHMACMD5Inst;
  IsHMACSHA1Avail  := OpenSSLIsHMACSHA1Avail;
  GetHMACSHA1HashInst:= OpenSSLGetHMACSHA1Inst;
  IsHMACSHA224Avail := OpenSSLIsHMACSHA224Avail;
  GetHMACSHA224HashInst:= OpenSSLGetHMACSHA224Inst;
  IsHMACSHA256Avail := OpenSSLIsHMACSHA256Avail;
  GetHMACSHA256HashInst:= OpenSSLGetHMACSHA256Inst;
  IsHMACSHA384Avail := OpenSSLIsHMACSHA384Avail;
  GetHMACSHA384HashInst:= OpenSSLGetHMACSHA384Inst;
  IsHMACSHA512Avail := OpenSSLIsHMACSHA512Avail;
  GetHMACSHA512HashInst:= OpenSSLGetHMACSHA512Inst;
  UpdateHMACInst := OpenSSLUpdateHMACInst;
  FinalHMACInst := OpenSSLFinalHMACInst;
finalization
  FreeAndNil(FFailedFunctionLoadList);

end.
