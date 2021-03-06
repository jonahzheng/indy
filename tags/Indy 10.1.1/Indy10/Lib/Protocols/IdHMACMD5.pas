unit IdHMACMD5;

interface

uses
  IdHash, IdHashMessageDigest, IdHMAC, IdGlobal, IdObjs, IdSys;

type
  TIdHMACMD5 = class(TIdHMAC)
  private
    FHashMD5: TIdHashMessageDigest5;
  protected
    procedure InitHash; override;
    function InternalHashValue(const ABuffer: TIdBytes) : TIdBytes; override;
  end;

implementation

{ TIdHMACMD5 }

procedure TIdHMACMD5.InitHash;
begin
  FHashName := 'MD5';
  FHashSize := 16;
  FBlockSize := 64;
  FHashMD5 := TIdHashMessageDigest5.Create;
  FHash := FHashMD5;
end;

function TIdHMACMD5.InternalHashValue(const ABuffer: TIdBytes): TIdBytes;
var
  TempStream: TIdMemoryStream;
  TempResult: T4x4LongWordRecord;
  TempBuff: TIdBytes;
begin
  TempStream := TIdMemoryStream.Create;
  try
    WriteTIdBytesToStream(TempStream, ABuffer);
    TempStream.Position := 0;
    TempResult := FHashMD5.HashValue(TempStream);
    SetLength(TempBuff, 4);
    SetLength(Result, FHashSize);
    TempBuff := ToBytes(TempResult[0]);
    CopyTIdBytes(TempBuff, 0, Result, 0, 4);
    TempBuff := ToBytes(TempResult[1]);
    CopyTIdBytes(TempBuff, 0, Result, 4, 4);
    TempBuff := ToBytes(TempResult[2]);
    CopyTIdBytes(TempBuff, 0, Result, 8, 4);
    TempBuff := ToBytes(TempResult[3]);
    CopyTIdBytes(TempBuff, 0, Result, 12, 4);
  finally
    Sys.FreeAndNil(TempStream);
  end;
end;

initialization
end.
