unit IdObjs;

{$I IdCompilerDefines.inc}

interface

uses
{$IFDEF DotNet}
  IdObjsNET
{$ELSE}
  Classes
{$ENDIF};

type
{$IFDEF DotNet}
  TIdStrings = TIdStringsDotNet;
{$ELSE}
  TIdStrings = Classes.TStrings;
{$ENDIF}


implementation

end.
