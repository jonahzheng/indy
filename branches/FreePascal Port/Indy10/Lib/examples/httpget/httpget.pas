program httpget;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { add your units here },
  IdHTTPHeaderInfo,    //for HTTP request and response info.
  IdHTTP,
  IdSSLOpenSSL,
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
  LIO : TIdSSLIOHandlerSocketOpenSSL;
  LHTTP : TIdHTTP;
  LStr : TMemoryStream;
  i : Integer;
  LHE : EIdHTTPProtocolException;
  LFName : String;
begin
  LIO := TIdSSLIOHandlerSocketOpenSSL.Create;
  try
    LHTTP := TIdHTTP.Create;
    try
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
      LHTTP.IOHandler := LIO;
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
    FreeAndNil(LIO);
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

