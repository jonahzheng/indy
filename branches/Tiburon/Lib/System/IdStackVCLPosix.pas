unit IdStackVCLPosix;
{
IMPORTANT!!!

Currently, this backend does not provide any functionality.  We will get back
to this when Embarcadero provides headers for the BSD Socket API.
}
interface
uses
  Classes,
  IdFakePosixSockets,
  IdStack,
  IdStackConsts,
  IdGlobal,
  IdStackBSDBase;

type
  TIdSocketListVCLPosix = class (TIdSocketList)
  protected
    FCount: Integer;
    FFDSet: TFDSet;
    //
    class function FDSelect(AReadSet: PFDSet; AWriteSet: PFDSet; AExceptSet: PFDSet;
      const ATimeout: Integer = IdTimeoutInfinite): Integer;
    function GetItem(AIndex: Integer): TIdStackSocketHandle; override;
  public
    procedure Add(AHandle: TIdStackSocketHandle); override;
    procedure Remove(AHandle: TIdStackSocketHandle); override;
    function Count: Integer; override;
    procedure Clear; override;
    function Clone: TIdSocketList; override;
    function ContainsSocket(AHandle: TIdStackSocketHandle): Boolean; override;
    procedure GetFDSet(var VSet: TFDSet);
    procedure SetFDSet(var VSet: TFDSet);
    class function Select(AReadList: TIdSocketList; AWriteList: TIdSocketList;
      AExceptList: TIdSocketList; const ATimeout: Integer = IdTimeoutInfinite): Boolean; override;
    function SelectRead(const ATimeout: Integer = IdTimeoutInfinite): Boolean; override;
    function SelectReadList(var VSocketList: TIdSocketList;
      const ATimeout: Integer = IdTimeoutInfinite): Boolean; override;
  end;

  TIdStackVCLPosix = class(TIdStackBSDBase)
  protected
