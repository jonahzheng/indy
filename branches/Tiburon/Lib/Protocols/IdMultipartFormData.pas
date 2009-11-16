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


  Prior revision history:

  Rev 1.17    2/8/05 6:07:16 PM  RLebeau
    Removed AddToInternalBuffer() method, using new AppendString() function
    from IdGlobal instead

  Rev 1.16    10/26/2004 10:29:30 PM  JPMugaas
    Updated refs.

  Rev 1.15    7/16/04 12:02:16 PM  RLebeau
    Reverted FileName fields to not strip off folder paths anymore.

  Rev 1.14    7/5/04 1:19:06 PM  RLebeau
    Updated IdRead() to check the calculated byte count before copying data
    into the caller's buffer.

  Rev 1.13    5/31/04 9:28:58 PM  RLebeau
    Updated FileName fields to strip off folder paths.
    Added "Content-Transfer-Encoding" header to file fields
    Updated "Content-Type" headers to be the appropriate media types when
    applicable

  Rev 1.12    5/30/04 7:39:02 PM  RLebeau
    Moved FormatField() method from TIdMultiPartFormDataStream to
    TIdFormDataField instead
    Misc. tweaks and bug fixes

  Rev 1.11    2004.05.20 11:37:02 AM  czhower
    IdStreamVCL

  Rev 1.10    3/1/04 8:57:34 PM  RLebeau
    Format() fixes for TIdMultiPartFormDataStream.FormatField() and
    TIdFormDataField.GetFieldSize().

  Rev 1.9    2004.02.03 5:44:08 PM  czhower
    Name changes

  Rev 1.8    2004.02.03 2:12:16 PM  czhower
    $I path change

  Rev 1.7    25/01/2004 21:56:42  CCostelloe
    Updated IdSeek to use new IdFromBeginning

  Rev 1.6    24/01/2004 19:26:56  CCostelloe
    Cleaned up warnings

  Rev 1.5    22/11/2003 12:05:26 AM  GGrieve
    Get working on both win32 and DotNet after other DotNet changes

  Rev 1.4    11/10/2003 8:03:54 PM  BGooijen
    Did all todo's ( TStream to TIdStream mainly )

  Rev 1.3    2003.10.24 10:43:12 AM  czhower
    TIdSTream to dos

  Rev 1.2    10/17/2003 12:49:52 AM  DSiders
    Added localization comments.
    Added resource string for unsupported operation exception.

  Rev 1.1    10/7/2003 10:07:06 PM  GGrieve
    Get HTTP compiling for DotNet

  Rev 1.0    11/13/2002 07:57:42 AM  JPMugaas
    Initial version control checkin.

  2001-Nov-23
    changed spelling error from XxxDataFiled to XxxDataField

  2001-Nov Doychin Bondzhev
    Now it descends from TStream and does not do buffering.
    Changes in the way the form parts are added to the stream.
}

unit IdMultipartFormData;

{
  Implementation of the Multipart Form data

  Based on Internet standards outlined in:
    RFC 1867 - Form-based File Upload in HTML
    RFC 2388 - Returning Values from Forms:  multipart/form-data

  Author: Shiv Kumar
}

interface

{$I IdCompilerDefines.inc}

uses
  Classes,
  IdGlobal,
  IdException,
  IdCharsets,
  IdCoderHeader,
  IdResourceStringsProtocols;

const
  sContentTypeFormData = 'multipart/form-data; boundary=';            {do not localize}
  sContentTypeOctetStream = 'application/octet-stream';               {do not localize}
  CRLF = #13#10;
  sContentDispositionPlaceHolder = 'Content-Disposition: form-data; name="%s"';  {do not localize}
  sFileNamePlaceHolder = '; filename="%s"';                           {do not localize}
  sContentTypePlaceHolder = 'Content-Type: %s';                       {do not localize}
  sCharsetPlaceHolder = '; charset="%s"';                             {do not localize}
  sContentTransferPlaceHolder = 'Content-Transfer-Encoding: %s';      {do not localize}

