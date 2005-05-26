unit IdObjsFCL;

interface

uses
  System.Collections, System.Collections.Specialized, System.Text, System.IO,
  IdException;

type             
  TIdStringListFCL = class;
  TIdNetSeekOrigin = (soBeginning, soCurrent, soEnd);
  EReadError = Exception;
  EWriteError = Exception;
  TByteArray = array of Byte;
  TIdNetStream = class
  private
    function Skip(Amount: Integer): Integer;
    procedure SetPosition(const Pos: Int64);
  protected
    function GetPosition: Int64; virtual; abstract;
    function GetSize: Int64; virtual; abstract;
    procedure SetSize(NewSize: Int64); overload; virtual; abstract;
  public
    function Read(var Buffer: array of Byte; Offset, Count: Longint): Longint; overload; virtual; abstract;
    function Read(var Buffer: array of Byte; Count: Longint): Longint; overload;
    function Read(var Buffer: Byte): Longint; overload;
    function Read(var Buffer: Byte; Count: Longint): Longint; overload; 
    function Read(var Buffer: Boolean): Longint; overload;
    function Read(var Buffer: Boolean; Count: Longint): Longint; overload; 
    function Read(var Buffer: Char): Longint; overload;
    function Read(var Buffer: Char; Count: Longint): Longint; overload; 
    function Read(var Buffer: AnsiChar): Longint; overload;
    function Read(var Buffer: AnsiChar; Count: Longint): Longint; overload; 
    function Read(var Buffer: ShortInt): Longint; overload;
    function Read(var Buffer: ShortInt; Count: Longint): Longint; overload; 
    function Read(var Buffer: SmallInt): Longint; overload;
    function Read(var Buffer: SmallInt; Count: Longint): Longint; overload; 
    function Read(var Buffer: Word): Longint; overload;
    function Read(var Buffer: Word; Count: Longint): Longint; overload; 
    function Read(var Buffer: Integer): Longint; overload;
    function Read(var Buffer: Integer; Count: Longint): Longint; overload; 
    function Read(var Buffer: Cardinal): Longint; overload;
    function Read(var Buffer: Cardinal; Count: Longint): Longint; overload;
    function Read(var Buffer: Int64): Longint; overload;
    function Read(var Buffer: Int64; Count: Longint): Longint; overload; 
    function Read(var Buffer: UInt64): Longint; overload;
    function Read(var Buffer: UInt64; Count: Longint): Longint; overload; 
    function Read(var Buffer: Single): Longint; overload;
    function Read(var Buffer: Single; Count: Longint): Longint; overload; 
    function Read(var Buffer: Double): Longint; overload;
    function Read(var Buffer: Double; Count: Longint): Longint; overload; 
    function Read(var Buffer: Extended): Longint; overload;
    function Read(var Buffer: Extended; Count: Longint): Longint; overload; 
    function Write(const Buffer: array of Byte; Offset, Count: Longint): Longint; overload; virtual; abstract;
    function Write(const Buffer: array of Byte; Count: Longint): Longint; overload;
    function Write(const Buffer: Byte): Longint; overload;
    function Write(const Buffer: Byte; Count: Longint): Longint; overload; 
    function Write(const Buffer: Boolean): Longint; overload;
    function Write(const Buffer: Boolean; Count: Longint): Longint; overload; 
    function Write(const Buffer: Char): Longint; overload;
    function Write(const Buffer: Char; Count: Longint): Longint; overload; 
    function Write(const Buffer: AnsiChar): Longint; overload;
    function Write(const Buffer: AnsiChar; Count: Longint): Longint; overload; 
    function Write(const Buffer: ShortInt): Longint; overload;
    function Write(const Buffer: ShortInt; Count: Longint): Longint; overload; 
    function Write(const Buffer: SmallInt): Longint; overload;
    function Write(const Buffer: SmallInt; Count: Longint): Longint; overload; 
    function Write(const Buffer: Word): Longint; overload;
    function Write(const Buffer: Word; Count: Longint): Longint; overload; 
    function Write(const Buffer: Integer): Longint; overload;
    function Write(const Buffer: Integer; Count: Longint): Longint; overload; 
    function Write(const Buffer: Cardinal): Longint; overload;
    function Write(const Buffer: Cardinal; Count: Longint): Longint; overload; 
    function Write(const Buffer: Int64): Longint; overload;
    function Write(const Buffer: Int64; Count: Longint): Longint; overload; 
    function Write(const Buffer: UInt64): Longint; overload;
    function Write(const Buffer: UInt64; Count: Longint): Longint; overload; 
    function Write(const Buffer: Single): Longint; overload;
    function Write(const Buffer: Single; Count: Longint): Longint; overload; 
    function Write(const Buffer: Double): Longint; overload;
    function Write(const Buffer: Double; Count: Longint): Longint; overload; 
    function Write(const Buffer: Extended): Longint; overload; 
    function Write(const Buffer: Extended; Count: Longint): Longint; overload; 
    function Seek(const Offset: Int64; Origin: TIdNetSeekOrigin): Int64; overload; virtual; abstract;
    procedure ReadBuffer(Buffer: array of Byte; Count: Longint); overload;
    procedure ReadBuffer(var Buffer: Byte); overload;
    procedure ReadBuffer(var Buffer: Byte; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Boolean); overload;
    procedure ReadBuffer(var Buffer: Boolean; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Char); overload;
    procedure ReadBuffer(var Buffer: Char; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: AnsiChar); overload;
    procedure ReadBuffer(var Buffer: AnsiChar; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: ShortInt); overload;
    procedure ReadBuffer(var Buffer: ShortInt; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: SmallInt); overload;
    procedure ReadBuffer(var Buffer: SmallInt; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Word); overload;
    procedure ReadBuffer(var Buffer: Word; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Integer); overload;
    procedure ReadBuffer(var Buffer: Integer; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Cardinal); overload;
    procedure ReadBuffer(var Buffer: Cardinal; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Int64); overload;
    procedure ReadBuffer(var Buffer: Int64; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: UInt64); overload;
    procedure ReadBuffer(var Buffer: UInt64; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Single); overload;
    procedure ReadBuffer(var Buffer: Single; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Double); overload;
    procedure ReadBuffer(var Buffer: Double; Count: Longint); overload; 
    procedure ReadBuffer(var Buffer: Extended); overload; 
    procedure ReadBuffer(var Buffer: Extended; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: array of Byte; Count: Longint); overload;
    procedure WriteBuffer(const Buffer: Byte); overload;
    procedure WriteBuffer(const Buffer: Byte; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: Boolean); overload;
    procedure WriteBuffer(const Buffer: Boolean; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: Char); overload;
    procedure WriteBuffer(const Buffer: Char; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: AnsiChar); overload;
    procedure WriteBuffer(const Buffer: AnsiChar; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: ShortInt); overload;
    procedure WriteBuffer(const Buffer: ShortInt; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: SmallInt); overload;
    procedure WriteBuffer(const Buffer: SmallInt; Count: Longint); overload;
    procedure WriteBuffer(const Buffer: Word); overload;
    procedure WriteBuffer(const Buffer: Word; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: Integer); overload;
    procedure WriteBuffer(const Buffer: Integer; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: Cardinal); overload;
    procedure WriteBuffer(const Buffer: Cardinal; Count: Longint); overload; 
    procedure WriteBuffer(const Buffer: Int64); overload;
    procedure WriteBuffer(const Buffer: Int64; Count: Integer); overload; 
    procedure WriteBuffer(const Buffer: UInt64); overload;
    procedure WriteBuffer(const Buffer: UInt64; Count: Integer); overload; 
    procedure WriteBuffer(const Buffer: Single); overload;
    procedure WriteBuffer(const Buffer: Single; Count: Integer); overload; 
    procedure WriteBuffer(const Buffer: Double); overload;
    procedure WriteBuffer(const Buffer: Double; Count: Integer); overload;
    procedure WriteBuffer(const Buffer: Extended); overload;
    procedure WriteBuffer(const Buffer: Extended; Count: Integer); overload;
    function CopyFrom(Source: TIdNetStream; Count: Int64): Int64;
    class operator Implicit(const Value: TIdNetStream): System.IO.Stream;
    class operator Implicit(const Value: System.IO.Stream): TIdNetStream;
    property Position: Int64 read GetPosition write SetPosition;
    property Size: Int64 read GetSize write SetSize;
  end;

  TIdNetCLRStreamWrapper = class(TIdNetStream)
  protected
    FHandle: System.IO.Stream;
    procedure SetSize(AValue: Int64); override;
    function GetPosition: Int64; override;
    function GetSize: Int64; override;
  public
    constructor Create(AHandle: System.IO.Stream);
    destructor Destroy; override;
    function Read(var Buffer: array of Byte; Offset, Count: Longint): Longint; override;
    function Write(const Buffer: array of Byte; Offset, Count: Longint): Longint; override;
    function Seek(const Offset: Int64; Origin: TIdNetSeekOrigin): Int64; override;
    property Handle: System.IO.Stream read FHandle;
  end;

  TIdNetWrapperFCLStream = class(System.IO.Stream)
  protected
    FStream: System.IO.Stream;
  public
    constructor Create(Stream: TIdNetStream); overload;
    { overridden methods of System.IO.Stream }
    procedure Close; override;
    procedure Flush; override;
    function get_CanRead: Boolean; override;
    function get_CanSeek: Boolean; override;
    function get_CanWrite: Boolean; override;
    function get_Length: Int64; override;
    function get_Position: Int64; override;
    function Read(Buffer: array of Byte; Offset: Integer; Count: Integer): Integer; override;
    function Seek(Offset: Int64; Origin: System.IO.SeekOrigin): Int64; override;
    procedure SetLength(Value: Int64); override;
    procedure set_Position(Value: Int64); override;
    procedure Write(Buffer: array of Byte; Offset: Integer; Count: Integer); override;
    property CanRead: Boolean read get_CanRead;
    property CanSeek: Boolean read get_CanSeek;
    property CanWrite: Boolean read get_CanWrite;
    property Length: Int64 read get_Length;
    property Position: Int64 read get_Position write set_Position;
  public
    destructor Destroy; override;
    class function GetStream(Stream: TIdNetStream): System.IO.Stream; static;
  end;

  TIdNetMemoryStream = class(TIdNetStream)
  private
    FFCLStream: System.IO.MemoryStream;
  protected
    function GetPosition: Int64; override;
    function GetSize: Int64; override;
    procedure SetSize(AValue: Int64); override;
    function GetMemory: TByteArray;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function Read(var Buffer: array of Byte; Offset, Count: Longint): Longint; overload; override;
    function Write(const Buffer: array of Byte; Offset, Count: Longint): Longint; overload; override;
    function Seek(const Offset: Int64; Origin: TIdNetSeekOrigin): Int64; overload; override;
    property Memory: TByteArray read GetMemory;
  end;

  TIdNetStringStream = class(TIdNetMemoryStream)
  private
  protected
    function GetString: string;
  public
    constructor Create(const AString: string); reintroduce; overload;
    procedure WriteString(const AString: string);
    property DataString: string read GetString;
  end;

  TIdNetFileStream = class(TIdNetStream)
  strict private
    FFCLStream: System.IO.FileStream;
  protected
    function GetPosition: Int64; override;
    function GetSize: Int64; override;
    procedure SetSize(AValue: Int64); override;
  public
    constructor Create(const AFileName: string; const AMode: UInt16); reintroduce; overload;
    constructor Create(const AFileName: string; const AMode: UInt16; const ARight: Cardinal); reintroduce; overload;
    destructor Destroy; override;

    function Read(var Buffer: array of Byte; Offset, Count: Longint): Longint; overload; override;
    function Write(const Buffer: array of Byte; Offset, Count: Longint): Longint; overload; override;
    function Seek(const Offset: Int64; Origin: TIdNetSeekOrigin): Int64; overload; override;
  end;

  TIdStringListSortCompareFCL = function (AList: TIdStringListFCL; AIndex1, AIndex2: Integer) : Integer;
  TIdDuplicates = (duIgnore, duAccept, duError);
  EIdStringListErrorFCL = class(EIdException);
  TIdStringsDefined = set of (sdDelimiter, sdQuoteChar, sdNameValueSeparator);

  TIdStringsFCL = class(MarshalByRefObject, ICloneable, IEnumerable, ICollection)
  private
    FDefined: TIdStringsDefined;
    FDelimiter: Char;
    FQuoteChar: Char;
    FNameValueSeparator: Char;
    FUpdateCount: Integer;
    function GetCommaText: string;
    function AnsiQuotedStr(AValue: string; AQuote: string): string;
    function GetDelimitedText: string;
    function GetName(AIndex: Integer): string;
    function GetValue(AName: string): string;
    procedure SetCommaText(AValue: string);
    function AnsiExtractQuotedStr(AValue: string; AQuote: Char) : string;
    procedure SetDelimitedText(AValue: string);
    procedure SetValue(AName, AValue: string);
    function GetDelimiter: Char;
    procedure SetDelimiter(AValue: Char);
    function GetQuoteChar: Char;
    procedure SetQuoteChar(AValue: Char);
    function GetNameValueSeparator: Char;
    procedure SetNameValueSeparator(AValue: Char);
    function GetValueFromIndex(AIndex: Integer): string;
    procedure SetValueFromIndex(AIndex: Integer; AValue: string);
  protected
    function ExtractName(S: string): string;
    function GetCapacity: Integer; virtual;
    function GetCount: Integer; virtual; abstract;
    function GetObject(AIndex: Integer) : &Object; virtual;
    function GetTextStr: string; virtual;
    procedure PutObject(AIndex: Integer; AObject: &Object); virtual;
    procedure SetCapacity(ACapacity: Integer); virtual;
    procedure SetTextStr(AText: string); virtual;
    procedure SetUpdateState(AUpdating: Boolean); virtual;
    function Get(AIndex: Integer): string; overload; virtual; abstract;
    procedure Put(AIndex: Integer; AValue: string); overload; virtual;
    function CompareStrings(S1, S2: string): Integer; virtual;
    function GetIsSynchronized: Boolean;
    function GetSyncRoot: &Object;
    function GetIsFixedSize: Boolean;
    function GetIsReadOnly: Boolean;
    property UpdateCount: Integer read FUpdateCount;
  public
    constructor Create;

    class operator Implicit(const aValue: TIdStringsFCL): StringCollection;
    class operator Implicit(AValue: StringCollection): TIdStringsFCL;

    function Clone: &Object; virtual;
    function GetEnumerator: IEnumerator;
    procedure CopyTo(ADest: &Array; AIndex: Integer); virtual; abstract;
    function Add(AObject: &Object): Integer; overload;
    function Contains(AObject: &Object): Boolean;
    procedure Insert(AIndex: Integer; AObject: &Object); overload;
    function IndexOf(AObject: &Object): Integer; overload;
    procedure Remove(AObject: &Object);
    procedure RemoveAt(AIndex: Integer);
    function ToString: string; override;

    procedure SaveToStream(AStream: TIdNetStream);
    procedure SaveToFile(AFileName: string);
    procedure LoadFromStream(AStream: TIdNetStream);
    procedure LoadFromFile(AFileName: string);

    function Add(const S: string): Integer; overload; virtual;
    function AddObject(S: string; AObject: &Object) : Integer; virtual;
    procedure Append(S: string);
    procedure AddStrings(AStrings: TIdStringsFCL); virtual;
    procedure Assign(ASource: TIdStringsFCL); virtual;
    procedure BeginUpdate;
    procedure Clear; virtual; abstract;
    procedure Delete(AIndex: Integer); virtual; abstract;
    procedure EndUpdate;
    procedure Sort;
    function Equals(AObject: &Object) : Boolean; overload; override;
    function Equals(AStrings: TIdStringsFCL): Boolean; overload; 

    class operator Equal(AStrings1, AStrings2: TIdStringsFCL) : Boolean;
    class operator NotEqual(AStrings1, AStrings2: TIdStringsFCL) : Boolean;

    procedure Exchange(AIndex1, AIndex2: Integer); virtual;

    function GetText: string; virtual;
    function IndexOf(AValue: string): Integer; overload; virtual;
    function IndexOfName(AName: string): Integer; virtual;
    function IndexOfObject(AObject: &Object): Integer; virtual;
    procedure Insert(AIndex: Integer; const AValue: string); overload; virtual; abstract;
    procedure InsertObject(AIndex: Integer; AValue: string; AObject: &Object); virtual;
    procedure SetText(AText: string); virtual;

    property IsSynchronized: Boolean read GetIsSynchronized;
    property SyncRoot: &Object read GetSyncRoot;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property CommaText: string read GetCommaText write SetCommaText;
    property Count: Integer read GetCount;
    property Delimiter: Char read GetDelimiter write SetDelimiter;
    property DelimitedText: string read GetDelimitedText write SetDelimitedText;
    property Names[AIndex: Integer]: string read GetName;
    property Objects[AIndex: Integer]: &Object read GetObject write PutObject;
    property QuoteChar: Char read GetQuoteChar write SetQuoteChar;
    property Values[AName: string]: string read GetValue write SetValue;
    property ValuesFromIndex[AIndex: Integer]: string read GetValueFromIndex write SetValueFromIndex;
    property NameValueSeparator: Char read GetNameValueSeparator write SetNameValueSeparator;
    property Strings[AIndex: Integer]: string read Get write Put; default;
    property Text: string read GetTextStr write SetTextStr;
  end;

  TIdStringsFCLEnumerator = class(&Object, IEnumerator)
  private
    FIndex: Integer;
    FStrings: TIdStringsFCL;
  protected
    constructor Create(AStrings: TIdStringsFCL); reintroduce;
  public
    function get_Current: &Object;
    function MoveNext: Boolean;
    procedure Reset;
  end;

  TIdStringListFCL = class(TIdStringsFCL)
  protected
    FCollection: StringCollection;
    FObjectArray: ArrayList;

    //
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): &Object; override;
    procedure PutObject(AIndex: Integer; AObject: &Object); override;
  public
    function Add(const S: string): Integer; overload; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  public
    constructor Create(AValue: StringCollection); reintroduce; overload;
    constructor Create(); overload;
    procedure CopyTo(ADest: &Array; AIndex: Integer); override;
    destructor Destroy; override;
    procedure Clear; override;

    class operator Implicit(const aValue: TIdStringListFCL): StringCollection;
  end;

