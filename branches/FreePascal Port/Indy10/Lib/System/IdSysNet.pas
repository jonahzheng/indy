unit IdSysNet;

interface

uses
  IdSysBase;

type
  //I know EAbort violates our rule about basing exceptions on EIdException.
  //I'm doing this for one reason, to be compatible with SysUtils where a reference
  //is made to the EAbort exception.
  EAbort = class(Exception);
  TSysCharSet = set of AnsiChar;
  TIdSysNet = class(TIdSysBase)
  public
    class function AddMSecToTime(const ADateTime : TDateTime; const AMSec : Integer):TDateTime; static;
    class function StrToInt64(const S: string): Int64; overload; static;
    class function StrToInt64(const S: string; const Default : Int64): Int64; overload; static;
    class function TwoDigitYearCenturyWindow : Word; static;
    class function FloatToIntStr(const AFloat : Extended) : String; static;
    class function AlignLeftCol(const AStr : String; const AWidth : Integer=0) : String; static;
    class procedure DecodeTime(const ADateTime: TDateTime; var Hour, Min, Sec, MSec: Word); static;
    class procedure DecodeDate(const ADateTime: TDateTime; var Year, Month, Day: Word); static;
    class function EncodeTime(Hour, Min, Sec, MSec: Word): TDateTime; static;
    class function EncodeDate(Year, Month, Day: Word): TDateTime; static;
    class function DateTimeToStr(const ADateTime: TDateTime): string; static;
    class function StrToDateTime(const S : String): TDateTime; static;
    class function Now : TDateTime; static;
    class function DayOfWeek(const ADateTime: TDateTime): Word; static;
    class function FormatDateTime(const Format: string; ADateTime: TDateTime): string; static;
    class function Format(const Format: string; const Args: array of const): string; static;
    class function SameText(const S1, S2 : String) : Boolean; static;
    class function CompareStr(const S1, S2: string): Integer; static;
    class function CompareDate(const D1, D2 : TDateTime) : Integer; static;
    class procedure FreeAndNil(var Obj);  static;
        class function IntToStr(Value: Integer): string; overload; static;
    class function IntToHex(Value: Integer; Digits: Integer): string; overload; static;
    class function IntToHex(Value: Int64; Digits: Integer): string; overload; static;

    class function IntToStr(Value: Int64): string; overload; static;
    class function UpperCase(const S: string): string;  static;
    class function LowerCase(const S: string): string;  static;
    class function IncludeTrailingPathDelimiter(const S: string): string; static;
    class function StrToInt(const S: string): Integer; overload; static;
    class function StrToInt(const S: string; Default: Integer): Integer; overload; static;
    class function Trim(const S: string): string; static;
    class function TrimLeft(const S: string): string; static;
    class function TrimRight(const S: string): string; static;
    class procedure Abort; static;
    class function FileAge(const FileName: string): TDateTime; static;
    class function FileExists(const FileName: string): Boolean; static;
    class function DirectoryExists(const Directory: string): Boolean; static;
    class function DeleteFile(const FileName: string): Boolean; static;
    class function ExtractFileName(const FileName: string): string; static;
    class function ExtractFileExt(const FileName: string): string; static;
    class function LastDelimiter(const Delimiters, S: string): Integer; static;
    class function StrToInt64Def(const S: string; const Default: Int64): Int64;  static;
    class function StringReplace(const S, OldPattern, NewPattern: string): string; overload; static;
    class function StringReplace(const S : String; const OldPattern, NewPattern: array of string): string; overload; static;
    class function ReplaceOnlyFirst(const S, OldPattern, NewPattern: string): string;  static;
  end;

const PATH_DELIN = '\';

implementation
uses
  System.IO,
  System.Text;

{ SysUtils }

class procedure TIdSysNet.Abort;
begin
  raise EAbort.Create;
end;

class function TIdSysNet.CompareStr(const S1, S2: string): Integer;
begin
  Result := System.&String.Compare(S1,S2,False);
end;

class function TIdSysNet.DateTimeToStr(const ADateTime: TDateTime): string;
begin
  Result := ADateTime.ToString;
end;

class function TIdSysNet.FileExists(const FileName: string): Boolean;
begin
  Result := System.IO.File.Exists(FileName);
end;

class function TIdSysNet.Format(const Format: string;  const Args: array of const): string;
begin

end;

