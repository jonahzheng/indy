unit IdHashIntf;

interface
{$i IdCompilerDefines.inc}

uses
  Classes,
  IdGlobal, IdHash,
  {$IFNDEF DOTNET}
  IdSSLOpenSSLHeaders
  {$ENDIF}
  ;

type
  {$IFDEF DOTNET}
  {$ELSE}
  TIdHashInst = PEVP_MD;
  TIdHashIntCtx = EVP_MD_CTX;
  {$ENDIF}
  TIdHashInt = class(TIdHash)
  protected
    function HashToHex(const AHash: TIdBytes): String; override;
    function GetHashInst : TIdHashInst; virtual; abstract;
    function InitHash : TIdHashIntCtx; virtual;
    procedure UpdateHash(ACtx : TIdHashIntCtx; const AIn : TIdBytes);
    function FinalHash(ACtx : TIdHashIntCtx) : TIdBytes;
    function GetHashBytes(AStream: TStream; ASize: Int64): TIdBytes; override;
  public
  end;
  TIdHashSHA224 = class(TIdHashInt)
  protected
    function GetHashInst : TIdHashInst; override;
  end;
  TIdHashSHA256 = class(TIdHashInt)
  protected
    function GetHashInst : TIdHashInst; override;
  end;
  TIdHashSHA386 = class(TIdHashInt)
  protected
    function GetHashInst : TIdHashInst; override;
  end;
  TIdHashSHA512 = class(TIdHashInt)
  protected
    function GetHashInst : TIdHashInst; override;
  end;


implementation
{$IFNDEF DOTNET}
uses IdCTypes;
{$ENDIF}

{ TIdHashInt }

function TIdHashInt.FinalHash(ACtx: TIdHashIntCtx): TIdBytes;
var LLen : TIdC_UInt;
begin
  {$IFNDEF DOTNET}
  SetLength(Result,OPENSSL_EVP_MAX_MD_SIZE);
  IdSslEvpDigestFinal(@ACtx,@Result[0],LLen);
  SetLength(Result,LLen);
  IdSslEvpMDCtxCleanup(@ACtx);
  {$ENDIF}
end;

function TIdHashInt.GetHashBytes(AStream: TStream; ASize: Int64): TIdBytes;
var LBuf : TIdBytes;
  LSize : Int64;
  LCtx : TIdHashIntCtx;
begin
  LCtx := InitHash;
  try
    SetLength(LBuf,2048);
    repeat
      LSize := ReadTIdBytesFromStream(AStream,LBuf,2048);
      if LSize = 0 then begin
        break;
      end;
      if LSize < 2048 then begin
        SetLength(LBuf,LSize);
        UpdateHash(LCtx,LBuf);
        break;
      end;
    until False;
  finally
    Result := FinalHash(LCtx);
  end;
end;

function TIdHashInt.HashToHex(const AHash: TIdBytes): String;
begin
  Result := ToHex(AHash);
end;

function TIdHashInt.InitHash: TIdHashIntCtx;
var LHash : TIdHashInst;
begin
  LHash := GetHashInst;
  {$IFNDEF DOTNET}
  IdSslEvpMDCtxInit(@Result);
  IdSslEvpDigestInitEx(@Result, LHash, nil);
  {$ENDIF}
end;

procedure TIdHashInt.UpdateHash(ACtx: TIdHashIntCtx; const AIn: TIdBytes);
begin
   {$IFNDEF DOTNET}

  IdSslEvpDigestUpdate(@ACtx,@Ain[0],Length(AIn));
  {$ENDIF}
end;

{ TIdHashSHA224 }

function TIdHashSHA224.GetHashInst: TIdHashInst;
begin
   {$IFNDEF DOTNET}
  Result := IdSslEvpSHA224;
  {$ENDIF}
end;

{ TIdHashSHA256 }

function TIdHashSHA256.GetHashInst: TIdHashInst;
begin
   {$IFNDEF DOTNET}
  Result := IdSslEvpSHA256;
  {$ENDIF}
end;

{ TIdHashSHA386 }

function TIdHashSHA386.GetHashInst: TIdHashInst;
begin
   {$IFNDEF DOTNET}
  Result := IdSslEvpSHA386;
  {$ENDIF}
end;

{ TIdHashSHA512 }

function TIdHashSHA512.GetHashInst: TIdHashInst;
begin
   {$IFNDEF DOTNET}
  Result := IdSslEvpSHA512;
  {$ENDIF}
end;

end.