implementation

const
  MaxBufSize = 5 * 1024;
  IfmCreate         = $FFFF;
  IfmOpenRead       = $0000;
  IfmOpenWrite      = $0001;
  IfmOpenReadWrite  = $0002;
  IfmShareExclusive = $0010;
  IfmShareDenyWrite = $0020;
  IfmShareDenyNone  = $0040;

resourcestring
  SReadError = 'Read Error.';
  SWriteError = 'Write Error.';

{ TIdStringsFCL }

function TIdStringsFCL.IndexOf(AValue: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
  begin
    if CompareStrings(AValue, Get(I)) = 0 then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

function TIdStringsFCL.IndexOf(AObject: &Object): Integer;
begin
  Result := IndexOf(string(AObject));
end;

function TIdStringsFCL.IndexOfName(AName: string): Integer;
var
  I: Integer;
  S: string;
  P: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
  begin
    S := Get(I);
    P := S.IndexOf(NameValueSeparator);
    if (P > 0) and (S.Substring(0, P) = AName) then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TIdStringsFCL.AddObject(S: string; AObject: &Object): Integer;
begin
  Result := GetCount;
  Insert(Result, S);
  PutObject(Result, AObject);
end;

function TIdStringsFCL.GetIsFixedSize: Boolean;
begin
  Result := False;
end;

function TIdStringsFCL.ExtractName(S: string): string;
var
  P: Integer;
begin
  P := S.IndexOf(NameValueSeparator);
  Result := '';
  if P > 0 then
  begin
    Result := S.Substring(0, P - 1);
  end;
end;

function TIdStringsFCL.GetDelimiter: Char;
begin
  if not (sdDelimiter in FDefined) then
  begin
    Delimiter := ',';
  end;
  Result := FDelimiter;
end;

function TIdStringsFCL.Add(const S: string): Integer;
begin
  Result := AddObject(S, nil);
end;

function TIdStringsFCL.Add(AObject: &Object): Integer;
begin
  Result := Add(string(AObject));
end;

function TIdStringsFCL.GetCapacity: Integer;
begin
  Result := Count;
end;

procedure TIdStringsFCL.SetUpdateState(AUpdating: Boolean);
begin
end;

function TIdStringsFCL.AnsiQuotedStr(AValue, AQuote: string): string;
begin
  if AValue.StartsWith(AQuote) then
  begin
    if AValue.EndsWith(AQuote) then
    begin
      Result := AValue;
    end
    else
    begin
      Result := AValue + AQuote;
    end;
  end
  else
  begin
    if AValue.EndsWith(AQuote) then
    begin
      Result := AQuote + AValue;
    end
    else
    begin
      Result := AQuote + AValue + AQuote;
    end;
  end;
end;

function TIdStringsFCL.GetSyncRoot: &Object;
begin
  Result := Self;
end;

procedure TIdStringsFCL.SetTextStr(AText: string);
var
  NL: string;
  I: Integer;
  oi: Integer;
begin
  BeginUpdate;
  try
    Clear;
    NL := Environment.NewLine;
    I := 0;
    while (I <> -1) and (I < AText.Length) do
    begin
      oi := I;
      I := AText.IndexOf(NL, I);
      if I <> -1 then
      begin
        Add(AText.Substring(oi, I - oi));
      end
      else
      begin
        Add(AText.Substring(oi));
        Exit;
      end;
    end;
  finally
    EndUpdate;
  end;
end;

function TIdStringsFCL.GetQuoteChar: Char;
begin
  if not (sdQuoteChar in FDefined) then
  begin
    QuoteChar := '"';
  end;
  Result := QuoteChar;
end;

function TIdStringsFCL.AnsiExtractQuotedStr(AValue: string; AQuote: Char): string;
var
  I: Integer;
begin
  I := AValue.IndexOf(AQuote);
  if I <> -1 then
  begin
    Result := AValue.Substring(0, I);
  end
  else
  begin
    Result := AValue;
  end;
end;

function TIdStringsFCL.GetValueFromIndex(AIndex: Integer): string;
begin
  if AIndex > -1 then
  begin
    Result := Get(AIndex).Substring(Names[AIndex].Length + 2);
  end
  else
  begin
    Result := '';
  end;
end;

procedure TIdStringsFCL.Assign(ASource: TIdStringsFCL);
begin
  BeginUpdate;
  try
    Clear;
    FDefined := ASource.FDefined;
    FNameValueSeparator := ASource.FNameValueSeparator;
    FQuoteChar := ASource.FQuoteChar;
    FDelimiter := ASource.FDelimiter;
    AddStrings(ASource);
  finally
    EndUpdate;
  end;
end;

function TIdStringsFCL.GetIsReadOnly: Boolean;
begin
  Result := False;
end;

function TIdStringsFCL.Equals(AStrings: TIdStringsFCL): Boolean;
var
  I: Integer;
begin
  if Count <> AStrings.Count then
  begin
    Result := False;
    Exit;
  end;

  for I := 0 to Count - 1 do
  begin
    if Get(I) <> AStrings.Get(I) then
    begin
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function TIdStringsFCL.Equals(AObject: &Object): Boolean;
begin
  if AObject is TIdStringsFCL then
  begin
    Result := Equals(TIdStringsFCL(AObject));
  end
  else
  begin
    Result := False;
  end;
end;

function TIdStringsFCL.GetValue(AName: string): string;
var
  I: Integer;
begin
  Result := '';
  I := IndexOfName(AName);
  if I > -1 then
  begin
    Result := Get(I).Substring(AName.Length + 1);
  end;
end;

procedure TIdStringsFCL.Exchange(AIndex1, AIndex2: Integer);
var
  DummyStr: string;
  DummyObj: &Object;
begin
  BeginUpdate;
  try
    DummyStr := Strings[AIndex1];
    DummyObj := Objects[AIndex1];
    Strings[AIndex1] := Strings[AIndex2];
    Objects[AIndex1] := Objects[AIndex2];
    Strings[AIndex2] := DummyStr;
    Objects[AIndex2] := DummyObj;
  finally
    EndUpdate;
  end;
end;

function TIdStringsFCL.CompareStrings(S1, S2: string): Integer;
begin
  Result := S1.CompareTo(S2);
end;

procedure TIdStringsFCL.SetDelimiter(AValue: Char);
begin
  if (    (FDelimiter <> AValue)
      or  (not (sdDelimiter in FDefined))
      ) then
  begin
    Include(FDefined, sdDelimiter);
    FDelimiter := AValue;
  end;
end;

function TIdStringsFCL.GetText: string;
begin
  Result := GetTextStr;
end;

function TIdStringsFCL.GetNameValueSeparator: Char;
begin
  if not (sdNameValueSeparator in FDefined) then
  begin
    NameValueSeparator := '=';
  end;
  Result := FNameValueSeparator;
end;

function TIdStringsFCL.GetIsSynchronized: Boolean;
begin
  Result := False;
end;

procedure TIdStringsFCL.SetCapacity(ACapacity: Integer);
begin
end;

procedure TIdStringsFCL.PutObject(AIndex: Integer; AObject: &Object);
begin

end;

function TIdStringsFCL.GetDelimitedText: string;
var
  LCount: Integer;
  I: Integer;
  S: string;
  P: Integer;
begin
  LCount := GetCount;
  Result := '';
  if (LCount = 1) and
     (Get(0) = '') then
  begin
    Result := QuoteChar.ToString;
  end
  else
  begin
    for I := 0 to Count - 1 do
    begin
      S := Get(I);
      P := 0;
      while (P < S.Length)
        and (S[p] > ' ')
        and (S[p] <> QuoteChar)
        and (S[p] <> Delimiter) do
      begin
        Inc(P);
      end;
      if (P < S.Length) and (S[P] <> #0) then
      begin
        S := AnsiQuotedStr(S, '' + QuoteChar);
      end;
      Result := Result + S + Delimiter;
    end;
  end;
  Result := Result.Substring(0, Result.Length - 1);
end;

function TIdStringsFCL.GetCommaText: string;
var
  OldDefined: TIdStringsDefined;
  OldDelim: Char;
  OldQuote: Char;
begin
  OldDefined := FDefined;
  OldDelim := FDelimiter;
  OldQuote := FQuoteChar;
  FDelimiter := ',';
  FQuoteChar := '"';
  try
    Result := GetDelimitedText;
  finally
    FDelimiter := OldDelim;
    FQuoteChar := OldQuote;
    FDefined := OldDefined;
  end;
end;

function TIdStringsFCL.Contains(AObject: &Object): Boolean;
begin
  Result := IndexOf(&String(AObject)) <> -1;
end;

function TIdStringsFCL.GetEnumerator: IEnumerator;
begin
  Result := TIdStringsFCLEnumerator.Create(Self);
end;

procedure TIdStringsFCL.Put(AIndex: Integer; AValue: string);
var
  Dummy: &Object;
begin
  Dummy := GetObject(AIndex);
  Delete(AIndex);
  InsertObject(AIndex, AValue, Dummy);
end;

function TIdStringsFCL.GetObject(AIndex: Integer): &Object;
begin
  Result := nil;
end;

procedure TIdStringsFCL.SetQuoteChar(AValue: Char);
begin
  if (not (sdQuoteChar in FDefined)) or (FQuoteChar <> AValue) then
  begin
    Include(FDefined, sdQuoteChar);
    FQuoteChar := AValue;
  end;
end;

class operator TIdStringsFCL.Equal(AStrings1,
  AStrings2: TIdStringsFCL): Boolean;
begin
  Result := AStrings1.Equals(AStrings2);
end;

procedure TIdStringsFCL.SetValueFromIndex(AIndex: Integer; AValue: string);
begin
  if AValue <> '' then
  begin
    if AIndex < 0 then
    begin
      AIndex := Add('');
    end;
    Put(AIndex, Names[AIndex] + NameValueSeparator + AValue);
  end
  else
  begin
    if AIndex >= 0 then
    begin
      Delete(AIndex)
    end;
  end;
end;

procedure TIdStringsFCL.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then
  begin
    SetUpdateState(False);
  end;
end;

procedure TIdStringsFCL.Remove(AObject: &Object);
begin
  Delete(IndexOf(AObject));
end;

function TIdStringsFCL.GetName(AIndex: Integer): string;
begin
  Result := ExtractName(Get(AIndex));
end;

class operator TIdStringsFCL.NotEqual(AStrings1,
  AStrings2: TIdStringsFCL): Boolean;
begin
  Result := not AStrings1.Equals(AStrings2);
end;

procedure TIdStringsFCL.AddStrings(AStrings: TIdStringsFCL);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to AStrings.Count - 1 do
    begin
      AddObject(AStrings[I], AStrings.Objects[I]);
    end;
  finally
    EndUpdate;
  end;
end;

procedure TIdStringsFCL.SetValue(AName, AValue: string);
var
  I: Integer;
begin
  I := IndexOfName(AName);
  if AValue <> '' then
  begin
    if I < 0 then
    begin
      I := Add('');
    end;
    Put(I, AName + NameValueSeparator + AValue);
  end
  else
  begin
    if I >= 0 then
      Delete(I);
  end;
end;

procedure TIdStringsFCL.Append(S: string);
begin
  Add(S);
end;

procedure TIdStringsFCL.SetText(AText: string);
begin
  SetTextStr(AText);
end;

procedure TIdStringsFCL.InsertObject(AIndex: Integer; AValue: string;
  AObject: &Object);
begin
  Insert(AIndex, AValue);
	PutObject(AIndex, AObject);
end;

function TIdStringsFCL.GetTextStr: string;
var
  NL: string;
  sb: StringBuilder;
  LCount: Integer;
  I: Integer;
begin
  NL := Environment.NewLine;
  sb := StringBuilder.Create;
  LCount := GetCount;
  for I := 0 to LCount - 1 do
  begin
    sb.Append(Get(i) + NL);
  end;
  Result := sb.ToString;
end;

procedure TIdStringsFCL.SetNameValueSeparator(AValue: Char);
begin
  if (FQuoteChar <> AValue) or
     (not (sdNameValueSeparator in FDefined)) then
  begin
    Include(FDefined, sdNameValueSeparator);
    FNameValueSeparator := AValue;
  end;
end;

function TIdStringsFCL.IndexOfObject(AObject: &Object): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
  begin
    if AObject = GetObject(I) then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

function TIdStringsFCL.ToString: string;
begin
  Result := Text;
end;

procedure TIdStringsFCL.SetDelimitedText(AValue: string);
var
  S: string;
  P: Integer;
  P1: Integer;
begin
  BeginUpdate;
  try
    Clear;
    P := 0;
    while (P < AValue.Length)
      and (AValue[P] > #0)
      and (AValue[P] <= ' ') do
    begin
      Inc(P);
    end;
    while P < AValue.Length do
    begin
      if AValue[P] = QuoteChar then
      begin
        S := AnsiExtractQuotedStr(AValue.Substring(P), QuoteChar);
      end
      else
      begin
        P1 := P;
        while (P < AValue.Length)
          and (AValue[P] > ' ')
          and (AValue[P] <> Delimiter) do
        begin
          Inc(P);
        end;
        S := AValue.Substring(P1, P - P1);
      end;
      Add(S);
      while (P < AValue.Length)
        and (AValue[P] > #0)
        and (AValue[P] <= ' ') do
      begin
        Inc(P);
      end;
      if (P < AValue.Length) and
         (AValue[P] = Delimiter) then
      begin
        if (P + 1) >= AValue.Length then
        begin
          Add('');
        end;
        repeat
          Inc(P);
        until not (   (P < AValue.Length)
                  and (AValue[P] > #0)
                  and (AValue[P] <= ' '));
      end;
    end;
  finally
    EndUpdate;
  end;
end;

procedure TIdStringsFCL.SetCommaText(AValue: string);
begin
  FDelimiter := ',';
  FQuoteChar := '"';
  SetDelimitedText(AValue);
end;

procedure TIdStringsFCL.BeginUpdate;
begin
  if FUpdateCount = 0 then
  begin
    SetUpdateState(True);
  end;
  Inc(FUpdateCount);
end;

procedure TIdStringsFCL.RemoveAt(AIndex: Integer);
begin
  Delete(AIndex);
end;

procedure TIdStringsFCL.Insert(AIndex: Integer; AObject: &Object);
begin
  Insert(AIndex, &String(AObject));
end;

constructor TIdStringsFCL.Create;
begin
  inherited;
  FDelimiter := ',';
  FQuoteChar := '"';
  FNameValueSeparator := '=';
  FUpdateCount := 0;
end;

class operator TIdStringsFCL.Implicit(AValue: StringCollection): TIdStringsFCL;
begin
  Result := TIdStringListFCL.Create(AValue);
end;

function TIdStringsFCL.Clone: &Object;
var
  sl: TIdStringsFCL;
begin
  sl := TIdStringListFCL.Create;
  sl.Assign(Self);
  Result := sl;
end;

class operator TIdStringsFCL.Implicit(const aValue: TIdStringsFCL): StringCollection;
begin
  EIdException.IfFalse(aValue is TIdStringListFCL, 'Invalid implicit conversion.');
  Result := TIdStringListFCL(aValue).FCollection;
end;

procedure TIdStringsFCL.SaveToStream(AStream: TIdNetStream);
begin
  raise NotImplementedException.Create;
end;

procedure TIdStringsFCL.Sort;
begin
  //
end;

procedure TIdStringsFCL.LoadFromFile(AFileName: string);
begin
  raise NotImplementedException.Create;
end;

procedure TIdStringsFCL.SaveToFile(AFileName: string);
begin
  raise NotImplementedException.Create;
end;

procedure TIdStringsFCL.LoadFromStream(AStream: TIdNetStream);
begin
  raise NotImplementedException.Create;
end;

{ TIdStringsFCLEnumerator }

constructor TIdStringsFCLEnumerator.Create(AStrings: TIdStringsFCL);
begin
  inherited Create;
  FStrings := AStrings;
  Reset;
end;

procedure TIdStringsFCLEnumerator.Reset;
begin
  FIndex := -1;
end;

function TIdStringsFCLEnumerator.get_Current: &Object;
begin
  Result := FStrings[FIndex];
end;

function TIdStringsFCLEnumerator.MoveNext: Boolean;
begin
  if FIndex < FStrings.Count then
  begin
    Inc(FIndex);
  end;
  Result := FIndex < FStrings.Count;
end;

{ TIdStringListFCL }

class operator TIdStringListFCL.Implicit(const aValue: TIdStringListFCL): StringCollection;
begin
  Result := aValue.FCollection;
end;

function TIdStringListFCL.GetCount: Integer;
begin
  Result := FCollection.Count;
end;

constructor TIdStringListFCL.Create;
begin
  Create(StringCollection.Create);
end;

constructor TIdStringListFCL.Create(AValue: StringCollection);
begin
  inherited Create;
  FObjectArray := ArrayList.Create;
  FCollection := AValue;
end;

function TIdStringListFCL.Add(const S: string): Integer;
begin
  Result := AddObject(S, nil);
end;

procedure TIdStringListFCL.PutObject(AIndex: Integer; AObject: &Object);
begin
  if (AIndex < 0) or
     (AIndex >= FCollection.Count) then
  begin
    EIdStringListErrorFCL.Toss('List index out of bounds (' + AIndex.ToString() + ')');
  end;

  //Changing;
  FObjectArray[AIndex] := AObject;
  //Changed;
end;

function TIdStringListFCL.GetObject(Index: Integer): &Object;
begin
  Result := FObjectArray.Item[Index];
end;

function TIdStringListFCL.Get(Index: Integer): string;
begin
  Result := FCollection.Item[Index];
end;

procedure TIdStringListFCL.Delete(Index: Integer);
begin
  if (Index >= 0) and (Index < Count) then
  begin
    FObjectArray.RemoveAt(Index);
    FCollection.RemoveAt(Index);
  end;
end;

procedure TIdStringListFCL.Clear;
begin
  FObjectArray.Clear;
  FCollection.Clear;
end;

destructor TIdStringListFCL.Destroy;
begin
  Clear;
  inherited;
end;

procedure TIdStringListFCL.Insert(Index: Integer; const S: string);
begin
  FCollection.Insert(Index, S);
  FObjectArray.Insert(Index, nil);
  PutObject(Index, nil);
end;

procedure TIdStringListFCL.CopyTo(ADest: &Array; AIndex: Integer);
begin
  raise NotImplementedException.Create;
end;

{ TIdNetStream }

procedure TIdNetStream.SetPosition(const Pos: Int64);
begin
  Seek(Pos, soBeginning);
end;

procedure TIdNetStream.ReadBuffer(Buffer: array of Byte; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Byte);
begin
  if Read(Buffer) <> SizeOf(Byte) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Byte; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Boolean);
begin
  if Read(Buffer) <> SizeOf(Boolean) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Boolean; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Char);
begin
  if Read(Buffer) <> SizeOf(Char) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Char; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: AnsiChar);
begin
  if Read(Buffer) <> SizeOf(AnsiChar) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: AnsiChar; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: ShortInt);
begin
  if Read(Buffer) <> SizeOf(ShortInt) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: ShortInt; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: SmallInt);
