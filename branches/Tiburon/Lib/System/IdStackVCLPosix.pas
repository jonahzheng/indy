unit IdStackVCLPosix;
{
IMPORTANT!!!

Currently, this backend does not provide any functionality.  We will get back
to this when Embarcadero provides headers for the BSD Socket API.
}
interface
uses
  Classes,
    PosixSysSelect,
  PosixSysSocket,
  PosixSysTime,
//  IdFakePosixSockets,
  IdStack,
  IdStackConsts,
  IdGlobal,
  IdStackBSDBase;

type

  TIdSocketListVCLPosix = class (TIdSocketList)
  protected
    FCount: Integer;
    FFDSet: fd_set;
    //
    class function FDSelect(AReadSet, AWriteSet,
      AExceptSet: Pfd_set; const ATimeout: Integer): Integer;
    function GetItem(AIndex: Integer): TIdStackSocketHandle; override;
  public


    procedure Add(AHandle: TIdStackSocketHandle); override;
    procedure Remove(AHandle: TIdStackSocketHandle); override;
    function Count: Integer; override;
    procedure Clear; override;
    function Clone: TIdSocketList; override;
    function ContainsSocket(AHandle: TIdStackSocketHandle): Boolean; override;
    procedure GetFDSet(var VSet: fd_set);
    procedure SetFDSet(var VSet: fd_set);
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
    function RecvFrom(const ASocket: TIdStackSocketHandle;
      var VBuffer; const ALength, AFlags: Integer; var VIP: string;
      var VPort: TIdPort; var VIPVersion: TIdIPVersion): Integer; override;
    function ReceiveMsg(ASocket: TIdStackSocketHandle;
      var VBuffer: TIdBytes; APkt: TIdPacketInfo): LongWord;  override;
    procedure WSSendTo(ASocket: TIdStackSocketHandle; const ABuffer;
      const ABufferLength, AFlags: Integer; const AIP: string; const APort: TIdPort;
      AIPVersion: TIdIPVersion = ID_DEFAULT_IP_VERSION); override;
    function WSSocket(AFamily : Integer; AStruct : TIdSocketType; AProtocol: Integer;
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
uses
  IdResourceStrings,
  IdException,
  PosixBase,
  PosixArpaInet,
  PosixErrno,
  PosixNetDB,
  PosixNetinetIn,
  PosixSysTypes,
  PosixUnistd,
  SysUtils;

  //Psockaddr(@LAddr)^

function IPv6_accept(socket: Integer; out address: sockaddr_in6;
  out address_len: socklen_t): Integer; cdecl;
  external libc name _PU + 'accept';

function IPv6_bind(socket: Integer; const address: sockaddr_in6;
  address_len: socklen_t): Integer; cdecl;
  external libc name _PU + 'bind';

function IPv6_connect(socket: Integer; const address: sockaddr_in6;
  address_len: socklen_t): Integer; cdecl;
  external libc name _PU + 'connect';

function IPv6_getpeername(socket: Integer; var address: sockaddr_in6;
  var address_len: socklen_t): Integer; cdecl;
  external libc name _PU + 'getpeername';

function IPv6_getsockname(socket: Integer; var address: sockaddr_in6;
  var address_len: socklen_t): Integer; cdecl;
  external libc name _PU + 'getsockname';

function IPv6_recvfrom(socket: Integer; var buffer; length: Size_t;
  flags: Integer; var address: sockaddr_in6;
  var address_len: socklen_t):  ssize_t; cdecl;
  external libc name _PU + 'recvfrom';

function IPv6_sendto(socket: Integer; const message; length: size_t;
  flags: Integer; const dest_addr: sockaddr_in6; dest_len: socklen_t): ssize_t; cdecl;
  external libc name _PU + 'sendto';


const
  {$IFDEF MACOSX}
  //fancy little trick since OS X does not have MSG_NOSIGNAL
  Id_MSG_NOSIGNAL = 0;
  {$ELSE}
  Id_MSG_NOSIGNAL = MSG_NOSIGNAL;
  {$ENDIF}
  Id_WSAEPIPE = EPIPE;
{ TIdSocketListVCLPosix }

procedure TIdSocketListVCLPosix.Add(AHandle: TIdStackSocketHandle);
begin
  Lock;
  try
    if not __FD_ISSET(AHandle, FFDSet) then begin
      if Count >= FD_SETSIZE then begin
        raise EIdStackSetSizeExceeded.Create(RSSetSizeExceeded);
      end;
      __FD_SET(AHandle, FFDSet);
      Inc(FCount);
    end;
  finally
    Unlock;
  end;
end;

procedure TIdSocketListVCLPosix.Clear;
begin
  Lock;
  try
    __FD_ZERO(FFDSet);
    FCount := 0;
  finally
    Unlock;
  end;
end;

function TIdSocketListVCLPosix.Clone: TIdSocketList;
begin
  Result := TIdSocketListVCLPosix.Create;
  try
    Lock;
    try
      TIdSocketListVCLPosix(Result).SetFDSet(FFDSet);
    finally
      Unlock;
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TIdSocketListVCLPosix.ContainsSocket(
  AHandle: TIdStackSocketHandle): Boolean;
begin
  Lock;
  try
    Result := __FD_ISSET(AHandle, FFDSet);
  finally
    Unlock;
  end;
end;

function TIdSocketListVCLPosix.Count: Integer;
begin
  Lock;
  try
    Result := FCount;
  finally
    Unlock;
  end;
end;

class function TIdSocketListVCLPosix.FDSelect(AReadSet, AWriteSet,
  AExceptSet: Pfd_set; const ATimeout: Integer): Integer;
var
  LTime: TimeVal;
  LTimePtr: PTimeVal;
begin
  if ATimeout = IdTimeoutInfinite then begin
    LTimePtr := nil;
  end else begin
    LTime.tv_sec := ATimeout div 1000;
    LTime.tv_usec := (ATimeout mod 1000) * 1000;
    LTimePtr := @LTime;
  end;
  Result := PosixSysSelect.select(MaxLongint, AReadSet, AWriteSet, AExceptSet, LTimePtr);
end;

procedure TIdSocketListVCLPosix.GetFDSet(var VSet: fd_set);
begin
  Lock;
  try
    VSet := FFDSet;
  finally
    Unlock;
  end;
end;

function TIdSocketListVCLPosix.GetItem(AIndex: Integer): TIdStackSocketHandle;
var
  LIndex, i: Integer;
begin
  Result := 0;
  Lock;
  try
    LIndex := 0;
    //? use FMaxHandle div x
    for i:= 0 to FD_SETSIZE - 1 do begin
      if __FD_ISSET(i, FFDSet) then begin
        if LIndex = AIndex then begin
          Result := i;
          Break;
        end;
        Inc(LIndex);
      end;
    end;
  finally
    Unlock;
  end;
end;

procedure TIdSocketListVCLPosix.Remove(AHandle: TIdStackSocketHandle);
begin
  Lock;
  try
    if __FD_ISSET(AHandle, FFDSet) then begin
      Dec(FCount);
      __FD_CLR(AHandle, FFDSet);
    end;
  finally
    Unlock;
  end;
end;

class function TIdSocketListVCLPosix.Select(AReadList, AWriteList,
  AExceptList: TIdSocketList; const ATimeout: Integer): Boolean;

var
  LReadSet: fd_set;
  LWriteSet: fd_set;
  LExceptSet: fd_set;
  LPReadSet: Pfd_set;
  LPWriteSet: Pfd_set;
  LPExceptSet: Pfd_set;

  procedure ReadSet(AList: TIdSocketList; var ASet: fd_set; var APSet: Pfd_set);
  begin
    if AList <> nil then begin
      TIdSocketListVCLPosix(AList).GetFDSet(ASet);
      APSet := @ASet;
    end else begin
      APSet := nil;
    end;
  end;

begin
  ReadSet(AReadList, LReadSet, LPReadSet);
  ReadSet(AWriteList, LWriteSet, LPWriteSet);
  ReadSet(AExceptList, LExceptSet, LPExceptSet);
  //
  Result := FDSelect(LPReadSet, LPWriteSet, LPExceptSet, ATimeout) >0;
  //
  TIdSocketListVCLPosix(AReadList).SetFDSet(LReadSet);
  TIdSocketListVCLPosix(AWriteList).SetFDSet(LWriteSet);
  TIdSocketListVCLPosix(AExceptList).SetFDSet(LExceptSet);
end;

function TIdSocketListVCLPosix.SelectRead(const ATimeout: Integer): Boolean;
var
  LSet: fd_set;
begin
  Lock;
  try
    LSet := FFDSet;
    // select() updates this structure on return,
    // so we need to copy it each time we need it
  finally
    Unlock;
  end;
  Result := FDSelect(@LSet, nil, nil, ATimeout) > 0;
end;

function TIdSocketListVCLPosix.SelectReadList(var VSocketList: TIdSocketList;
  const ATimeout: Integer): Boolean;
var
  LSet: fd_set;
begin
  Lock;
  try
    LSet := FFDSet;
    // select() updates this structure on return,
    // so we need to copy it each time we need it
  finally
    Unlock;
  end;
  Result := FDSelect(@LSet, nil, nil, ATimeout) > 0;
  if Result then begin
    if VSocketList = nil then begin
      VSocketList := TIdSocketList.CreateSocketList;
    end;
    TIdSocketListVCLPosix(VSocketList).SetFDSet(LSet);
  end;
end;

procedure TIdSocketListVCLPosix.SetFDSet(var VSet: fd_set);
begin
  Lock;
  try
    FFDSet := VSet;
  finally
    Unlock;
  end;
end;

{ TIdStackVCLPosix }

function TIdStackVCLPosix.Accept(ASocket: TIdStackSocketHandle; var VIP: string;
  var VPort: TIdPort; var VIPVersion: TIdIPVersion): TIdStackSocketHandle;
var
  LN: socklen_t;
  LAddr: sockaddr_in6;
  LAddrPtr : Psockaddr;
begin
  LN := SizeOf(LAddr);
  LAddrPtr := psockaddr(@LAddr);
  Result := PosixSysSocket.accept(ASocket, LAddrPtr^, LN);
  if Result <> -1 then begin
    case LAddr.sin6_family of
      Id_PF_INET4: begin
        with PSockAddrIn(LAddrPtr)^ do begin
          VIP := TranslateTInAddrToString( sin_addr, Id_IPv4);
          VPort := Ntohs(PSockAddrIn(LAddrPtr)^.sin_port);
        end;
        VIPVersion := Id_IPV4;
      end;
      Id_PF_INET6: begin
        with LAddr do begin
          VIP := TranslateTInAddrToString(sin6_addr, Id_IPv6);
          VPort := ntohs(sin6_port);
        end;
        VIPVersion := Id_IPV6;
      end
      else begin
        __close(Result);
        Result := Id_INVALID_SOCKET;
        IPVersionUnsupported;
      end;
    end;
  end else begin
    if GetLastError = EBADF then begin
      SetLastError(EINTR);
    end;
  end;
end;

procedure TIdStackVCLPosix.AddLocalAddressesToList(AAddresses: TStrings);
type
  TaPInAddr = array[0..250] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  LRetVal: Integer;
  LHostName: AnsiString;
  Hints: TAddrInfo;
  LAddrInfo: pAddrInfo;

begin
  Hints.ai_family := Id_PF_INET4;
  Hints.ai_socktype := SOCK_STREAM;
  Hints.ai_protocol := 0;
  Hints.ai_addrlen := 0;
  Hints.ai_canonname := nil;
  Hints.ai_next := nil;
  Hints.ai_addr := nil;

  LAddrInfo := nil;

  LHostName := HostName;
  LRetVal := getaddrinfo( PAnsiChar(LHostName), nil, Hints, LAddrInfo);
  if LRetVal <> 0 then begin
    EIdReverseResolveError.CreateFmt(RSReverseResolveError, [LHostName, gai_strerror(LRetVal), LRetVal]);
  end;
  try
    AAddresses.BeginUpdate;
    try
      repeat
        case LAddrInfo^.ai_addr^.sa_family  of
        Id_PF_INET4 : AAddresses.Add(TranslateTInAddrToString( PSockAddrIn(LAddrInfo^.ai_addr)^.sin_addr, Id_IPv4));
        Id_PF_INET6 : AAddresses.Add(TranslateTInAddrToString( PSockAddrIn6(LAddrInfo^.ai_addr)^.sin6_addr, Id_IPv6));
        end;
        LAddrInfo := LAddrInfo^.ai_next;
      until LAddrInfo = nil;
    finally;
      AAddresses.EndUpdate;
    end;
  finally
    freeaddrinfo(LAddrInfo^);
  end;
end;

procedure TIdStackVCLPosix.Bind(ASocket: TIdStackSocketHandle;
  const AIP: string; const APort: TIdPort; const AIPVersion: TIdIPVersion);
var
  LAddr: sockaddr_in6;
begin
  FillChar(LAddr, SizeOf(LAddr), 0);
  case AIPVersion of
    Id_IPv4: begin
        with PSockAddrIn(@LAddr)^ do begin
          sin_family := Id_PF_INET4;
          if AIP <> '' then begin
            TranslateStringToTInAddr(AIP, sin_addr, Id_IPv4);
          end;
          sin_port := htons(APort);
        end;
        CheckForSocketError(PosixSysSocket.bind(ASocket, Psockaddr(@LAddr)^,SizeOf(sockaddr)));
      end;
    Id_IPv6: begin
        with LAddr do begin
          sin6_family := Id_PF_INET6;
          if AIP <> '' then begin
            TranslateStringToTInAddr(AIP, sin6_addr, Id_IPv6);
          end;
          sin6_port := htons(APort);
        end;
        CheckForSocketError(PosixSysSocket.bind(ASocket,Psockaddr(@LAddr)^, SizeOf(sockaddr_in6)));
      end;
    else begin
      IPVersionUnsupported;
    end;
  end;

end;

function TIdStackVCLPosix.CheckIPVersionSupport(
  const AIPVersion: TIdIPVersion): boolean;
var
  LTmpSocket: TIdStackSocketHandle;
begin
  LTmpSocket := WSSocket(IdIPFamily[AIPVersion], Id_SOCK_STREAM, Id_IPPROTO_IP );
  Result := LTmpSocket <> Id_INVALID_SOCKET;
  if Result then begin
    WSCloseSocket(LTmpSocket);
  end;
end;

procedure TIdStackVCLPosix.Connect(const ASocket: TIdStackSocketHandle;
  const AIP: string; const APort: TIdPort; const AIPVersion: TIdIPVersion);
var
  LAddr: sockAddr_in6;
begin
  FillChar(LAddr, SizeOf(LAddr), 0);
  case AIPVersion of
    Id_IPv4: begin
      with PSockAddrIn(@LAddr)^ do begin
        sin_family := Id_PF_INET4;
        TranslateStringToTInAddr(AIP, sin_addr, Id_IPv4);
        sin_port := htons(APort);
      end;
      CheckForSocketError(PosixSysSocket.connect(
        ASocket,Psockaddr(@LAddr)^,
        SizeOf(sockaddr)));
    end;
    Id_IPv6: begin
      with LAddr do begin
        sin6_family := Id_PF_INET6;
        TranslateStringToTInAddr(AIP, sin6_addr, Id_IPv6);
        sin6_port := htons(APort);
      end;
      CheckForSocketError(
        PosixSysSocket.connect( ASocket, Psockaddr(@LAddr)^, SizeOf(sockaddr_in6)));
    end;
    else begin
      IPVersionUnsupported;
    end;
  end;

end;

constructor TIdStackVCLPosix.Create;
begin
  inherited Create;
end;

destructor TIdStackVCLPosix.Destroy;
begin
  inherited Destroy;
end;

procedure TIdStackVCLPosix.Disconnect(ASocket: TIdStackSocketHandle);
begin
  // Windows uses Id_SD_Send, Linux should use Id_SD_Both
  WSShutdown(ASocket, Id_SD_Both);
  // SO_LINGER is false - socket may take a little while to actually close after this
  WSCloseSocket(ASocket);
end;

function TIdStackVCLPosix.GetLastError: Integer;
begin
  Result := errno;
end;

procedure TIdStackVCLPosix.GetPeerName(ASocket: TIdStackSocketHandle;
  var VIP: string; var VPort: TIdPort; var VIPVersion: TIdIPVersion);
var
  i: socklen_t;
  LAddr: sockaddr_in6;
begin
  i := SizeOf(LAddr);
  CheckForSocketError(PosixSysSocket.getpeername(ASocket, PSockAddr(@LAddr)^, i));
  case LAddr.sin6_family of
    Id_PF_INET4: begin
      with PsockaddrIn(@LAddr)^ do begin
        VIP := TranslateTInAddrToString(sin_addr, Id_IPv4);
        VPort := ntohs(sin_port);
      end;
      VIPVersion := Id_IPV4;
    end;
    Id_PF_INET6: begin
      with LAddr do begin
        VIP := TranslateTInAddrToString(sin6_addr, Id_IPv6);
        VPort := Ntohs(sin6_port);
      end;
      VIPVersion := Id_IPV6;
    end;
    else begin
      IPVersionUnsupported;
    end;
  end;

end;

procedure TIdStackVCLPosix.GetSocketName(ASocket: TIdStackSocketHandle;
  var VIP: string; var VPort: TIdPort; var VIPVersion: TIdIPVersion);
var
  LiSize: socklen_t;
  LAddr: sockaddr_in6;

begin
  LiSize := SizeOf(LAddr);
  CheckForSocketError(getsockname(ASocket, psockaddr(@LAddr)^, LiSize));
  case PSockAddr(@LAddr)^.sa_family of
    Id_PF_INET4: begin
      with psockaddrIn(@LAddr)^ do begin
        VIP := TranslateTInAddrToString(sin_addr, Id_IPv4);
        VPort := ntohs(sin_port);
      end;
      VIPVersion := Id_IPV4;
    end;
    Id_PF_INET6: begin
      with LAddr do begin
        VIP := TranslateTInAddrToString(sin6_addr, Id_IPv6);
        VPort := ntohs(sin6_port);
      end;
      VIPVersion := Id_IPV6;
    end;
    else begin
      IPVersionUnsupported;
    end;
  end;
end;

procedure TIdStackVCLPosix.GetSocketOption(ASocket: TIdStackSocketHandle;
  ALevel: TIdSocketOptionLevel; AOptName: TIdSocketOption;
  out AOptVal: Integer);
var
  LLen : Integer;
  LBuf : Integer;
begin
  LLen := SizeOf(Integer);
  WSGetSockOpt(ASocket, ALevel, AOptName, PAnsiChar(@LBuf), LLen);
  AOptVal := LBuf;
end;

function TIdStackVCLPosix.HostByAddress(const AAddress: string;
  const AIPVersion: TIdIPVersion): string;
var
  LHints: AddrInfo; //The T is no omission - that's what I found in the header
  LAddrInfo: PAddrInfo;
  LRetVal: integer;
  LAStr: AnsiString;

begin
  case AIPVersion of
    Id_IPv6, Id_IPv4: begin
      FillChar(LHints, SizeOf(LHints), 0);
      LHints.ai_family := IdIPFamily[AIPVersion];
      LHints.ai_socktype := Integer(SOCK_STREAM);
      LHints.ai_flags := AI_CANONNAME or AI_NUMERICHOST;
      LAddrInfo := nil;

      LAStr := AnsiString(AAddress); // explicit convert to Ansi
      LRetVal := getaddrinfo(
        PAnsiChar(LAStr),
        nil, LHints,LAddrInfo);
      if LRetVal <> 0 then begin
        if LRetVal = EAI_SYSTEM then begin
          IndyRaiseLastError;
        end else begin
          raise EIdReverseResolveError.CreateFmt(RSReverseResolveError, [AAddress, gai_strerror(LRetVal), LRetVal]);
        end;
      end;
      try
        Result := String(LAddrInfo^.ai_canonname);
      finally
        freeaddrinfo(LAddrInfo^);
      end;
    end;
(* JMB: I left this in here just in case someone
        complains, but the other code works on all
        linux systems for all addresses and is thread-safe

variables for it:
  Host: PHostEnt;
  LAddr: u_long;

    Id_IPv4: begin
      // GetHostByAddr is thread-safe in Linux.
      // It might not be safe in Solaris or BSD Unix
      LAddr := inet_addr(PAnsiChar(AAddress));
      Host := GetHostByAddr(@LAddr,SizeOf(LAddr),AF_INET);
      if (Host <> nil) then begin
        Result := Host^.h_name;
      end else begin
        RaiseSocketError(h_errno);
      end;
    end;
*)
    else begin
      IPVersionUnsupported;
    end;
  end;
end;

function TIdStackVCLPosix.HostByName(const AHostName: string;
  const AIPVersion: TIdIPVersion): string;
var
  LAddrInfo: pAddrInfo;
  Hints: AddrInfo;
  LTemp: AnsiString;
  RetVal: Integer;
begin
  if not (AIPVersion in [Id_IPv4, Id_IPv6]) then begin
    IPVersionUnsupported;
  end;
//  ZeroMemory(@Hints, SIZE_TADDRINFO);
  Hints.ai_family := IdIPFamily[AIPVersion];
  Hints.ai_socktype := SOCK_STREAM;
  LAddrInfo := nil;
  LTemp := AnsiString(AHostName);

  RetVal := getaddrinfo( PAnsiChar(LTemp), nil, Hints, LAddrInfo);
  if RetVal <> 0 then begin
    RaiseSocketError(RetVal);
  end;
  try
    if AIPVersion = Id_IPv4 then begin
      Result := TranslateTInAddrToString( PSockAddrIn( LAddrInfo^.ai_addr)^.sin_addr, AIPVersion);
    end else begin
      Result := TranslateTInAddrToString( PSockAddrIn6( LAddrInfo^.ai_addr)^.sin6_addr, AIPVersion);
    end;
  finally
    freeaddrinfo(LAddrInfo^);
  end;
end;

function TIdStackVCLPosix.HostToNetwork(AValue: LongWord): LongWord;
begin
 Result := htonl(AValue);
end;

function TIdStackVCLPosix.HostToNetwork(AValue: Word): Word;
begin
  Result := htons(AValue);
end;

function TIdStackVCLPosix.HostToNetwork(AValue: Int64): Int64;
var
  LParts: TIdInt64Parts;
  L: LongWord;
begin
  LParts.QuadPart := AValue;
  L := htonl(LParts.HighPart);
  if (L <> LParts.HighPart) then begin
    LParts.HighPart := htonl(LParts.LowPart);
    LParts.LowPart := L;
  end;
  Result := LParts.QuadPart;
end;

function TIdStackVCLPosix.IOControl(const s: TIdStackSocketHandle;
  const cmd: LongWord; var arg: LongWord): Integer;
var
  LArg : PtrUInt;
begin
  LArg := arg;
//  Result := ioctl(s, cmd, Pointer(LArg));
end;

procedure TIdStackVCLPosix.Listen(ASocket: TIdStackSocketHandle;
  ABackLog: Integer);
begin
  CheckForSocketError(PosixSysSocket.listen(ASocket, ABacklog));
end;

function TIdStackVCLPosix.NetworkToHost(AValue: LongWord): LongWord;
begin
  Result := ntohl(AValue);
end;

function TIdStackVCLPosix.NetworkToHost(AValue: Int64): Int64;
var
  LParts: TIdInt64Parts;
  L: LongWord;
begin
  LParts.QuadPart := AValue;
  L := ntohl(LParts.HighPart);
  if (L <> LParts.HighPart) then begin
    LParts.HighPart := ntohl(LParts.LowPart);
    LParts.LowPart := L;
  end;
  Result := LParts.QuadPart;

end;

function TIdStackVCLPosix.NetworkToHost(AValue: Word): Word;
begin
   Result := ntohs(AValue);
end;

function TIdStackVCLPosix.ReadHostName: string;
var
  LStr: AnsiString;
begin
  SetLength(LStr, 250);
  gethostname(PAnsiChar(LStr), 250);
  Result := PAnsiChar(LStr);
end;

function TIdStackVCLPosix.ReceiveMsg(ASocket: TIdStackSocketHandle;
  var VBuffer: TIdBytes; APkt: TIdPacketInfo): LongWord;
//termporarily disabled until I can finish this.
  begin
  {var
  LIP : String;
  LPort : TIdPort;
  LSize: Cardinal;
  LAddr: SockAddr_In6;
  LMsg : msghdr;
  LMsgBuf : BUF;
  LControl : TIdBytes;
  LCurCmsg : CMSGHDR;   //for iterating through the control buffer
  LByte : PByte;
  LDummy, LDummy2 : Cardinal;

begin
   //we call the macro twice because we specified two possible structures.
   //Id_IPV6_HOPLIMIT and Id_IPV6_PKTINFO
   LSize := CMSG_LEN(CMSG_LEN(Length(VBuffer)));
   SetLength( LControl,LSize);
    LMsgBuf.len := Length(VBuffer); // Length(VMsgData);
    LMsgBuf.buf := @VBuffer[0]; // @VMsgData[0];

    FillChar(LMsg,SizeOf(LMsg),0);

    LMsg.lpBuffers := @LMsgBuf;
    LMsg.dwBufferCount := 1;

    LMsg.Control.Len := LSize;
    LMsg.Control.buf := @LControl[0];

    LMsg.name := PSOCKADDR(@LAddr);
    LMsg.namelen := SizeOf(LAddr);

    CheckForSocketError(RecvMsg(ASocket, @LMsg, Result, @LDummy, LPwsaoverlapped_COMPLETION_ROUTINE(@LDummy2)));

    case LAddr.sin6_family of
      Id_PF_INET4: begin
        with Psockaddr(@LAddr)^ do
        begin
          APkt.SourceIP := TranslateTInAddrToString(sin_addr, Id_IPv4);
          APkt.SourcePort := ntohs(sin_port);
        end;
        APkt.SourceIPVersion := Id_IPv4;
      end;
      Id_PF_INET6: begin
        with LAddr do
        begin
          APkt.SourceIP := TranslateTInAddrToString(sin6_addr, Id_IPv6);
          APkt.SourcePort := ntohs(sin6_port);
        end;
        APkt.SourceIPVersion := Id_IPv6;
      end;
      else begin
        Result := 0; // avoid warning
        IPVersionUnsupported;
      end;
    end;

    LCurCmsg := nil;
    repeat
      LCurCmsg := CMSG_NXTHDR(@LMsg,LCurCmsg);
      if LCurCmsg=nil then
      begin
        break;
      end;
      case LCurCmsg^.cmsg_type of
        IP_PKTINFO :     //done this way because IPV6_PKTINF and  IP_PKTINFO
        //are both 19
        begin
          case LAddr.sin6_family of
            Id_PF_INET4: begin
              with Pin_pktinfo(CMSG_DATA(LCurCmsg))^ do
              begin
                APkt.DestIP := TranslateTInAddrToString(ipi_addr, Id_IPv4);
                APkt.DestIF := ipi_ifindex;
              end;
              APkt.DestIPVersion := Id_IPv4;
            end;
            Id_PF_INET6: begin
              with Pin6_pktinfo(CMSG_DATA(LCurCmsg))^ do
              begin
                APkt.DestIP := TranslateTInAddrToString(ipi6_addr, Id_IPv6);
                APkt.DestIF := ipi6_ifindex;
              end;
              APkt.DestIPVersion := Id_IPv6;
            end;
          end;
        end;
        Id_IPV6_HOPLIMIT :
        begin
          LByte :=  PByte(CMSG_DATA(LCurCmsg));
          APkt.TTL := LByte^;
        end;
      end;
    until False; }
end;

function TIdStackVCLPosix.RecvFrom(const ASocket: TIdStackSocketHandle;
  var VBuffer; const ALength, AFlags: Integer; var VIP: string;
  var VPort: TIdPort; var VIPVersion: TIdIPVersion): Integer;
var
  LiSize: socklen_t;
  LAddr: sockaddr_in6;          // or Id_MSG_NOSIGNAL
begin
  LiSize := SizeOf(sockaddr_in6);
  Result := PosixSysSocket.recvfrom(ASocket,VBuffer, ALength, AFlags, psockaddr(@LAddr)^, LiSize);
  if Result >= 0 then
  begin
    case PSockAddr(@LAddr)^.sa_family of
      Id_PF_INET4: begin
        with PSockAddrIn(@LAddr)^ do begin
          VIP := TranslateTInAddrToString(sin_addr, Id_IPv4);
          VPort := Ntohs(sin_port);
        end;
        VIPVersion := Id_IPV4;
      end;
      Id_PF_INET6: begin
        with LAddr do begin
          VIP := TranslateTInAddrToString(sin6_addr, Id_IPv6);
          VPort := ntohs(sin6_port);
        end;
        VIPVersion := Id_IPV6;
      end;
      else begin
        Result := 0;
        IPVersionUnsupported;
      end;
    end;
  end;
end;

procedure TIdStackVCLPosix.SetBlocking(ASocket: TIdStackSocketHandle;
  const ABlocking: Boolean);
begin
  if not ABlocking then begin
    raise EIdBlockingNotSupported.Create(RSStackNotSupportedOnUnix);
  end;
end;

procedure TIdStackVCLPosix.SetLastError(const AError: Integer);
begin
  __error^ := AError;
end;

procedure TIdStackVCLPosix.SetSocketOption(ASocket: TIdStackSocketHandle;
  ALevel: TIdSocketOptionLevel; AOptName: TIdSocketOption; AOptVal: Integer);
begin
  CheckForSocketError(PosixSysSocket.setsockopt(ASocket, ALevel, AOptName, AOptVal, SizeOf(AOptVal)));
end;

procedure TIdStackVCLPosix.SetSocketOption(const ASocket: TIdStackSocketHandle;
  const Alevel, Aoptname: Integer; Aoptval: PAnsiChar; const Aoptlen: Integer);
begin
  CheckForSocketError(PosixSysSocket.setsockopt(ASocket, ALevel, Aoptname, Aoptval, Aoptlen));
end;

function TIdStackVCLPosix.SupportsIPv6: Boolean;
begin
  //In Windows, this does something else.  It checks the LSP's installed.
  Result := CheckIPVersionSupport(Id_IPv6);
end;

function TIdStackVCLPosix.WouldBlock(const AResult: Integer): Boolean;
begin
  //non-blocking does not exist in Linux, always indicate things will block
  Result := True;
end;

procedure TIdStackVCLPosix.WriteChecksum(s: TIdStackSocketHandle;
  var VBuffer: TIdBytes; const AOffset: Integer; const AIP: String;
  const APort: TIdPort; const AIPVersion: TIdIPVersion);
begin


end;

procedure TIdStackVCLPosix.WriteChecksumIPv6(s: TIdStackSocketHandle;
  var VBuffer: TIdBytes; const AOffset: Integer; const AIP: String;
  const APort: TIdPort);
begin
//we simply request that the kernal write the checksum when the data
//is sent.  All of the parameters required are because Windows is bonked
//because it doesn't have the IPV6CHECKSUM socket option meaning we have
//to querry the network interface in TIdStackWindows -- yuck!!
  SetSocketOption(s, Id_IPPROTO_IPV6, IPV6_CHECKSUM, AOffset);
end;

function TIdStackVCLPosix.WSCloseSocket(ASocket: TIdStackSocketHandle): Integer;
begin
  Result := __close(ASocket);
end;

function TIdStackVCLPosix.WSGetLastError: Integer;
begin
  //IdStackWindows just uses   result := WSAGetLastError;
  Result := GetLastError; //System.GetLastOSError; - FPC doesn't define it in System
  if Result = Id_WSAEPIPE then begin
    Result := Id_WSAECONNRESET;
  end;
end;

function TIdStackVCLPosix.WSGetServByName(const AServiceName: string): TIdPort;
var
  Lps: PServEnt;
  LAStr: AnsiString;
begin
  LAStr := AnsiString(AServiceName); // explicit convert to Ansi
  Lps := PosixNetDB.getservbyname( PAnsiChar(LAStr), nil);
  if Lps <> nil then begin
    Result := ntohs(Lps^.s_port);
  end else begin
    try
      Result := IndyStrToInt(AServiceName);
    except
      on EConvertError do begin
        raise EIdInvalidServiceName.CreateFmt(RSInvalidServiceName, [AServiceName]);
      end;
    end;
  end;
end;

function TIdStackVCLPosix.WSGetServByPort(const APortNumber: TIdPort): TStrings;
type
  PPAnsiCharArray = ^TPAnsiCharArray;
  TPAnsiCharArray = packed array[0..(MaxLongint div SizeOf(PAnsiChar))-1] of PAnsiChar;
var
  Lps: PServEnt;
  Li: Integer;
  Lp: PPAnsiCharArray;
begin
  Result := TStringList.Create;
  Lp := nil;
  try
    Lps := PosixNetDB.getservbyport(htons(APortNumber), nil);
    if Lps <> nil then begin
      Result.Add(String(Lps^.s_name));
      Li := 0;
      Lp := Pointer(Lps^.s_aliases);
      while Lp[Li] <> nil do begin
        Result.Add(String(Lp[Li]));
        Inc(Li);
      end;
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

procedure TIdStackVCLPosix.WSGetSockOpt(ASocket: TIdStackSocketHandle; Alevel,
  AOptname: Integer; AOptval: PAnsiChar; var AOptlen: Integer);
var s : socklen_t;
begin
  CheckForSocketError(PosixSysSocket.getsockopt(ASocket, ALevel, AOptname, AOptval, s));
  AOptlen := s;
end;

function TIdStackVCLPosix.WSRecv(ASocket: TIdStackSocketHandle; var ABuffer;
  const ABufferLength, AFlags: Integer): Integer;
begin
  //IdStackWindows is just: Result := Recv(ASocket, ABuffer, ABufferLength, AFlags);
  Result := PosixSysSocket.Recv(ASocket, ABuffer, ABufferLength, AFlags or Id_MSG_NOSIGNAL);

end;

function TIdStackVCLPosix.WSSend(ASocket: TIdStackSocketHandle; const ABuffer;
  const ABufferLength, AFlags: Integer): Integer;
begin
  //CC: Should Id_MSG_NOSIGNAL be included?
  //  Result := Send(ASocket, ABuffer, ABufferLength, AFlags or Id_MSG_NOSIGNAL);
  Result := CheckForSocketError(PosixSysSocket.send(ASocket, ABuffer, ABufferLength, AFlags or Id_MSG_NOSIGNAL));

end;

procedure TIdStackVCLPosix.WSSendTo(ASocket: TIdStackSocketHandle;
  const ABuffer; const ABufferLength, AFlags: Integer; const AIP: string;
  const APort: TIdPort; AIPVersion: TIdIPVersion);
var
  LAddr: sockaddr_in6;
  LiSize: socklen_t;
begin
   FillChar(LAddr, SizeOf(LAddr), 0);
  case AIPVersion of
    Id_IPv4: begin
      with PsockaddrIn(@LAddr)^ do begin
        sin_family := Id_PF_INET4;
        TranslateStringToTInAddr(AIP, sin_addr, Id_IPv4);
        sin_port := htons(APort);
      end;
      LiSize := SizeOf(sockaddr);
    end;
    Id_IPv6: begin
      with LAddr do begin
        sin6_family := Id_PF_INET6;
        TranslateStringToTInAddr(AIP, sin6_addr, Id_IPv6);
        sin6_port := htons(APort);
      end;
      LiSize := SizeOf(sockaddr_in6);
    end;
 else
      LiSize := 0; // avoid warning
      IPVersionUnsupported;
 end;
//function sendto(socket: Integer; const message; length: size_t;
//  flags: Integer; const dest_addr: sockaddr; dest_len: socklen_t): ssize_t; cdecl;
//  external libc name _PU + 'sendto';
  LiSize := PosixSysSocket.sendto(
    ASocket, ABuffer, ABufferLength, AFlags or Id_MSG_NOSIGNAL,
    Psockaddr(@LAddr)^,LiSize);
  if LiSize = Id_SOCKET_ERROR then begin
    // TODO: move this into RaiseLastSocketError directly
    if WSGetLastError() = Id_WSAEMSGSIZE then begin
      raise EIdPackageSizeTooBig.Create(RSPackageSizeTooBig);
    end else begin
      RaiseLastSocketError;
    end;
  end
  else if LiSize <> ABufferLength then begin
    raise EIdNotAllBytesSent.Create(RSNotAllBytesSent);
  end;

end;

procedure TIdStackVCLPosix.WSSetLastError(const AErr: Integer);
begin
  __error^ := AErr;
end;

function TIdStackVCLPosix.WSShutdown(ASocket: TIdStackSocketHandle;
  AHow: Integer): Integer;
begin
  Result := PosixSysSocket.shutdown(ASocket, AHow);
end;

function TIdStackVCLPosix.WSSocket(AFamily : Integer; AStruct : TIdSocketType; AProtocol: Integer;
      const AOverlapped: Boolean = False): TIdStackSocketHandle;
begin
  Result := PosixSysSocket.socket(AFamily, AStruct, AProtocol);
end;

function TIdStackVCLPosix.WSTranslateSocketErrorMsg(
  const AErr: Integer): string;
begin

end;

end.
