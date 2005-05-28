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
  TIdBaseObject = &Object;
  TIdStrings = TIdStringsFCL;
  TIdStringList = TIdStringListFCL;
  TIdStream2 = TIdNetStream;
  TIdMemoryStream = TIdNetMemoryStream;
  TIdStringStream = TIdNetStringStream;
  TIdFileStream = TIdNetFileStream;
  TIdSeekOrigin = TIdNetSeekOrigin;
  TIdList = TIdNetList;
  TIdCollection = TIdNetCollection;
  TIdCollectionItem = TIdNetCollectionItem;
  TIdNativeThread = TIdNetThread;
  TIdNotifyEvent = TIdNetNotifyEvent;
{$ELSE}
  {$IFDEF DELPHI5}
  TSeekOrigin = Word;
  {$ENDIF}

  TIdBaseObject = TObject;
  TIdStrings = Classes.TStrings;
  TIdStringList = Classes.TStringList;
  TIdStream2 = TStream;
  TIdMemoryStream = TMemoryStream;
  TIdStringStream = TStringStream;
  TIdFileStream = TFileStream;
  TIdSeekOrigin = TSeekOrigin;
  TIdList = TList;
  TIdCollection = TCollection;
  TIdCollectionItem = TCollectionItem;
  TIdNativeThread = TThread;
  TIdNotifyEvent = TNotifyEvent; 
{$ENDIF}

const
{$IFDEF DOTNET}
  IdFromBeginning   = TIdSeekOrigin.soBeginning;
  IdFromCurrent     = TIdSeekOrigin.soCurrent;
  IdFromEnd         = TIdSeekOrigin.soEnd;

  fmCreate          = $FFFF;
  fmOpenRead        = $0000;
  fmOpenWrite       = $0001;
  fmOpenReadWrite   = $0002;

  fmShareExclusive  = $0010;
  fmShareDenyWrite  = $0020;
  fmShareDenyNone   = $0040;
{$ELSE}

  {$IFDEF DELPHI5}
  soBeginning = soFromBeginning;
  soCurrent = soFromCurrent;
  soEnd = soFromEnd;
  {$ENDIF}

  IdFromBeginning   = TIdSeekOrigin(soBeginning);
  IdFromCurrent     = TIdSeekOrigin(soCurrent);
  IdFromEnd         = TIdSeekOrigin(soEnd);

  fmCreate          = $FFFF;
{$IFDEF LINUX}
  fmOpenRead        = O_RDONLY;
  fmOpenWrite       = O_WRONLY;
  fmOpenReadWrite   = O_RDWR;

  fmShareExclusive  = $0010;
  fmShareDenyWrite  = $0020;
  fmShareDenyNone   = $0030;
{$ENDIF}
{$IFDEF MSWINDOWS}
  fmOpenRead        = $0000;
  fmOpenWrite       = $0001;
  fmOpenReadWrite   = $0002;

  fmShareExclusive  = $0010;
  fmShareDenyWrite  = $0020;
  fmShareDenyNone   = $0040;
{$ENDIF}
{$ENDIF}
{$IFDEF DotNetDistro}
  tpIdLowest = tpIdNetLowest;
  tpIdBelowNormal = tpIdNetBelowNormal;
  tpIdNormal = tpIdNetNormal;
  tpIdAboveNormal = tpIdNetAboveNormal;
  tpIdHighest = tpIdNetHighest;
{$ELSE}
  tpIdLowest = tpLowest;
  tpIdBelowNormal = tpLower;
  tpIdNormal = tpNormal;
  tpIdAboveNormal = tpHigher;
  tpIdHighest = tpHighest;
{$ENDIF}

procedure SplitColumnsNoTrim(const AData: string; AStrings: TIdStrings; const ADelim: string = ' ');    {Do not Localize}
procedure SplitColumns(const AData: string; AStrings: TIdStrings; const ADelim: string = ' ');    {Do not Localize}

implementation

uses
  IdGlobal, IdSys;

procedure SplitColumnsNoTrim(const AData: string; AStrings: TIdStrings; const ADelim: string);
var
  i: Integer;
  LDelim: Integer; //delim len
  LLeft: string;
  LLastPos: Integer;
begin
  Assert(Assigned(AStrings));
  AStrings.Clear;
  LDelim := Length(ADelim);
  LLastPos := 1;

  i := Pos(ADelim, AData);
  while I > 0 do begin
    LLeft := Copy(AData, LLastPos, I - LLastPos); //'abc d' len:=i(=4)-1    {Do not Localize}
    if LLeft <> '' then begin    {Do not Localize}
      {$IfDEF DotNet}
      AStrings.AddObject(LLeft, TObject(LLastPos));
      {$else}
      AStrings.AddObject(LLeft, Pointer(LLastPos));
      {$endif}
    end;
    LLastPos := I + LDelim; //first char after Delim
    i := PosIdx(ADelim, AData, LLastPos);
  end;
  if LLastPos <= Length(AData) then begin
    {$IfDEF DotNet}
    AStrings.AddObject(Copy(AData, LLastPos, MaxInt), TObject(LLastPos));
    {$else}
    AStrings.AddObject(Copy(AData, LLastPos, MaxInt), Pointer(LLastPos));
    {$endif}
  end;
end;

procedure SplitColumns(const AData: string; AStrings: TIdStrings; const ADelim: string);
var
  i: Integer;
  LData: string;
  LDelim: Integer; //delim len
  LLeft: string;
  LLastPos: Integer;
  LLeadingSpaceCnt: Integer;
Begin
  Assert(Assigned(AStrings));
  AStrings.Clear;
  LDelim := Length(ADelim);
  LLastPos := 1;
  LData := Sys.Trim(AData);

  LLeadingSpaceCnt := 0;
  if LData <> '' then begin //if Not WhiteStr
    while AData[LLeadingSpaceCnt + 1] <= #32 do
      Inc(LLeadingSpaceCnt);
  end
  else begin
    Exit;
  end;

  i := Pos(ADelim, LData);
  while I > 0 do begin
    LLeft:= Copy(LData, LLastPos, I - LLastPos); //'abc d' len:=i(=4)-1    {Do not Localize}
    if LLeft > '' then begin    {Do not Localize}
      AStrings.AddObject(Sys.Trim(LLeft), TObject(LLastPos + LLeadingSpaceCnt));
    end;
    LLastPos := I + LDelim; //first char after Delim
    i := PosIdx (ADelim, LData, LLastPos);
  end;//while found
  if LLastPos <= Length(LData) then begin
    AStrings.AddObject(Sys.Trim(Copy(LData, LLastPos, MaxInt)), TObject(LLastPos + LLeadingSpaceCnt));
  end;
end;

end.
