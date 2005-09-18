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


    Rev 1.0    11/29/2004 2:44:16 AM  JPMugaas
  New FTP list parsers for some legacy FTP servers.
}
unit IdFTPListParseChameleonNewt;

interface
{$i idcompilerdefines.inc}

uses IdFTPList, IdFTPListParseBase,IdFTPListTypes, IdObjs;

type
  TIdChameleonNewtFTPListItem = class(TIdDOSBaseFTPListItem);
  TIdFTPLPChameleonNewt = class(TIdFTPLPBaseDOS)
  protected
    class function MakeNewItem(AOwner : TIdFTPListItems)  : TIdFTPListItem; override;
    class function ParseLine(const AItem : TIdFTPListItem; const APath : String=''): Boolean; override;
  public
    class function GetIdent : String; override;
    class function CheckListing(AListing : TIdStrings; const ASysDescript : String =''; const ADetails : Boolean = True): boolean; override;
  end;

implementation
uses IdFTPCommon, IdGlobal, IdGlobalProtocols, IdSys;

{ TIdFTPLPChameleonNewt }

class function TIdFTPLPChameleonNewt.CheckListing(AListing: TIdStrings;
  const ASysDescript: String; const ADetails: Boolean): boolean;
{Look for something like this:

.               <DIR>      Nov 16 1994 17:16   
..              <DIR>      Nov 16 1994 17:16   
INSTALL         <DIR>      Nov 16 1994 17:17
CMT             <DIR>      Nov 21 1994 10:17
DESIGN1.DOC     11264      May 11 1995 14:20   A
README.TXT       1045      May 10 1995 11:01
WPKIT1.EXE     960338      Jun 21 1995 17:01   R
CMT.CSV             0      Jul 06 1995 14:56   RHA
}
var i : Integer;
  LBuf, LBuf2 : String;
  LInt : Integer;
begin
  Result := False;
  for i := 0 to AListing.Count -1 do
  begin
    LBuf := AListing[i];
    //filename and extension - we assume an 8.3 filename type because
    //Windows 3.1 only supports that.
    Fetch(LBuf);
    LBuf := Sys.TrimLeft(LBuf);
    //<DIR> or file size
    LBuf2 := Fetch(LBuf);
    Result := (LBuf2='<DIR>') or IsNumeric(LBuf2);   {Do not localize}
    if not result then
    begin
      Exit;
    end;
    LBuf := Sys.TrimLeft(LBuf);
    //month
    LBuf2 := Fetch(LBuf);
    Result := StrToMonth(LBuf2)>0;
    if not result then
    begin
      Exit;
    end;
    //day
    LBuf := Sys.TrimLeft(LBuf);
    LInt := Sys.StrToInt64(Fetch(LBuf),0);
    Result := (LInt>0) and (LInt<32);
    if not result then
    begin
      Exit;
    end;
    //year
    LBuf := Sys.TrimLeft(LBuf);
    Result := IsNumeric(Fetch(LBuf));
    if not result then
    begin
      Exit;
    end;
    //time
    LBuf := Sys.TrimLeft(LBuf);
    LBuf2 := Fetch(LBuf);
    Result := IsHHMMSS(LBuf2,':');
    if not result then
    begin
      Exit;
    end;
    //attributes
    repeat

      LBuf := Sys.TrimLeft(LBuf);
      if LBuf='' then
      begin
        break;
      end;
      LBuf2 := Fetch(LBuf);

      result := IsValidAttr(LBuf2);
      if not result then
      begin
        Exit;
      end;
    until False;
  end;
end;

class function TIdFTPLPChameleonNewt.GetIdent: String;
begin
  Result := 'NetManage Chameleon/Newt';  {Do not localize}
end;

class function TIdFTPLPChameleonNewt.MakeNewItem(
  AOwner: TIdFTPListItems): TIdFTPListItem;
begin
  Result := TIdChameleonNewtFTPListItem.Create(AOwner);
end;

class function TIdFTPLPChameleonNewt.ParseLine(const AItem: TIdFTPListItem;
  const APath: String): Boolean;
var LI : TIdChameleonNewtFTPListItem;
  LBuf, LBuf2 : String;
  LDay, LMonth, LYear : Integer;
begin
  LI := AItem as TIdChameleonNewtFTPListItem;
  LBuf := AItem.Data;
  //filename and extension - we assume an 8.3 filename type because
  //Windows 3.1 only supports that.
  LI.FileName :=  Fetch(LBuf);
  LBuf := Sys.TrimLeft(LBuf);
  //<DIR> or file size
  LBuf2 := Fetch(LBuf);
  if LBuf2 = '<DIR>' then   {Do not localize}
  begin
    LI.ItemType := ditDirectory;
    LI.SizeAvail := False;
  end
  else
  begin
    LI.ItemType := ditFile;
    Result :=  IsNumeric(LBuf2);
    if not result then
    begin
      Exit;
    end;
    LI.Size := Sys.StrToInt64(LBuf2,0);
  end;

  //month
    LBuf := Sys.TrimLeft(LBuf);
    LBuf2 := Fetch(LBuf);
    LMonth := StrToMonth(LBuf2);
    Result := LMonth>0;
    if not result then
    begin
      Exit;
    end;
    //day
    LBuf := Sys.TrimLeft(LBuf);
    LBuf2 := Fetch(LBuf);
    LDay := Sys.StrToInt64(LBuf2,0);
    Result := (LDay>0) and (LDay<32);
    if not result then
    begin
      Exit;
    end;
    //year
    LBuf := Sys.TrimLeft(LBuf);
    LBuf2 := Fetch(LBuf);
    Result := IsNumeric(LBuf2);
    if not result then
    begin
      Exit;
    end;
    LYear := Y2Year( Sys.StrToInt(LBuf2,0));
    LI.ModifiedDate := Sys.EncodeDate(LYear,LMonth,LDay);
    //time
    LBuf := Sys.TrimLeft(LBuf);
    LBuf2 := Fetch(LBuf);
    Result := IsHHMMSS(LBuf2,':');
    if not result then
    begin
      Exit;
    end;
    LI.ModifiedDate := LI.ModifiedDate + TimeHHMMSS(LBuf2);
    //attributes
    repeat
      if LBuf='' then
      begin
        break;
      end;
      LBuf := Sys.TrimLeft(LBuf);
      LBuf2 := Fetch(LBuf);
      result := LI.FAttributes.AddAttribute(LBuf2);
      if not result then
      begin
        Exit;
      end;
    until False;
end;

initialization
  RegisterFTPListParser(TIdFTPLPChameleonNewt);
finalization
  UnRegisterFTPListParser(TIdFTPLPChameleonNewt);
end.
