unit IdCTypes;
interface
{$i IdCompilerDefines.inc}

{This unit should not contain ANY program code.  It is meant to be extremely 
thin.  The idea is that the unit will contain type mappings that used for headers
and API calls using the headers.  The unit is here because in cross-platform
headers, the types may not always be the same as they would for Win32 on x86
Intel architecture.  We also want to be completely compatiable with Borland
Delphi for Win32.}
{$IFDEF FPC}
uses
  ctypes;
{$ENDIF}
  
{
IMPORTANT!!!

The types below are defined to hide architecture differences for various C++
types while also making this header compile with Borland Delphi.

}
type 
  {$IFDEF FPC}
  TIdC_ULONG = cuLong;
  TIdC_UINT  = cUInt;
  TIdC_UNSIGNED = cunsigned;
  TIdC_PULONG = pculong;
  TIdC_INT   = cInt;
  {$ENDIF}
  {$IFNDEF FPC}
  TIdC_ULONG = LongWord;
  TIdC_UINT  = LongWord;
  TIdC_UNSIGNED = LongWord;
  TIdC_PULONG = ^TIdC_UNSIGNED;
  TIdC_INT   = LongInt;
  {$ENDIF}
    
implementation

end.
