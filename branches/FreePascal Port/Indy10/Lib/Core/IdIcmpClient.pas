{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  11942: IdIcmpClient.pas 
{
{   Rev 1.8    2004-04-25 12:08:24  Mattias
{ Fixed multithreading issue
}
{
{   Rev 1.7    2004.02.03 4:16:42 PM  czhower
{ For unit name changes.
}
{
{   Rev 1.6    2/1/2004 4:53:30 PM  JPMugaas
{ Removed Todo;
}
{
{   Rev 1.5    2004.01.20 10:03:24 PM  czhower
{ InitComponent
}
{
{   Rev 1.4    2003.12.31 10:37:54 PM  czhower
{ GetTickcount --> Ticks
}
{
{   Rev 1.3    10/16/2003 11:06:14 PM  SPerry
{ Moved ICMP_MIN to IdRawHeaders
}
{
{   Rev 1.2    2003.10.11 5:48:04 PM  czhower
{ -VCL fixes for servers
{ -Chain suport for servers (Super core)
{ -Scheduler upgrades
{ -Full yarn support
}
{
{   Rev 1.1    2003.09.30 1:22:56 PM  czhower
{ Stack split for DotNet
}
{
{   Rev 1.0    11/13/2002 08:44:30 AM  JPMugaas
}
unit IdIcmpClient;

// SG 25/1/02: Modified the component to support multithreaded PING and traceroute
// SG 25/1/02: NOTE!!!
// SG 25/1/02:   The component no longer use the timing informations contained
// SG 25/1/02:   in the packet to compute the roundtrip time. This is because
// SG 25/1/02:   that information is only correctly set in case of ECHOREPLY
// SG 25/1/02:   In case of TTL, it is incorrect.

interface

uses
  Classes,
  IdGlobal,
  IdRawBase,
  IdRawClient,
  IdStackConsts,
  IdSys;

const
  DEF_PACKET_SIZE = 32;
  MAX_PACKET_SIZE = 1024;
  iDEFAULTPACKETSIZE = 128;
  iDEFAULTREPLYBUFSIZE = 1024;
  Id_TIDICMP_ReceiveTimeout = 5000;

type
  TReplyStatusTypes = (rsEcho, rsError, rsTimeOut, rsErrorUnreachable, rsErrorTTLExceeded);

  TReplyStatus = class(TObject)
  protected
    FBytesReceived: integer; // number of bytes in reply from host
    FFromIpAddress: string;  // IP address of replying host
    FToIpAddress : string;   //who receives it (i.e., us.  This is for multihorned machines
    FMsgType: byte;
    FSequenceId: word;       // sequence id of ping reply
    // TODO: roundtrip time in ping reply should be float, not byte
    FMsRoundTripTime: longword; // ping round trip time in milliseconds
    FTimeToLive: byte;       // time to live
    FReplyStatusType: TReplyStatusTypes;
  public
    property BytesReceived: integer read FBytesReceived write FBytesReceived; // number of bytes in reply from host
    property FromIpAddress: string read FFromIpAddress write FFromIpAddress;  // IP address of replying host
    property ToIpAddress : string read FToIpAddress write FToIpAddress;   //who receives it (i.e., us.  This is for multihorned machines
    property MsgType: byte read FMsgType write FMsgType;
    property SequenceId: word read FSequenceId write FSequenceId;       // sequence id of ping reply
    // TODO: roundtrip time in ping reply should be float, not byte
    property MsRoundTripTime: longword read FMsRoundTripTime write FMsRoundTripTime; // ping round trip time in milliseconds
    property TimeToLive: byte read FTimeToLive write FTimeToLive;       // time to live
    property ReplyStatusType: TReplyStatusTypes read FReplyStatusType write FReplyStatusType;
  end;

  TOnReplyEvent = procedure(ASender: TComponent; const AReplyStatus: TReplyStatus) of object;

  TIdIcmpClient = class(TIdRawClient)
  protected
    FbufReceive: TIdBytes;
    FbufIcmp: TIdBytes;
    wSeqNo: word;
    iDataSize: integer;
    FReplyStatus: TReplyStatus;
    FOnReply: TOnReplyEvent;
    FReplydata: String;
    //
    function CalcCheckSum: word;
    function DecodeIPv6Packet(BytesRead: Cardinal; var AReplyStatus: TReplyStatus): boolean;
    function DecodeIPv4Packet(BytesRead: Cardinal; var AReplyStatus: TReplyStatus): boolean;
    function DecodeResponse(BytesRead: Cardinal; var AReplyStatus: TReplyStatus): boolean;
    procedure DoReply(const AReplyStatus: TReplyStatus);
    procedure GetEchoReply;
    procedure InitComponent; override;
    procedure PrepareEchoRequestIPv6(Buffer: String);
    procedure PrepareEchoRequestIPv4(Buffer : String='');
    procedure PrepareEchoRequest(Buffer: string = '');    {Do not Localize}
    procedure SendEchoRequest;
  public
    destructor Destroy; override;
    procedure Ping(ABuffer: String = ''; SequenceID: word = 0);    {Do not Localize}
    function Receive(ATimeOut: Integer): TReplyStatus;
    //
    property ReplyStatus: TReplyStatus read FReplyStatus;
    property ReplyData: string read FReplydata;
  published
    property ReceiveTimeout default Id_TIDICMP_ReceiveTimeout;
    property Host;
    property Port;
    property Protocol Default Id_IPPROTO_ICMP;
    property OnReply: TOnReplyEvent read FOnReply write FOnReply;
  end;

implementation

uses
  IdExceptionCore, IdRawHeaders, IdResourceStringsCore,
  IdStack;

{ TIdIcmpClient }

function TIdIcmpClient.CalcCheckSum: word;
var i : Integer;
  LSize : Integer;
  LCRC : Cardinal;
begin
  LCRC := 0;
  i := 0;

    LSize := Length(FbufIcmp);

  while LSize >1 do
  begin
    LCRC := LCRC + IdGlobal.BytesToWord(FbufIcmp,i);

    Dec(LSize,2);
    inc(i,2);

  end;
  if LSize>0 then
  begin
    LCRC := LCRC + FbufIcmp[i];
  end;
  LCRC := (LCRC shr 16) + (LCRC and $ffff);  //(LCRC >> 16)
  LCRC := LCRC + (LCRC shr 16);

  Result := not Word(LCRC);
end;

procedure TIdIcmpClient.PrepareEchoRequest(Buffer: string = '');    {Do not Localize}
begin
  if Self.IPVersion = Id_IPv4 then
  begin
    PrepareEchoRequestIPv4(Buffer);
  end
  else
  begin
    PrepareEchoRequestIPv6(Buffer);
  end;
end;

procedure TIdIcmpClient.SendEchoRequest;
begin
  Send(Host, Port, FbufIcmp);
end;

function TIdIcmpClient.DecodeResponse(BytesRead: Cardinal; var AReplyStatus: TReplyStatus): Boolean;

begin
  Result := False;
  if BytesRead = 0 then begin
    // Timed out
    if Self.IPVersion = Id_IPv4 then
    begin
      AReplyStatus.BytesReceived   := 0;
      AReplyStatus.FromIpAddress   := '0.0.0.0';
      AReplyStatus.ToIpAddress     := '0.0.0.0';
      AReplyStatus.MsgType         := 0;
      AReplyStatus.SequenceId      := wSeqNo;
      AReplyStatus.TimeToLive      := 0;
      AReplyStatus.ReplyStatusType := rsTimeOut;
    end
    else
    begin
      AReplyStatus.BytesReceived   := 0;
      AReplyStatus.FromIpAddress   := '::0';
      AReplyStatus.ToIpAddress     := '::0';
      AReplyStatus.MsgType         := 0;
      AReplyStatus.SequenceId      := wSeqNo;
      AReplyStatus.TimeToLive      := 0;
      AReplyStatus.ReplyStatusType := rsTimeOut;
    end;
    result := true;
  end else begin
    AReplyStatus.ReplyStatusType := rsError;
    if Self.IPVersion = Id_IPv4 then
    begin
      DecodeIPv4Packet(BytesRead,AReplyStatus);
    end
    else
    begin
      DecodeIPv6Packet(BytesRead,AReplyStatus);
    end;
  end;

end;

{function TIdIcmpClient.DecodeResponse(BytesRead: Cardinal; var AReplyStatus: TReplyStatus): Boolean;
var
  RTTime: Cardinal;
  pip, pOriginalIP: PIdIPHdr;
  picmp, pOriginalICMP: PIdICMPHdr;
  iIpHeaderLen: Cardinal;
  ActualSeqID: word;
begin
  if BytesRead = 0 then begin
    // Timed out
    AReplyStatus.BytesReceived   := 0;
    AReplyStatus.FromIpAddress   := '0.0.0.0';
    AReplyStatus.MsgType         := 0;
    AReplyStatus.SequenceId      := wSeqNo;
    AReplyStatus.TimeToLive      := 0;
    AReplyStatus.ReplyStatusType := rsTimeOut;
    result := true;
  end else begin
    AReplyStatus.ReplyStatusType := rsError;
    pip := PIdIPHdr(@FbufReceive[0]);
    iIpHeaderLen := (FBufReceive[0] and $0F) * 4; //(pip^.ip_verlen and $0F) * 4;
    if (BytesRead < iIpHeaderLen + ICMP_MIN) then begin
      // RSICMPNotEnoughtBytes 'Not enough bytes received'
      raise EIdIcmpException.Create(RSICMPNotEnoughtBytes);
    end;


    picmp := PIdICMPHdr(@FbufReceive[iIpHeaderLen]);
    {$IFDEF LINUX}
    // TODO: baffled as to why linux kernel sends back echo from localhost
    {.$ENDIF}

    // Check if we are reading the packet we are waiting for. if not, don't use it in treatement and discard it    {Do not Localize}
{    case picmp^.icmp_type of
      Id_ICMP_ECHOREPLY, Id_ICMP_ECHO:
      begin
        AReplyStatus.ReplyStatusType := rsEcho;
        FReplydata :=       IdGlobal.BytesToString(FBufReceive,iIpHeaderLen + SizeOf(picmp^), Length(FbufReceive));
        //Copy(FbufReceive, iIpHeaderLen + SizeOf(picmp^) + 1, Length(FbufReceive));
        // result is only valid if the seq. number is correct
      end;
      Id_ICMP_UNREACH:
        AReplyStatus.ReplyStatusType := rsErrorUnreachable;
      Id_ICMP_TIMXCEED:
        AReplyStatus.ReplyStatusType := rsErrorTTLExceeded;
      else
        raise EIdICMPException.Create(RSICMPNonEchoResponse);// RSICMPNonEchoResponse = 'Non-echo type response received'
    end;    // case
    // check if we got a reply to the packet that was actually sent
    case AReplyStatus.ReplyStatusType of    //
      rsEcho:
        begin

          result :=   picmp^.icmp_hun.echo.seq  = wSeqNo;
          ActualSeqID := picmp^.icmp_hun.echo.seq;
          RTTime := Ticks - picmp^.icmp_dun.ts.otime;
        end
      else
        begin
          // not an echo reply: the original IP frame is contained withing the DATA section of the packet
          pOriginalIP := PIdIPHdr(@picmp^.icmp_dun.data);
          // move to offset
          pOriginalICMP := Pointer(Cardinal(pOriginalIP) + (iIpHeaderLen));
          // extract information from original ICMP frame
          ActualSeqID := pOriginalICMP^.icmp_hun.echo.seq;
          RTTime := Ticks - pOriginalICMP^.icmp_dun.ts.otime;
          result := pOriginalICMP^.icmp_hun.echo.seq = wSeqNo;
        end;
    end;    // case

    if result then
    begin
      with AReplyStatus do begin
        BytesReceived := BytesRead;
        FromIpAddress := GBSDStack.TranslateTInAddrToString(pip^.ip_src, Binding.IPVersion);
        MsgType := picmp^.icmp_type;
        SequenceId := ActualSeqID;
        MsRoundTripTime := RTTime;
        TimeToLive := pip^.ip_ttl;
      end;
    end;
  end;
end;  }

procedure TIdIcmpClient.GetEchoReply;
begin
  FReplyStatus := Receive(FReceiveTimeout);
end;

procedure TIdIcmpClient.Ping(ABuffer: String = ''; SequenceID: word = 0);    {Do not Localize}
var
  RTTime: Cardinal;
begin
  if SequenceID <> 0 then
  begin
    wSeqNo := SequenceID;
  end;
  PrepareEchoRequest(ABuffer);
  RTTime := Ticks;
  SendEchoRequest;
  GetEchoReply;
  RTTime := GetTickDiff(RTTime, Ticks);
  Binding.CloseSocket;
  FReplyStatus.MsRoundTripTime := RTTime;
  DoReply(FReplyStatus);
  Inc(wSeqNo); // SG 25/1/02: Only incread sequence number when finished.
end;

function TIdIcmpClient.Receive(ATimeOut: Integer): TReplyStatus;
var
  BytesRead : Integer;
  StartTime: Cardinal;
begin
  Result := Self.FReplyStatus;
  FillBytes(FbufReceive, sizeOf(FbufReceive),0);
  StartTime := Ticks;
  repeat
    BytesRead := ReceiveBuffer(FbufReceive, ATimeOut);
    if DecodeResponse(BytesRead, Result) then
    begin
      break
    end
    else
    begin
      // We caught a response that wasn't meant for this thread - so we must
      // make sure we don't report it as such in case we time out after this
      result.BytesReceived   := 0;
      result.FromIpAddress   := '0.0.0.0';    {Do not Localize}
      result.MsgType         := 0;
      result.SequenceId      := wSeqNo;
      result.TimeToLive      := 0;
      result.ReplyStatusType := rsTimeOut;

      ATimeOut := Cardinal(ATimeOut) - GetTickDiff(StartTime, Ticks); // compute new timeout value
    end;
  until ATimeOut <= 0;
end;

procedure TIdIcmpClient.DoReply(const AReplyStatus: TReplyStatus);
begin
  if Assigned(FOnReply) then begin
    FOnReply(Self, AReplyStatus);
  end;
end;

procedure TIdIcmpClient.InitComponent;
begin
  inherited;
  FReplyStatus:= TReplyStatus.Create;
  FProtocol := Id_IPPROTO_ICMP;
  wSeqNo := 3489; // SG 25/1/02: Arbitrary Constant <> 0
  FReceiveTimeOut := Id_TIDICMP_ReceiveTimeout;
  SetLength(FbufReceive,MAX_PACKET_SIZE+Id_IP_HSIZE);
  SetLength(FbufIcmp,MAX_PACKET_SIZE);
end;

destructor TIdIcmpClient.Destroy;
begin
  Sys.FreeAndNil(FReplyStatus);
  inherited;
end;

function TIdIcmpClient.DecodeIPv4Packet(BytesRead: Cardinal;
  var AReplyStatus: TReplyStatus): boolean;
var LIPHeaderLen:Cardinal;
  RTTime: Cardinal;
  LActualSeqID: word;
  LIdx : Integer;
  LIPv4 : TIdIPHdr;
  LIcmp : TIdICMPHdr;
begin
    LIdx := 0;
    LIPv4 := TIdIPHdr.Create;
    LIcmp := TIdICMPHdr.Create;
    try

      LIpHeaderLen := (FBufReceive[0] and $0F) * 4;
      if (BytesRead < LIpHeaderLen + ICMP_MIN) then begin
        raise EIdIcmpException.Create(RSICMPNotEnoughtBytes);
      end;
      LIPv4.ReadStruct(FBufReceive, LIdx);
      LIdx := LIpHeaderLen;
      LIcmp.ReadStruct(FBufReceive, LIdx);
    {$IFDEF LINUX}
    // TODO: baffled as to why linux kernel sends back echo from localhost
    {$ENDIF}
      case FBufReceive[LIpHeaderLen] of
        Id_ICMP_ECHOREPLY, Id_ICMP_ECHO:
        begin
          AReplyStatus.ReplyStatusType := rsEcho;
        //                                                    SizeOf(picmp^)
          FReplydata := BytesToString(FBufReceive,LIpHeaderLen + 8, Length(FbufReceive));
        //Copy(FbufReceive, iIpHeaderLen + SizeOf(picmp^) + 1, Length(FbufReceive));
        // result is only valid if the seq. number is correct
        end;
        Id_ICMP_UNREACH:
          AReplyStatus.ReplyStatusType := rsErrorUnreachable;
        Id_ICMP_TIMXCEED:
          AReplyStatus.ReplyStatusType := rsErrorTTLExceeded;
        else
          raise EIdICMPException.Create(RSICMPNonEchoResponse);// RSICMPNonEchoResponse = 'Non-echo type response received'
      end;    // case
      // check if we got a reply to the packet that was actually sent
      case AReplyStatus.ReplyStatusType of    //
        rsEcho:
        begin
          LActualSeqID := BytesToWord( FBufReceive,LIpHeaderLen+6);
          result :=  LActualSeqID = wSeqNo;//;picmp^.icmp_hun.echo.seq  = wSeqNo;
          RTTime := Ticks - BytesToCardinal( FBufReceive,LIpHeaderLen+8); //picmp^.icmp_dun.ts.otime;
        end
        else
        begin
          // not an echo reply: the original IP frame is contained withing the DATA section of the packet
      //    pOriginalIP := PIdIPHdr(@picmp^.icmp_dun.data);
           LActualSeqID := BytesToWord( FBufReceive,LIpHeaderLen+6+8);//pOriginalICMP^.icmp_hun.echo.seq;
           RTTime := Ticks - BytesToCardinal( FBufReceive,LIpHeaderLen+8+8); //pOriginalICMP^.icmp_dun.ts.otime;
           result :=  LActualSeqID = wSeqNo;
          // move to offset
      //    pOriginalICMP := Pointer(Cardinal(pOriginalIP) + (iIpHeaderLen));
          // extract information from original ICMP frame
     //     ActualSeqID := pOriginalICMP^.icmp_hun.echo.seq;
    //      RTTime := Ticks - pOriginalICMP^.icmp_dun.ts.otime;
    //      result := pOriginalICMP^.icmp_hun.echo.seq = wSeqNo;
        end;
      end;    // case

      if result then
      begin
        with AReplyStatus do begin
          BytesReceived := BytesRead;

          FromIpAddress := IdGlobal.MakeDWordIntoIPv4Address ( GStack.NetworkToHOst( BytesToCardinal( FBufReceive,12)));
          ToIpAddress   := IdGlobal.MakeDWordIntoIPv4Address ( GStack.NetworkToHOst( BytesToCardinal( FBufReceive,16)));
          MsgType := FBufReceive[LIpHeaderLen]; //picmp^.icmp_type;
          SequenceId := LActualSeqID;
          MsRoundTripTime := RTTime;
          TimeToLive := FBufReceive[8];
    //    TimeToLive := pip^.ip_ttl;
        end;
      end;
    finally
      Sys.FreeAndNil(LIcmp);
      Sys.FreeAndNil(LIPv4);
    end;
end;

procedure TIdIcmpClient.PrepareEchoRequestIPv4(Buffer: String);
begin
  iDataSize := DEF_PACKET_SIZE + 8;
  FillBytes(FbufIcmp, iDataSize, 0);
  //icmp_type
  FBufIcmp[0] := Id_ICMP_ECHO;
  //icmp_code := 0;
  FBufIcmp[1] := 0;
  //skip checksum for now

  //icmp_hun.echo.id := word(CurrentProcessId);
  IdGlobal.CopyTIdWord(CurrentProcessId,FBufIcmp,4);
  //icmp_hun.echo.seq := wSeqNo;
  IdGlobal.CopyTIdWord(wSeqNo,FBufIcmp,6);
  // icmp_dun.ts.otime := Ticks; - not an official thing but for Indy internal use
  IdGlobal.CopyTIdCardinal(Ticks, FBufIcmp,8);
  //data
  IdGlobal.CopyTIdString(Buffer,FBufIcmp,12);
  //now do the checksum
  IdGlobal.CopyTIdWord(CalcCheckSum,FBufIcmp,2);
{  pih := PIdIcmpHdr(@FbufIcmp[0]);
  with pih^ do
  begin
    icmp_type := Id_ICMP_ECHO;
    icmp_code := 0;
    icmp_hun.echo.id := word(CurrentProcessId);
    icmp_hun.echo.seq := wSeqNo;
    icmp_dun.ts.otime := Ticks;
    i := Succ(sizeof(TIdIcmpHdr));
    // SG 19/12/01: Changed the fill algoritm
    BufferPos := 1;
    while (i <= iDataSize) do
    begin
      // SG 19/12/01: Build the reply buffer
      if BufferPos <= Length(Buffer) then
      begin
        FbufIcmp[i] := Byte(Buffer[BufferPos]);
        inc(BufferPos);
      end
      else
      begin
        FbufIcmp[i] := Byte('E');    {Do not Localize}
{      end;
      Inc(i);
    end;
    icmp_sum := CalcCheckSum;
  end;     }
  // SG 25/1/02: Retarded wSeqNo increment to be able to check it against the response

end;

procedure TIdIcmpClient.PrepareEchoRequestIPv6(Buffer: String);
var LIPv6 : TIdicmp6_hdr;
  LIdx : Integer;
begin
  LIPv6 := TIdicmp6_hdr.create;
  try
    LIdx := 0;
    LIPv6.icmp6_type := ICMP6_ECHO_REQUEST;
    LIPv6.icmp6_code := 0;
    LIPv6.data.icmp6_un_data16[0] := word(CurrentProcessId);
    LIPv6.data.icmp6_un_data16[1] := wSeqNo;
    LIPv6.icmp6_cksum := 0;
    LIPv6.WriteStruct(FBufIcmp,LIdx);
    IdGlobal.CopyTIdCardinal(Ticks, FBufIcmp,LIdx);
    Inc(LIdx,4);
    CopyTIdString(Buffer,FBufIcmp,LIdx,Length(Buffer));
    Inc(LIdx,Length(Buffer));
    LIPv6.icmp6_cksum := GStack.HostToNetwork( CalcCheckSum);
    //we have to write this twice, the second time with the checksum
    //from the header (checksum = 0) and the data
    LIdx := 0;
    LIPv6.WriteStruct(FBufIcmp,LIdx);
  finally
    Sys.FreeAndNil(LIPv6);
  end;
end;

function TIdIcmpClient.DecodeIPv6Packet(BytesRead: Cardinal;
  var AReplyStatus: TReplyStatus): boolean;
var
 LIdx : Integer;
  LIPv6 : TIdip6_hdr;
  LIcmp : TIdICMPHdr;
begin
  LIdx := 0;
  LIPv6 := TIdip6_hdr.Create;
  LIcmp := TIdICMPHdr.Create;
  try
    LIPv6.ReadStruct(FBufReceive,LIdx);

  finally
    Sys.FreeAndNil(LIcmp);
    Sys.FreeAndNil(LIPv6);
  end;
end;

end.
