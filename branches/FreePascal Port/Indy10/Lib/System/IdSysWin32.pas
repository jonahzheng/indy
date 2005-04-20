unit IdSysWin32;

interface

uses
  Windows,
  IdSysVCL,
  SysUtils;

type
  EAbort = SysUtils.EAbort;
  Exception = SysUtils.Exception;
  TAnsiCharSet = set of AnsiChar;
  TSysCharSet = SysUtils.TSysCharSet;

  TIdSysWin32 = class(TIdSysVCL)
  public
    class function StrToInt64(const S: string): Int64; overload;
    class function StrToInt64(const S: string; const Default : Int64): Int64; overload; 

    class function TwoDigitYearCenturyWindow : Word; 
    class function DayOfWeek(const ADateTime: TDateTime): Word;
    class function DateTimeToStr(const ADateTime: TDateTime): string;  
    class function StrToDateTime(const S: String): TDateTime;

    class function Now : TDateTime;  
    class function FormatDateTime(const Format: string; ADateTime: TDateTime): string; 
    class function Format(const Format: string; const Args: array of const): string; 

    class function AnsiExtractQuotedStr(var Src: PChar; Quote: Char): string;  
    class function StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar; 
    class function StrPas(const Str: PChar): string; 
    class function StrNew(const Str: PChar): PChar;
    class procedure StrDispose(Str: PChar); 

    class function AnsiUpperCase(const S: AnsiString): AnsiString; overload; 
    class function AnsiUpperCase(const S: WideString): WideString; overload; deprecated;

    class function AnsiLowerCase(const S: AnsiString): AnsiString; overload;
    class function AnsiLowerCase(const S: WideString): WideString; overload; deprecated;

    class function ByteType(const S: string; Index: Integer): TMbcsByteType; 
    //done because for some reason, mbSingleByte can only be exposed directly from the SysUtils unit,
    //I tried doing it from here without luck
    class function IsSingleByteType(const S: string; Index: Integer): Boolean; 
    class function FileCreate(const FileName: string; Rights: Integer): Integer; overload;
    class function FileCreate(const FileName: string): Integer; overload; 
    class procedure FileClose(Handle: Integer); 
    class function FileDateToDateTime(FileDate: Integer): TDateTime; 
    class function AnsiCompareText(const S1, S2: AnsiString): Integer; overload;
    class function AnsiCompareText(const S1, S2: WideString): Integer; overload; deprecated;
    class function CompareStr(const S1, S2: string): Integer; 
    class function AnsiCompareStr(const S1, S2: AnsiString): Integer; overload; 
    class function AnsiCompareStr(const S1, S2: WideString): Integer; overload; deprecated;
    class function AddMSecToTime(const ADateTime : TDateTime; const AMSec : Integer):TDateTime; 
    class function CompareDate(const D1, D2 : TDateTime) : Integer; 
    class function SameText(const S1, S2 : String) : Boolean; 

    class function AnsiPos(const Substr, S: AnsiString): Integer; overload; 
    class function AnsiPos(const Substr, S: WideString): Integer; overload;  deprecated;

    class procedure FreeAndNil(var Obj);  
    class function LeadBytes: TAnsiCharSet; 
    class function IntToHex(Value: Integer; Digits: Integer): string; overload;
    class function IntToHex(Value: Int64; Digits: Integer): string; overload; 
    class function IntToStr(Value: Integer): string; overload; 
    class function IntToStr(Value: Int64): string; overload; 
    class function Win32Platform: Integer;
    class function Win32MajorVersion : Integer;
    class function Win32MinorVersion : Integer;
    class function Win32BuildNumber : Integer;
    class function IncludeTrailingPathDelimiter(const S: string): string;
    class function StrToInt(const S: string; Default: Integer): Integer; overload;
    class function StrToInt(const S: string): Integer; overload;
    class function LowerCase(const S: string): string;
    class function UpperCase(const S: string): string; overload;
    class procedure RaiseLastOSError;
    class function Trim(const S: string): string;
    class function TrimLeft(const S: string): string;
    class function TrimRight(const S: string): string;

    class function CompareMem(P1, P2: Pointer; Length: Integer): Boolean;
    class procedure Abort;
    class function FileExists(const FileName: string): Boolean;
    class function LastDelimiter(const Delimiters, S: string): Integer;
    class function StrToInt64Def(const S: string; const Default: Int64): Int64;
    class function StringReplace(const S, OldPattern, NewPattern: string): string; overload;
    class function StringReplace(const S : String; const OldPattern, NewPattern: array of string): string; overload;

    class function ReplaceOnlyFirst(const S, OldPattern, NewPattern: string): string;
    class procedure DecodeTime(const ADateTime: TDateTime; var Hour, Min, Sec, MSec: Word);
    class procedure DecodeDate(const ADateTime: TDateTime; var Year, Month, Day: Word);
    class function EncodeTime(Hour, Min, Sec, MSec: Word): TDateTime;
    class function EncodeDate(Year, Month, Day: Word): TDateTime;
    class function FileAge(const FileName: string): TDateTime;
    class function DirectoryExists(const Directory: string): Boolean; 
    class function DeleteFile(const FileName: string): Boolean; 
    class function ExtractFileName(const FileName: string): string; 
    class function ExtractFileExt(const FileName: string): string;

    class function FloatToIntStr(const AFloat: Extended): String;
  end;