//    procedure SetSocketOption(ASocket: TIdStackSocketHandle;
//      ALevel: TIdSocketProtocol; AOptName: TIdSocketOption; AOptVal: Integer);
    procedure WriteChecksumIPv6(s: TIdStackSocketHandle; var VBuffer: TIdBytes;
      const AOffset: Integer; const AIP: String; const APort: TIdPort);
    function GetLastError: Integer;
    procedure SetLastError(const AError: Integer);
    function HostByName(const AHostName: string;
      const AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION): string; override;
    function ReadHostName: string; override;
    function WSCloseSocket(ASocket: TIdStackSocketHandle): Integer; override;
    function WSRecv(ASocket: TIdStackSocketHandle; var ABuffer;
      const ABufferLength, AFlags: Integer): Integer; override;
    function WSSend(ASocket: TIdStackSocketHandle; const ABuffer;
      const ABufferLength, AFlags: Integer): Integer; override;
    function WSShutdown(ASocket: TIdStackSocketHandle; AHow: Integer): Integer; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetBlocking(ASocket: TIdStackSocketHandle; const ABlocking: Boolean); override;
    function WouldBlock(const AResult: Integer): Boolean; override;
    function WSTranslateSocketErrorMsg(const AErr: Integer): string; override;
    function Accept(ASocket: TIdStackSocketHandle; var VIP: string; var VPort: TIdPort;
      var VIPVersion: TIdIPVersion): TIdStackSocketHandle; override;
    procedure Bind(ASocket: TIdStackSocketHandle; const AIP: string;
     const APort: TIdPort; const AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION); override;
    procedure Connect(const ASocket: TIdStackSocketHandle; const AIP: string;
     const APort: TIdPort; const AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION); override;
    function HostByAddress(const AAddress: string;
      const AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION): string; override;
    function WSGetLastError: Integer; override;
    procedure WSSetLastError(const AErr : Integer); override;
    function WSGetServByName(const AServiceName: string): TIdPort; override;
    function WSGetServByPort(const APortNumber: TIdPort): TStrings; override;
    procedure WSGetSockOpt(ASocket: TIdStackSocketHandle; Alevel, AOptname: Integer;
      AOptval: PAnsiChar; var AOptlen: Integer); override;
    procedure GetSocketOption(ASocket: TIdStackSocketHandle;
      ALevel: TIdSocketOptionLevel; AOptName: TIdSocketOption;
      out AOptVal: Integer); override;
    procedure GetPeerName(ASocket: TIdStackSocketHandle; var VIP: string;
     var VPort: TIdPort; var VIPVersion: TIdIPVersion); override;
    procedure GetSocketName(ASocket: TIdStackSocketHandle; var VIP: string;
     var VPort: TIdPort; var VIPVersion: TIdIPVersion); override;
    procedure Listen(ASocket: TIdStackSocketHandle; ABackLog: Integer); override;
    function HostToNetwork(AValue: Word): Word; override;
    function NetworkToHost(AValue: Word): Word; override;
    function HostToNetwork(AValue: LongWord): LongWord; override;
    function NetworkToHost(AValue: LongWord): LongWord; override;
    function HostToNetwork(AValue: Int64): Int64; override;
    function NetworkToHost(AValue: Int64): Int64; override;
    function RecvFrom(const ASocket: TIdStackSocketHandle; var VBuffer;
      const ALength, AFlags: Integer; var VIP: string; var VPort: TIdPort;
      AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION): Integer; override;
    function ReceiveMsg(ASocket: TIdStackSocketHandle; var VBuffer: TIdBytes;
      APkt :  TIdPacketInfo; const AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION): LongWord; override;
    procedure WSSendTo(ASocket: TIdStackSocketHandle; const ABuffer;
      const ABufferLength, AFlags: Integer; const AIP: string; const APort: TIdPort;
      AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION); override;
    function WSSocket(AFamily, AStruct, AProtocol: Integer;
     const AOverlapped: Boolean = False): TIdStackSocketHandle; override;
    procedure Disconnect(ASocket: TIdStackSocketHandle); override;
    procedure SetSocketOption(ASocket: TIdStackSocketHandle; ALevel: TIdSocketOptionLevel;
      AOptName: TIdSocketOption; AOptVal: Integer); overload;override;
    procedure SetSocketOption( const ASocket: TIdStackSocketHandle;
      const Alevel, Aoptname: Integer; Aoptval: PAnsiChar; const Aoptlen: Integer); overload; override;
    function SupportsIPv6: Boolean; overload; override;
    function CheckIPVersionSupport(const AIPVersion: TIdIPVersion): boolean; override;
    //In Windows, this writes a checksum into a buffer.  In Linux, it would probably
    //simply have the kernal write the checksum with something like this (RFC 2292):
//
//    int  offset = 2;
//    setsockopt(fd, IPPROTO_IPV6, IPV6_CHECKSUM, &offset, sizeof(offset));
//
//  Note that this should be called
    //IMMEDIATELY before you do a SendTo because the Local IPv6 address might change

    procedure WriteChecksum(s : TIdStackSocketHandle; var VBuffer : TIdBytes;
      const AOffset : Integer; const AIP : String; const APort : TIdPort;
      const AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION); override;
    function IOControl(const s: TIdStackSocketHandle; const cmd: LongWord;
      var arg: LongWord): Integer; override;

    procedure AddLocalAddressesToList(AAddresses: TStrings); override;
  end;

implementation

{ TIdSocketListVCLPosix }

procedure TIdSocketListVCLPosix.Add(AHandle: TIdStackSocketHandle);
begin
  inherited;

end;

procedure TIdSocketListVCLPosix.Clear;
begin
  inherited;

end;

function TIdSocketListVCLPosix.Clone: TIdSocketList;
begin

end;

function TIdSocketListVCLPosix.ContainsSocket(
  AHandle: TIdStackSocketHandle): Boolean;
begin

end;

function TIdSocketListVCLPosix.Count: Integer;
begin

end;

class function TIdSocketListVCLPosix.FDSelect(AReadSet, AWriteSet,
  AExceptSet: PFDSet; const ATimeout: Integer): Integer;
begin

end;

