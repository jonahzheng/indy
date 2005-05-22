{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log: }

unit IdSys;
{$I IdCompilerDefines.inc}

interface

uses
  {$IFDEF DotNetDistro}
  IdSysNet;
  {$ELSE}
    SysUtils,  //SysUtils has to be here for non-Dot NET stuff

    {$IFDEF MSWindows}
    IdSysWin32;
    {$ELSE}
      {$IFDEF Linux}
      IdSysLinux;
      {$ELSE}
      IdSysVCL;
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}

type
  {$IFDEF DotNetDistro}
  Sys = class(TIdSysNet);
  {$ELSE}
    {$IFDEF MSWindows}
  Sys = TIdSysWin32;
    {$ELSE}
      {$IFDEF Linux}
  Sys = TIdSysLinux;
      {$ELSE}
      Sys = TIdSysVCL;
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}

  TIdDateTime = TIdDateTimeBase;

  // Exceptions
  //
  // ALL Indy exceptions must descend from EIdException or descendants of it and not directly
  // from EIdExceptionBase. This is the class that differentiates Indy exceptions from non Indy
  // exceptions in a cross platform way
  //
  // Do NOT use the class keyword, we do not want a new class, we just want an alias
  // so that it actually IS the base.
  //
  {$IFDEF DotNetDistro}
  EIdExceptionBase = System.Exception;
  EAbort = IdSysNET.EAbort;
  {$ELSE}
  EIdExceptionBase = Exception;
  {$IFDEF DOTNET}
    Exception = System.Exception;
  {$ELSE}
    Exception = SysUtils.Exception;
  {$ENDIF}
  EAbort = SysUtils.EAbort;
  {$ENDIF}

implementation

end.