begin
  if Read(Buffer) <> SizeOf(SmallInt) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: SmallInt; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Word);
begin
  if Read(Buffer) <> SizeOf(Word) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Word; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Integer);
begin
  if Read(Buffer) <> SizeOf(Integer) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Integer; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Cardinal);
begin
  if Read(Buffer) <> SizeOf(Cardinal) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Cardinal; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Int64);
begin
  if Read(Buffer) <> SizeOf(Int64) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Int64; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: UInt64);
begin
  if Read(Buffer) <> SizeOf(UInt64) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: UInt64; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Single);
begin
  if Read(Buffer) <> SizeOf(Single) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Single; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Double);
begin
  if Read(Buffer) <> SizeOf(Double) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Double; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Extended);
begin
  if Read(Buffer) <> 10 then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.ReadBuffer(var Buffer: Extended; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    raise EReadError.Create(SReadError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: array of Byte; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Byte);
begin
  if Write(Buffer) <> SizeOf(Byte) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Byte; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Boolean);
begin
  if Write(Buffer) <> SizeOf(Boolean) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Boolean; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Char);
begin
  if Write(Buffer) <> SizeOf(Char) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Char; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: AnsiChar);
begin
  if Write(Buffer) <> SizeOf(AnsiChar) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: AnsiChar; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: ShortInt);
