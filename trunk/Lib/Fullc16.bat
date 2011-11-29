@echo off

REM ****************************************************************************
REM 
REM Author : Malcolm Smith, MJ freelancing
REM          http://www.mjfreelancing.com
REM 
REM Note: This batch file copies the ZLIB OBJ files from \Lib\Protocols\ZLib\i386-Win32-ZLib
REM       (Update to \Lib\Protocols\ZLib\x86_64-Win64-ZLib if required)
REM
REM Pre-requisites:  \Lib\System contains the project / pas/ res files for IndySystem
REM                  \Lib\Core contains the project / pas/ res files for IndyCore
REM                  \Lib\Protocols contains the project / pas/ res files for IndyProtocols
REM 
REM ****************************************************************************

computil SetupC16
if exist setenv.bat call setenv.bat
if exist setenv.bat del setenv.bat > nul

if (%NDC16%)==() goto enderror
if not exist %NDC16%\bin\dcc32.exe goto endnocompiler
if not exist ..\C16\*.* md ..\C16 > nul
if not exist ..\C16\ZLib\*.* md ..\C16\ZLib > nul
if not exist ..\C16\ZLib\i386-Win32-ZLib\*.* md ..\C16\ZLib\i386-Win32-ZLib > nul
if not exist ..\C16\ZLib\x86_64-Win64-ZLib\*.* md ..\C16\ZLib\x86_64-Win64-ZLib > nul

if exist ..\C16\*.* call clean.bat ..\C16\

cd System
copy IndySystem160.dpk ..\..\C16 > nul
copy *IndySystem160.cfg1 ..\..\C16 > nul
copy *IndySystem160.cfg2 ..\..\C16 > nul
copy *.res ..\..\C16 > nul
copy *.pas ..\..\C16 > nul
copy *.inc ..\..\C16 > nul

cd ..\..\C16


REM ************************************************************
REM Compile IndySystem160 - Round 1
REM ************************************************************
copy IndySystem160.cfg1 IndySystem160.cfg > nul
%NDC16%\bin\dcc32.exe /B IndySystem160.dpk
if errorlevel 1 goto enderror



REM ************************************************************
REM Compile IndySystem160 - Round 2
REM ************************************************************
del IndySystem160.cfg > nul 
copy IndySystem160.cfg2 IndySystem160.cfg > nul
%NDC16%\bin\dcc32.exe /B IndySystem160.dpk
if errorlevel 1 goto enderror



REM ************************************************************
REM Prepare to copy all CORE related files
REM ************************************************************

cd ..\Lib\Core

copy *IndyCore160.dpk ..\..\C16 > nul
copy *IndyCore160.cfg1 ..\..\C16 > nul
copy *IndyCore160.cfg2 ..\..\C16 > nul
copy *.res ..\..\C16 > nul
copy *.pas ..\..\C16 > nul
copy *.dcr ..\..\C16 > nul
copy *.inc ..\..\C16 > nul


cd ..\..\C16


REM ************************************************************
REM Compile IndyCore160 - Round 1
REM ************************************************************
copy IndyCore160.cfg1 IndyCore160.cfg > nul
%NDC16%\bin\dcc32.exe /B IndyCore160.dpk
if errorlevel 1 goto enderror


REM ************************************************************
REM Compile IndyCore160 - Round 2
REM ************************************************************
del IndyCore160.cfg > nul
copy IndyCore160.cfg2 IndyCore160.cfg > nul
%NDC16%\bin\dcc32.exe /B IndyCore160.dpk
if errorlevel 1 goto enderror




REM ************************************************************
REM Compile dclIndyCore160 - Round 1
REM ************************************************************
copy dclIndyCore160.cfg1 dclIndyCore160.cfg > nul
%NDC16%\bin\dcc32.exe /B dclIndyCore160.dpk
if errorlevel 1 goto enderror



REM ************************************************************
REM Prepare to copy all PROTOCOLS related files
REM ************************************************************

cd ..\Lib\Protocols

copy zlib\i386-Win32-ZLib\*.obj ..\..\C16\ZLib\i386-Win32-ZLib > nul
copy zlib\x86_64-Win64-ZLib\*.obj ..\..\C16\ZLib\x86_64-Win64-ZLib > nul
copy *IndyProtocols160.dpk ..\..\C16 > nul
copy *IndyProtocols160.cfg1 ..\..\C16 > nul
copy *IndyProtocols160.cfg2 ..\..\C16 > nul
copy *.res ..\..\C16 > nul
copy *.pas ..\..\C16 > nul
copy *.dcr ..\..\C16 > nul
copy *.inc ..\..\C16 > nul

cd ..\..\C16


REM ************************************************************
REM Compile IndyProtocols160 - Round 1
REM ************************************************************
copy IndyProtocols160.cfg1 IndyProtocols160.cfg > nul
%NDC16%\bin\dcc32.exe /B IndyProtocols160.dpk
if errorlevel 1 goto enderror


REM ************************************************************
REM Compile IndyProtocols160 - Round 2
REM ************************************************************
del IndyProtocols160.cfg > nul
copy IndyProtocols160.cfg2 IndyProtocols160.cfg > nul
%NDC16%\bin\dcc32.exe /B IndyProtocols160.dpk
if errorlevel 1 goto enderror



REM ************************************************************
REM Compile dclIndyProtocols160 - Round 1
REM ************************************************************
copy dclIndyProtocols160.cfg1 dclIndyProtocols160.cfg > nul
%NDC16%\bin\dcc32.exe /B dclIndyProtocols160.dpk
if errorlevel 1 goto enderror



REM ************************************************************
REM Set all files we want to keep with the R attribute then 
REM delete the rest before restoring the attribute
REM ************************************************************
cd ZLib\i386-Win32-ZLib
del /Q *.* > nul
cd..
rd i386-Win32-ZLib
cd x86_64-Win64-ZLib
del /Q *.* > nul
cd..
rd x86_64-Win64-ZLib
cd..
rd ZLib
attrib +r Id*.hpp
attrib +r *.bpl
attrib +r Indy*.bpi
attrib +r Indy*.lib
attrib +r indysystem160.res
attrib +r indycore160.res
attrib +r indyprotocols160.res
del /Q /A:-R *.* > nul
attrib -r Id*.hpp
attrib -r *.bpl
attrib -r Indy*.bpi
attrib -r Indy*.lib
attrib -r indysystem160.res
attrib -r indycore160.res
attrib -r indyprotocols160.res

goto endok

:enderror
echo Error!
goto endok

:endnocompiler
echo C++Builder 16 Compiler Not Present!
goto endok

:endok
cd ..\Lib
