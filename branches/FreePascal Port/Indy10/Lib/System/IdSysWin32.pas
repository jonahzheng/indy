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
