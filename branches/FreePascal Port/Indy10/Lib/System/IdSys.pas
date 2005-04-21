unit IdSys;
{$I IdCompilerDefines.inc}

interface

uses
  {$IFDEF DotNet}
  IdSysNet;
  {$ELSE}
  SysUtils,  //SysUtils has to be here for non-Dot NET stuff
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

  // Exceptions
  //
  // ALL Indy exceptions must descend from EIdException or descendants of it and not directly
  // from EIdExceptionBase. This is the class that differentiates Indy exceptions from non Indy
  // exceptions in a cross platform way
  //
  // Do NOT use the class keyword, we do not want a new class, we just want an alias
  // so that it actually IS the base.
  //
  {$IFDEF DotNet}
  EIdExceptionBase = System.Exception;
  {$ELSE}
  EIdExceptionBase = Exception;
  Exception = SysUtils.Exception;
  EAbort = SysUtils.EAbort;
  {$ENDIF}

implementation

end.
