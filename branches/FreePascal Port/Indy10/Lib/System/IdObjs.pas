unit IdObjs;

{$I IdCompilerDefines.inc}

interface

uses
{$IFDEF DotNetDistro}
  IdObjsFCL
{$ELSE}
  Classes
{$ENDIF};

type
{$IFDEF DotNetDistro}
  TIdStrings = TIdStringsFCL;
  TIdStringList = TIdStringListFCL;
{$ELSE}
  TIdStrings = Classes.TStrings;
  TIdStringList = Classes.TStringList;
{$ENDIF}


implementation

end.
