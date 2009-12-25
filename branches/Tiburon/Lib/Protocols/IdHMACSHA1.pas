{
  $Project$
  $Workfile$
  $Revision$
  $DateUTC$
  $Id$

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log$
}
{
  HMAC specification on the NIST website
  http://csrc.nist.gov/publications/fips/fips198/fips-198a.pdf
}

unit IdHMACSHA1;

interface

{$i IdCompilerDefines.inc}

uses
  IdHash, IdHashSHA, IdHMAC;

type
  TIdHMACSHA1 = class(TIdHMAC)
  protected
    procedure InitHash; override;
  end;
  {$IFNDEF DOTNET}
  TIdHMACSHA224 = class(TIdHMAC)
  protected
    procedure InitHash; override;
  end;
  {$ENDIF}
  TIdHMACSHA256 = class(TIdHMAC)
  protected
    procedure InitHash; override;
  end;
  TIdHMACSHA384 = class(TIdHMAC)
  protected
    procedure InitHash; override;
  end;
  TIdHMACSHA512 = class(TIdHMAC)
  protected
    procedure InitHash; override;
  end;

implementation

{ TIdHMACSHA1 }

procedure TIdHMACSHA1.InitHash;
begin
  FHashSize := 20;
  FBlockSize := 64;
  FHashName := 'SHA1';
  FHash := TIdHashSHA1.Create;
end;

{ TIdHMACSHA224 }

  {$IFNDEF DOTNET}
procedure TIdHMACSHA224.InitHash;
begin
  FHashSize := 28;
  FBlockSize := 64;
  FHashName := 'SHA224';
  FHash := TIdHashSHA224.Create;
end;
{$ENDIF}

{ TIdHMACSHA256 }

procedure TIdHMACSHA256.InitHash;
begin
  FHashSize := 32;
  FBlockSize := 64;
  FHashName := 'SHA256';
  FHash := TIdHashSHA256.Create;
end;

{ TIdHMACSHA384 }

procedure TIdHMACSHA384.InitHash;
begin
  FHashSize := 48;
  FBlockSize := 128;
  FHashName := 'SHA384';
  FHash := TIdHashSHA384.Create;
end;

{ TIdHMACSHA512 }

procedure TIdHMACSHA512.InitHash;
begin
  FHashSize := 64;
  FBlockSize := 128;
  FHashName := 'SHA512';
  FHash := TIdHashSHA512.Create;
end;

end.