type
  TIdMultiPartFormDataStream = class;

  {
    TODO:
      Need to add ContentTransferEncoding property and arguments
      for use in AddFile or AddObject for the multipart data stream.
      Assumes the content transfer encoding has already been applied
      to the contents of the TIdStream or the TIdStrings object.

      Can implement when current TIdStreamX issues are resolved.
  }
  TIdFormDataField = class(TCollectionItem)
  protected
    FFileName: string;
    FCharset: string;
    FContentType: string;
    FFieldName: string;
    FFieldObject: TObject;
    FCanFreeFieldObject: Boolean;

    function GetFieldSize: LongInt;
    function GetFieldStream: TStream;
    function GetFieldStrings: TStrings;
    function GetFieldValue: string;
    procedure SetCharset(const Value: string);
    procedure SetContentType(const Value: string);
    procedure SetFieldName(const Value: string);
    procedure SetFieldStream(const Value: TStream);
    procedure SetFieldStrings(const Value: TStrings);
    procedure SetFieldValue(const Value: string);
    procedure SetFieldObject(const Value: TObject);
    procedure SetFileName(const Value: string);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    // procedure Assign(Source: TPersistent); override;
    function FormatHeader: string;
    property ContentType: string read FContentType write SetContentType;
    property Charset: string read FCharset write SetCharset;
    property FieldName: string read FFieldName write SetFieldName;
    property FieldStream: TStream read GetFieldStream write SetFieldStream;
    property FieldStrings: TStrings read GetFieldStrings write SetFieldStrings;
    property FieldObject: TObject read FFieldObject write SetFieldObject;
    property FileName: string read FFileName write SetFileName;
    property FieldValue: string read GetFieldValue write SetFieldValue;
    property FieldSize: LongInt read GetFieldSize;
  end;

  TIdFormDataFields = class(TCollection)
  protected
    FParentStream: TIdMultiPartFormDataStream;
    function GetFormDataField(AIndex: Integer): TIdFormDataField;
  public
    constructor Create(AMPStream: TIdMultiPartFormDataStream);
    function Add: TIdFormDataField;
    property MultipartFormDataStream: TIdMultiPartFormDataStream read FParentStream;
    property Items[AIndex: Integer]: TIdFormDataField read GetFormDataField;
  end;

  TIdMultiPartFormDataStream = class(TIdBaseStream)
  protected
    FInputStream: TStream;
    FFreeInputStream: Boolean;
    FBoundary: string;
    FRequestContentType: string;
    FCurrentItem: integer;
    FInitialized: Boolean;
    FInternalBuffer: TIdBytes;

    FPosition: Int64;
    FSize: Int64;

    FFields: TIdFormDataFields;

    function GenerateUniqueBoundary: string;
    procedure CalculateSize;

    function IdRead(var VBuffer: TIdBytes; AOffset, ACount: Longint): Longint; override;
    function IdWrite(const ABuffer: TIdBytes; AOffset, ACount: Longint): Longint; override;
    function IdSeek(const AOffset: Int64; AOrigin: TSeekOrigin): Int64; override;
    procedure IdSetSize(ASize : Int64); override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddFormField(const AFieldName, AFieldValue: string; const ACharset: string = '');
    procedure AddObject(const AFieldName, AContentType, ACharset: string; AFileData: TObject; const AFileName: string = '');
    procedure AddFile(const AFieldName, AFileName, AContentType: string);

    procedure Clear;
    
    property Boundary: string read FBoundary;
    property RequestContentType: string read FRequestContentType;
  end;

  EIdInvalidObjectType = class(EIdException);

implementation

uses
  SysUtils,
  IdCoderQuotedPrintable,
  IdStream,
  IdGlobalProtocols;

{ TIdMultiPartFormDataStream }

constructor TIdMultiPartFormDataStream.Create;
begin
  inherited Create;
  FSize := 0;
  FInitialized := False;
  FBoundary := GenerateUniqueBoundary;
  FRequestContentType := sContentTypeFormData + FBoundary;
  FFields := TIdFormDataFields.Create(Self);