begin
  if Write(Buffer) <> SizeOf(ShortInt) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: ShortInt; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: SmallInt);
begin
  if Write(Buffer) <> SizeOf(SmallInt) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: SmallInt; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Word);
begin
  if Write(Buffer) <> SizeOf(Word) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Word; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Integer);
begin
  if Write(Buffer, 4) <> 4 then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Integer; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Cardinal);
begin
  if Write(Buffer) <> SizeOf(Cardinal) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Cardinal; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Int64);
begin
  if Write(Buffer) <> SizeOf(Int64) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Int64; Count: Integer);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: UInt64);
begin
  if Write(Buffer) <> SizeOf(UInt64) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: UInt64; Count: Integer);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Single);
begin
  if Write(Buffer) <> SizeOf(Single) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Single; Count: Integer);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Double);
begin
  if Write(Buffer) <> SizeOf(Double) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Double; Count: Integer);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Extended);
begin
  if Write(Buffer) <> 10 then
    raise EWriteError.Create(SWriteError);
end;

procedure TIdNetStream.WriteBuffer(const Buffer: Extended; Count: Integer);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    raise EWriteError.Create(SWriteError);
end;

function TIdNetStream.CopyFrom(Source: TIdNetStream; Count: Int64): Int64;
var
  BufSize, N: Integer;
  Buffer: array of Byte;