procedure TIdSocketListVCLPosix.GetFDSet(var VSet: TFDSet);
begin

end;

function TIdSocketListVCLPosix.GetItem(AIndex: Integer): TIdStackSocketHandle;
begin

end;

procedure TIdSocketListVCLPosix.Remove(AHandle: TIdStackSocketHandle);
begin
  inherited;

end;

class function TIdSocketListVCLPosix.Select(AReadList, AWriteList,
  AExceptList: TIdSocketList; const ATimeout: Integer): Boolean;
begin

end;

function TIdSocketListVCLPosix.SelectRead(const ATimeout: Integer): Boolean;
begin

end;

function TIdSocketListVCLPosix.SelectReadList(var VSocketList: TIdSocketList;
  const ATimeout: Integer): Boolean;
begin

end;

procedure TIdSocketListVCLPosix.SetFDSet(var VSet: TFDSet);
begin

end;

{ TIdStackVCLPosix }

function TIdStackVCLPosix.Accept(ASocket: TIdStackSocketHandle; var VIP: string;
  var VPort: TIdPort; var VIPVersion: TIdIPVersion): TIdStackSocketHandle;
begin

end;

procedure TIdStackVCLPosix.AddLocalAddressesToList(AAddresses: TStrings);
begin
  inherited;

end;

procedure TIdStackVCLPosix.Bind(ASocket: TIdStackSocketHandle;
  const AIP: string; const APort: TIdPort; const AIPVersion: TIdIPVersion);
begin
  inherited;

end;

function TIdStackVCLPosix.CheckIPVersionSupport(
  const AIPVersion: TIdIPVersion): boolean;
begin

end;

procedure TIdStackVCLPosix.Connect(const ASocket: TIdStackSocketHandle;
  const AIP: string; const APort: TIdPort; const AIPVersion: TIdIPVersion);
begin
  inherited;

end;

constructor TIdStackVCLPosix.Create;
begin
  inherited;

end;

destructor TIdStackVCLPosix.Destroy;
begin

  inherited;
end;

procedure TIdStackVCLPosix.Disconnect(ASocket: TIdStackSocketHandle);
begin
  inherited;

end;

function TIdStackVCLPosix.GetLastError: Integer;
begin

end;

procedure TIdStackVCLPosix.GetPeerName(ASocket: TIdStackSocketHandle;
  var VIP: string; var VPort: TIdPort; var VIPVersion: TIdIPVersion);
begin
  inherited;

end;

procedure TIdStackVCLPosix.GetSocketName(ASocket: TIdStackSocketHandle;
  var VIP: string; var VPort: TIdPort; var VIPVersion: TIdIPVersion);
begin
  inherited;

end;

procedure TIdStackVCLPosix.GetSocketOption(ASocket: TIdStackSocketHandle;
  ALevel: TIdSocketOptionLevel; AOptName: TIdSocketOption;
  out AOptVal: Integer);
begin
  inherited;

end;

function TIdStackVCLPosix.HostByAddress(const AAddress: string;
  const AIPVersion: TIdIPVersion): string;
begin

end;

function TIdStackVCLPosix.HostByName(const AHostName: string;
  const AIPVersion: TIdIPVersion): string;
begin

end;

function TIdStackVCLPosix.HostToNetwork(AValue: LongWord): LongWord;
begin

end;

function TIdStackVCLPosix.HostToNetwork(AValue: Word): Word;
begin

end;

function TIdStackVCLPosix.HostToNetwork(AValue: Int64): Int64;
begin

end;

function TIdStackVCLPosix.IOControl(const s: TIdStackSocketHandle;
  const cmd: LongWord; var arg: LongWord): Integer;
begin

end;

procedure TIdStackVCLPosix.Listen(ASocket: TIdStackSocketHandle;
  ABackLog: Integer);
begin
  inherited;

end;

function TIdStackVCLPosix.NetworkToHost(AValue: LongWord): LongWord;
begin

end;

function TIdStackVCLPosix.NetworkToHost(AValue: Int64): Int64;
begin

end;