end;

destructor TIdMultiPartFormDataStream.Destroy;
begin
  FreeAndNil(FFields);
  inherited Destroy;
end;

procedure TIdMultiPartFormDataStream.AddObject(const AFieldName,
  AContentType, ACharset: string; AFileData: TObject; const AFileName: string = '');
var
  LItem: TIdFormDataField;
  LCharSet: String;
begin
  if not ((AFileData is TStream) or (AFileData is TStrings)) then begin
    raise EIdInvalidObjectType.Create(RSMFDIvalidObjectType);
  end;

  LItem := FFields.Add;

  with LItem do begin
    FFieldName := AFieldName;
    FFileName := ExtractFileName(AFileName);
    FFieldObject := AFileData;
    if Length(AContentType) > 0 then begin
      FContentType := RemoveHeaderEntry(AContentType, 'charset'); {do not localize}
      if ACharset <> '' then begin
        FCharset := ACharset;
      end else
      begin
        {RLebeau: override the current CharSet only if the header specifies a new value}
        LCharSet := ExtractHeaderSubItem(AContentType, 'charset'); {do not localize}
        if LCharSet <> '' then begin
          FCharSet := LCharSet;
        end;
      end;
    end
    else if Length(FFileName) > 0 then begin
      FContentType := GetMIMETypeFromFile(FFileName);
    end else begin
      FContentType := sContentTypeOctetStream;
    end;
  end;
end;

procedure TIdMultiPartFormDataStream.AddFile(const AFieldName, AFileName,
  AContentType: string);
var
  LStream: TIdReadFileExclusiveStream;
  LItem: TIdFormDataField;
begin
  LStream := TIdReadFileExclusiveStream.Create(AFileName);
  try
    LItem := FFields.Add;
  except
    FreeAndNil(LStream);
    raise;
  end;

  with LItem do begin
    FFieldName := AFieldName;
    FFileName := ExtractFileName(AFileName);
    FFieldObject := LStream;
    FCanFreeFieldObject := True;
    if Length(AContentType) > 0 then begin
      FContentType := AContentType;
    end else begin
      FContentType := GetMIMETypeFromFile(AFileName);
    end;
  end;
end;

procedure TIdMultiPartFormDataStream.AddFormField(const AFieldName,
  AFieldValue: string; const ACharset: string = '');
var
  LStrings: TStrings;
  LItem: TIdFormDataField;
begin
  LStrings := TStringList.Create;
  try
    LStrings.Text := AFieldValue;
    LItem := FFields.Add;
  except
    FreeAndNil(LStrings);
    raise;
  end;

  with LItem do begin
    FFieldName := AFieldName;
    FFieldObject := LStrings;
    FCanFreeFieldObject := True;
    FContentType := 'text/plain'; {do not localize}
    FCharset := ACharset;
  end;
end;

procedure TIdMultiPartFormDataStream.Clear;
begin
  FInitialized := False;
  FFields.Clear;
  if FFreeInputStream then begin
    FInputStream.Free;
  end;
  FInputStream := nil;
  FFreeInputStream := False;
  FCurrentItem := 0;
  FPosition := 0;
  FSize := 0;
  SetLength(FInternalBuffer, 0);
end;

function TIdMultiPartFormDataStream.GenerateUniqueBoundary: string;
begin
  Result := '--------' + FormatDateTime('mmddyyhhnnsszzz', Now);  {do not localize}
end;

procedure TIdMultiPartFormDataStream.CalculateSize;
var
  I: Integer;
begin
  FSize := 0;
  if FFields.Count > 0 then begin
    for I := 0 to FFields.Count-1 do begin
      FSize := FSize + FFields.Items[I].FieldSize;
    end;
    FSize := FSize + 2{'--'} + Length(Boundary) + 4{'--'+CRLF};
  end;
end;