begin
  if Count = 0 then
  begin
    Source.Position := 0;
    Count := Source.Size;
  end;
  Result := Count;
  if Count > MaxBufSize then
    BufSize := MaxBufSize
  else
    BufSize := Count;
  SetLength(Buffer, BufSize);
  while Count <> 0 do
  begin
    if Count > BufSize then
      N := BufSize
    else
      N := Count;
    Source.ReadBuffer(Buffer, N);
    WriteBuffer(Buffer, N);
    Dec(Count, N);
  end;
end;

class operator TIdNetStream.Implicit(const Value: TIdNetStream): System.IO.Stream;
begin
  if Value is TIdNetCLRStreamWrapper then
    Result := TIdNetCLRStreamWrapper(Value).Handle
  else
    Result := TIdNetWrapperFCLStream.Create(Value);
end;

class operator TIdNetStream.Implicit(const Value: System.IO.Stream): TIdNetStream;
begin
  Result := TIdNetCLRStreamWrapper.Create(Value);
end;

function TIdNetStream.Read(var Buffer: array of Byte; Count: Longint): Longint;
begin
  Result := Read(Buffer, 0, Count);
end;

function TIdNetStream.Read(var Buffer: Byte): Longint;
var
  Buf: array[] of System.Byte;
begin
  Result := Read(Buf, 0, 1);
  Buffer := Buf[0];
