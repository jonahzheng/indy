unit IdObjsFCL;

interface

uses
  System.Collections, System.Collections.Specialized, System.Text, System.IO,
  IdException;

type
//  TIdStringItemFCL = class
//  public
//    FString: string;
//		FObject: &Object;
//  end;

  TIdStringListFCL = class;

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

    class operator Implicit(const aValue: TIdStringListFCL): StringCollection;
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

    function Add(const S: string): Integer; overload; virtual;
    function AddObject(S: string; AObject: &Object) : Integer; virtual;
    procedure Append(S: string);
    procedure AddStrings(AStrings: TIdStringsFCL); virtual;
    procedure Assign(ASource: TIdStringsFCL); virtual;
    procedure BeginUpdate;
    procedure Clear; virtual; abstract;
    procedure Delete(AIndex: Integer); virtual; abstract;
    procedure EndUpdate;
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
  end;

implementation

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
  Result := Add(S);
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
  Result := GetCount;
  Insert(Result, S);
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

class operator TIdStringsFCL.Implicit(const aValue: TIdStringListFCL): StringCollection;
begin
  EIdException.IfFalse(aValue is TIdStringListFCL, 'Invalid implicit conversion.');
  Result := TIdStringListFCL(aValue).FCollection;
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
  PutObject(Index, nil);
end;

procedure TIdStringListFCL.CopyTo(ADest: &Array; AIndex: Integer);
begin
  raise NotImplementedException.Create;
end;

end.
