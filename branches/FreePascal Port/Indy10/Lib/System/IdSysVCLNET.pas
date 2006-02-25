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

unit IdSysVCLNET;

interface
uses
  IdSysVCL;

type
  TIdSysVCLNET = class(TIdSysVCL)
  public
    class function OffsetFromUTC: TIdDateTimeBase;// override;

  end;

implementation

{ TIdSysVCLNET }

class function TIdSysVCLNET.OffsetFromUTC: TIdDateTimeBase;
begin
  Result := System.Timezone.CurrentTimezone.GetUTCOffset(DateTime.FromOADate(Now)).TotalDays;
end;

end.