end;

function TIdNetStream.Read(var Buffer: Byte; Count: Longint): Longint;
var
  Buf: array[] of Byte;
begin
  if Count <> 0 then
  begin
    Result := Read(Buf, 1);
    if Count > 1 then
      Inc(Result, Skip(Count - 1));
    Buffer := Buf[0];
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: Boolean): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 1);
  Buffer := Boolean(Buf[0]);
end;

function TIdNetStream.Read(var Buffer: Boolean; Count: Longint): Longint;
var
  Buf: array[] of Byte;
begin
  if Count <> 0 then
  begin
    Result := Read(Buf, 1);
    if Count > 1 then
      Inc(Result, Skip(Count - 1));
    Buffer := Boolean(Buf[0]);
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: Char): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 2);
  Buffer := Char(Buf[0] or Buf[1] shl 8);
end;

function TIdNetStream.Read(var Buffer: Char; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  S: Integer;
begin
  S := 0;
  if Count > 2 then
  begin
    S := Count - 2;
    Count := 2;
  end;
  if Count <> 0 then
  begin
    Buf[1] := 0;
    Result := Read(Buf, Count);
    Buffer := Char(Buf[0] or Buf[1] shl 8);
    if S <> 0 then
      Inc(Result, Skip(S));
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: AnsiChar): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 1);
  Buffer := AnsiChar(Buf[0]);
end;

function TIdNetStream.Read(var Buffer: AnsiChar; Count: Longint): Longint;
var
  Buf: array[] of Byte;
begin
  if Count <> 0 then
  begin
    Result := Read(Buf, 1);
    if Count > 1 then
      Inc(Result, Skip(Count - 1));
    Buffer := AnsiChar(Buf[0]);
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: ShortInt): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 1);
  Buffer := ShortInt(Buf[0]);
end;

function TIdNetStream.Read(var Buffer: ShortInt; Count: Longint): Longint;
var
  Buf: array[] of Byte;
begin
  if Count <> 0 then
  begin
    Result := Read(Buf, 1);
    if Count > 1 then
      Inc(Result, Skip(Count - 1));
    Buffer := ShortInt(Buf[0]);
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: SmallInt): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 2);
  Buffer := SmallInt(Buf[0] or (Buf[1] shl 8));
end;

function TIdNetStream.Read(var Buffer: SmallInt; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  S: Integer;
begin
  S := 0;
  if Count > 2 then
  begin
    S := Count - 2;
    Count := 2;
  end;
  if Count <> 0 then
  begin
    Buf[1] := 0;
    Result := Read(Buf, Count);
    Buffer := SmallInt(Buf[0] or (Buf[1] shl 8));
    if S <> 0 then
      Inc(Result, Skip(S));
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: Word): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 2);
  Buffer := Word(Buf[0] or (Buf[1] shl 8));
end;

function TIdNetStream.Read(var Buffer: Word; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  S: Integer;
begin
  S := 0;
  if Count > 2 then
  begin
    S := Count - 2;
    Count := 2;
  end;
  if Count <> 0 then
  begin
    Buf[1] := 0;
    Result := Read(Buf, Count);
    Buffer := Word(Buf[0] or (Buf[1] shl 8));
    if S <> 0 then
      Inc(Result, Skip(S));
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: Integer): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 4);
  Buffer := Integer(Buf[0] or (Buf[1] shl 8) or (Buf[2] shl 16) or (Buf[3] shl 24));
end;

function TIdNetStream.Read(var Buffer: Integer; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  S: Integer;
begin
  S := 0;
  if Count > 4 then
  begin
    S := Count - 4;
    Count := 4;
  end;
  if Count <> 0 then
  begin
    Buf[1] := 0;
    Buf[2] := 0;
    Buf[3] := 0;
    Result := Read(Buf, Count);
    Buffer := Integer(Buf[0] or (Buf[1] shl 8) or (Buf[2] shl 16) or (Buf[3] shl 24));
    if S <> 0 then
      Inc(Result, Skip(S));
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: Cardinal): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 4);
  Buffer := Cardinal(Buf[0] or (Buf[1] shl 8) or (Buf[2] shl 16) or (Buf[3] shl 24));
end;

function TIdNetStream.Read(var Buffer: Cardinal; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  S: Integer;
begin
  S := 0;
  if Count > 4 then
  begin
    S := Count - 4;
    Count := 4;
  end;
  if Count <> 0 then
  begin
    Buf[1] := 0;
    Buf[2] := 0;
    Buf[3] := 0;
    Result := Read(Buf, Count);
    Buffer := Cardinal(Buf[0] or (Buf[1] shl 8) or (Buf[2] shl 16) or (Buf[3] shl 24));
    if S <> 0 then
      Inc(Result, Skip(S));
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: Int64): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 8);
  Buffer := Int64(Buf[0]) or (Int64(Buf[1]) shl 8) or
      (Int64(Buf[2]) shl 16) or (Int64(Buf[3]) shl 24) or
      (Int64(Buf[4]) shl 32) or (Int64(Buf[5]) shl 40) or
      (Int64(Buf[6]) shl 48) or (Int64(Buf[7]) shl 56);
end;

function TIdNetStream.Read(var Buffer: Int64; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  S: Integer;
begin
  S := 0;
  if Count > 8 then
  begin
    S := Count - 8;
    Count := 8;
  end;
  if Count <> 0 then
  begin
    Buf[1] := 0;
    Buf[2] := 0;
    Buf[3] := 0;
    Buf[4] := 0;
    Buf[5] := 0;
    Buf[6] := 0;
    Buf[7] := 0;
    Result := Read(Buf, Count);
    Buffer := Int64(Buf[0]) or (Int64(Buf[1]) shl 8) or
        (Int64(Buf[2]) shl 16) or (Int64(Buf[3]) shl 24) or
        (Int64(Buf[4]) shl 32) or (Int64(Buf[5]) shl 40) or
        (Int64(Buf[6]) shl 48) or (Int64(Buf[7]) shl 56);
    if S <> 0 then
      Inc(Result, Skip(S));
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: UInt64): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 8);
  Buffer := Int64(Buf[0]) or (Int64(Buf[1]) shl 8) or
      (Int64(Buf[2]) shl 16) or (Int64(Buf[3]) shl 24) or
      (Int64(Buf[4]) shl 32) or (Int64(Buf[5]) shl 40) or
      (Int64(Buf[6]) shl 48) or (Int64(Buf[7]) shl 56);
end;

function TIdNetStream.Read(var Buffer: UInt64; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  S: Integer;
begin
  S := 0;
  if Count > 8 then
  begin
    S := Count - 8;
    Count := 8;
  end;
  if Count <> 0 then
  begin
    Buf[1] := 0;
    Buf[2] := 0;
    Buf[3] := 0;
    Buf[4] := 0;
    Buf[5] := 0;
    Buf[6] := 0;
    Buf[7] := 0;
    Result := Read(Buf, Count);
    Buffer := Int64(Buf[0]) or (Int64(Buf[1]) shl 8) or
        (Int64(Buf[2]) shl 16) or (Int64(Buf[3]) shl 24) or
        (Int64(Buf[4]) shl 32) or (Int64(Buf[5]) shl 40) or
        (Int64(Buf[6]) shl 48) or (Int64(Buf[7]) shl 56);
    if S <> 0 then
      Inc(Result, Skip(S));
  end
  else
    Result := 0;
end;

function TIdNetStream.Read(var Buffer: Single): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 4);
  Buffer := BitConverter.ToSingle(Buf, 0);
end;

function TIdNetStream.Read(var Buffer: Single; Count: Longint): Longint;
var
  Buf: array[] of Byte;
