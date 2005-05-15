unit IdObjs;

{$I IdCompilerDefines.inc}

interface

uses
{$IFDEF DotNet}
  IdObjsFCL
{$ELSE}
  Classes
{$ENDIF};

type
{$IFDEF DotNet}
  TIdStrings = TIdStringsFCL;
  TIdStringList = TIdStringListFCL;
{$ELSE}
  TIdStrings = Classes.TStrings;
  TIdStringList = Classes.TStringList;
{$ENDIF}


implementation

end.