// RLebeau - IdRead() should wrap multiple files using a single
// "multipart/mixed" MIME part, as recommended by RFC 1867

function TIdMultiPartFormDataStream.IdRead(var VBuffer: TIdBytes; AOffset, ACount: Longint): Longint;
var
  LTotalRead: Integer;
  LCount: Integer;
  LBufferCount: Integer;
  LRemaining : Integer;
  LItem: TIdFormDataField;
  LEncoding: TIdTextEncoding;
begin
  if not FInitialized then begin
    FInitialized := True;
    FCurrentItem := 0;
    SetLength(FInternalBuffer, 0);
  end;

  LTotalRead := 0;
  LBufferCount := 0;

  while (LTotalRead < ACount) and ((Length(FInternalBuffer) > 0) or Assigned(FInputStream) or (FCurrentItem < FFields.Count)) do begin
    if (Length(FInternalBuffer) = 0) and (not Assigned(FInputStream)) then begin
      LItem := FFields.Items[FCurrentItem];
      AppendString(FInternalBuffer, LItem.FormatHeader);

      if (LItem.FieldObject is TStream) then begin
        FInputStream := TStream(LItem.FieldObject);
        FFreeInputStream := False;
        FInputStream.Position := 0;
      end
      else if (LItem.FieldObject is TStrings) then begin
        LEncoding := CharsetToEncoding(LItem.Charset);
        {$IFNDEF DOTNET}
        try
        {$ENDIF}
          FInputStream := TMemoryStream.Create;
          FFreeInputStream := True;
          try
            TIdEncoderQuotedPrintable.EncodeString(TStrings(LItem.FieldObject).Text, FInputStream, LEncoding);
          except
            FreeAndNil(FInputStream);
            FFreeInputStream := False;
            raise;
          end;
          FInputStream.Position := 0;
        {$IFNDEF DOTNET}
        finally
          LEncoding.Free;
        end;
       {$ENDIF}
      end else
      begin
        Inc(FCurrentItem);
      end;
    end;

    if Length(FInternalBuffer) > 0 then begin
      LCount := IndyMin(ACount - LBufferCount, Length(FInternalBuffer));
      if LCount > 0 then begin
        LRemaining := Length(FInternalBuffer) - LCount;
        CopyTIdBytes(FInternalBuffer, 0, VBuffer, LBufferCount, LCount);
        if LRemaining > 0 then begin
          CopyTIdBytes(FInternalBuffer, LCount, FInternalBuffer, 0, LRemaining);
        end;
        SetLength(FInternalBuffer, LRemaining);
        LBufferCount := LBufferCount + LCount;
        FPosition := FPosition + LCount;
        LTotalRead := LTotalRead + LCount;
      end;
    end;

    if (LTotalRead < ACount) and (Length(FInternalBuffer) = 0) and Assigned(FInputStream) then begin
      LCount := TIdStreamHelper.ReadBytes(FInputStream, VBuffer, ACount - LTotalRead, LBufferCount);
      if LCount > 0 then begin
        LBufferCount := LBufferCount + LCount;
        LTotalRead := LTotalRead + LCount;
        FPosition := FPosition + LCount;
      end
      else begin
        SetLength(FInternalBuffer, 0);
        if FFreeInputStream then begin
          FInputStream.Free;
        end else begin
          FInputStream.Position := 0;
          AppendString(FInternalBuffer, CRLF);
        end;
        FInputStream := nil;
        FFreeInputStream := False;
        Inc(FCurrentItem);
      end;
    end;

    if (Length(FInternalBuffer) = 0) and (not Assigned(FInputStream)) and (FCurrentItem = FFields.Count) then begin
      AppendString(FInternalBuffer, '--' + Boundary + '--' + CRLF);     {do not localize}
      Inc(FCurrentItem);
    end;
  end;

  Result := LTotalRead;
end;