begin
  if Count <> 4 then
  begin
    Buffer := 0;
    Result := Skip(Count);
  end
  else
  begin
    Result := Read(Buf, 4);
    Buffer := BitConverter.ToSingle(Buf, 0);
  end;
end;

function TIdNetStream.Read(var Buffer: Double): Longint;
var
  Buf: array[] of Byte;
begin
  Result := Read(Buf, 8);
  Buffer := BitConverter.ToDouble(Buf, 0);
end;

function TIdNetStream.Read(var Buffer: Double; Count: Longint): Longint;
var
  Buf: array[] of Byte;
begin
  if Count = 8 then
  begin
    Result := Read(Buf, 8);
    Buffer := BitConverter.ToDouble(Buf, 0);
  end
  else
  begin
    Buffer := 0;
    Result := Skip(Count);
  end;
end;

function TIdNetStream.Read(var Buffer: Extended): Longint;
var
  Buf: array[] of Byte;
begin
  // Read Win32 compatible extended
  Result := Read(Buf, 10);
  Buffer := ExtendedAsBytesToDouble(Buf);
end;

function TIdNetStream.Read(var Buffer: Extended; Count: Longint): Longint;
var
  Buf: array[] of Byte;
begin
  if Count = SizeOf(Double) then
  begin
    Result := Read(Buf, SizeOf(Double));
    Buffer := BitConverter.ToDouble(Buf, 0);
  end
  else if Count = 10 then
  begin
    // Read Win32 compatible extended
    Result := Read(Buf, 10);
    Buffer := ExtendedAsBytesToDouble(Buf);
  end
  else
  begin
    Buffer := 0;
    Result := Skip(Count);
  end;
end;

function TIdNetStream.Skip(Amount: Integer): Integer;
var
  P: Integer;
begin
  P := Position;
  Result := Seek(Amount, soCurrent) - P;
end;

function TIdNetStream.Write(const Buffer: array of Byte; Count: Longint): Longint;
begin
  Result := Write(Buffer, 0, Count);
end;

function TIdNetStream.Write(const Buffer: Byte): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Buffer;
  Result := Write(Buf, 1);
end;

function TIdNetStream.Write(const Buffer: Byte; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 1 then
    C := 1;
  Buf[0] := Buffer;
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Boolean): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Byte(Buffer);
  Result := Write(Buf, 1);
end;

function TIdNetStream.Write(const Buffer: Boolean; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 1 then
    C := 1;
  Buf[0] := Byte(Buffer);
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Char): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Word(Buffer) and $FF;
  Buf[1] := (Word(Buffer) shr 8) and $FF;
  Result := Write(Buf, 2);
end;

function TIdNetStream.Write(const Buffer: Char; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 2 then
    C := 2;
  Buf[0] := Word(Buffer) and $FF;
  Buf[1] := (Word(Buffer) shr 8) and $FF;
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: AnsiChar): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Byte(Buffer);
  Result := Write(Buf, 1);
end;

function TIdNetStream.Write(const Buffer: AnsiChar; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 1 then
    C := 1;
  Buf[0] := Byte(Buffer);
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: ShortInt): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Buffer;
  Result := Write(Buf, 1);
end;

function TIdNetStream.Write(const Buffer: ShortInt; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 1 then
    C := 1;
  Buf[0] := Buffer;
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: SmallInt): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Buffer and $FF;
  Buf[1] := (Buffer shr 8) and $FF;
  Result := Write(Buf, 2);
end;

function TIdNetStream.Write(const Buffer: SmallInt; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 2 then
    C := 2;
  Buf[0] := Buffer and $FF;
  Buf[1] := (Buffer shr 8) and $FF;
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Word): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Word(Buffer) and $FF;
  Buf[1] := (Word(Buffer) shr 8) and $FF;
  Result := Write(Buf, 2);
end;

function TIdNetStream.Write(const Buffer: Word; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 2 then
    C := 2;
  Buf[0] := Word(Buffer) and $FF;
  Buf[1] := (Word(Buffer) shr 8) and $FF;
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Integer): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Buffer and $FF;
  Buf[1] := (Buffer shr 8) and $FF;
  Buf[2] := (Buffer shr 16) and $FF;
  Buf[3] := (Buffer shr 24) and $FF;
  Result := Write(Buf, 4);
end;

function TIdNetStream.Write(const Buffer: Integer; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 4 then
    C := 4;
  Buf[0] := Buffer and $FF;
  Buf[1] := (Buffer shr 8) and $FF;
  Buf[2] := (Buffer shr 16) and $FF;
  Buf[3] := (Buffer shr 24) and $FF;
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Cardinal): Longint;
var
  Buf: array[] of Byte;
begin
  Buf[0] := Buffer and $FF;
  Buf[1] := (Buffer shr 8) and $FF;
  Buf[2] := (Buffer shr 16) and $FF;
  Buf[3] := (Buffer shr 24) and $FF;
  Result := Write(Buf, 4);
end;

function TIdNetStream.Write(const Buffer: Cardinal; Count: Longint): Longint;
var
  Buf: array[] of Byte;
  C: Integer;
begin
  C := Count;
  if C > 4 then
    C := 4;
  Buf[0] := Buffer and $FF;
  Buf[1] := (Buffer shr 8) and $FF;
  Buf[2] := (Buffer shr 16) and $FF;
  Buf[3] := (Buffer shr 24) and $FF;
  Result := Write(Buf, C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Int64): Longint;
begin
  Result := Write(BitConverter.GetBytes(Buffer), SizeOf(Int64));
end;

function TIdNetStream.Write(const Buffer: Int64; Count: Integer): Longint;
var
  C: Integer;
begin
  C := Count;
  if C > 8 then
    C := 8;
  Result := Write(BitConverter.GetBytes(Buffer), C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: UInt64): Longint;
begin
  Result := Write(BitConverter.GetBytes(Buffer), SizeOf(UInt64));
end;

function TIdNetStream.Write(const Buffer: UInt64; Count: Integer): Longint;
var
  C: Integer;
begin
  C := Count;
  if C > 8 then
    C := 8;
  Result := Write(BitConverter.GetBytes(Buffer), C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Single): Longint;
begin
  Result := Write(BitConverter.GetBytes(Buffer), SizeOf(Single));
end;

function TIdNetStream.Write(const Buffer: Single; Count: Integer): Longint;
var
  C: Integer;
begin
  C := Count;
  if C > 4 then
    C := 4;
  Result := Write(BitConverter.GetBytes(Buffer), C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Double): Longint;
begin
  Result := Write(BitConverter.GetBytes(Buffer), SizeOf(Double));
end;

function TIdNetStream.Write(const Buffer: Double; Count: Integer): Longint;
var
  C: Integer;
begin
  C := Count;
  if C > 8 then
    C := 8;
  Result := Write(BitConverter.GetBytes(Buffer), C);
  if C < Count then
    Inc(Result, Skip(Count - C));
end;

function TIdNetStream.Write(const Buffer: Extended): Longint;
begin
  // Write Win32 compatible extended
  Result := Write(DoubleToExtendedAsBytes(Buffer), 10);
end;

function TIdNetStream.Write(const Buffer: Extended; Count: Longint): Longint;
begin
  if Count = SizeOf(Double) then
  begin
    Result := Write(BitConverter.GetBytes(Double(Buffer)), SizeOf(Double));
  end
  else if Count = 10 then
    // Write Win32 compatible extended
    Result := Write(DoubleToExtendedAsBytes(Buffer), 10)
  else
    Result := Skip(Count);
end;

{ TIdNetCLRStreamWrapper }

constructor TIdNetCLRStreamWrapper.Create(AHandle: System.IO.Stream);
begin
  inherited Create;
  FHandle := AHandle;
end;

destructor TIdNetCLRStreamWrapper.Destroy;
begin
  if FHandle <> nil then
    FHandle.Close;
  inherited Destroy;
end;

function TIdNetCLRStreamWrapper.GetSize: Int64;
begin
  Result := FHandle.Length;
end;

function TIdNetCLRStreamWrapper.GetPosition: Int64;
begin
  Result := FHandle.Position;
end;

function TIdNetCLRStreamWrapper.Read(var Buffer: array of Byte; Offset, Count: Longint): Longint;
begin
  Result := FHandle.Read(Buffer, Offset, Count);
end;