class procedure TIdSysNet.FreeAndNil(var Obj);
begin
  TObject(Obj).Free;
  Obj := nil;
end;

class function TIdSysNet.IncludeTrailingPathDelimiter( const S: string): string;
begin
  Result := S;
  if Copy(S,Length(S),1)<>PATH_DELIN then
  begin
    Result := S + PATH_DELIN;
  end;
end;

class function TIdSysNet.IntToHex(Value: Int64; Digits: Integer): string;
begin
  Result := System.&String.Format('{0:x' + Digits.ToString + '}', TObject(Value) );
  //Borland's standard string is one based, not zero based
  Result := Copy(Result,Length(Result)-Digits+1,Digits);
end;

class function TIdSysNet.IntToHex(Value, Digits: Integer): string;
begin
  Result := System.&String.Format('{0:x' + Digits.ToString + '}', TObject(Value));
  //Borland's standard string is one based, not zero based
  Result := Copy(Result,Length(Result)-Digits+1,Digits);
end;

class function TIdSysNet.IntToStr(Value: Int64): string;
begin
  Result := System.Convert.ToString(Value);
end;

class function TIdSysNet.IntToStr(Value: Integer): string;
begin
 Result := System.Convert.ToString(Value);
end;

class function TIdSysNet.LastDelimiter(const Delimiters,
  S: string): Integer;
begin
  Result := s.LastIndexOfAny(Delimiters.ToCharArray);
end;

class function TIdSysNet.Now: TDateTime;
begin
  Result := System.DateTime.Now;
end;

class function TIdSysNet.StringReplace(const S, OldPattern,
  NewPattern: string): string;
var LS : StringBuilder;
begin
  LS := StringBuilder.Create(S);
  LS.Replace(OldPattern,NewPattern);
  Result := LS.ToString;
end;

class function TIdSysNet.ReplaceOnlyFirst(const S, OldPattern,
  NewPattern: string): string;
var LS : StringBuilder;
  i : Integer;
  i2 : Integer;
begin
  i := s.IndexOf(OldPattern);
  if i < 0 then
  begin
    Result := s;
    Exit;
  end;
  i2 := OldPattern.Length;
  LS := StringBUilder.Create;
  LS.Append(s,0,i);
  LS.Append( NewPattern);
  LS.Append(s,i+i2,S.Length-(i2+i));
  Result := LS.ToString;
end;

class function TIdSysNet.StringReplace(const S: String; const OldPattern,
  NewPattern: array of string): string;
var LS : StringBuilder;
  i : Integer;
begin
  LS := StringBuilder.Create(S);
  for i := Low(OldPattern) to High(OldPattern) do
  begin
    LS.Replace(OldPattern[i],NewPattern[i]);
  end;
  Result := LS.ToString;
end;

class function TIdSysNet.StrToInt64Def(const S: string;
  const Default: Int64): Int64;
var LErr : Integer;
begin
  Val(S,Result,LErr);
  if LErr<>0 then
  begin
    Result := Default;
  end;
end;

class function TIdSysNet.StrToInt(const S: string): Integer;
begin
  Result := StrToInt(S,0);
end;

class function TIdSysNet.StrToInt(const S: string;
  Default: Integer): Integer;
var LErr : Integer;
begin
  Val(S,Result,LErr);
  if LErr<>0 then
  begin
    Result := Default;
  end;
end;

class function TIdSysNet.Trim(const S: string): string;
begin
  Result := s.Trim;
end;

class function TIdSysNet.UpperCase(const S: string): string;
begin
  Result := System.String(S).ToUpper;
end;

class function TIdSysNet.LowerCase(const S: string): string;
begin
  Result := System.String(S).ToLower;
end;

class procedure TIdSysNet.DecodeDate(const ADateTime: TDateTime; var Year,
  Month, Day: Word);
begin
  TDateTime.DecodeDate(ADateTime,Year,Month,Day);
end;

class procedure TIdSysNet.DecodeTime(const ADateTime: TDateTime; var Hour,
  Min, Sec, MSec: Word);
begin
  TDateTime.DecodeTime(ADateTime,Hour,Min,Sec,MSec);
end;

class function TIdSysNet.TrimLeft(const S: string): string;
var LS : StringBuilder;
  i : Integer;
  LDelTo : Integer;
