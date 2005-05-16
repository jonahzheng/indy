unit IdSysNativeVCL;

interface
uses IdSysVCL;
type
  TIdSysNativeVCL = class(TIdSysVCL)
  public
    class function AnsiExtractQuotedStr(var Src: PChar; Quote: Char): string;
    class function StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar;
    class function StrPas(const Str: PChar): string;
    class function StrNew(const Str: PChar): PChar;
    class procedure StrDispose(Str: PChar);
    class function CompareMem(P1, P2: Pointer; Length: Integer): Boolean;
  end;

implementation

class function TIdSysNativeVCL.CompareMem(P1, P2: Pointer;
  Length: Integer): Boolean;
begin
  Result := SysUtils.CompareMem(P1,P2,Length);
end;
class function TIdSysVCL.AnsiExtractQuotedStr(var Src: PChar;
  Quote: Char): string;
begin
  Result := SysUtils.AnsiExtractQuotedStr(Src,Quote);
end;

class function TIdSysVCL.StrLCopy(Dest: PChar; const Source: PChar;
  MaxLen: Cardinal): PChar;
begin
  Result := SysUtils.StrLCopy(Dest,Source,MaxLen);
end;

class function TIdSysVCL.StrPas(const Str: PChar): string;
begin
  Result := SysUtils.StrPas(Str);
end;

class function TIdSysVCL.StrNew(const Str: PChar): PChar;
begin
  Result := SysUtils.StrNew(Str);
end;

class procedure TIdSysVCL.StrDispose(Str: PChar);
begin
  SysUtils.StrDispose(Str);
end;

end.
