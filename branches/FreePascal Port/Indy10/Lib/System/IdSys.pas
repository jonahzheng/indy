unit IdSys;
{$I IdCompilerDefines.inc}

interface

uses
  {$IFDEF DotNet}
  IdSysNet;
  {$ENDIF}
  {$IFDEF MSWindows}
  IdSysWin32;
  {$ENDIF}
  {$IFDEF Linux}
  IdSysLinux;
  {$ENDIF}

type
  {$IFDEF DotNet}
  Sys = TIdSysNet;
  {$ENDIF}
  {$IFDEF MSWindows}
  Sys = TIdSysWin32;
  {$ENDIF}
  {$IFDEF Linux}
  Sys = TIdSysLinux;
  {$ENDIF}

  // ALL Indy exceptions must descend from EIdException or descendants of it and not directly
  // from EIdExceptionBase. This is the class that differentiates Indy exceptions from non Indy
  // exceptions in a cross platform way
  {$IFDEF DotNet}
  EIdExceptionBase = class(System.Exception);
  {$ELSE}
  EIdExceptionBase = class(Exception);
  {$ENDIF}

implementation

end.
