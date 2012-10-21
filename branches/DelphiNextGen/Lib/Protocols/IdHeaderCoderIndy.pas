unit IdHeaderCoderIndy;

interface

{$i IdCompilerDefines.inc}

uses
  IdGlobal, IdHeaderCoderBase;

type
  TIdHeaderCoderIndy = class(TIdHeaderCoder)
  public
    class function Decode(const ACharSet: string; const AData: TIdBytes): String; override;
    class function Encode(const ACharSet, AData: String): TIdBytes; override;
    class function CanHandle(const ACharSet: String): Boolean; override;
  end;

  // RLebeau 4/17/10: this forces C++Builder to link to this unit so
  // RegisterHeaderCoder can be called correctly at program startup...
  (*$HPPEMIT '#pragma link "IdHeaderCoderIndy"'*)

implementation

{$IFNDEF DOTNET_OR_ICONV}
uses
  IdCharsets;
{$ENDIF}

// TODO: re-write this unit to use IdGlobalProtocol.CharsetToEncoding() instead of TIdTextEncoding.GetEncoding() directly...

class function TIdHeaderCoderIndy.Decode(const ACharSet: string; const AData: TIdBytes): String;
var
  LEncoding: IIdTextEncoding;
  {$IFNDEF DOTNET_OR_ICONV}
  CP: Word;
  {$ENDIF}
begin
  Result := '';
  try
    {$IFDEF DOTNET_OR_ICONV}
    LEncoding := IndyTextEncoding(ACharSet);
    {$ELSE}
    CP := CharsetToCodePage(ACharSet);
    if CP = 0 then begin
      Exit;
    end;
    LEncoding := IndyTextEncoding(CP);
    {$ENDIF}
    Result := LEncoding.GetString(AData);
  except
  end;
end;

class function TIdHeaderCoderIndy.Encode(const ACharSet, AData: String): TIdBytes;
var
  LEncoding: IIdTextEncoding;
  {$IFNDEF DOTNET_OR_ICONV}
  CP: Word;
  {$ENDIF}
begin
  Result := nil;
  try
    {$IFDEF DOTNET_OR_ICONV}
    LEncoding := IndyTextEncoding(ACharSet);
    {$ELSE}
    CP := CharsetToCodePage(ACharSet);
    if CP = 0 then begin
      Exit;
    end;
    LEncoding := IndyTextEncoding(CP);
    {$ENDIF}
    Result := LEncoding.GetBytes(AData);
  except
  end;
end;

class function TIdHeaderCoderIndy.CanHandle(const ACharSet: String): Boolean;
{$IFNDEF DOTNET_OR_ICONV}
  {$IFDEF WINDOWS}
var
  CP: Word;
  {$ENDIF}
{$ENDIF}
begin
  Result := False;
  try
    {$IFDEF DOTNET_OR_ICONV}
    Result := Assigned(IndyTextEncoding(ACharSet));
    {$ELSE}
      {$IFDEF WINDOWS}
    CP := CharsetToCodePage(ACharSet);
    if CP <> 0 then begin
      Result := Assigned(IndyTextEncoding(CP));
    end;
      {$ENDIF}
    {$ENDIF}
  except
  end;
end;

initialization
  RegisterHeaderCoder(TIdHeaderCoderIndy);
finalization
  UnregisterHeaderCoder(TIdHeaderCoderIndy);

end.
