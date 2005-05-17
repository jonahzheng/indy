unit IdSysNet;

interface

uses
  System.Globalization,
  System.Text, //here so we can refer to StringBuilder class
  IdSysBase;

type
  //I know EAbort violates our rule about basing exceptions on EIdException.
  //I'm doing this for one reason, to be compatible with SysUtils where a reference
  //is made to the EAbort exception.
  EAbort = class(Exception);
  TSysCharSet = set of AnsiChar;
  //I'm doing it this way because you can't inherit directly from StringBuilder
  //because of MS defined it.
  //This is necessary because the StringBuilder does NOT have an IndexOF method and
  //StringBuilder is being used for speed to prevent immutability problems with the String class
  //in DotNET
  TIdStringBuilder = System.Text.StringBuilder;
  TIdStringBuilderHelper =  class helper for System.Text.StringBuilder
  public
   function IndexOf(const value : String; const startIndex, count : Integer) : Integer; overload;
   function IndexOf(const value : String; const startIndex : Integer) : Integer; overload;
   function IndexOf(const value : String) : Integer; overload;
   function LastIndexOf(const value : String; const startIndex, count : Integer) : Integer; overload;
   function LastIndexOf(const value : String; const startIndex : Integer) : Integer; overload;
   function LastIndexOf(const value : String) : Integer; overload;

   function ReplaceOnlyFirst(const oldValue, newValue : String): StringBuilder; overload;
   function ReplaceOnlyFirst(const oldValue, newValue : String; const startIndex, count : Integer ): StringBuilder; overload;

   function ReplaceOnlyLast(const oldValue, newValue : String): StringBuilder; overload;
   function ReplaceOnlyLast(const oldValue, newValue : String; const startIndex, count : Integer ): StringBuilder; overload;

  end;

  TOADate = double;
  TIdDateTimeBase = packed record(IFormattable, IComparable, IConvertible)
  strict private
    var
      FValue: System.DateTime;
    class var
      FMinValue, FMaxValue: System.DateTime;
  public
    class constructor Create;
    constructor Create(const AValue: Double); overload;
    constructor Create(const ADays: Integer); overload;
    constructor Create(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Integer); overload;

    function ToString: string; overload; override;

    class function Parse(const AValue: string): TIdDateTimeBase; overload; static;
    class function Parse(const AValue: string;
      AProvider: IFormatProvider): TIdDateTimeBase; overload; static;
    class function Parse(const AValue: string; AProvider: IFormatProvider;
      AStyle: System.Globalization.DateTimeStyles): TIdDateTimeBase; overload; static;

    procedure AddMSec(AMSec: Integer);

    function Year: Integer;
    function Month: Integer;
    function Day: Integer;
    function Hour: Integer;
    function Minute: Integer;
    function Second: Integer;
    function MilliSecond: Integer;
    function DayOfYear: Integer;
    function DayOfWeek: Integer;
    function Time: TIdDateTimeBase;
    function Date: TIdDateTimeBase;
    class function IsLeapYear(AYear: Word): Boolean; static;
    class function DaysInMonth(AYear, AMonth: Word): Word; static;
    class function Now: TIdDateTimeBase; static;
    class function TheDate: TIdDateTimeBase; static;
    class function TheTime: TIdDateTimeBase; static;
    class function TheYear: Word; static;

    class procedure DecodeDate(const AValue: TIdDateTimeBase; out AYear, AMonth, ADay: Word); overload; static;
    class function DecodeDate(const AValue: TIdDateTimeBase; out AYear, AMonth, ADay, ADOW: Word): Boolean; overload; static;
    class procedure DecodeTime(const AValue: TIdDateTimeBase; out AHour, AMinute, ASecond, AMilliSecond: Word); static;
    class procedure DecodeDateTime(const AValue: TIdDateTimeBase; out AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word); static;
    class function EncodeDate(AYear, AMonth, ADay: Word): TIdDateTimeBase; static;
    class function EncodeTime(AHour, AMinute, ASecond, AMilliSecond: Word): TIdDateTimeBase; static;
    class function EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): TIdDateTimeBase; static;
    class function TryEncodeDate(AYear, AMonth, ADay: Word; out ADate: TIdDateTimeBase): Boolean; static;
    class function TryEncodeTime(AHour, AMinute, ASecond, AMilliSecond: Word; out ATime: TIdDateTimeBase): Boolean; static;
    class function TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; out AValue: TIdDateTimeBase): Boolean; static;

    function ReplaceDate(AYear, AMonth, ADay: Word): TIdDateTimeBase; overload;
    function ReplaceDate(const ADate: TIdDateTimeBase): TIdDateTimeBase; overload;
    function ReplaceTime(AHour, AMinute, ASecond, AMilliSecond: Word): TIdDateTimeBase; overload;
    function ReplaceTime(const ATime: TIdDateTimeBase): TIdDateTimeBase; overload;
    function AddMonth(AMonths: Integer = 1): TIdDateTimeBase;

    class function MinValue: TIdDateTimeBase; static; { 01/01/0100 12:00:00.000 AM }
    class function MaxValue: TIdDateTimeBase; static; { 12/31/9999 11:59:59.999 PM }

    class function FromOADate(const AValue: TOADate): TIdDateTimeBase; static;
    function ToOADate: TOADate; 
    class function FromBytes(const AValue: TBytes): TIdDateTimeBase; static;
    class function ToBytes(const AValue: TIdDateTimeBase): TBytes; static;
    class function FromObject(AObject: System.Object): TIdDateTimeBase; static;

    class operator Trunc(const AValue: TIdDateTimeBase): Int64;
    class operator Round(const AValue: TIdDateTimeBase): Int64;

    class operator Negative(const AValue: TIdDateTimeBase): Double;
    class operator Positive(const AValue: TIdDateTimeBase): Double;

    class operator Add(const Left, Right: TIdDateTimeBase): Double;
    class operator Add(const Left: TIdDateTimeBase; const Right: Double): TIdDateTimeBase;
    class operator Add(const Left: TIdDateTimeBase; const Right: System.TimeSpan): TIdDateTimeBase;
    class operator Subtract(const Left, Right: TIdDateTimeBase): Double;
    class operator Subtract(const Left: TIdDateTimeBase; const Right: Double): TIdDateTimeBase;
    class operator Subtract(const Left: TIdDateTimeBase; const Right: System.TimeSpan): TIdDateTimeBase;
    class operator Multiply(const Left, Right: TIdDateTimeBase): Double;
    class operator Multiply(const Left: TIdDateTimeBase; const Right: Double): Double;
    class operator Divide(const Left, Right: TIdDateTimeBase): Double;
    class operator Divide(const Left: TIdDateTimeBase; const Right: Double): Double;

    class operator Equal(const Left, Right: TIdDateTimeBase): Boolean;
    class operator NotEqual(const Left, Right: TIdDateTimeBase): Boolean;
    class operator LessThan(const Left, Right: TIdDateTimeBase): Boolean;
    class operator LessThanOrEqual(const Left, Right: TIdDateTimeBase): Boolean;
    class operator GreaterThan(const Left, Right: TIdDateTimeBase): Boolean;
    class operator GreaterThanOrEqual(const Left, Right: TIdDateTimeBase): Boolean;

    class operator Implicit(const AValue: Integer): TIdDateTimeBase;
    class operator Implicit(const AValue: Int64): TIdDateTimeBase;
    class operator Implicit(const AValue: Double): TIdDateTimeBase;
    class operator Implicit(const AValue: TIdDateTimeBase): Double;
    class operator Implicit(const AValue: Extended): TIdDateTimeBase;
    class operator Implicit(const AValue: TIdDateTimeBase): Extended;
    class operator Implicit(const aValue: System.DateTime): TIdDateTimeBase;
    class operator Implicit(const AValue: TIdDateTimeBase): System.DateTime;
    class operator Implicit(const aValue: TDate): TIdDateTimeBase;
    class operator Implicit(const AValue: TIdDateTimeBase): TDate;
    class operator Implicit(const aValue: TTime): TIdDateTimeBase;
    class operator Implicit(const AValue: TIdDateTimeBase): TTime;