const
  OriginMap: array[TIdNetSeekOrigin] of System.IO.SeekOrigin =
    (System.IO.SeekOrigin.Begin, System.IO.SeekOrigin.Current,
    System.IO.SeekOrigin.End);

function TIdNetCLRStreamWrapper.Seek(const Offset: Int64; Origin: TIdNetSeekOrigin): Int64;
begin
  Result := FHandle.Seek(Offset, OriginMap[Origin]);
end;

procedure TIdNetCLRStreamWrapper.SetSize(AValue: Int64);
begin
  FHandle.SetLength(AValue);
end;

function TIdNetCLRStreamWrapper.Write(const Buffer: array of Byte; Offset, Count: Longint): Longint;
begin
  try
    FHandle.Write(Buffer, Offset, Count);
    Result := Count;
  except
    Result := 0;
  end;
end;

{ TIdNetWrapperFCLStream }

constructor TIdNetWrapperFCLStream.Create(Stream: TIdNetStream);
begin
  inherited Create;
  FStream := Stream;
end;

procedure TIdNetWrapperFCLStream.Close;
begin
  FStream.Free;
  FStream := nil;
end;

procedure TIdNetWrapperFCLStream.Flush;
begin
  // Nothing applicable
end;

function TIdNetWrapperFCLStream.get_CanRead: Boolean;
begin
  Result := True;
end;

function TIdNetWrapperFCLStream.get_CanSeek: Boolean;
begin
  Result := True;
end;

function TIdNetWrapperFCLStream.get_CanWrite: Boolean;
begin
  Result := True;
end;

function TIdNetWrapperFCLStream.get_Length: Int64;
begin
  Result := FStream.Length;
end;

function TIdNetWrapperFCLStream.get_Position: Int64;
begin
  Result := FStream.Position;
end;

function TIdNetWrapperFCLStream.Read(Buffer: array of Byte; Offset: Integer; Count: Integer): Integer;
begin
  Result := FStream.Read(Buffer, Offset, Count);
end;

function TIdNetWrapperFCLStream.Seek(Offset: Int64; Origin: System.IO.SeekOrigin): Int64;
var
  LOrigin: SeekOrigin;
begin
  case Origin of
    SeekOrigin.Current:
      LOrigin := SeekOrigin.Current;  
    SeekOrigin.End:
      LOrigin := SeekOrigin.End;
  else
    LOrigin := SeekOrigin.Begin;
  end;
  Result := FStream.Seek(Offset, LOrigin);
end;

procedure TIdNetWrapperFCLStream.SetLength(Value: Int64);
begin
  FStream.SetLength(Value);
end;

procedure TIdNetWrapperFCLStream.set_Position(Value: Int64);
begin
  FStream.Position := Value;
end;

procedure TIdNetWrapperFCLStream.Write(Buffer: array of Byte; Offset: Integer; Count: Integer);
begin
  FStream.Write(Buffer, Offset, Count);
end;

destructor TIdNetWrapperFCLStream.Destroy;
begin
  FStream.Free;
  inherited;
end;

class function TIdNetWrapperFCLStream.GetStream(Stream: TIdNetStream): System.IO.Stream;
begin
  if Stream is TIdNetCLRStreamWrapper then
    Result := TIdNetCLRStreamWrapper(Stream).Handle
  else
    Result := TIdNetWrapperFCLStream.Create(Stream);
end;

{ TIdNetMemoryStream }

constructor TIdNetMemoryStream.Create;
begin
  inherited;
  FFCLStream := MemoryStream.Create;
end;

destructor TIdNetMemoryStream.Destroy;
begin
  FFCLStream.Close;
  FFCLStream := nil;
  inherited;
end;

function TIdNetMemoryStream.GetSize: Int64;
begin
  Result := FFCLStream.Length;
end;

function TIdNetMemoryStream.GetPosition: Int64;
begin
  Result := FFCLStream.Position;
end;

procedure TIdNetMemoryStream.SetSize(AValue: Int64);
begin
  FFCLStream.SetLength(AValue);
end;

function TIdNetMemoryStream.Write(const Buffer: array of Byte; Offset,
  Count: Integer): Integer;
begin
  Result := Count;
  FFCLStream.Write(Buffer, Offset, Count);
end;

function TIdNetMemoryStream.Seek(const Offset: Int64;
  Origin: TIdNetSeekOrigin): Int64;
  function GetSeekOrigin: SeekOrigin;
  begin
    Result := SeekOrigin.&Begin;
    case Origin of
      soBeginning:  Result := SeekOrigin.&Begin;
      soCurrent:    Result := SeekOrigin.Current;
      soEnd:        Result := SeekOrigin.&End;
    end;                                                                    
  end;
begin
  Result := FFCLStream.Seek(Offset, GetSeekOrigin);
end;

function TIdNetMemoryStream.Read(var Buffer: array of Byte; Offset,
  Count: Integer): Integer;
begin
  Result := FFCLStream.Read(Buffer, Offset, Count);
end;

function TIdNetMemoryStream.GetMemory: TByteArray;
begin
  Result := FFCLStream.GetBuffer;
end;

{ TIdNetStringStream }

constructor TIdNetStringStream.Create(const AString: string);
begin
  inherited Create;
  WriteString(AString);
  Position := 0; 
end;

function TIdNetStringStream.GetString: string;
begin
  Result := Encoding.ASCII.GetString(FFCLStream.GetBuffer, 0, Size)
end;

procedure TIdNetStringStream.WriteString(const AString: string);
var
  Bytes: TBytes;
begin
  Bytes := Encoding.ASCII.GetBytes(AString);
  Write(Bytes, Length(Bytes));
end;


{ TIdNetFileStream }

function TIdNetFileStream.Write(const Buffer: array of Byte; Offset,
  Count: Integer): Longint;
begin
  Result := Count;
  FFCLStream.Write(Buffer, Offset, Count);
end;

constructor TIdNetFileStream.Create(const AFileName: string; const AMode: UInt16; const ARight: Cardinal);
var
  LMode: System.IO.FileMode;
  LAccess: System.IO.FileAccess;
  LShare: System.IO.FileShare;
begin
  inherited Create;
  if AMode = IfmCreate then
  begin
    LMode := System.IO.FileMode.Create;
    LAccess := System.IO.FileAccess.ReadWrite;
  end
  else
  begin
    LMode := System.IO.FileMode.Open;
    case AMode and $F of
      IfmOpenReadWrite: LAccess := System.IO.FileAccess.ReadWrite;
      IfmOpenWrite: LAccess := System.IO.FileAccess.Write;
    else
      LAccess := System.IO.FileAccess.Read;
    end;
  end;
  case AMode and $F0 of
    IfmShareDenyWrite: LShare := System.IO.FileShare.Read;
    IfmShareDenyNone: LShare := System.IO.FileShare.None;
  else
    LShare := System.IO.FileShare.ReadWrite;
  end;
  FFCLStream := System.IO.FileStream.Create(AFileName, LMode, LAccess, LShare);
end;

function TIdNetFileStream.GetSize: Int64;
begin
  Result := FFCLStream.Length;
end;

function TIdNetFileStream.Seek(const Offset: Int64;
  Origin: TIdNetSeekOrigin): Int64;
function GetSeekOrigin: SeekOrigin;
  begin
    Result := SeekOrigin.&Begin;
    case Origin of
      soBeginning:  Result := SeekOrigin.&Begin;
      soCurrent:    Result := SeekOrigin.Current;
      soEnd:        Result := SeekOrigin.&End;
    end;                                                                    
  end;
begin
  Result := FFCLStream.Seek(Offset, GetSeekOrigin);
end;

function TIdNetFileStream.GetPosition: Int64;
begin
  Result := FFCLStream.Position;
end;

procedure TIdNetFileStream.SetSize(AValue: Int64);
begin
  FFCLStream.SetLength(AValue);
end;

function TIdNetFileStream.Read(var Buffer: array of Byte; Offset,
  Count: Integer): Longint;
begin
  Result := FFCLStream.Read(Buffer, Offset, Count);
end;

destructor TIdNetFileStream.Destroy;
begin
  FFCLStream.Close;
  FFCLStream := nil;
  inherited;
end;

constructor TIdNetFileStream.Create(const AFileName: string; const AMode: UInt16);
begin
  Create(AFileName, AMode, 0);
end;

end.