implementation

{ SysUtils }

class procedure TIdSysWin32.Abort;
begin
  SysUtils.Abort;
end;

class function TIdSysWin32.AnsiCompareStr(const S1,
  S2: WideString): Integer;
begin
  Result := SysUtils.AnsiCompareStr(S1,S2);
end;

class function TIdSysWin32.AnsiCompareStr(const S1,
  S2: AnsiString): Integer;
begin
  Result := SysUtils.AnsiCompareStr(S1,S2);
end;

class function TIdSysWin32.AnsiCompareText(const S1,
  S2: WideString): Integer;
begin
  Result := SysUtils.AnsiCompareText(S1,S2);
end;

class function TIdSysWin32.AnsiCompareText(const S1,
  S2: AnsiString): Integer;
begin
  Result := SysUtils.AnsiCompareText(S1,S2);
end;

class function TIdSysWin32.AnsiLowerCase(const S: WideString): WideString;
begin
  Result := SysUtils.AnsiLowerCase(S);
end;

class function TIdSysWin32.AnsiLowerCase(const S: AnsiString): AnsiString;
begin
  Result := SysUtils.AnsiLowerCase(S);
end;

class function TIdSysWin32.AnsiPos(const Substr, S: WideString): Integer;
begin
  Result := SysUtils.AnsiPos(Substr,S);
end;

class function TIdSysWin32.AnsiPos(const Substr, S: AnsiString): Integer;
begin
  Result := SysUtils.AnsiPos(Substr,S);
end;

class function TIdSysWin32.AnsiUpperCase(const S: WideString): WideString;
begin
  Result := SysUtils.AnsiUpperCase(S);
end;

class function TIdSysWin32.AnsiUpperCase(const S: AnsiString): AnsiString;
begin
  Result := SysUtils.AnsiUpperCase(S);
end;

class function TIdSysWin32.CompareMem(P1, P2: Pointer;
  Length: Integer): Boolean;
begin
  Result := SysUtils.CompareMem(P1,P2,Length);
end;

class function TIdSysWin32.FileExists(const FileName: string): Boolean;
begin
  Result := SysUtils.FileExists(FileName);
end;

class function TIdSysWin32.Format(const Format: string;
  const Args: array of const): string;
begin
  Result := SysUtils.Format(Format,Args);
end;

class procedure TIdSysWin32.FreeAndNil(var Obj);
begin
  SysUtils.FreeAndNil(Obj);
end;

class function TIdSysWin32.IncludeTrailingPathDelimiter(
  const S: string): string;
begin
  Result := SysUtils.IncludeTrailingPathDelimiter(S);
end;

class function TIdSysWin32.IntToHex(Value: Int64; Digits: Integer): string;
begin
  Result := SysUtils.IntToHex(Value,Digits);
end;

class function TIdSysWin32.IntToHex(Value, Digits: Integer): string;
begin
  Result := SysUtils.IntToHex(Value,Digits);
end;

class function TIdSysWin32.IntToStr(Value: Int64): string;
begin
  Result := SysUtils.IntToStr(Value);
end;

class function TIdSysWin32.IntToStr(Value: Integer): string;
begin
  Result := SysUtils.IntToStr(Value);
end;