// remove when TDateTime isn't used anymore
    class operator Implicit(const AValue: TIdDateTimeBase): TDateTime;
    class operator Implicit(const AValue: TDateTime): TIdDateTimeBase;
// end removal-todo


    // IFormattable
    /// Note: format is the CLR format string, not a Delphi format string
    function ToString(AFormat: string; AProvider: IFormatProvider): string; overload;

    // IComparable
    function CompareTo(AValue: TObject): Integer;

    // IConvertible
    function GetTypeCode: TypeCode;
    function ToInt16(AProvider: IFormatProvider): SmallInt;
    function ToInt32(AProvider: IFormatProvider): Integer;
    function ToSingle(AProvider: IFormatProvider): Single;
    function ToDouble(AProvider: IFormatProvider): Double;
    function ToDateTime(AProvider: IFormatProvider): DateTime;
    function ToBoolean(AProvider: IFormatProvider): Boolean;
    function ToDecimal(AProvider: IFormatProvider): Decimal;
    function ToSByte(AProvider: IFormatProvider): ShortInt;
    function ToByte(AProvider: IFormatProvider): Byte;
    function ToUInt16(AProvider: IFormatProvider): Word;
    function ToUInt32(AProvider: IFormatProvider): LongWord;
    function ToInt64(AProvider: IFormatProvider): Int64;
    function ToUInt64(AProvider: IFormatProvider): UInt64;
    function ToString(AProvider: IFormatProvider): string; overload;
    function ToChar(AProvider: IFormatProvider): Char;
    function ToType(AType: System.Type; AProvider: IFormatProvider): TObject;
  end;

// helper class

  TIdSysNet = class(TIdSysBase)
  protected
    class function AddStringToFormat(SB: StringBuilder; I: Integer; S: String): Integer; static;
    class procedure FmtStr(var Result: string; const Format: string;
      const Args: array of const); static;
  public
    class function FormatBuf(var Buffer: System.Text.StringBuilder; const Format: string;
      FmtLen: Cardinal; const Args: array of const; Provider: IFormatProvider): Cardinal; overload; static;
    class function FormatBuf(var Buffer: System.Text.StringBuilder; const Format: string;
      FmtLen: Cardinal; const Args: array of const): Cardinal;  overload; static;
    class function AnsiCompareText(const S1, S2: WideString): Integer; static;

    class function LastChars(const AStr : String; const ALen : Integer): String; static;
    class function AddMSecToTime(const ADateTime : TIdDateTimeBase; const AMSec : Integer): TIdDateTimeBase; static;
    class function StrToInt64(const S: string): Int64; overload; static;
    class function StrToInt64(const S: string; const Default : Int64): Int64; overload; static;
    class function TwoDigitYearCenturyWindow : Word; static;
    class function FloatToIntStr(const AFloat : Extended) : String; static;
    class function AlignLeftCol(const AStr : String; const AWidth : Integer=0) : String; static;
    class procedure DecodeTime(const ADateTime: TIdDateTimeBase; var Hour, Min, Sec, MSec: Word); static;
    class procedure DecodeDate(const ADateTime: TIdDateTimeBase; var Year, Month, Day: Word); static;
    class function EncodeTime(Hour, Min, Sec, MSec: Word): TIdDateTimeBase; static;
    class function EncodeDate(Year, Month, Day: Word): TIdDateTimeBase; static;
    class function DateTimeToStr(const ADateTime: TIdDateTimeBase): string; static;
    class function StrToDateTime(const S : String): TIdDateTimeBase; static;
    class function Now : TIdDateTimeBase; static;
    class function DayOfWeek(const ADateTime: TIdDateTimeBase): Word; static;
    class function FormatDateTime(const Format: string; ADateTime: TIdDateTimeBase): string; static;
    class function Format(const Format: string; const Args: array of const): string; static;
    class function SameText(const S1, S2 : String) : Boolean; static;
    class function CompareStr(const S1, S2: string): Integer; static;
    class function CompareDate(const D1, D2 : TIdDateTimeBase) : Integer; static;
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
    class function FileAge(const FileName: string): TIdDateTimeBase; static;
    class function FileExists(const FileName: string): Boolean; static;
    class function DirectoryExists(const Directory: string): Boolean; static;
    class function DeleteFile(const FileName: string): Boolean; static;
    class function ExtractFileName(const FileName: string): string; static;
    class function ExtractFileExt(const FileName: string): string; static;
    class function ChangeFileExt(const FileName, Extension: string): string; static;
    class function LastDelimiter(const Delimiters, S: string): Integer; static;
    class function StrToInt64Def(const S: string; const Default: Int64): Int64;  static;
    class function StringReplace(const S, OldPattern, NewPattern: string): string; overload; static;
    class function StringReplace(const S : String; const OldPattern, NewPattern: array of string): string; overload; static;
    class function ConvertFormat(const AFormat : String;
           const ADate : TIdDateTimeBase;
           DTInfo : System.Globalization.DateTimeFormatInfo): String; static;
    class function ReplaceOnlyFirst(const S, OldPattern, NewPattern: string): string; overload; static;
  end;

const PATH_DELIN = '\';

implementation
uses
  System.IO;

{ SysUtils }

class procedure TIdSysNet.Abort;
begin
  raise EAbort.Create;
end;

class function TIdSysNet.CompareStr(const S1, S2: string): Integer;
begin
  Result := System.&String.Compare(S1,S2,False);