begin
  LDelTo := 0;
  LS := StringBuilder.Create(S);
  for i := 0 to LS.Length-1 do
  begin
    if LS.Chars[i]<=' ' then
    begin
      Inc(LDelTo);
    end
    else
    begin
      Break;
    end;
  end;
  if LDelTo>0 then
  begin
    LS.Remove(0,LDelTo);
  end;
  Result := LS.ToString;
end;

class function TIdSysNet.TrimRight(const S: string): string;
var LS : StringBuilder;
  i : Integer;
  LDelPos : Integer;
begin

  LS := StringBuilder.Create(S);
  LDelPos := LS.Length;
  for i := LS.Length-1 downto 0 do
  begin
    if LS.Chars[i]<=' ' then
    begin
      Dec(LDelPos);
    end
    else
    begin
      Break;
    end;
  end;
  if LDelPos < LS.Length then
  begin
     LS.Remove(LDelPos,LS.Length-LDelPos);
  end;
  Result := LS.ToString;
end;

class function TIdSysNet.DirectoryExists(const Directory: string): Boolean;
begin
  Result := System.IO.Directory.Exists(Directory);
end;

class function TIdSysNet.ExtractFileExt(const FileName: string): string;
begin
  Result := System.IO.Path.GetExtension(FileName);
end;

class function TIdSysNet.EncodeTime(Hour, Min, Sec, MSec: Word): TDateTime;
begin
  Result := TDateTime.EncodeTime(Hour,Min,Sec,MSec);
end;

class function TIdSysNet.EncodeDate(Year, Month, Day: Word): TDateTime;
begin
 Result := TDateTime.EncodeDate(Year,Month,Day);
end;

class function TIdSysNet.AlignLeftCol(const AStr: String;
  const AWidth: Integer): String;
begin
  Result := Copy(Result,Length(AStr)-AWidth+1,AWidth);
end;

class function TIdSysNet.FloatToIntStr(const AFloat: Extended): String;
begin
  Result := Int( AFloat).ToString;
end;

class function TIdSysNet.TwoDigitYearCenturyWindow: Word;
begin
//in SysUtils, this value is adjustable but I haven't figured out how to do that
//here.  Borland's is 50 but for our purposes, 1970 should work since it is the Unix epech
//and FTP was started around 1973 anyway.   Besides, if I mess up, chances are
//that I will not be around to fix it :-).
  Result := 70;
end;

class function TIdSysNet.ExtractFileName(const FileName: string): string;
begin
  Result := System.IO.Path.GetFileName(FileName);
end;

class function TIdSysNet.DeleteFile(const FileName: string): Boolean;
begin
  Result := False;
  if System.IO.&File.Exists(FileName) then
  begin
    System.IO.&File.Delete(FileName);
    Result := not System.IO.&File.Exists(FileName);
  end;
end;

class function TIdSysNet.FileAge(const FileName: string): TDateTime;
begin
  if System.IO.&File.Exists(FileName) then
  begin
    Result := System.IO.&File.GetLastWriteTime(FileName);
  end
  else
  begin
    Result := 0;
  end;
end;



class function TIdSysNet.CompareDate(const D1, D2: TDateTime): Integer;
begin
  Result := D1.CompareTo(D2);
end;

class function TIdSysNet.StrToDateTime(const S: String): TDateTime;
begin

  Result := TDateTime.Parse(S)
end;

class function TIdSysNet.StrToInt64(const S: string): Int64;
var LErr : Integer;
begin
  Val(S,Result,LErr);
  if LErr <> 0 then
  begin
    Result := 0;
  end;
end;

class function TIdSysNet.StrToInt64(const S: string;
  const Default: Int64): Int64;
var LErr : Integer;
begin
  Val(S,Result,LErr);
  if LErr <> 0 then
  begin
    Result := Default;
  end;

end;

class function TIdSysNet.SameText(const S1, S2: String): Boolean;
begin
  Result := System.&String.Compare(S1,S2,True)=0;
end;

class function TIdSysNet.FormatDateTime(const Format: string;
  ADateTime: TDateTime): string;
begin

end;

class function TIdSysNet.DayOfWeek(const ADateTime: TDateTime): Word;
begin
  Result := ADateTime.DayOfWeek;
end;

class function TIdSysNet.AddMSecToTime(const ADateTime: TDateTime;
  const AMSec: Integer): TDateTime;
var LD : DateTime;
begin
  LD := ADateTime;
  LD.AddMilliseconds(AMSec);
   Result := LD;
end;

end.
