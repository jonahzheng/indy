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