function TIdStackVCLPosix.NetworkToHost(AValue: Word): Word;
begin

end;

function TIdStackVCLPosix.ReadHostName: string;
begin

end;

function TIdStackVCLPosix.ReceiveMsg(ASocket: TIdStackSocketHandle;
  var VBuffer: TIdBytes; APkt: TIdPacketInfo;
  const AIPVersion: TIdIPVersion): LongWord;
begin

end;

function TIdStackVCLPosix.RecvFrom(const ASocket: TIdStackSocketHandle;
  var VBuffer; const ALength, AFlags: Integer; var VIP: string;
  var VPort: TIdPort; AIPVersion: TIdIPVersion): Integer;
begin

end;

procedure TIdStackVCLPosix.SetBlocking(ASocket: TIdStackSocketHandle;
  const ABlocking: Boolean);
begin
  inherited;

end;

procedure TIdStackVCLPosix.SetLastError(const AError: Integer);
begin

end;

procedure TIdStackVCLPosix.SetSocketOption(ASocket: TIdStackSocketHandle;
  ALevel: TIdSocketOptionLevel; AOptName: TIdSocketOption; AOptVal: Integer);
begin
  inherited;

end;

procedure TIdStackVCLPosix.SetSocketOption(const ASocket: TIdStackSocketHandle;
  const Alevel, Aoptname: Integer; Aoptval: PAnsiChar; const Aoptlen: Integer);
begin
  inherited;

end;

function TIdStackVCLPosix.SupportsIPv6: Boolean;
begin

end;

function TIdStackVCLPosix.WouldBlock(const AResult: Integer): Boolean;
begin

end;

procedure TIdStackVCLPosix.WriteChecksum(s: TIdStackSocketHandle;
  var VBuffer: TIdBytes; const AOffset: Integer; const AIP: String;
  const APort: TIdPort; const AIPVersion: TIdIPVersion);
begin
  inherited;

end;

procedure TIdStackVCLPosix.WriteChecksumIPv6(s: TIdStackSocketHandle;
  var VBuffer: TIdBytes; const AOffset: Integer; const AIP: String;
  const APort: TIdPort);
begin

end;

function TIdStackVCLPosix.WSCloseSocket(ASocket: TIdStackSocketHandle): Integer;
begin

end;

function TIdStackVCLPosix.WSGetLastError: Integer;
begin

end;

function TIdStackVCLPosix.WSGetServByName(const AServiceName: string): TIdPort;
begin

end;

function TIdStackVCLPosix.WSGetServByPort(const APortNumber: TIdPort): TStrings;
begin

end;

procedure TIdStackVCLPosix.WSGetSockOpt(ASocket: TIdStackSocketHandle; Alevel,
  AOptname: Integer; AOptval: PAnsiChar; var AOptlen: Integer);
begin
  inherited;

end;

function TIdStackVCLPosix.WSRecv(ASocket: TIdStackSocketHandle; var ABuffer;
  const ABufferLength, AFlags: Integer): Integer;
begin

end;

function TIdStackVCLPosix.WSSend(ASocket: TIdStackSocketHandle; const ABuffer;
  const ABufferLength, AFlags: Integer): Integer;
begin

end;

procedure TIdStackVCLPosix.WSSendTo(ASocket: TIdStackSocketHandle;
  const ABuffer; const ABufferLength, AFlags: Integer; const AIP: string;
  const APort: TIdPort; AIPVersion: TIdIPVersion);
begin
  inherited;

end;

procedure TIdStackVCLPosix.WSSetLastError(const AErr: Integer);
begin
  inherited;

end;

function TIdStackVCLPosix.WSShutdown(ASocket: TIdStackSocketHandle;
  AHow: Integer): Integer;
begin

end;

function TIdStackVCLPosix.WSSocket(AFamily, AStruct, AProtocol: Integer;
  const AOverlapped: Boolean): TIdStackSocketHandle;
begin

end;

function TIdStackVCLPosix.WSTranslateSocketErrorMsg(
  const AErr: Integer): string;
begin

end;

end.