end;

class function TIdSysNet.DateTimeToStr(const ADateTime: TIdDateTimeBase): string;
begin
  Result := ADateTime.ToString;
end;

class function TIdSysNet.FileExists(const FileName: string): Boolean;
begin
  Result := System.IO.File.Exists(FileName);
end;

class function TIdSysNet.Format(const Format: string;  const Args: array of const): string;
begin
  FmtStr(Result, Format, Args);
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

class function TIdSysNet.Now: TIdDateTimeBase;
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

class procedure TIdSysNet.DecodeDate(const ADateTime: TIdDateTimeBase; var Year,
  Month, Day: Word);
begin
  Year := ADateTime.Year;
  Month := ADateTime.Month;
  Day := ADateTime.Day;
end;

class procedure TIdSysNet.DecodeTime(const ADateTime: TIdDateTimeBase; var Hour,
  Min, Sec, MSec: Word);
begin
  Hour := ADateTime.Hour;
  Min := ADateTime.Minute;
  Sec := ADateTime.Second;
  MSec := ADateTime.Millisecond;
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

class function TIdSysNet.EncodeTime(Hour, Min, Sec, MSec: Word): TIdDateTimeBase;
begin
  Result := TIdDateTimeBase.Create(0, 1, 1, Hour, Min, Sec, MSec);
end;

class function TIdSysNet.EncodeDate(Year, Month, Day: Word): TIdDateTimeBase;
begin
 Result := TIdDateTimeBase.Create(Year, Month, Day, 0, 0, 0, 0);
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

class function TIdSysNet.FileAge(const FileName: string): TIdDateTimeBase;
begin
  if System.IO.&File.Exists(FileName) then
  begin
    Result := System.IO.&File.GetLastWriteTime(FileName);
  end
  else
  begin
    Result := TIdDateTimeBase.Create(0);
  end;
end;



class function TIdSysNet.CompareDate(const D1, D2: TIdDateTimeBase): Integer;
begin
  Result := D1.CompareTo(D2);
end;

class function TIdSysNet.StrToDateTime(const S: String): TIdDateTimeBase;
begin

  Result := TIdDateTimeBase.Parse(S)
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

class function TIdSysNet.AddStringToFormat(SB: StringBuilder; I: Integer; S: String): Integer;
begin
  SB.Append(S);
  Result := I + 1;
end;

class function TIdSysNet.ConvertFormat(const AFormat : String;
  const ADate : TIdDateTimeBase;
  DTInfo : System.Globalization.DateTimeFormatInfo): String;
var LSB : StringBuilder;
  I, LCount, LHPos, LH2Pos, LLen: Integer;
  c : Char;
  LAMPM : String;

