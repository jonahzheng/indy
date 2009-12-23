unit IdFIPS;

interface

{$I IdCompilerDefines.inc}

{
  IMPORTANT!!!

  This unit does not directly provide FIPS support.  It centalizes some Indy
  encryption functions and exposes a function to get and set a FIPS mode that is
  implemented by the library that hooks this unit.

  The idea is that Indy will not have a FIPS certification per se but will be
  able to utilize cryptographic modules that are FIPS complient.

  In addition, this unit provides a way of centralizing all hashing and HMAC
  functions and to control dependancies in Indy.
}
uses IdException, IdGlobal;

type
{$IFDEF DOTNET}
  TIdHashIntCtx = IntPtr;
{$ELSE}
  TIdHashIntCtx = Pointer;
{$ENDIF}

  EIdFIPSAlgorithmNotAllowed = class(EIdException);
    TGetFIPSMode = function: Boolean;
    TSetFIPSMode = function(const AMode: Boolean): Boolean;
    TIsHashingIntfAvail = function: Boolean;
    TGetHashInst = function: TIdHashIntCtx;
    TUpdateHashInst = procedure(ACtx: TIdHashIntCtx; const AIn: TIdBytes);
    TFinalHashInst = function(ACtx: TIdHashIntCtx): TIdBytes;

  var
    GetFIPSMode: TGetFIPSMode;
    SetFIPSMode: TSetFIPSMode;
    IsHashingIntfAvail: TIsHashingIntfAvail;
    GetMD2HashInst: TGetHashInst;
    IsMD2HashIntfAvail: TIsHashingIntfAvail;
    GetMD4HashInst: TGetHashInst;
    IsMD4HashIntfAvail: TIsHashingIntfAvail;
    GetMD5HashInst: TGetHashInst;
    IsMD5HashIntfAvail: TIsHashingIntfAvail;
    GetSHA1HashInst: TGetHashInst;
    IsSHA1HashIntfAvail: TIsHashingIntfAvail;
    GetSHA224HashInst: TGetHashInst;
    IsSHA224HashIntfAvail: TIsHashingIntfAvail;
    GetSHA256HashInst: TGetHashInst;
    IsSHA256HashIntfAvail: TIsHashingIntfAvail;
    GetSHA384HashInst: TGetHashInst;
    IsSHA384HashIntfAvail: TIsHashingIntfAvail;
    GetSHA512HashInst: TGetHashInst;
    IsSHA512HashIntfAvail: TIsHashingIntfAvail;
    UpdateHashInst: TUpdateHashInst;
    FinalHashInst: TFinalHashInst;

    procedure CheckMD2Permitted;
    procedure CheckMD4Permitted;
    procedure CheckMD5Permitted;
    procedure FIPSAlgorithmNotAllowed(const AAlgorithm: String);

implementation

uses IdResourceStringsProtocols, SysUtils;

procedure CheckMD2Permitted; {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  if GetFIPSMode then
  begin
    FIPSAlgorithmNotAllowed('MD2');
  end;
end;

procedure CheckMD4Permitted; {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  if GetFIPSMode then
  begin
    FIPSAlgorithmNotAllowed('MD4');
  end;
end;

procedure CheckMD5Permitted; {$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  if GetFIPSMode then
  begin
    FIPSAlgorithmNotAllowed('MD5');
  end;
end;

procedure FIPSAlgorithmNotAllowed(const AAlgorithm: String);
{$IFDEF USE_INLINE} inline; {$ENDIF}
begin
  raise EIdFIPSAlgorithmNotAllowed.Create(Format(RSFIPSAlgorithmNotAllowed,
      [AAlgorithm]));
end;

// fips mode default procs
function DefGetFIPSMode: Boolean;
begin
  Result := False;
end;

function DefSetFIPSMode(const AMode: Boolean): Boolean;
begin
  // leave this empty as we may not be using something that supports FIPS
  Result := False;
end;

function DefIsHashingIntfAvail: Boolean;
begin
  Result := False;
end;

function DefIsHashIntfAvail: Boolean;
begin
  Result := False;
end;

function DefGetHashInst : TIdHashIntCtx;
begin
  Result := nil;
end;

procedure DefUpdateHashInst(ACtx: TIdHashIntCtx; const AIn: TIdBytes);
begin
end;

function DefFinalHashInst(ACtx: TIdHashIntCtx): TIdBytes;
begin
  SetLength(Result, 0);
end;

initialization

  GetFIPSMode := DefGetFIPSMode;
  SetFIPSMode := DefSetFIPSMode;

  IsHashingIntfAvail := DefIsHashingIntfAvail;

  IsMD2HashIntfAvail := DefIsHashIntfAvail;
  GetMD2HashInst := DefGetHashInst;
  IsMD4HashIntfAvail := DefIsHashIntfAvail;
  GetMD4HashInst := DefGetHashInst;
  IsMD5HashIntfAvail := DefIsHashIntfAvail;
  GetMD5HashInst := DefGetHashInst;
  IsSHA1HashIntfAvail := DefIsHashIntfAvail;
  GetSHA1HashInst := DefGetHashInst;
  IsSHA224HashIntfAvail := DefIsHashIntfAvail;
  GetSHA224HashInst := DefGetHashInst;

  IsSHA256HashIntfAvail := DefIsHashIntfAvail;
  GetSHA256HashInst := DefGetHashInst;
  IsSHA384HashIntfAvail := DefIsHashIntfAvail;
  GetSHA384HashInst := DefGetHashInst;
  IsSHA512HashIntfAvail := DefIsHashIntfAvail;
  GetSHA512HashInst := DefGetHashInst;
  UpdateHashInst := DefUpdateHashInst;
  FinalHashInst := DefFinalHashInst;

end.
