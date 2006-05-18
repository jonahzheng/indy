program httpget;

{$mode objfpc}{$H+}

{$IFDEF UNIX}
  {$define usezlib}
  {$define useopenssl}
{$ENDIF}
{$IFDEF WIN32}
  {$define usezlib}
  {$define useopenssl}
{$ENDIF}
uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  {$ifdef usezlib}
    IdCompressorZLib,  //for deflate and gzip content encoding
  {$endif}
  IdAuthenticationDigest, //MD5-Digest authentication
  {$ifdef useopenssl}
    IdSSLOpenSSL,  //ssl
    IdAuthenticationNTLM, //NTLM - uses OpenSSL libraries
  {$endif}
  Classes
  { add your units here },
  IdHTTPHeaderInfo,    //for HTTP request and response info.
  IdHTTP,
  IdURI,
  SysUtils;

function GetTargetFileName(AHTTP : TIdHTTP; const AURI : String) : String;
var
    LURI : TIdURI;
begin
{
We do things this way in case the server gave you a specific document type
in response to a request.

eg.

Request:  http://www.indyproject.org/
Response: http://www.indyproject.org/index.html
}
  LURI := TIdURI.Create;
  try
    LURI.URI := AHTTP.Response.Location;
    if LURI.Document <> '' then
    begin
      Result := LURI.Document;
    end
    else
    begin
      LURI.URI := AURI;
      Result := LURI.Document;
    end;
    if Result = '' then
    begin
      Result := 'index.html';
    end;
  finally
    FreeAndNil(LURI);
  end;
end;

procedure outputHeaders(var AFile : Text; AHTTP : TIdHTTP);
var i : Integer;
begin
  Writeln(AFile,'Request');
  for i := 0 to AHTTP.Request.RawHeaders.Count -1 do
  begin
    WriteLn(AFile,AHTTP.Request.RawHeaders[i]);
  end;
  Writeln(AFile,'');
  Writeln(AFile,'Response');
  for i := 0 to AHTTP.Response.RawHeaders.Count -1 do
  begin
    WriteLn(AFile,AHTTP.Response.RawHeaders[i]);
  end;
end;

procedure HTTPGetFile(const AURL : String; const AVerbose : Boolean);
var
  {$ifdef useopenssl}
  LIO : TIdSSLIOHandlerSocketOpenSSL;
  {$endif}
  LHTTP : TIdHTTP;
  LStr : TMemoryStream;
  i : Integer;
  LHE : EIdHTTPProtocolException;
  LFName : String;
 {$ifdef usezlib}
    LC : TIdCompressorZLib;
 {$endif}
begin
  {$ifdef useopenssl}
  LIO := TIdSSLIOHandlerSocketOpenSSL.Create;
  {$endif}
  {$ifdef  usezlib}
  LC := TIdCompressorZLib.Create;
  {$endif}
  try
    LHTTP := TIdHTTP.Create;
    try
      {$ifdef useopenssl}
      LHTTP.Compressor := LC;
      {$endif}
      //set to false if you want this to simply raise an exception on redirects
      LHTTP.HandleRedirects := True;
{
Note that you probably should set the UserAgent because some servers now screen out requests from
our default string "Mozilla/3.0 (compatible; Indy Library)" to prevent address harvesters
and Denial of Service attacks.  SOme people have used Indy for these.

Note that you do need a Mozilla string for the UserAgent property. The format is like this:

Mozilla/4.0 (compatible; MyProgram)
}
      LHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; httpget)';
      LStr := TMemoryStream.Create;
      {$ifdef useopenssl}
      LHTTP.IOHandler := LIO;
      {$endif}
      LHTTP.Get(AURL,LStr);      
      if AVerbose then
      begin
        outputHeaders(stdout,LHTTP);
      end;
      LFName := GetTargetFileName(LHTTP,AURL);
      if LFName <> '' then
      begin
        LStr.SaveToFile(LFName);
      end;

    except
      on E : Exception do
      begin
        if E is EIdHTTPProtocolException then
        begin
          LHE := E as EIdHTTPProtocolException;
          WriteLn(stderr,'HTTP Protocol Error - '+IntToStr(LHE.ErrorCode));
          WriteLn(stderr,LHE.ErrorMessage);
          Writeln(stderr,'');
          outputHeaders(stderr,LHTTP);
        end
        else
        begin
          Writeln(stderr,E.Message);
        end;
      end;
    end;
    FreeAndNil(LHTTP);
    FreeAndNil(LStr);
  finally
    {$ifdef useopenssl}
    FreeAndNil(LIO);
    {$endif}
    {$ifdef  usezlib}
    FreeAndNil(LC);
    {$endif}
  end;
end;

procedure PrintHelpScreen;
var LExe : String;
begin
  LExe := ExtractFileName(ParamStr(0));
  WriteLn(LExe);
  WriteLn('');
  WriteLn('usage: '+LExe+' [-v] URL');
  WriteLn('');
  WriteLn('  v : Verbose');
end;

var
  GURL, GSwitches : String;
  i : Integer;

begin
  GSwitches := '';

  if ParamCount > 0 then
  begin
    for i := 1 to ParamCount do
    begin
      if Copy(ParamStr(i),1,1) = '-' then
      begin
        GSwitches := GSwitches + Copy(ParamStr(i),2,Length(ParamStr(i))-1);
      end
      else
      begin
        if GURL ='' then
        begin
          GURL := ParamStr(i);
        end;
      end;
    end;

  end;
  if GURL = '' then
  begin
    PrintHelpScreen;
  end
  else
  begin

    HTTPGetFile(GURL, Pos(GSwitches,'v')>0);
  end;
end.