function TIdMultiPartFormDataStream.IdSeek(const AOffset: Int64; AOrigin: TSeekOrigin): Int64;
begin
  Result := 0;
  case AOrigin of
    soBeginning: begin
      if (AOffset = 0) then begin
        FInitialized := False;
        FPosition := 0;
        Result := 0;
      end else begin
        Result := FPosition;
      end;
    end;
    soCurrent: begin
      Result := FPosition;
    end;
    soEnd: begin
      if (AOffset = 0) then begin
        CalculateSize;
        Result := FSize;
      end else begin
        Result := FPosition;
      end;
    end;
  end;
end;

function TIdMultiPartFormDataStream.IdWrite(const ABuffer: TIdBytes; AOffset, ACount: Longint): Longint;
begin
  raise EIdException.Create(RSUnsupportedOperation);
end;

procedure TIdMultiPartFormDataStream.IdSetSize(ASize: Int64);
begin
  raise EIdException.Create(RSUnsupportedOperation);
end;

{ TIdFormDataFields }

function TIdFormDataFields.Add: TIdFormDataField;
begin
  Result := TIdFormDataField(inherited Add);
end;

constructor TIdFormDataFields.Create(AMPStream: TIdMultiPartFormDataStream);
begin
  inherited Create(TIdFormDataField);
  FParentStream := AMPStream;
end;

function TIdFormDataFields.GetFormDataField(AIndex: Integer): TIdFormDataField;
begin
  Result := TIdFormDataField(inherited Items[AIndex]);
end;

{ TIdFormDataField }

constructor TIdFormDataField.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FFieldObject := nil;
  FFileName := '';
  FFieldName := '';
  FContentType := '';
  FCanFreeFieldObject := False;
end;

destructor TIdFormDataField.Destroy;
begin
  if Assigned(FFieldObject) then begin
    if FCanFreeFieldObject then begin
      FreeAndNil(FFieldObject);
    end;
  end;
  inherited Destroy;
end;

function TIdFormDataField.FormatHeader: string;
var
  LBoundary: string;
  LHeaderEncoding: Char;
  LCharSet: String;
begin
  LBoundary := '--' + TIdFormDataFields(Collection).MultipartFormDataStream.Boundary; {do not localize}

  LHeaderEncoding := 'B';     { base64 / quoted-printable }    {Do not Localize}
  LCharSet := IdCharsetNames[IdGetDefaultCharSet];

  // it's not clear when VHeaderEncoding should be Q not B.
  // Comments welcome on atozedsoftware.indy.general

  case IdGetDefaultCharSet of
    idcs_ISO_8859_1  : LHeaderEncoding := 'Q';    {Do not Localize}
    idcs_UNICODE_1_1 : LCharSet := IdCharsetNames[idcs_UTF_8];
  else
    // nothing
  end;

  Result := IndyFormat('%s' + CRLF + sContentDispositionPlaceHolder,
    [LBoundary, EncodeHeader(FieldName, '', LHeaderEncoding, LCharSet)]);       {do not localize}

  if Length(FileName) > 0 then begin
    Result := Result + IndyFormat(sFileNamePlaceHolder,
      [EncodeHeader(FileName, '', LHeaderEncoding, LCharSet)]);                 {do not localize}
  end;

  Result := Result + CRLF;

  if Length(ContentType) > 0 then begin
    Result := Result + IndyFormat(sContentTypePlaceHolder, [ContentType]);      {do not localize}
    if Length(CharSet) > 0 then begin
      Result := Result + IndyFormat(sCharsetPlaceHolder, [Charset]);            {do not localize}
    end;
    Result := Result + CRLF;
  end;

  Result := Result + IndyFormat(sContentTransferPlaceHolder + CRLF,
    [iif(FieldObject is TStream, 'binary', 'quoted-printable')]);               {do not localize}

  Result := Result + CRLF;
end;

function TIdFormDataField.GetFieldSize: LongInt;
var
  LEncoding: TIdTextEncoding;
  LSize: TIdStreamSize;
  LStream: TStream;