class function TIdSysWin32.LastDelimiter(const Delimiters,
  S: string): Integer;
begin
  Result := SysUtils.LastDelimiter(Delimiters, S);
end;

class function TIdSysWin32.LeadBytes: TAnsiCharSet;
begin
  Result := SysUtils.LeadBytes;
end;

class procedure TIdSysWin32.RaiseLastOSError;
begin
  SysUtils.RaiseLastOSError;
end;

class function TIdSysWin32.StringReplace(const S: String; const OldPattern,
  NewPattern: array of string): string;
var i : Integer;
begin
  for i := Low(OldPattern) to High(OldPattern) do
  begin
    Result := SysUtils.StringReplace(s,OldPattern[i],NewPattern[i],[rfReplaceAll]);
  end;
end;

class function TIdSysWin32.StringReplace(const S, OldPattern,
  NewPattern: string): string;
begin
   Result := SysUtils.StringReplace(s,OldPattern,NewPattern,[rfReplaceAll]);
end;

class function TIdSysWin32.ReplaceOnlyFirst(const S, OldPattern,
  NewPattern: string): string;
begin
   Result := SysUtils.StringReplace(s,OldPattern,NewPattern,[]);
end;

class function TIdSysWin32.StrToInt(const S: string): Integer;
begin
  Result := SysUtils.StrToInt(S);
end;

class function TIdSysWin32.StrToInt64Def(const S: string;
  const Default: Int64): Int64;
begin
  Result := SysUtils.StrToIntDef(S,Default);
end;

class function TIdSysWin32.StrToInt(const S: string;
  Default: Integer): Integer;
begin
  Result := SysUtils.StrToIntDef(S,Default);
end;

class function TIdSysWin32.Trim(const S: string): string;
begin
  Result := SysUtils.Trim(s);
end;

class function TIdSysWin32.UpperCase(const S: string): string;
begin
  Result := SysUtils.UpperCase(S);
end;



class function TIdSysWin32.DateTimeToStr(
  const ADateTime: TDateTime): string;
begin
  Result := SysUtils.DateTimeToStr(ADateTime);
end;

class function TIdSysWin32.StrToDateTime(const S: String): TDateTime;
begin
  Result := SysUtils.StrToDateTime(S);
end;

class function TIdSysWin32.Now: TDateTime;
begin
  Result := SysUtils.Now;
end;

class function TIdSysWin32.CompareDate(const D1, D2: TDateTime): Integer;
var LTM1, LTM2 : TTimeStamp;
begin
  LTM1 := DateTimeToTimeStamp(D1);
  LTM2 := DateTimeToTimeStamp(D2);
  if (LTM1.Date = LTM2.Date) then
  begin
    if (LTM1.Time < LTM2.Time) then
    begin
       Result := -1;
    end
    else
    begin
      if (LTM1.Time > LTM2.Time) then
      begin
        Result := 1;
      end
      else
      begin
        Result := 0;
      end;
    end;
  end
  else
  begin
    if LTM1.Date > LTM2.Date then
    begin
      Result := 1;
    end
    else
    begin
      Result := -1;
    end;
  end;
end;

class function TIdSysWin32.FormatDateTime(const Format: string;
  ADateTime: TDateTime): string;
begin
   Result := SysUtils.FormatDateTime(Format,ADateTime);
end;

class function TIdSysWin32.DayOfWeek(const ADateTime: TDateTime): Word;
begin
  Result := SysUtils.DayOfWeek(ADateTime);
end;

class procedure TIdSysWin32.DecodeDate(const ADateTime: TDateTime;
  var Year, Month, Day: Word);
begin
  SysUtils.DecodeDate(ADateTime,Year,Month,Day);
end;

class function TIdSysWin32.EncodeTime(Hour, Min, Sec,
  MSec: Word): TDateTime;
begin
  Result := SysUtils.EncodeTime(Hour,Min,Sec,MSec);
end;

class procedure TIdSysWin32.DecodeTime(const ADateTime: TDateTime;
  var Hour, Min, Sec, MSec: Word);
begin
  SysUtils.DecodeTime(ADateTime,Hour,Min,Sec,MSec);
end;

class function TIdSysWin32.EncodeDate(Year, Month, Day: Word): TDateTime;
begin
  Result := SysUtils.EncodeDate(Year,Month,Day);
