unit IdTestFtpServer;

interface

uses
  IdGlobal,
  IdSys,
  IdObjs,
  IdTest,
  IdTcpClient,
  IdIOHandlerStack,
  IdLogDebug,
  IdFtp,
  IdFtpServer;

type

  TIdTestFtpServer = class(TIdTest)
  private
    procedure CallbackRetrieve(ASender: TIdFTPServerContext; const AFileName: string; var VStream: TIdStream);
    procedure CallbackStore(ASender: TIdFTPServerContext; const AFileName: string; AAppend: Boolean; var VStream: TIdStream);
  published
    procedure TestBasic;
    procedure TestMethods;
  end;

  TIdTestStream = class(TIdMemoryStream)
  public
    destructor Destroy;override;
  end;

implementation

const
  cGreeting='HELLO';
  cTestFtpPort=20021;
  cContent='HELLO';
  cUploadTo='file.txt';
  cGoodFilename='good.txt';
  cUnknownFilename='unknown.txt';
  cErrorFilename='error.txt';

procedure TIdTestFtpServer.CallbackRetrieve(ASender: TIdFTPServerContext;
  const AFileName: string; var VStream: TIdStream);
begin
 if AFileName=cGoodFilename then
   begin
   VStream:=TIdStringStream.Create(cContent);
   end
 else if AFileName=cErrorFilename then
   begin
   Assert(False);
   end
 else if AFileName=cUnknownFilename then
   begin
   end;
end;

procedure TIdTestFtpServer.CallbackStore(ASender: TIdFTPServerContext;
  const AFileName: string; AAppend: Boolean; var VStream: TIdStream);
//var
//  s:string;
begin
  Assert(VStream=nil);
  if AFileName=cUploadTo then
   begin
   VStream:=TIdTestStream.Create;
   //s:=ReadStringFromStream(VStream);
   //Assert(s=cContent);
   end;
end;

procedure TIdTestFtpServer.TestBasic;
var
  s:TIdFTPServer;
  c:TIdTCPClient;
  aStr:string;
  aIntercept:TIdLogDebug;
begin
  s:=TIdFTPServer.Create(nil);
  c:=TIdTCPClient.Create(nil);
  try
    c.CreateIOHandler;
    aIntercept := TIdLogDebug.Create;
    c.IOHandler.Intercept := aIntercept;
    aIntercept.Active := true;
    try
      s.Greeting.Text.Text:=cGreeting;
      s.DefaultPort:=cTestFtpPort;
      s.Active:=True;

      c.Port:=cTestFtpPort;
      c.Host:='127.0.0.1';
      c.Connect;
//OutputLn('Connected');
      c.IOHandler.ReadTimeout:=500;

      //expect a greeting. typical="220 FTP Server Ready."
      aStr:=c.IOHandler.Readln;

//OutputLn('ReadLn(1)');
      Assert(aStr = '220 ' + cGreeting, cGreeting);

      //ftp server should only process a command after crlf
      //see TIdFTPServer.ReadCommandLine
      c.IOHandler.Write('U');
//OutputLn('Write(''U'')');
      aStr:=c.IOHandler.Readln;
//OutputLn('ReadLn(2)');
      Assert(aStr='',aStr);

      //complete the rest of the command
      c.IOHandler.WriteLn('SER ANONYMOUS');
//OutputLn('WriteLn(2)');
      aStr:=c.IOHandler.Readln;
//OutputLn('ReadLn(3)');
      Assert(aStr<>'',aStr);

      //attempt to start a transfer when no datachannel setup.
      //should give 550 error?
      //typical quit='221 Goodbye.'
    finally
      aIntercept.Active := False;
    end;
  finally
    Sys.FreeAndNil(aIntercept);
    Sys.FreeAndNil(c);
    Sys.FreeAndNil(s);
  end;
end;


procedure TIdTestFtpServer.TestMethods;
var
  s:TIdFTPServer;
  c:TIdFTP;
  aStream:TIdMemoryStream;
const
  cTestFtpPort=20021;
begin
  s:=TIdFTPServer.Create(nil);
  c:=TIdFTP.Create(nil);
  try
//OutputLn('   TestMethods');
    s.Greeting.Text.Text:=cGreeting;
    s.DefaultPort:=cTestFtpPort;
    s.OnStoreFile:=CallbackStore;
    s.OnRetrieveFile:=CallbackRetrieve;
    s.Active:=True;
    c.Port:=cTestFtpPort;
    c.Host:='127.0.0.1';
    c.CreateIOHandler;
    c.IOHandler.ReadTimeout:=1000;
    c.AutoLogin:=False;
    c.Connect;
//OutputLn('Connected');
    //check invalid login
    //check valid login
    //check allow/disallow anonymous login

    s.AllowAnonymousLogin:=True;
    c.Username:='anonymous';
    c.Password:='bob@example.com';
    c.Login;
//OutputLn('LoggedOn');
//OutputLn('PORT Mode tests');
    repeat
    //check stream upload
    aStream:=TIdMemoryStream.Create;
    try
      WriteStringToStream(aStream, cContent);
      aStream.Position := 0;
      c.Put(aStream,cUploadTo);
    finally
      Sys.FreeAndNil(aStream);
    end;

//OutputLn('Put done.');
    //check no dest filename
    //check missing source file
    //check file upload rejected by server. eg out of space?

    //check normal file upload. create a temp file? use c:\?
    //c.Put('c:\test.txt',cUploadTo);

    //test resume
    //test download unknown file

    aStream:=TIdMemoryStream.Create;
    try
    //test download to stream
    c.Get(cGoodFilename,aStream);
//OutputLn('Get done.');
//    Assert(aStream.DataString=cContent);

    //test exception on server gets sent to client
{    aStream.Size:=0;
    try
    c.Get(cUnknownFilename,aStream);
    Assert(False);
    except
    //expect to be here
    end;
}
    finally
    Sys.FreeAndNil(aStream);
    end;
      if c.Passive then
      begin
        break;
      end;

//OutputLn('PASV Mode tests');
      c.Passive := True;
    until False;
  finally
    Sys.FreeAndNil(c);
    Sys.FreeAndNil(s);
  end;
end;

destructor TIdTestStream.Destroy;
begin
  inherited;
end;

initialization

  TIdTest.RegisterTest(TIdTestFtpServer);

end.