begin
  Result := Length(FormatHeader);
  if not Assigned(FFieldObject) then begin
    Exit;
  end;
  if FieldObject is TStrings then begin
    LEncoding := CharsetToEncoding(FCharset);
    {$IFNDEF DOTNET}
    try
    {$ENDIF}
      LStream := TMemoryStream.Create;
      try
        TIdEncoderQuotedPrintable.EncodeString(TStrings(FieldObject).Text, LStream, LEncoding);
        // the text always includes a CRLF at the end...
        Result := Result + LStream.Size {+2};
      finally
        LStream.Free;
      end;
    {$IFNDEF DOTNET}
    finally
      LEncoding.Free;
    end;
    {$ENDIF}
  end
  else if FieldObject is TStream then begin
    LSize := TStream(FieldObject).Size;
    if LSize > 0 then begin
      // need to include an explicit CRLF at the end of the data
      Result := Result + LSize + 2;
    end;
  end;
end;

function TIdFormDataField.GetFieldStream: TStream;
begin
  if (FFieldObject is TStream) then begin
    Result := TStream(FFieldObject);
  end else begin
    Result := nil;
    raise EIdInvalidObjectType.Create(RSMFDIvalidObjectType);
  end;
end;

function TIdFormDataField.GetFieldStrings: TStrings;
begin
  if (FFieldObject is TStrings) then begin
    Result := TStrings(FFieldObject);
  end else begin
    Result := nil;
    raise EIdInvalidObjectType.Create(RSMFDIvalidObjectType);
  end;
end;

function TIdFormDataField.GetFieldValue: string;
begin
  if (FFieldObject is TStrings) then begin
    Result := TStrings(FFieldObject).Text;
  end else begin
    Result := '';
    raise EIdInvalidObjectType.Create(RSMFDIvalidObjectType);
  end;
end;

procedure TIdFormDataField.SetCharset(const Value: string);
begin
  FCharset := Value;
end;

procedure TIdFormDataField.SetContentType(const Value: string);
var
  LCharSet: String;
begin
  if Length(Value) > 0 then begin
    FContentType := RemoveHeaderEntry(Value, 'charset'); {do not localize}
    {RLebeau: override the current CharSet only if the header specifies a new value}
    LCharSet := ExtractHeaderSubItem(Value, 'charset'); {do not localize}
    if LCharSet <> '' then begin
      FCharSet := LCharSet;
    end;
  end
  else if Length(FFileName) > 0 then begin
    FContentType := GetMIMETypeFromFile(FFileName);
  end else begin;
    FContentType := sContentTypeOctetStream;
  end;
end;

procedure TIdFormDataField.SetFieldName(const Value: string);
begin
  FFieldName := Value;
end;

procedure TIdFormDataField.SetFieldObject(const Value: TObject);
begin
  if not ((Value is TStream) or (Value is TStrings)) then begin
    raise EIdInvalidObjectType.Create(RSMFDIvalidObjectType);
  end;

  if Assigned(FFieldObject) and FCanFreeFieldObject then begin
    FreeAndNil(FFieldObject);
  end;

  FFieldObject := Value;
  FCanFreeFieldObject := False;
end;

procedure TIdFormDataField.SetFieldStream(const Value: TStream);
begin
  FieldObject := Value;
end;

procedure TIdFormDataField.SetFieldStrings(const Value: TStrings);
begin
  FieldObject := Value;
end;

procedure TIdFormDataField.SetFieldValue(const Value: string);
begin
  if Assigned(FFieldObject) then begin
    if not (FFieldObject is TStrings) then begin
      if FCanFreeFieldObject then begin
        FreeAndNil(FFieldObject);
      end;
      FFieldObject := TStringList.Create;
      FCanFreeFieldObject := True;
    end;
  end else begin
    FFieldObject := TStringList.Create;
    FCanFreeFieldObject := True;
  end;
  TStrings(FFieldObject).Text := Value;
end;

procedure TIdFormDataField.SetFileName(const Value: string);
begin
  FFileName := ExtractFileName(Value);
end;

end.