end;

class function TIdSysWin32.TrimLeft(const S: string): string;
begin
  Result := SysUtils.TrimLeft(S);
end;

class function TIdSysWin32.TrimRight(const S: string): string;
begin
  Result := SysUtils.TrimRight(S);
end;

class function TIdSysWin32.ExtractFileName(const FileName: string): string;
begin
   Result := SysUtils.ExtractFileName(FileName);
end;

class function TIdSysWin32.FileAge(const FileName: string): TDateTime;
begin
  Result := SysUtils.FileDateToDateTime( SysUtils.FileAge(FileName));
end;

class function TIdSysWin32.DirectoryExists(
  const Directory: string): Boolean;
begin
  Result := SysUtils.DirectoryExists(Directory);
end;

class function TIdSysWin32.DeleteFile(const FileName: string): Boolean;
begin
  Result := SysUtils.DeleteFile(FileName);
end;

class function TIdSysWin32.ExtractFileExt(const FileName: string): string;
begin
  Result := SysUtils.ExtractFileExt(FileName);
end;

class function TIdSysWin32.LowerCase(const S: string): string;
begin
  Result := SysUtils.LowerCase(S);
end;

class function TIdSysWin32.FloatToIntStr(const AFloat: Extended): String;
begin
  Result := SysUtils.FloatToStr(AFloat);
end;

class function TIdSysWin32.TwoDigitYearCenturyWindow: Word;
begin
  Result := SysUtils.TwoDigitYearCenturyWindow;
end;

class function TIdSysWin32.CompareStr(const S1, S2: string): Integer;
begin
  Result := SysUtils.CompareStr(S1,S2);
end;

class function TIdSysWin32.StrToInt64(const S: string;
  const Default: Int64): Int64;
begin
  Result := SysUtils.StrToInt64Def(S,Default);
end;

class function TIdSysWin32.StrToInt64(const S: string): Int64;
begin
  Result := SysUtils.StrToInt64(S);
end;

class function TIdSysWin32.SameText(const S1, S2: String): Boolean;
begin
  Result := SysUtils.SameText(S1,S2);
end;

class function TIdSysWin32.AnsiExtractQuotedStr(var Src: PChar;
  Quote: Char): string;
begin
  Result := SysUtils.AnsiExtractQuotedStr(Src,Quote);
end;

class function TIdSysWin32.StrLCopy(Dest: PChar; const Source: PChar;
  MaxLen: Cardinal): PChar;
begin
  Result := SysUtils.StrLCopy(Dest,Source,MaxLen);
end;

class function TIdSysWin32.StrPas(const Str: PChar): string;
begin
  Result := SysUtils.StrPas(Str);
end;

class function TIdSysWin32.StrNew(const Str: PChar): PChar;
begin
  Result := SysUtils.StrNew(Str);
end;

class procedure TIdSysWin32.StrDispose(Str: PChar);
begin
  SysUtils.StrDispose(Str);
end;

class function TIdSysWin32.AddMSecToTime(const ADateTime: TDateTime;
  const AMSec: Integer): TDateTime;
var
  LTM : TTimeStamp;
begin
  LTM := DateTimeToTimeStamp(ADateTime);
  LTM.Time := LTM.Time + AMSec;
  Result :=  TimeStampToDateTime(LTM);
end;

class function TIdSysWin32.ByteType(const S: string;
  Index: Integer): TMbcsByteType;
begin
  Result := SysUtils.ByteType(S,Index)
end;

class function TIdSysWin32.FileCreate(const FileName: string;
  Rights: Integer): Integer;
begin
   Result := SysUtils.FileCreate(FileName,Rights);
end;

class procedure TIdSysWin32.FileClose(Handle: Integer);
begin
  SysUtils.FileClose(Handle);
end;

class function TIdSysWin32.FileCreate(const FileName: string): Integer;
begin
  Result := SysUtils.FileCreate(FileName);
end;

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

class function TIdSysWin32.IsSingleByteType(const S: string;
  Index: Integer): Boolean; 
begin
  Result  := ByteType(S,Index)=mbSingleByte;
end;

class function TIdSysWin32.FileDateToDateTime(
  FileDate: Integer): TDateTime;
begin
  Result := SysUtils.FileDateToDateTime(FileDate);
end;

end.