begin
  Result := '';
  LSB := StringBuilder.Create;
  Llen := AFormat.Length;
  if LLen=0 then
  begin
    Exit;
  end;
  I := 1;
  LHPos := -1;
  LH2Pos := -1;
  repeat
    if I > LLen then
    begin
      Break;
    end;
    C := AFormat[I];
    case C of
      't', 'T' : //t - short time, tt - long time
      begin
        if (i < LLen) and ((AFormat[i+1]='t') or (AFormat.Chars[i]='T')) then
        begin
          LSB.Append(DTInfo.LongTimePattern );
          i := i + 2;
        end
        else
        begin
          LSB.Append(DTInfo.ShortTimePattern );
          i := i + 1;
        end;
      end;
      'c', 'C' : //
      begin
        LSB.Append( DTInfo.ShortDatePattern  );
        i := AddStringToFormat(LSB,i,' ');
        LSB.Append( DTInfo.LongTimePattern );
      end;
      'd' : //must do some mapping
      begin
        LCount := 0;
        while (i + LCount<=LLen) and ((AFormat[i+LCount] ='D') or
          (AFormat[i+LCount] ='d')) do
        begin
          Inc(LCount);
        end;
        case LCount of
          5 : LSB.Append(DTInfo.ShortDatePattern);
          6 : LSB.Append(DTInfo.LongDatePattern);
        else
          LSB.Append(StringOfChar(c,LCount));
        end;
        Inc(i,LCount);
      end;
      'h' : //h -
      //assume 24 hour format
      //remember positions in case am/pm pattern appears later
      begin
        LHPos := LSB.Length;
        i := AddStringToFormat(LSB,i,'H');
        if (i <= LLen) then
        begin
          if (AFormat[i] ='H') or (AFormat[i] = 'h') then
          begin
            LH2Pos := LSB.Length;
            i := AddStringToFormat(LSB,i,'H');
          end;
        end;
      end;
      'a' : //check for AM/PM formats
      begin
        if LAMPM ='' then
        begin
          //We want to honor both lower and uppercase just like Borland's
          //FormatDate should
          if ADate.Hour <12 then
          begin
            LAMPM := DTInfo.AMDesignator;
          end
          else
          begin
            LAMPM := DTInfo.PMDesignator;
          end;
        end;
        if System.&String.Compare(AFormat,i-1,'am/pm',0,5,True)=0 then
        begin
          LSB.Append('"');
          if AFormat.Chars[i-1]='a' then
          begin
            LSB.Append( System.Char.ToLower( LAMPM.Chars[0]) );
          end
          else
          begin
            LSB.Append( LSB.Append( System.Char.ToUpper( LAMPM.Chars[0]) ));
          end;
          if AFormat.Chars[i]='m' then
          begin
            LSB.Append( System.Char.ToLower( LAMPM.Chars[1]) );
          end
          else
          begin
            LSB.Append( LSB.Append( System.Char.ToUpper( LAMPM.Chars[1]) ));
          end;
          LSB.Append('"');
          i := i + 5;
        end
        else
        begin
          if System.&String.Compare(AFormat,i-1,'a/p',0,3,True)=0 then
          begin
            LSB.Append('"');
            if AFormat.Chars[i-1]='a' then
            begin
              LSB.Append( System.Char.ToLower( LAMPM.Chars[0]) );
            end
            else
            begin
              LSB.Append( LSB.Append( System.Char.ToUpper( LAMPM.Chars[0]) ));
            end;
            LSB.Append('"');
            i := i + 3;
          end
          else
          begin
            LSB.Append('"');
            if AFormat.Chars[i-1]='a' then
            begin
              LSB.Append( System.Char.ToLower( LAMPM.Chars[0]) );
            end
            else
            begin
              LSB.Append( LSB.Append( System.Char.ToUpper( LAMPM.Chars[0]) ));
            end;
            if AFormat.Chars[i]='m' then
            begin
              LSB.Append( System.Char.ToLower( LAMPM.Chars[1]) );
            end
            else
            begin
              LSB.Append( LSB.Append( System.Char.ToUpper( LAMPM.Chars[1]) ));
            end;
            LSB.Append('"');
            i := i + 5;
          end;
        end;
        if LHPos <> -1 then
        begin
          LSB.Chars[LHPos] := 'h';
          if LH2Pos<>-1 then
          begin
            LSB.Chars[LH2Pos] := 'h';
          end;
          LHPos := -1;
          LH2Pos := -1;
        end;
      end;
      'z', 'Z' :
      begin
        if (i+2 < LLen) and (System.&String.Compare(AFormat,i-1,'zzz',0,3,True)=0) then
        begin
          LSB.Append(  ADate.MilliSecond.ToString );
          i := i + 3;
        end
        else
        begin
          LSB.Append('fff');
          i := i + 1;
        end;
      end;
      '/' : //double this
      begin
        i := AddStringToFormat(LSB,i,'\\');
      end;
      '''','"' : //litteral
      begin
        i := AddStringToFormat(LSB,i,C);
        LCount := 0;
        while (i + LCount < LLen) and (AFormat.Chars[I+LCount]<>C) do
        begin
          Inc(LCount);
        end;
        LSB.Append(AFormat,i-1,LCount);
        inc(i,LCount);
        if i<=LLen then
        begin
          AddStringToFormat(LSB,i,c);
        end;

      end;
      'n','N' : //minutes - lowercase m
      begin
        i := AddStringToFormat(LSB,i,'m');
      end;
      'm','M' : //monthes - must be uppercase
      begin
        i := AddStringToFormat(LSB,i,'M');
      end;
      'y','Y' : //year - must be lowercase
      begin
        i := AddStringToFormat(LSB,i,'y');
      end;
      's','S' : //seconds -must be lowercase
      begin
        i := AddStringToFormat(LSB,i,'s');
      end
      else
      begin
        i := AddStringToFormat(LSB,i,C);
      end;
    end;
  until False;
  Result := LSB.ToString;
end;

class function TIdSysNet.FormatDateTime(const Format: string;
  ADateTime: TIdDateTimeBase): string;
var LF : System.Globalization.DateTimeFormatInfo;
begin
  //unlike Borland's FormatDate, we only want the ENglish language
  LF := System.Globalization.DateTimeFormatInfo.InvariantInfo;
  Result := ADateTime.ToString(ConvertFormat(Format,ADateTime,LF),LF);
end;

class function TIdSysNet.DayOfWeek(const ADateTime: TIdDateTimeBase): Word;
begin
  Result := Integer(ADateTime.DayOfWeek) + 1;
end;

class function TIdSysNet.AddMSecToTime(const ADateTime: TIdDateTimeBase;
  const AMSec: Integer): TIdDateTimeBase;
var LD : TIdDateTimeBase;
begin
  LD := ADateTime;
  LD.AddMSec(AMSec);
  Result := LD;
end;

class function TIdSysNet.LastChars(const AStr: String; const ALen : Integer): String;
begin
  if AStr.Length > ALen then
  begin
    Result := Copy(AStr,Length(AStr)-ALen+1,ALen);
  end
  else
  begin
    Result := AStr;
  end;
end;

{ TIdStringBuilderHelper }

function TIdStringBuilderHelper.IndexOf(const value: String): Integer;
begin
  Result := IndexOf(value,0,Self.Length);
end;

function TIdStringBuilderHelper.IndexOf(const value: String;
  const startIndex: Integer): Integer;
begin
   Result := IndexOf(value,startIndex,Self.Length);
end;

function TIdStringBuilderHelper.IndexOf(const value: String;
  const startIndex, count: Integer): Integer;
var i,j,l : Integer;
    LFoundSubStr : Boolean;
begin
  Result := -1;
  if (value.Length + startIndex > (Self.Length + startIndex))
    or (value.Length > startIndex + count)  then
  begin
    Exit;
  end;
  l := (startIndex + count);

  if l > (Self.Length - 1) then
  begin
    l := Self.Length - 1;
  end;

  for i := startIndex to l-value.Length+1 do
  begin
    if i < 0 then
    begin
      break;
    end;
    if Self.Chars[i] = value.Chars[0] then
    begin
      //we don't want to loop through the substring if it has only
      //one char because there's no sense to evaluate the same thing
      //twice
      if value.Length > 1 then
      begin
        Result := i;
        Break;
      end
      else
      begin
        LFoundSubStr := True;
        for j := 1 to value.Length-1 do
        begin
         if Self.Chars[i + j] <> value.Chars[j] then
         begin
           LFoundSubStr := False;
           break;
         end;
        end;
        if LFoundSubStr then
        begin
          Result := i;
          Exit;
        end;
      end;
    end;

  end;
end;

function TIdStringBuilderHelper.LastIndexOf(const value: String): Integer;
begin
 Result := LastIndexOf(value,Self.Length);
end;

function TIdStringBuilderHelper.LastIndexOf(const value: String;
  const startIndex: Integer): Integer;
begin
  Result := LastIndexOf(value,startIndex,Self.Length);
end;

function TIdStringBuilderHelper.LastIndexOf(const value: String;
  const startIndex, count: Integer): Integer;
var i,j : Integer;
    LFoundSubStr : Boolean;
    LEndIndex, LStartIndex : Integer;
begin
  Result := -1;
  LEndIndex := startindex - count;
  if LEndIndex < 0 then
  begin
    LEndIndex := 0;
  end;
  if LEndIndex > Self.Length then
  begin
    Exit;
  end;
  LStartIndex := startIndex;
  if LStartIndex >= Self.Length then
  begin
    LStartIndex := Self.Length-1;
  end;


  for i := LStartIndex downto LEndIndex+1+value.Length do
  begin
    if Self.Chars[i] = value.Chars[0] then
    begin
      //we don't want to loop through the substring if it has only
      //one char because there's no sense to evaluate the same thing
      //twice
      if value.Length < 2 then
      begin
        Result := i;
        Break;
      end
      else
      begin
        LFoundSubStr := True;
        for j := value.Length-1 downto 1 do
        begin
         if Self.Chars[i + j] <> value.Chars[j] then
         begin
           LFoundSubStr := False;
           break;
         end;
        end;
        if LFoundSubStr then
        begin
          Result := i;
          Exit;
        end;
      end;
    end;

  end;
end;

function TIdStringBuilderHelper.ReplaceOnlyFirst(const oldValue,
  newValue: String; const startIndex, count: Integer): StringBuilder;
var
  i : Integer;

begin
  Result := Self;
  i := Self.IndexOf(OldValue,startIndex,count);
  if i < 0 then
  begin
    Exit;
  end;
  Self.Remove(i,oldValue.Length);
  Self.Insert(i,newValue);
end;

function TIdStringBuilderHelper.ReplaceOnlyFirst(const oldValue,
  newValue: String): StringBuilder;
begin
  Result := ReplaceOnlyFirst(oldValue,newValue,0,Self.Length);
end;

function TIdStringBuilderHelper.ReplaceOnlyLast(const oldValue,
  newValue: String; const startIndex, count: Integer): StringBuilder;
var
  i : Integer;

begin
  Result := Self;
  i := Self.LastIndexOf(OldValue,startIndex,count);
  if i < 0 then
  begin
    Exit;
  end;
  Self.Remove(i,oldValue.Length);
  Self.Insert(i,newValue);
end;

function TIdStringBuilderHelper.ReplaceOnlyLast(const oldValue,
  newValue: String): StringBuilder;

begin
  Result := Self.ReplaceOnlyLast(oldValue,newValue,Self.Length,Self.Length);
end;

class function TIdSysNet.FormatBuf(var Buffer: System.Text.StringBuilder;
  const Format: string; FmtLen: Cardinal; const Args: array of const): Cardinal;
var
  LFormat: NumberFormatInfo;
begin
  //for most of our uses, we want the immutable settings instead of the user's
  //local settings.
  LFormat := NumberFormatInfo.InvariantInfo;

  Result := FormatBuf(Buffer, Format, FmtLen, Args, LFormat);
end;

class function TIdSysNet.FormatBuf(var Buffer: System.Text.StringBuilder;
  const Format: string; FmtLen: Cardinal; const Args: array of const;
  Provider: IFormatProvider): Cardinal;

  function ReadNumber(const AFmt : String;
    const AArgs: array of const;
    AProvider: IFormatProvider;
    var VIdx : Integer;
    var VArgIdx : Integer;
    AScratch : System.Text.StringBuilder): Integer;

  begin

    Result := 0;
    AScratch.Length := 0;
    if AFmt.Chars[VIdx] = '-' then
    begin
      AScratch.Append(AFmt.Chars[VIdx]);
      Inc(VIdx);
      if VIdx >= AFmt.Length then
      begin
        Exit;
      end;
    end;
    if AFmt.Chars[VIdx] = '*' then
    begin
      //The value is embedded in the Args paramer;

       AScratch.Append(AArgs[VArgIdx]);
      Inc(VArgIdx);
      Inc(VIdx);
    end
    else
    begin
      //parse the value
      repeat

        if VIdx >= AFmt.Length then
        begin
          Break;
        end;

         if System.Char.IsDigit(AFmt.Chars[VIdx]) then
         begin
           AScratch.Append( AFmt.Chars[VIdx]);
         end
         else
         begin
           break;
         end;
         inc(VIdx);
      until False;
    end;
    if AScratch.Length>0 then
    begin
      Result := System.Convert.ToInt32 ( AScratch.ToString, AProvider );
    end;
  end;
  

var
  LStrLen : Integer;
  LIdx, LArgIdx : Integer;
  LPerLen : Integer;
  LWidth : Integer;
  LFmStr : System.Text.StringBuilder;
  LScratch : System.Text.StringBuilder; //scratch pad for int. usage

begin
  LWidth := 0;
  LIdx := 0;
  LArgIdx := 0;
  LStrLen := Format.Length;
  LFmStr := System.Text.StringBuilder.Create;
  LScratch := System.Text.StringBuilder.Create;
  repeat
    if LIdx >= LStrLen then
    begin
      Break;
    end;
    if Format.Chars[LIdx]='%' then
    begin
      inc(LIdx);
      if LIdx >= LStrLen then
      begin
        break;
      end;
      //interpret as one litteral % in a string
      if Format.Chars[LIdx] ='%' then
      begin
        Buffer.Append(Format.Chars[LIdx]);
        Continue;
      end;
      LFmStr.Length := 0;
      LFmStr.Append('{0');
      //width specifier might be first
      LWidth := ReadNumber(Format,Args,Provider,LIdx,LArgIdx,LScratch);

      if Format.Chars[LIdx] = ':' then
      begin
        inc(LIdx);
        if LIdx >= LStrLen then
        begin
          break;
        end;
        //That was not the width but the Index
        if LWidth >-1 then
        begin
          LArgIdx := 0 - LWidth;
          LWidth := -1;
        end
        else
        begin
          LArgIdx := 0;
          Inc(LIdx);
          if LIdx >= LStrLen then
          begin
            break;
          end;
        end;

        LWidth := ReadNumber(Format,Args,Provider,LIdx,LArgIdx,LScratch);
      end;
      //Percission value
      if Format.Chars[LIdx] = '.' then
      begin
        inc(LIdx);
        if LIdx >= LStrLen then
        begin
          break;
        end;
        LPerLen := ReadNumber(Format,Args,Provider,LIdx,LArgIdx,LScratch);
      end
      else
      begin
        LPerLen := 0;
      end;
      if LWidth <> 0 then
      begin
        LFmStr.Append(','+LWidth.ToString);
      end;
      LFmStr.Append(Char(':'));

      case Format.Chars[LIdx] of
        'd', 'D',
        'u', 'U': LFmStr.Append(Char('d'));
        'e', 'E',
        'f', 'F',
        'g', 'G',
        'n', 'N',
        'x', 'X':  LFmStr.Append(Char(Format.Chars[LIdx]));

        'm', 'M': LFmStr.Append(Char('c'));
        'p', 'P': LFmStr.Append(Char('x'));
        's', 'S': ;  // no format spec needed for strings
      else
        Continue;
      end;
      if LPerLen>0 then
      begin
        LFmStr.Append(LPerLen.ToString);
      end;
      LFmStr.Append(Char('}'));
      //we'll AppendFormat to our scratchpad instead of directly into
      //buffer because the Width specifier needs to truncate with a string.
      LScratch.Length := 0;
      LScratch.AppendFormat(Provider, LFmStr.ToString, [Args[LArgIdx]]);
      if ((Format.Chars[LIdx] = 's') or (Format.Chars[LIdx] = 'S')) and
        (LPerLen>0) then
      begin
        LScratch.Length := LPerLen;
      end;
      Buffer.Append(LScratch);
      Inc(LArgIdx);
    end
    else
    begin
      Buffer.Append(Format.Chars[LIdx]);
    end;
    Inc(LIdx);
  until False;
  Result := Buffer.Length;
end;

class procedure TIdSysNet.FmtStr(var Result: string; const Format: string;
  const Args: array of const);
var
  Buffer: System.Text.StringBuilder;
begin
  Buffer := System.Text.StringBuilder.Create(Length(Format) * 2);
  FormatBuf(Buffer, Format, Length(Format), Args);
  Result := Buffer.ToString;
end;

class function TIdSysNet.AnsiCompareText(const S1, S2: WideString): Integer;
begin
  Result := System.String.Compare(S1, S2, True);
end;

class function TIdSysNet.ChangeFileExt(const FileName,
  Extension: string): string;
begin
  if Extension.Length <> 0 then
  begin
    Result := System.IO.Path.ChangeExtension(FileName, Extension)
  end
  else
  begin
    Result := System.IO.Path.ChangeExtension(FileName, System.String(nil));
  end;
end;

// TIdDateTimeBase

class constructor TIdDateTimeBase.Create;
begin
  FMinValue := System.DateTime.Create(100, 1, 1, 0, 0, 0, 0);
  FMaxValue := System.DateTime.Create(9999, 12, 31, 23, 59, 59, 999);
end;

constructor TIdDateTimeBase.Create(const AValue: Double);
begin
  inherited Create;
  FValue := System.DateTime.FromOADate(AValue);
end;

constructor TIdDateTimeBase.Create(const ADays: Integer);
begin
  inherited Create;
  FValue := System.DateTime.FromOADate(ADays);
end;

constructor TIdDateTimeBase.Create(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Integer);
begin
  inherited Create;
  FValue := System.DateTime.Create(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
end;

function TIdDateTimeBase.ToString: string;
begin
  Result := FValue.ToString;
end;

function TIdDateTimeBase.ToString(AProvider: IFormatProvider): string;
begin
  Result := FValue.ToString(AProvider);
end;

function TIdDateTimeBase.ToString(AFormat: string; AProvider: IFormatProvider): string;
begin
  Result := FValue.ToString(AFormat, AProvider);
end;

class function TIdDateTimeBase.Parse(const AValue: string): TIdDateTimeBase;
begin
  Result.FValue := System.DateTime.Parse(AValue);
end;

class function TIdDateTimeBase.Parse(const AValue: string; AProvider: IFormatProvider): TIdDateTimeBase;
begin
  Result.FValue := System.DateTime.Parse(AValue, AProvider);
end;

class function TIdDateTimeBase.Parse(const AValue: string; AProvider: IFormatProvider;
  AStyle: System.Globalization.DateTimeStyles): TIdDateTimeBase;
begin
  Result.FValue := System.DateTime.Parse(AValue, AProvider, AStyle);
end;

function TIdDateTimeBase.CompareTo(AValue: TObject): Integer;
begin
  if AValue is TIdDateTimeBase then
    Result := FValue.CompareTo(TIdDateTimeBase(AValue).FValue)
  else if AValue is System.DateTime then
    Result := FValue.CompareTo(AValue)
  else
    try
      try
        Result := FValue.CompareTo(Convert.ToDateTime(AValue));
      except
        Result := FValue.CompareTo(System.DateTime.FromOADate(Convert.ToDouble(AValue)));
      end;
    except
      ConvertError(SObjectToDateError);
      Result := 0;
    end;
end;

function TIdDateTimeBase.Year: Integer;
begin
  Result := FValue.Year;
end;

function TIdDateTimeBase.Month: Integer;
begin
  Result := FValue.Month;
end;

function TIdDateTimeBase.Day: Integer;
begin
  Result := FValue.Day;
end;

function TIdDateTimeBase.Hour: Integer;
begin
  Result := FValue.Hour;
end;

function TIdDateTimeBase.Minute: Integer;
begin
  Result := FValue.Minute;
end;

function TIdDateTimeBase.Second: Integer;
begin
  Result := FValue.Second;
end;

function TIdDateTimeBase.MilliSecond: Integer;
begin
  Result := FValue.MilliSecond;
end;

function TIdDateTimeBase.DayOfYear: Integer;
begin
  Result := FValue.DayOfYear;
end;

function TIdDateTimeBase.DayOfWeek: Integer;
begin
  Result := Ord(FValue.DayOfWeek) + 1; // Sunday = 1...Saturday = 7
end;

const
  CDefaultYear = 1899;
  CDefaultMonth = 12;
  CDefaultDay = 30;
  CDefaultHour = 0;
  CDefaultMinute = 0;
  CDefaultSecond = 0;
  CDefaultMilliSecond = 0;

function TIdDateTimeBase.Time: TIdDateTimeBase;
begin
  with FValue do
    Result := EncodeTime(Hour, Minute, Second, Millisecond);
end;

function TIdDateTimeBase.Date: TIdDateTimeBase;
begin
  Result.FValue := FValue.Date;
end;

class function TIdDateTimeBase.IsLeapYear(AYear: Word): Boolean;
begin
  Result := System.DateTime.IsLeapYear(AYear);
end;

class function TIdDateTimeBase.DaysInMonth(AYear, AMonth: Word): Word;
begin
  Result := System.DateTime.DaysInMonth(AYear, AMonth);
end;

class function TIdDateTimeBase.Now: TIdDateTimeBase;
begin
  Result.FValue := System.DateTime.Now;
end;

class function TIdDateTimeBase.TheDate: TIdDateTimeBase;
begin
  Result := Now.Date;
end;

class function TIdDateTimeBase.TheTime: TIdDateTimeBase;
begin
  Result := Now.Time;
end;

class function TIdDateTimeBase.TheYear: Word;
begin
  Result := Now.Year;
end;

class procedure TIdDateTimeBase.DecodeDate(const AValue: TIdDateTimeBase; out AYear, AMonth, ADay: Word); overload;
var
  LDOW: Word;
begin
  DecodeDate(AValue, AYear, AMonth, ADay, LDOW);
end;

class function TIdDateTimeBase.DecodeDate(const AValue: TIdDateTimeBase; out AYear, AMonth, ADay, ADOW: Word): Boolean; overload;
begin
  with AValue do
  begin
    AYear := Year;
    if (AYear < 100) or (AYear > 9999) then
    begin
      AYear := 0;
      AMonth := 0;
      ADay := 0;
      ADOW := 0;
      Result := False;
    end
    else
    begin
      AMonth := Month;
      ADay := Day;
      ADOW := DayOfWeek;
      Result := IsLeapYear(AYear);
    end;
  end;
end;

class procedure TIdDateTimeBase.DecodeTime(const AValue: TIdDateTimeBase; out AHour, AMinute, ASecond, AMilliSecond: Word);
begin
  with AValue do
  begin
    AHour := Hour;
    AMinute := Minute;
    ASecond := Second;
    AMilliSecond := Millisecond;
  end;
end;

class procedure TIdDateTimeBase.DecodeDateTime(const AValue: TIdDateTimeBase; out AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word);
begin
  DecodeDate(AValue, AYear, AMonth, ADay);
  DecodeTime(AValue, AHour, AMinute, ASecond, AMilliSecond);
end;

class function TIdDateTimeBase.EncodeDate(AYear, AMonth, ADay: Word): TIdDateTimeBase;
begin
  if not TryEncodeDate(AYear, AMonth, ADay, Result) then
    ConvertError(SDateEncodeError);
end;

class function TIdDateTimeBase.EncodeTime(AHour, AMinute, ASecond, AMilliSecond: Word): TIdDateTimeBase;
begin
  if not TryEncodeTime(AHour, AMinute, ASecond, AMilliSecond, Result) then
    ConvertError(STimeEncodeError);
end;

class function TIdDateTimeBase.EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): TIdDateTimeBase;
begin
  if not TryEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond, Result) then
    ConvertError(SDateTimeEncodeError);
end;

class function TIdDateTimeBase.TryEncodeDate(AYear, AMonth, ADay: Word; out ADate: TIdDateTimeBase): Boolean;
begin
  Result := TryEncodeDateTime(AYear, AMonth, ADay, CDefaultHour, CDefaultMinute, CDefaultSecond, CDefaultMilliSecond, ADate);
end;

class function TIdDateTimeBase.TryEncodeTime(AHour, AMinute, ASecond, AMilliSecond: Word; out ATime: TIdDateTimeBase): Boolean;
begin
  Result := TryEncodeDateTime(CDefaultYear, CDefaultMonth, CDefaultDay, AHour, AMinute, ASecond, AMilliSecond, ATime);
end;

class function TIdDateTimeBase.TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; out AValue: TIdDateTimeBase): Boolean;
begin
  Result := not ((AYear < 100) or (AYear > 9999) or
                 (AMonth < 1) or (AMonth > 12) or
                 (ADay < 1) or (ADay > DaysInMonth(AYear, AMonth)) or
                 (AHour > 23) or (AMinute > 59) or (ASecond > 59) or (AMilliSecond > 999));
  if Result then
    AValue.FValue := System.DateTime.Create(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
end;

function TIdDateTimeBase.ReplaceDate(AYear, AMonth, ADay: Word): TIdDateTimeBase;
var
  LHour, LMinute, LSecond, LMilliSecond: Word;
begin
  DecodeTime(Self, LHour, LMinute, LSecond, LMilliSecond);
  Result := EncodeDateTime(AYear, AMonth, ADay, LHour, LMinute, LSecond, LMilliSecond);
end;

function TIdDateTimeBase.ReplaceDate(const ADate: TIdDateTimeBase): TIdDateTimeBase;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(ADate, LYear, LMonth, LDay);
  Result := ReplaceDate(LYear, LMonth, LDay);
end;

function TIdDateTimeBase.ReplaceTime(AHour, AMinute, ASecond, AMilliSecond: Word): TIdDateTimeBase;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(Self, LYear, LMonth, LDay);
  Result := EncodeDateTime(LYear, LMonth, LDay, AHour, AMinute, ASecond, AMilliSecond);
end;

function TIdDateTimeBase.ReplaceTime(const ATime: TIdDateTimeBase): TIdDateTimeBase;
var
  LHour, LMinute, LSecond, LMilliSecond: Word;
begin
  DecodeTime(ATime, LHour, LMinute, LSecond, LMilliSecond);
  Result := ReplaceTime(LHour, LMinute, LSecond, LMilliSecond);
end;

function TIdDateTimeBase.AddMonth(AMonths: Integer): TIdDateTimeBase;
begin
  Result.FValue := FValue.AddMonths(AMonths);
end;

class function TIdDateTimeBase.MinValue: TIdDateTimeBase;
begin
  Result.FValue := FMinValue;
end;

class function TIdDateTimeBase.MaxValue: TIdDateTimeBase;
begin
  Result.FValue := FMaxValue;
end;

class function TIdDateTimeBase.FromOADate(const AValue: TOADate): TIdDateTimeBase;
begin
  Result.FValue := System.DateTime.FromOADate(AValue);
end;

function TIdDateTimeBase.ToOADate: TOADate;
begin
  Result := FValue.ToOADate;
end;

class function TIdDateTimeBase.FromBytes(const AValue: TBytes): TIdDateTimeBase;
begin
  Result := FromOADate(System.BitConverter.ToDouble(AValue, 0));
end;

class function TIdDateTimeBase.ToBytes(const AValue: TIdDateTimeBase): TBytes;
begin
  Result := System.BitConverter.GetBytes(AValue.ToOADate);
end;

class function TIdDateTimeBase.FromObject(AObject: TObject): TIdDateTimeBase;
begin
  if AObject is TIdDateTimeBase then
    Result.FValue := TIdDateTimeBase(AObject).FValue
  else if AObject is System.DateTime then
    Result := System.DateTime(AObject)
  else if AObject is System.Double then
    Result := FromOADate(Double(AObject))
  else if AObject is System.Boolean then
    if Boolean(AObject) then
      Result.FValue := FromOADate(-1)
    else
      Result.FValue := FromOADate(0)
  else
    try
      // We have to attempt conversion via double first as System.DateTime's
      //  Parse (which TIdDateTimeBase uses) will interpert strings like '5.01'
      //  as equaling a little after 5am on 12/30/1899.  Crazy but true.
      Result := FromOADate(Convert.ToDouble(AObject));
    except
      Result := Parse(Convert.ToString(AObject));
    end;
end;

class operator TIdDateTimeBase.Trunc(const AValue: TIdDateTimeBase): Int64;
begin
  Result := Trunc(AValue.ToOADate);
end;

class operator TIdDateTimeBase.Round(const AValue: TIdDateTimeBase): Int64;
begin
  Result := Round(AValue.ToOADate);
end;

class operator TIdDateTimeBase.Negative(const AValue: TIdDateTimeBase): Double;
begin
  Result := -(AValue.ToOADate);
end;

class operator TIdDateTimeBase.Positive(const AValue: TIdDateTimeBase): Double;
begin
  Result := AValue.ToOADate;
end;

class operator TIdDateTimeBase.Add(const Left, Right: TIdDateTimeBase): Double;
begin
  Result := Left.ToOADate + Right.ToOADate;
end;

class operator TIdDateTimeBase.Add(const Left: TIdDateTimeBase; const Right: Double): TIdDateTimeBase;
begin
  Result.FValue := Left.FValue + TimeSpan.FromDays(Right);
end;

class operator TIdDateTimeBase.Add(const Left: TIdDateTimeBase; const Right: System.TimeSpan): TIdDateTimeBase;
begin
  Result.FValue := Left.FValue + Right;
end;

class operator TIdDateTimeBase.Subtract(const Left, Right: TIdDateTimeBase): Double;
begin
  Result := Left.ToOADate - Right.ToOADate;
end;

class operator TIdDateTimeBase.Subtract(const Left: TIdDateTimeBase; const Right: Double): TIdDateTimeBase;
begin
  Result.FValue := Left.FValue - TimeSpan.FromDays(Right);
end;

class operator TIdDateTimeBase.Subtract(const Left: TIdDateTimeBase; const Right: System.TimeSpan): TIdDateTimeBase;
begin
  Result.FValue := Left.FValue - Right;
end;

class operator TIdDateTimeBase.Multiply(const Left, Right: TIdDateTimeBase): Double;
begin
  Result := Left.ToOADate * Right.ToOADate;
end;

class operator TIdDateTimeBase.Multiply(const Left: TIdDateTimeBase; const Right: Double): Double;
begin
  Result := Left.ToOADate * Right;
end;

class operator TIdDateTimeBase.Divide(const Left, Right: TIdDateTimeBase): Double;
begin
  Result := Left.ToOADate / Right.ToOADate;
end;

class operator TIdDateTimeBase.Divide(const Left: TIdDateTimeBase; const Right: Double): Double;
begin
  Result := Left.ToOADate / Right;
end;

class operator TIdDateTimeBase.Equal(const Left, Right: TIdDateTimeBase): Boolean;
begin
  Result := Left.FValue = Right.FValue;
end;

class operator TIdDateTimeBase.NotEqual(const Left, Right: TIdDateTimeBase): Boolean;
begin
  Result := Left.FValue <> Right.FValue;
end;

class operator TIdDateTimeBase.LessThan(const Left, Right: TIdDateTimeBase): Boolean;
begin
  Result := Left.FValue < Right.FValue;
end;

class operator TIdDateTimeBase.LessThanOrEqual(const Left, Right: TIdDateTimeBase): Boolean;
begin
  Result := Left.FValue <= Right.FValue;
end;

class operator TIdDateTimeBase.GreaterThan(const Left, Right: TIdDateTimeBase): Boolean;
begin
  Result := Left.FValue > Right.FValue;
end;

class operator TIdDateTimeBase.GreaterThanOrEqual(const Left, Right: TIdDateTimeBase): Boolean;
begin
  Result := Left.FValue >= Right.FValue;
end;

class operator TIdDateTimeBase.Implicit(const AValue: Integer): TIdDateTimeBase;
begin
  Result := FromOADate(AValue);
end;

class operator TIdDateTimeBase.Implicit(const AValue: Int64): TIdDateTimeBase;
begin
  Result := FromOADate(AValue);
end;

class operator TIdDateTimeBase.Implicit(const AValue: Double): TIdDateTimeBase;
begin
  Result := FromOADate(AValue);
end;

class operator TIdDateTimeBase.Implicit(const AValue: TIdDateTimeBase): Double;
begin
  Result := AValue.ToOADate;
end;

class operator TIdDateTimeBase.Implicit(const AValue: Extended): TIdDateTimeBase;
begin
  Result := FromOADate(AValue);
end;

class operator TIdDateTimeBase.Implicit(const AValue: TIdDateTimeBase): Extended;
begin
  Result := AValue.ToOADate;
end;

class operator TIdDateTimeBase.Implicit(const AValue: System.DateTime): TIdDateTimeBase;
begin
  Result.FValue := AValue;
end;

class operator TIdDateTimeBase.Implicit(const AValue: TIdDateTimeBase): System.DateTime;
begin
  Result := AValue.FValue;
end;

class operator TIdDateTimeBase.Implicit(const AValue: TDate): TIdDateTimeBase;
begin
  Result.FValue := AValue;
end;

class operator TIdDateTimeBase.Implicit(const AValue: TIdDateTimeBase): TDate;
begin
  Result := AValue.FValue;
end;

class operator TIdDateTimeBase.Implicit(const AValue: TTime): TIdDateTimeBase;
begin
  Result.FValue := AValue;
end;

class operator TIdDateTimeBase.Implicit(const AValue: TIdDateTimeBase): TTime;
begin
  Result := AValue.FValue;
end;

function TIdDateTimeBase.GetTypeCode: TypeCode;
begin
  Result := TypeCode.Object;
end;

function TIdDateTimeBase.ToInt16(AProvider: IFormatProvider): SmallInt;
begin
  Result := Trunc(ToOADate);
end;

function TIdDateTimeBase.ToInt32(AProvider: IFormatProvider): Integer;
begin
  Result := Trunc(ToOADate);
end;

function TIdDateTimeBase.ToSingle(AProvider: IFormatProvider): Single;
begin
  Result := ToOADate;
end;

function TIdDateTimeBase.ToDouble(AProvider: IFormatProvider): Double;
begin
  Result := ToOADate;
end;

function TIdDateTimeBase.ToDateTime(AProvider: IFormatProvider): DateTime;
begin
  Result := Self;
end;

function TIdDateTimeBase.ToBoolean(AProvider: IFormatProvider): Boolean;
begin
  Result := ToOADate <> 0;
end;

function TIdDateTimeBase.ToDecimal(AProvider: IFormatProvider): Decimal;
begin
  Result := Convert.ToDecimal(ToOADate);
end;

function TIdDateTimeBase.ToSByte(AProvider: IFormatProvider): ShortInt;
begin
  Result := Trunc(ToOADate);
end;

function TIdDateTimeBase.ToByte(AProvider: IFormatProvider): Byte;
begin
  Result := Trunc(ToOADate);
end;

function TIdDateTimeBase.ToUInt16(AProvider: IFormatProvider): Word;
begin
  Result := Trunc(ToOADate);
end;

function TIdDateTimeBase.ToUInt32(AProvider: IFormatProvider): LongWord;
begin
  Result := Trunc(ToOADate);
end;

function TIdDateTimeBase.ToInt64(AProvider: IFormatProvider): Int64;
begin
  Result := Trunc(ToOADate);
end;

function TIdDateTimeBase.ToUInt64(AProvider: IFormatProvider): UInt64;
begin
  Result := Convert.ToUInt64(ToOADate);
end;

function TIdDateTimeBase.ToChar(AProvider: IFormatProvider): Char;
begin
  Result := ToString(AProvider)[1];
end;

function TIdDateTimeBase.ToType(AType: System.Type; AProvider: IFormatProvider): TObject;
begin
  if AType = typeof(TIdDateTimeBase) then
    Result := Self
  else
    case System.Type.GetTypeCode(AType) of
      TypeCode.Empty:
        Result := FromOADate(0);
      // any others?
    else
      Result := (FValue as IConvertible).ToType(AType, AProvider);
    end;
end;

procedure TIdDateTimeBase.AddMSec(AMSec: Integer);
begin
  FValue := FValue.AddMilliseconds(AMSec);
end;

class operator TIdDateTimeBase.Implicit(
  const AValue: TDateTime): TIdDateTimeBase;
begin
  Result := TIdDateTimeBase.Create(AValue);
end;

class operator TIdDateTimeBase.Implicit(const AValue: TIdDateTimeBase): TDateTime;
begin
  Result := AValue.ToOADate;
end;

end.
