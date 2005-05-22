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

unit IdSysWin32;

interface

uses
  Windows,
  IdSysNativeVCL,
  SysUtils;

type

  TIdDateTimeBase = TDateTime;

  TIdSysWin32 = class(TIdSysNativeVCL)
  public
    class function Win32Platform: Integer;
    class function Win32MajorVersion : Integer;
    class function Win32MinorVersion : Integer;
    class function Win32BuildNumber : Integer;
  end;

implementation

class function TIdSysWin32.Win32MinorVersion: Integer;
begin
  Result := SysUtils.Win32MinorVersion;
end;

class function TIdSysWin32.Win32BuildNumber: Integer;
begin
//  for this, you need to strip off some junk to do comparisons
   Result := SysUtils.Win32BuildNumber and $FFFF;
end;

class function TIdSysWin32.Win32Platform: Integer;
begin
  Result := SysUtils.Win32Platform;
end;

class function TIdSysWin32.Win32MajorVersion: Integer;
begin
  Result := SysUtils.Win32MajorVersion;
end;

end.
