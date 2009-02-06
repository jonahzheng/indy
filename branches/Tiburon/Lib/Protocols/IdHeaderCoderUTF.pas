unit IdHeaderCoderUTF;

interface

{$i IdCompilerDefines.inc}

uses
  IdGlobal, IdHeaderCoderBase;

type
  TIdHeaderCoderUTF = class(TIdHeaderCoder)
  public
    class function Decode(const ACharSet, AData: String): String; override;
    class function Encode(const ACharSet, AData: String): String; override;
    class function CanHandle(const ACharSet: String): Boolean; override;
  end;

implementation

class function TIdHeaderCoderUTF.Decode(const ACharSet, AData: String): String;
var
  LEncoder: TIdTextEncoding;
  LBytes: TIdBytes;
begin
  Result := '';
  LBytes := nil;
  if TextIsSame(ACharSet, 'UTF-7') then begin {do not localize}
    LEncoder := TIdTextEncoding.UTF7;
  end
  else if TextIsSame(ACharSet, 'UTF-8') then begin {do not localize}
    LEncoder := TIdTextEncoding.UTF8;
  end else
  begin
    Exit;
  end;
  LBytes := TIdTextEncoding.Convert(
    LEncoder,
    TIdTextEncoding.Unicode,
    LEncoder.GetBytes(AData));
  Result := TIdTextEncoding.Unicode.GetString(LBytes, 0, Length(LBytes));
end;

class function TIdHeaderCoderUTF.Encode(const ACharSet, AData: String): String;
var
  LBytes: TIdBytes;
  LStrEncoding, LByteEncoding: TIdTextEncoding;
begin
  Result := '';
  LBytes := nil;
  // RLebeau 1/27/09: do not use the same Encoding class to encode the input
  // string to bytes and then encode the bytes to a string.  Doing so will
  // undo what TIdTextEncoding.Convert() does, effectively making this class
  // behave the same as TIdHeaderCoderPlain.  The output of this class needs
  // to be a string that contains codeunits in the UTF-7/8 Ansi range, not
  // codeunits that have been converted back to UTF-16...
  if TextIsSame(ACharSet, 'UTF-7') then begin {do not localize}
    LStrEncoding := TIdTextEncoding.UTF7;
    LByteEncoding := TIdTextEncoding.ASCII;
  end
  else if TextIsSame(ACharSet, 'UTF-8') then begin {do not localize}
    LStrEncoding := TIdTextEncoding.UTF8;
    LByteEncoding := Get8BitEncoding;
  end else
  begin
    Exit;
  end;
  LBytes := TIdTextEncoding.Convert(
    TIdTextEncoding.Unicode,
    LStrEncoding,
    TIdTextEncoding.Unicode.GetBytes(AData));
  Result := LByteEncoding.GetString(LBytes, 0, Length(LBytes));
end;

class function TIdHeaderCoderUTF.CanHandle(const ACharSet: String): Boolean;
begin
  Result := PosInStrArray(ACharSet, ['UTF-7', 'UTF-8'], False) > -1; {do not localize}
end;

initialization
  RegisterHeaderCoder(TIdHeaderCoderUTF);
finalization
  UnregisterHeaderCoder(TIdHeaderCoderUTF);

end.
