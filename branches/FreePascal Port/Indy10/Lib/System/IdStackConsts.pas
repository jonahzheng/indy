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
   Rev 1.0    2004.02.07 12:25:16 PM  czhower
 Recheckin to fix case of filename
}
{
   Rev 1.1    2/7/2004 5:20:06 AM  JPMugaas
 Added some constants that were pasted from other places.  DotNET uses the
 standard Winsock 2 error consstants.  We don't want to link to IdWInsock or
 Windows though because that causes other problems.
}
{
   Rev 1.0    2004.02.03 3:14:44 PM  czhower
 Move and updates
}
{
   Rev 1.12    2003.12.28 6:53:46 PM  czhower
 Added some consts.
}
{
   Rev 1.11    10/28/2003 9:14:54 PM  BGooijen
 .net
}
{
   Rev 1.10    10/19/2003 10:46:18 PM  BGooijen
 Added more consts
}
{
   Rev 1.9    10/19/2003 9:15:28 PM  BGooijen
 added some SocketOptionName consts for dotnet
}
{
   Rev 1.8    10/19/2003 5:21:30 PM  BGooijen
 SetSocketOption
}
{
   Rev 1.7    10/2/2003 7:31:18 PM  BGooijen
 .net
}
{
   Rev 1.6    2003.10.02 10:16:32 AM  czhower
 .Net
}
{
   Rev 1.5    2003.10.01 5:05:18 PM  czhower
 .Net
}
{
   Rev 1.4    2003.10.01 1:12:40 AM  czhower
 .Net
}
{
   Rev 1.3    2003.09.30 12:09:38 PM  czhower
 DotNet changes.
}
{
   Rev 1.2    9/29/2003 10:28:30 PM  BGooijen
 Added constants for DotNet
}
{
   Rev 1.1    12-14-2002 14:58:34  BGooijen
 Added definition for Id_SOCK_RDM and Id_SOCK_SEQPACKET
}
{
   Rev 1.0    11/13/2002 08:59:14 AM  JPMugaas
}
unit IdStackConsts;



interface
{$I IdCompilerDefines.inc}
{This should be the only unit except OS Stack units that reference
Winsock or lnxsock}
uses
 {$IFDEF DotNet}
  System.Net.Sockets;
 {$ENDIF}
 //TODO:  I'm not really sure how other platforms are supported with asockets header
 //Do I use the sockets unit or do something totally different for each platform
   {$ifdef win32}
   IdWship6, //for some constants that supplement IdWinsock
   IdWinsock2;
   {$endif}
    {$ifdef os2}
    pmwsock;
   {$endif}
   {$ifdef netware_clib}
    winsock; //not sure if this is correct
   {$endif}
   {$ifdef netware_libc}
    winsock;  //not sure if this is correct
   {$endif}
   {$ifdef MacOS}
   {$endif}
   {$ifdef Unix}
     {$ifdef UseLibc}
     libc;
     {$else}
     Sockets,BaseUnix,Unix; // FPC "native" Unix units.
     //Marco may want to change the socket interface unit
     //so we don't use the libc header.
     {$endif}
   {$endif}



type
  {$IFDEF UseBaseUnix}
   TSocket = cint;  // TSocket is afaik not POSIX, so we have to add it
                    // (Socket() returns a C int according to opengroup)

  {$ENDIF}
  TIdStackSocketHandle =
    {$IFDEF DOTNET}
      Socket;
    {$ELSE}
      TSocket;
    {$ENDIF}

var
  Id_SO_True: Integer = 1;
  Id_SO_False: Integer = 0;

const
  {$IFDEF DotNet}
    Id_IPV6_UNICAST_HOPS = System.Net.Sockets.SocketOptionName.IpTimeToLive;

    Id_IPV6_MULTICAST_IF = System.Net.Sockets.SocketOptionName.MulticastInterface;
    Id_IPV6_MULTICAST_HOPS = System.Net.Sockets.SocketOptionName.MulticastTimeToLive;
    Id_IPV6_MULTICAST_LOOP = System.Net.Sockets.SocketOptionName.MulticastLoopback;
    Id_IPV6_ADD_MEMBERSHIP = System.Net.Sockets.SocketOptionName.AddMembership;
    Id_IPV6_DROP_MEMBERSHIP = System.Net.Sockets.SocketOptionName.DropMembership;
    Id_IPV6_PKTINFO =         System.Net.Sockets.SocketOptionName.PacketInformation;
     Id_IP_MULTICAST_TTL =    System.Net.Sockets.SocketOptionName.MulticastTimeToLive;
     Id_IP_MULTICAST_LOOP =   System.Net.Sockets.SocketOptionName.MulticastLoopback;
     Id_IP_ADD_MEMBERSHIP =   System.Net.Sockets.SocketOptionName.AddMembership;
      Id_IP_DROP_MEMBERSHIP = System.Net.Sockets.SocketOptionName.DropMembership;
  {$ENDIF}
  {$IFDEF UNIX}
    {$ifdef USEBASEUNIX}
      {$define missingconsts}
    {$endif}
    {$ifdef missingconsts}
    {$WARNING TODO -remove  consts below this when updated header files are included in FPC builds}
    
     {this section should be removed when new constants are available
     a new build.  It's there because while I know Marco Dev Voort checked in these
     cosntants, they are not yet available in Unix builds and releases.
     This is a temporary measure.}

   //from /rtl/inc/socketsh.inc
  INADDR_ANY   = CARDINAL(0);
  INADDR_NONE  = CARDINAL($FFFFFFFF);
  
  //from /rtl/freebsd/unixsocket.h
	IPPROTO_IP              = 0;               { dummy for IP }
	IPPROTO_ICMP            = 1;               { control message protocol }
	IPPROTO_TCP             = 6;               { tcp }
	IPPROTO_UDP             = 17;              { user datagram protocol }


	IPPROTO_HOPOPTS		= 0 ; 		{ IP6 hop-by-hop options }
	IPPROTO_IGMP		= 2 ; 		{ group mgmt protocol }
	IPPROTO_GGP		= 3 ; 		{ gateway^2 (deprecated) }
	IPPROTO_IPV4		= 4 ; 		{ IPv4 encapsulation }
	IPPROTO_IPIP		= IPPROTO_IPV4;	{ for compatibility }
	IPPROTO_ST		= 7 ; 		{ Stream protocol II }
	IPPROTO_EGP		= 8 ; 		{ exterior gateway protocol }
	IPPROTO_PIGP		= 9 ; 		{ private interior gateway }
	IPPROTO_RCCMON		= 10; 		{ BBN RCC Monitoring }
	IPPROTO_NVPII		= 11; 		{ network voice protocol}
	IPPROTO_PUP		= 12; 		{ pup }
	IPPROTO_ARGUS		= 13; 		{ Argus }
	IPPROTO_EMCON		= 14; 		{ EMCON }
	IPPROTO_XNET		= 15; 		{ Cross Net Debugger }
	IPPROTO_CHAOS		= 16; 		{ Chaos}
	IPPROTO_MUX		= 18; 		{ Multiplexing }
	IPPROTO_MEAS		= 19; 		{ DCN Measurement Subsystems }
	IPPROTO_HMP		= 20; 		{ Host Monitoring }
	IPPROTO_PRM		= 21; 		{ Packet Radio Measurement }
	IPPROTO_IDP		= 22; 		{ xns idp }
	IPPROTO_TRUNK1		= 23; 		{ Trunk-1 }
	IPPROTO_TRUNK2		= 24; 		{ Trunk-2 }
	IPPROTO_LEAF1		= 25; 		{ Leaf-1 }
	IPPROTO_LEAF2		= 26; 		{ Leaf-2 }
	IPPROTO_RDP		= 27; 		{ Reliable Data }
	IPPROTO_IRTP		= 28; 		{ Reliable Transaction }
	IPPROTO_TP		= 29; 		{ tp-4 w/ class negotiation }
	IPPROTO_BLT		= 30; 		{ Bulk Data Transfer }
	IPPROTO_NSP		= 31; 		{ Network Services }
	IPPROTO_INP		= 32; 		{ Merit Internodal }
	IPPROTO_SEP		= 33; 		{ Sequential Exchange }
	IPPROTO_3PC		= 34; 		{ Third Party Connect }
	IPPROTO_IDPR		= 35; 		{ InterDomain Policy Routing }
	IPPROTO_XTP		= 36; 		{ XTP }
	IPPROTO_DDP		= 37; 		{ Datagram Delivery }
	IPPROTO_CMTP		= 38; 		{ Control Message Transport }
	IPPROTO_TPXX		= 39; 		{ TP++ Transport }
	IPPROTO_IL		= 40; 		{ IL transport protocol }
	IPPROTO_IPV6		= 41; 		{ IP6 header }
	IPPROTO_SDRP		= 42; 		{ Source Demand Routing }
	IPPROTO_ROUTING		= 43; 		{ IP6 routing header }
	IPPROTO_FRAGMENT	= 44; 		{ IP6 fragmentation header }
	IPPROTO_IDRP		= 45; 		{ InterDomain Routing}
	IPPROTO_RSVP		= 46; 		{ resource reservation }
	IPPROTO_GRE		= 47; 		{ General Routing Encap. }
	IPPROTO_MHRP		= 48; 		{ Mobile Host Routing }
	IPPROTO_BHA		= 49; 		{ BHA }
	IPPROTO_ESP		= 50; 		{ IP6 Encap Sec. Payload }
	IPPROTO_AH		= 51; 		{ IP6 Auth Header }
	IPPROTO_INLSP		= 52; 		{ Integ. Net Layer Security }
	IPPROTO_SWIPE		= 53; 		{ IP with encryption }
	IPPROTO_NHRP		= 54; 		{ Next Hop Resolution }
	IPPROTO_MOBILE		= 55; 		{ IP Mobility }
	IPPROTO_TLSP		= 56; 		{ Transport Layer Security }
	IPPROTO_SKIP		= 57; 		{ SKIP }
	IPPROTO_ICMPV6		= 58; 		{ ICMP6 }
	IPPROTO_NONE		= 59; 		{ IP6 no next header }
	IPPROTO_DSTOPTS		= 60; 		{ IP6 destination option }
	IPPROTO_AHIP		= 61; 		{ any host internal protocol }
	IPPROTO_CFTP		= 62; 		{ CFTP }
	IPPROTO_HELLO		= 63; 		{ "hello" routing protocol }
	IPPROTO_SATEXPAK	= 64; 		{ SATNET/Backroom EXPAK }
	IPPROTO_KRYPTOLAN	= 65; 		{ Kryptolan }
	IPPROTO_RVD		= 66; 		{ Remote Virtual Disk }
	IPPROTO_IPPC		= 67; 		{ Pluribus Packet Core }
	IPPROTO_ADFS		= 68; 		{ Any distributed FS }
	IPPROTO_SATMON		= 69; 		{ Satnet Monitoring }
	IPPROTO_VISA		= 70; 		{ VISA Protocol }
	IPPROTO_IPCV		= 71; 		{ Packet Core Utility }
	IPPROTO_CPNX		= 72; 		{ Comp. Prot. Net. Executive }
	IPPROTO_CPHB		= 73; 		{ Comp. Prot. HeartBeat }
	IPPROTO_WSN		= 74; 		{ Wang Span Network }
	IPPROTO_PVP		= 75; 		{ Packet Video Protocol }
	IPPROTO_BRSATMON	= 76; 		{ BackRoom SATNET Monitoring }
	IPPROTO_ND		= 77; 		{ Sun net disk proto (temp.) }
	IPPROTO_WBMON		= 78; 		{ WIDEBAND Monitoring }
	IPPROTO_WBEXPAK		= 79; 		{ WIDEBAND EXPAK }
	IPPROTO_EON		= 80; 		{ ISO cnlp }
	IPPROTO_VMTP		= 81; 		{ VMTP }
	IPPROTO_SVMTP		= 82; 		{ Secure VMTP }
	IPPROTO_VINES		= 83; 		{ Banyon VINES }
	IPPROTO_TTP		= 84; 		{ TTP }
	IPPROTO_IGP		= 85; 		{ NSFNET-IGP }
	IPPROTO_DGP		= 86; 		{ dissimilar gateway prot. }
	IPPROTO_TCF		= 87; 		{ TCF }
	IPPROTO_IGRP		= 88; 		{ Cisco/GXS IGRP }
	IPPROTO_OSPFIGP		= 89; 		{ OSPFIGP }
	IPPROTO_SRPC		= 90; 		{ Strite RPC protocol }
	IPPROTO_LARP		= 91; 		{ Locus Address Resoloution }
	IPPROTO_MTP		= 92; 		{ Multicast Transport }
	IPPROTO_AX25		= 93; 		{ AX.25 Frames }
	IPPROTO_IPEIP		= 94; 		{ IP encapsulated in IP }
	IPPROTO_MICP		= 95; 		{ Mobile Int.ing control }
	IPPROTO_SCCSP		= 96; 		{ Semaphore Comm. security }
	IPPROTO_ETHERIP		= 97; 		{ Ethernet IP encapsulation }
	IPPROTO_ENCAP		= 98; 		{ encapsulation header }
	IPPROTO_APES		= 99; 		{ any private encr. scheme }
	IPPROTO_GMTP		= 100;		{ GMTP}
	IPPROTO_IPCOMP		= 108;		{ payload compression (IPComp) }
{ 101-254: Partly Unassigned }
	IPPROTO_PIM		= 103;		{ Protocol Independent Mcast }
	IPPROTO_CARP		= 112;		{ CARP }
	IPPROTO_PGM		= 113;		{ PGM }
	IPPROTO_PFSYNC		= 240;		{ PFSYNC }

{ last return value of *_input(), meaning "all job for this pkt is done".  }
	IPPROTO_RAW             = 255;
	IPPROTO_MAX		= 256;
	IPPROTO_DONE		= 257;

{
 * Options for use with [gs]etsockopt at the IP level.
 * First word of comment is data type; bool is stored in int.
 }
	IP_OPTIONS		= 1 ;   { buf/ip_opts; set/get IP options }
	IP_HDRINCL		= 2 ;   { int; header is included with data }
	IP_TOS			= 3 ;   { int; IP type of service and preced. }
	IP_TTL			= 4 ;   { int; IP time to live }
	IP_RECVOPTS		= 5 ;   { bool; receive all IP opts w/dgram }
	IP_RECVRETOPTS		= 6 ;   { bool; receive IP opts for response }
	IP_RECVDSTADDR		= 7 ;   { bool; receive IP dst addr w/dgram }
	IP_SENDSRCADDR		= IP_RECVDSTADDR; { cmsg_type to set src addr }
	IP_RETOPTS		= 8 ;   { ip_opts; set/get IP options }
	IP_MULTICAST_IF		= 9 ;   { u_char; set/get IP multicast i/f  }
	IP_MULTICAST_TTL	= 10;   { u_char; set/get IP multicast ttl }
	IP_MULTICAST_LOOP	= 11;   { u_char; set/get IP multicast loopback }
	IP_ADD_MEMBERSHIP	= 12;   { ip_mreq; add an IP group membership }
	IP_DROP_MEMBERSHIP	= 13;   { ip_mreq; drop an IP group membership }
	IP_MULTICAST_VIF	= 14;   { set/get IP mcast virt. iface }
	IP_RSVP_ON		= 15;   { enable RSVP in kernel }
	IP_RSVP_OFF		= 16;   { disable RSVP in kernel }
	IP_RSVP_VIF_ON		= 17;   { set RSVP per-vif socket }
	IP_RSVP_VIF_OFF		= 18;   { unset RSVP per-vif socket }
	IP_PORTRANGE		= 19;   { int; range to choose for unspec port }
	IP_RECVIF		= 20;   { bool; receive reception if w/dgram }

{ for IPSEC }
	IP_IPSEC_POLICY		= 21;   { int; set/get security policy }
	IP_FAITH		= 22;   { bool; accept FAITH'ed connections }

	IP_ONESBCAST		= 23;   { bool: send all-ones broadcast }

	IP_FW_TABLE_ADD		= 40;   { add entry }
	IP_FW_TABLE_DEL		= 41;   { delete entry }
	IP_FW_TABLE_FLUSH	= 42;   { flush table }
	IP_FW_TABLE_GETSIZE	= 43;   { get table size }
	IP_FW_TABLE_LIST	= 44;   { list table contents }

	IP_FW_ADD		= 50;   { add a firewall rule to chain }
	IP_FW_DEL		= 51;   { delete a firewall rule from chain }
	IP_FW_FLUSH		= 52;   { flush firewall rule chain }
	IP_FW_ZERO		= 53;   { clear single/all firewall counter(s) }
	IP_FW_GET		= 54;   { get entire firewall rule chain }
	IP_FW_RESETLOG		= 55;   { reset logging counters }

	IP_DUMMYNET_CONFIGURE	= 60;   { add/configure a dummynet pipe }
	IP_DUMMYNET_DEL		= 61;   { delete a dummynet pipe from chain }
	IP_DUMMYNET_FLUSH	= 62;   { flush dummynet }
	IP_DUMMYNET_GET		= 64;   { get entire dummynet pipes }

	IP_RECVTTL		= 65;   { bool; receive IP TTL w/dgram }

	IPV6_SOCKOPT_RESERVED1	= 3 ; { reserved for future use }
	IPV6_UNICAST_HOPS	= 4 ; { int; IP6 hops }
	IPV6_MULTICAST_IF	= 9 ; { u_int; setget IP6 multicast if  }
	IPV6_MULTICAST_HOPS	= 10; { int; setget IP6 multicast hops }
	IPV6_MULTICAST_LOOP	= 11; { u_int; setget IP6 multicast loopback }
	IPV6_JOIN_GROUP		= 12; { ip6_mreq; join a group membership }
	IPV6_LEAVE_GROUP	= 13; { ip6_mreq; leave a group membership }
	IPV6_PORTRANGE		= 14; { int; range to choose for unspec port }

	IPV6_PKTINFO            = 46; { in6_pktinfo; send if, src addr }
 	IPV6_HOPLIMIT           = 47; { int; send hop limit }
 	IPV6_NEXTHOP            = 48; { sockaddr; next hop addr }
 	IPV6_HOPOPTS            = 49; { ip6_hbh; send hop-by-hop option }
 	IPV6_DSTOPTS            = 50; { ip6_dest; send dst option befor rthdr }
 	IPV6_RTHDR              = 51; { ip6_rthdr; send routing header }
 	IPV6_PKTOPTIONS         = 52; { buf/cmsghdr; set/get IPv6 options }
  {$endif}
    Id_IPV6_UNICAST_HOPS = IPV6_UNICAST_HOPS;
    Id_IPV6_MULTICAST_IF = IPV6_MULTICAST_IF;
    Id_IPV6_MULTICAST_HOPS = IPV6_MULTICAST_HOPS;
    Id_IPV6_MULTICAST_LOOP = IPV6_MULTICAST_LOOP;
    {$IFDEF LINUX}
    // These are probably leftovers from the non-final IPV6 KAME standard
    // in Linux. They only seem to exist in Linux, others use
    // the standarised versions.
    // Probably the JOIN_GROUP ones replaced these,
    // but they have different numbers in Linux, and possibly
    // also different behaviour?
      {$ifndef Kylix}
        {$ifdef USEBASEUNIX}
      //In Linux, the libc.pp header maps the old values to new ones,
      //probably for consistancy.  I'm doing this because we can't link
      //to Libc for Basic Unix stuff and some people may want to use this API
      //in Linux instead of the libc API.
      IPV6_ADD_MEMBERSHIP = IPV6_JOIN_GROUP;
      IPV6_DROP_MEMBERSHIP = IPV6_LEAVE_GROUP;
        {$endif}
      {$endif}
    Id_IPV6_ADD_MEMBERSHIP = IPV6_ADD_MEMBERSHIP;
    Id_IPV6_DROP_MEMBERSHIP = IPV6_DROP_MEMBERSHIP;
    {$ELSE}
     Id_IPV6_ADD_MEMBERSHIP = IPV6_JOIN_GROUP;
     Id_IPV6_DROP_MEMBERSHIP = IPV6_LEAVE_GROUP;
    {$ENDIF}
    Id_IPV6_PKTINFO = IPV6_PKTINFO;
    Id_IPV6_HOPLIMIT =  IPV6_HOPLIMIT;
    Id_IP_MULTICAST_TTL = IP_MULTICAST_TTL; // TODO integrate into IdStackConsts
    Id_IP_MULTICAST_LOOP = IP_MULTICAST_LOOP; // TODO integrate into IdStackConsts
    Id_IP_ADD_MEMBERSHIP = IP_ADD_MEMBERSHIP; // TODO integrate into IdStackConsts
    Id_IP_DROP_MEMBERSHIP = IP_DROP_MEMBERSHIP; // TODO integrate into IdStackConsts
  {$ENDIF}
  {$IFDEF WIN32}
    Id_IPV6_HDRINCL = IPV6_HDRINCL;
    Id_IPV6_UNICAST_HOPS = IPV6_UNICAST_HOPS;
    Id_IPV6_MULTICAST_IF = IPV6_MULTICAST_IF;
    Id_IPV6_MULTICAST_HOPS = IPV6_MULTICAST_HOPS;
    Id_IPV6_MULTICAST_LOOP = IPV6_MULTICAST_LOOP;
    Id_IPV6_ADD_MEMBERSHIP = IPV6_ADD_MEMBERSHIP;
    Id_IPV6_DROP_MEMBERSHIP = IPV6_DROP_MEMBERSHIP;
    Id_IPV6_PKTINFO = IPV6_PKTINFO;
    Id_IPV6_HOPLIMIT =  IPV6_HOPLIMIT;
    Id_IP_MULTICAST_TTL = 10; // TODO integrate into IdStackConsts FIX ERROR in IdWinsock
    Id_IP_MULTICAST_LOOP = 11; // TODO integrate into IdStackConsts FIX ERROR in IdWinsock
    Id_IP_ADD_MEMBERSHIP = 12; // TODO integrate into IdStackConsts FIX ERROR in IdWinsock
    Id_IP_DROP_MEMBERSHIP = 13; // TODO integrate into IdStackConsts FIX ERROR in IdWinsock
  {$ENDIF}


(*
  There seems to be an error in the correct values of multicast values in IdWinsock
  The values should be:

  ip_options          = 1;  //* set/get IP options */
  ip_hdrincl          = 2;  //* header is included with data */
  ip_tos              = 3;  //* IP type of service and preced*/
  ip_ttl              = 4;  //* IP time to live */
  ip_multicast_if     = 9;  //* set/get IP multicast i/f  */
  ip_multicast_ttl    = 10; //* set/get IP multicast ttl */
  ip_multicast_loop   = 11; //*set/get IP multicast loopback */
  ip_add_membership   = 12; //* add an IP group membership */
  ip_drop_membership  = 13; //* drop an IP group membership */
  ip_dontfragment     = 14; //* don't fragment IP datagrams */    {Do not Localize}
*)
  {$IFDEF UNIX}
  TCP_NODELAY = 1;
  {$ENDIF}

  // Protocol Family

  {$ifndef DOTNET}
  Id_PF_INET4 = PF_INET;
  Id_PF_INET6 = PF_INET6;
  {$else}
  Id_PF_INET4 = ProtocolFamily.InterNetwork;
  Id_PF_INET6 = ProtocolFamily.InterNetworkV6;
  {$endif}

  {$IFDEF UseBaseUnix}
    // These constants are actually WinSock specific, not std TCP/IP
    // FPC doesn't emulate WinSock.
    INVALID_SOCKET = -1;
    SOCKET_ERROR   = -1;
  {$ENDIF}

  // Socket Type
type
  TIdSocketType = {$IFDEF DotNet} SocketType; {$ELSE} Integer; {$ENDIF}
const
  {$IFNDEF DOTNET}
  Id_SOCK_STREAM     = SOCK_STREAM;      //1               /* stream socket */
  Id_SOCK_DGRAM      = SOCK_DGRAM;       //2               /* datagram socket */
  Id_SOCK_RAW        = SOCK_RAW;         //3               /* raw-protocol interface */
  Id_SOCK_RDM        = SOCK_RDM;         //4               /* reliably-delivered message */
  Id_SOCK_SEQPACKET  = SOCK_SEQPACKET;   //5               /* sequenced packet stream */
  {$ELSE}

  Id_SOCK_STREAM     = SocketType.Stream;         // /* stream socket */
  Id_SOCK_DGRAM      = SocketType.Dgram;          // /* datagram socket */
  Id_SOCK_RAW        = SocketType.Raw;            // /* raw-protocol interface */
  Id_SOCK_RDM        = SocketType.Rdm;            // /* reliably-delivered message */
  Id_SOCK_SEQPACKET  = SocketType.Seqpacket;      // /* sequenced packet stream */
  {$ENDIF}

  // IP Protocol type
type
  TIdSocketProtocol     = {$IFDEF DotNet} ProtocolType; {$ELSE} Integer; {$ENDIF}
  TIdSocketOption       = {$IFDEF DotNet} SocketOptionName; {$ELSE} Integer; {$ENDIF}
  TIdSocketOptionLevel  = {$IFDEF DotNet} SocketOptionLevel; {$ELSE} Integer; {$ENDIF}

const
  {$ifndef DOTNET}
   {$ifdef os2}
  Id_IPPROTO_GGP =  IPPROTO_GGP; //OS/2 does something strange and we might wind up
  //supporting it later for all we know.
   {$else}
  Id_IPPROTO_GGP = 3;// IPPROTO_GGP; may not be defined in some headers in FPC
    {$endif}
  Id_IPPROTO_ICMP = IPPROTO_ICMP;
  Id_IPPROTO_ICMPV6 = IPPROTO_ICMPV6;
  Id_IPPROTO_IDP = IPPROTO_IDP;
  Id_IPPROTO_IGMP = IPPROTO_IGMP;
  Id_IPPROTO_IP = IPPROTO_IP;
  Id_IPPROTO_IPv6 = IPPROTO_IPV6;
  Id_IPPROTO_ND = 77; //IPPROTO_ND; is not defined in some headers in FPC
  Id_IPPROTO_PUP = IPPROTO_PUP;
  Id_IPPROTO_RAW = IPPROTO_RAW;
  Id_IPPROTO_TCP = IPPROTO_TCP;
  Id_IPPROTO_UDP = IPPROTO_UDP;

  Id_IPPROTO_MAX = IPPROTO_MAX;
  {$else}
  Id_IPPROTO_GGP = ProtocolType.Ggp;    //Gateway To Gateway Protocol.
  Id_IPPROTO_ICMP = ProtocolType.Icmp; //Internet Control Message Protocol.
  Id_IPPROTO_IDP =  ProtocolType.Idp;   //IDP Protocol.
  Id_IPPROTO_IGMP = ProtocolType.Igmp; //Internet Group Management Protocol.
  Id_IPPROTO_IP = ProtocolType.IP;     //Internet Protocol.
  Id_IPPROTO_IPv6 = ProtocolType.IPv6;
  Id_IPPROTO_IPX =  ProtocolType.Ipx; //IPX Protocol.
  Id_IPPROTO_ND  = ProtocolType.ND;  //Net Disk Protocol (unofficial).
  Id_IPPROTO_PUP = ProtocolType.Pup; //PUP Protocol.
  Id_IPPROTO_RAW = ProtocolType.Raw;  //Raw UP packet protocol.
  Id_IPPROTO_SPX = ProtocolType.Spx;  //SPX Protocol.
  Id_IPPROTO_SPXII = ProtocolType.SpxII; //SPX Version 2 Protocol.
  Id_IPPROTO_TCP = ProtocolType.Tcp;  //Transmission Control Protocol.
  Id_IPPROTO_UDP = ProtocolType.Udp;  //User Datagram Protocol.
  Id_IPPROTO_UNKNOWN = ProtocolType.Unknown; //Unknown protocol.
  Id_IPPROTO_UNSPECIFIED = ProtocolType.Unspecified; //unspecified protocol.

//  Id_IPPROTO_MAX = ProtocolType.; ?????????????????????
  {$endif}

  // Socket Option level
  {$ifndef DOTNET}
  Id_SOL_SOCKET = SOL_SOCKET;
  Id_SOL_IP  = IPPROTO_IP;
  Id_SOL_IPv6 = IPPROTO_IPV6;
  Id_SOL_TCP  = IPPROTO_TCP;
  Id_SOL_UDP  = IPPROTO_UDP;
  {$else}
  Id_SOL_SOCKET = SocketOptionLevel.Socket;
  Id_SOL_IP = SocketOptionLevel.Ip;
  Id_SOL_IPv6 = SocketOptionLevel.IPv6;
  Id_SOL_TCP = SocketOptionLevel.Tcp;
  Id_SOL_UDP = SocketOptionLevel.Udp;
  {$endif}

  // Socket options
  {$ifndef DOTNET}
  Id_SO_BROADCAST        =  SO_BROADCAST;
  Id_SO_DEBUG            =  SO_DEBUG;
  Id_SO_DONTROUTE        =  SO_DONTROUTE;
  Id_SO_KEEPALIVE        =  SO_KEEPALIVE;
  Id_SO_LINGER	         =  SO_LINGER;
  Id_SO_OOBINLINE        =  SO_OOBINLINE;
  Id_SO_RCVBUF           =  SO_RCVBUF;
  Id_SO_REUSEADDR        =  SO_REUSEADDR;
  Id_SO_SNDBUF           =  SO_SNDBUF;
  {$else}
{
SocketOptionName.AcceptConnection;// Socket is listening.
SocketOptionName.AddMembership;//  Add an IP group membership.
SocketOptionName.AddSourceMembership;//  Join a source group.
SocketOptionName.BlockSource;//  Block data from a source.
}
  Id_SO_BROADCAST        =  SocketOptionName.Broadcast;//  Permit sending broadcast messages on the socket.
  Id_SO_DEBUG            =  SocketOptionName.Debug;
  {
SocketOptionName.BsdUrgent;//  Use urgent data as defined in RFC-1222. This option can be set only once, and once set, cannot be turned off.
SocketOptionName.ChecksumCoverage;//  Set or get UDP checksum coverage.
SocketOptionName.Debug;//  Record debugging information.
SocketOptionName.DontFragment;//  Do not fragment IP datagrams.
SocketOptionName.DontLinger;//  Close socket gracefully without lingering.
SocketOptionName.DontRoute;//  Do not route; send directly to interface addresses.
SocketOptionName.DropMembership;//  Drop an IP group membership.
SocketOptionName.DropSourceMembership;//  Drop a source group.
SocketOptionName.Error;//  Get error status and clear.
SocketOptionName.ExclusiveAddressUse;//  Enables a socket to be bound for exclusive access.
SocketOptionName.Expedited;//  Use expedited data as defined in RFC-1222. This option can be set only once, and once set, cannot be turned off.
SocketOptionName.HeaderIncluded;//  Indicates application is providing the IP header for outgoing datagrams.
SocketOptionName.IPOptions;//  Specifies IP options to be inserted into outgoing datagrams.
SocketOptionName.KeepAlive;//  Send keep-alives.
SocketOptionName.Linger;//  Linger on close if unsent data is present.
SocketOptionName.MaxConnections;//  Maximum queue length that can be specified by Listen.
SocketOptionName.MulticastInterface;//  Set the interface for outgoing multicast packets.
SocketOptionName.MulticastLoopback;//  IP multicast loopback.
SocketOptionName.MulticastTimeToLive;//  IP multicast time to live.
SocketOptionName.NoChecksum;//  Send UDP datagrams with checksum set to zero.
SocketOptionName.NoDelay;//  Disables the Nagle algorithm for send coalescing.
SocketOptionName.OutOfBandInline;//  Receives out-of-band data in the normal data stream.
SocketOptionName.PacketInformation;//  Return information about received packets.
SocketOptionName.ReceiveBuffer;//  Send low water mark.
SocketOptionName.ReceiveLowWater;//  Receive low water mark.
SocketOptionName.ReceiveTimeout;//  Receive time out. This option applies only to synchronous methods; it has no effect on asynchronous methods such as BeginSend.
}
  Id_SO_REUSEADDR        =  SocketOptionName.ReuseAddress;//  Allows the socket to be bound to an address that is already in use.
{
SocketOptionName.SendBuffer;//  Specifies the total per-socket buffer space reserved for sends. This is unrelated to the maximum message size or the size of a TCP window.
SocketOptionName.SendLowWater;//  Specifies the total per-socket buffer space reserved for receives. This is unrelated to the maximum message size or the size of a TCP window.
SocketOptionName.SendTimeout;//  Send timeout. This option applies only to synchronous methods; it has no effect on asynchronous methods such as BeginSend.
SocketOptionName.Type;//  Get socket type.
SocketOptionName.TypeOfService;//  Change the IP header type of service field.
SocketOptionName.UnblockSource;//  Unblock a previously blocked source.
SocketOptionName.UseLoopback;//  Bypass hardware when possible.
}
  {$endif}

  // Additional socket options
  {$ifndef DOTNET}
  Id_SO_RCVTIMEO         = SO_RCVTIMEO;
  Id_SO_SNDTIMEO         = SO_SNDTIMEO;
  {$else}
  Id_SO_RCVTIMEO         = SocketOptionName.ReceiveTimeout;
  Id_SO_SNDTIMEO         = SocketOptionName.SendTimeout;
  {$endif}

  {$ifndef DOTNET}
  Id_SO_IP_TTL              = IP_TTL;
  {$else}
  Id_SO_IP_TTL              = SocketOptionName.IpTimeToLive; //  Set the IP header time-to-live field.
  {$endif}

  //
  {$ifndef DOTNET}
  Id_INADDR_ANY = INADDR_ANY;
  Id_INADDR_NONE = INADDR_NONE;
  {$else}
  {$endif}

  // TCP Options
  {$ifndef DOTNET}
  Id_TCP_NODELAY = TCP_NODELAY;
  Id_INVALID_SOCKET = INVALID_SOCKET;
  Id_SOCKET_ERROR = SOCKET_ERROR;

  Id_SOCKETOPTIONLEVEL_TCP = Id_IPPROTO_TCP; // BGO: rename to Id_SOL_TCP
  {$else}
  Id_TCP_NODELAY = SocketOptionName.NoDelay;
  Id_INVALID_SOCKET = nil;
  Id_SOCKETOPTIONLEVEL_TCP = SocketOptionLevel.TCP; // BGO: rename to Id_SOL_TCP
  {$endif}
  //
  {$IFDEF UseLibC}
  // Shutdown Options
  Id_SD_Recv = SHUT_RD;
  Id_SD_Send = SHUT_WR;
  Id_SD_Both = SHUT_RDWR;
  //
  Id_WSAEINTR = EINTR;
  Id_WSAEBADF = EBADF;
  Id_WSAEACCES = EACCES;
  Id_WSAEFAULT = EFAULT;
  Id_WSAEINVAL = EINVAL;
  Id_WSAEMFILE = EMFILE;
  Id_WSAEWOULDBLOCK = EWOULDBLOCK;
  Id_WSAEINPROGRESS = EINPROGRESS;
  Id_WSAEALREADY = EALREADY;
  Id_WSAENOTSOCK = ENOTSOCK;
  Id_WSAEDESTADDRREQ = EDESTADDRREQ;
  Id_WSAEMSGSIZE = EMSGSIZE;
  Id_WSAEPROTOTYPE = EPROTOTYPE;
  Id_WSAENOPROTOOPT = ENOPROTOOPT;
  Id_WSAEPROTONOSUPPORT = EPROTONOSUPPORT;
  Id_WSAESOCKTNOSUPPORT = ESOCKTNOSUPPORT;

  Id_WSAEOPNOTSUPP = EOPNOTSUPP;
  Id_WSAEPFNOSUPPORT = EPFNOSUPPORT;
  Id_WSAEAFNOSUPPORT = EAFNOSUPPORT;
  Id_WSAEADDRINUSE = EADDRINUSE;
  Id_WSAEADDRNOTAVAIL = EADDRNOTAVAIL;
  Id_WSAENETDOWN = ENETDOWN;
  Id_WSAENETUNREACH = ENETUNREACH;
  Id_WSAENETRESET = ENETRESET;
  Id_WSAECONNABORTED = ECONNABORTED;
  Id_WSAECONNRESET = ECONNRESET;
  Id_WSAENOBUFS = ENOBUFS;
  Id_WSAEISCONN = EISCONN;
  Id_WSAENOTCONN = ENOTCONN;
  Id_WSAESHUTDOWN = ESHUTDOWN;
  Id_WSAETOOMANYREFS = ETOOMANYREFS;
  Id_WSAETIMEDOUT = ETIMEDOUT;
  Id_WSAECONNREFUSED = ECONNREFUSED;
  Id_WSAELOOP = ELOOP;
  Id_WSAENAMETOOLONG = ENAMETOOLONG;
  Id_WSAEHOSTDOWN = EHOSTDOWN;
  Id_WSAEHOSTUNREACH = EHOSTUNREACH;
  Id_WSAENOTEMPTY = ENOTEMPTY;
  {$endif}
  {$IFDEF UseBaseUnix}
  // Shutdown Options
  Id_SD_Recv = SHUT_RD;
  Id_SD_Send = SHUT_WR;
  Id_SD_Both = SHUT_RDWR;
  //
  Id_WSAEINTR = ESysEINTR;
  Id_WSAEBADF = ESysEBADF;
  Id_WSAEACCES = ESysEACCES;
  Id_WSAEFAULT = ESysEFAULT;
  Id_WSAEINVAL = ESysEINVAL;
  Id_WSAEMFILE = ESysEMFILE;
  Id_WSAEWOULDBLOCK = ESysEWOULDBLOCK;
  Id_WSAEINPROGRESS = ESysEINPROGRESS;
  Id_WSAEALREADY = ESysEALREADY;
  Id_WSAENOTSOCK = ESysENOTSOCK;
  Id_WSAEDESTADDRREQ = ESysEDESTADDRREQ;
  Id_WSAEMSGSIZE = ESysEMSGSIZE;
  Id_WSAEPROTOTYPE = ESysEPROTOTYPE;
  Id_WSAENOPROTOOPT = ESysENOPROTOOPT;
  Id_WSAEPROTONOSUPPORT = ESysEPROTONOSUPPORT;
  Id_WSAESOCKTNOSUPPORT = ESysESOCKTNOSUPPORT;

  Id_WSAEOPNOTSUPP = ESysEOPNOTSUPP;
  Id_WSAEPFNOSUPPORT = ESysEPFNOSUPPORT;
  Id_WSAEAFNOSUPPORT = ESysEAFNOSUPPORT;
  Id_WSAEADDRINUSE = ESysEADDRINUSE;
  Id_WSAEADDRNOTAVAIL = ESysEADDRNOTAVAIL;
  Id_WSAENETDOWN = ESysENETDOWN;
  Id_WSAENETUNREACH = ESysENETUNREACH;
  Id_WSAENETRESET = ESysENETRESET;
  Id_WSAECONNABORTED = ESysECONNABORTED;
  Id_WSAECONNRESET = ESysECONNRESET;
  Id_WSAENOBUFS = ESysENOBUFS;
  Id_WSAEISCONN = ESysEISCONN;
  Id_WSAENOTCONN = ESysENOTCONN;
  Id_WSAESHUTDOWN = ESysESHUTDOWN;
  Id_WSAETOOMANYREFS = ESysETOOMANYREFS;
  Id_WSAETIMEDOUT = ESysETIMEDOUT;
  Id_WSAECONNREFUSED = ESysECONNREFUSED;
  Id_WSAELOOP = ESysELOOP;
  Id_WSAENAMETOOLONG = ESysENAMETOOLONG;
  Id_WSAEHOSTDOWN = ESysEHOSTDOWN;
  Id_WSAEHOSTUNREACH = ESysEHOSTUNREACH;
  Id_WSAENOTEMPTY = ESysENOTEMPTY;
  {$endif}
  {$ifdef WIN32}
  // Shutdown Options
  Id_SD_Recv = 0;
  Id_SD_Send = 1;
  Id_SD_Both = 2;
  //
  Id_WSAEINTR = WSAEINTR;
  Id_WSAEBADF = WSAEBADF;
  Id_WSAEACCES = WSAEACCES;
  Id_WSAEFAULT = WSAEFAULT;
  Id_WSAEINVAL = WSAEINVAL;
  Id_WSAEMFILE = WSAEMFILE;
  Id_WSAEWOULDBLOCK = WSAEWOULDBLOCK;
  Id_WSAEINPROGRESS = WSAEINPROGRESS;
  Id_WSAEALREADY = WSAEALREADY;
  Id_WSAENOTSOCK = WSAENOTSOCK;
  Id_WSAEDESTADDRREQ = WSAEDESTADDRREQ;
  Id_WSAEMSGSIZE = WSAEMSGSIZE;
  Id_WSAEPROTOTYPE = WSAEPROTOTYPE;
  Id_WSAENOPROTOOPT = WSAENOPROTOOPT;
  Id_WSAEPROTONOSUPPORT = WSAEPROTONOSUPPORT;
  Id_WSAESOCKTNOSUPPORT = WSAESOCKTNOSUPPORT;

  Id_WSAEOPNOTSUPP = WSAEOPNOTSUPP;
  Id_WSAEPFNOSUPPORT = WSAEPFNOSUPPORT;
  Id_WSAEAFNOSUPPORT = WSAEAFNOSUPPORT;
  Id_WSAEADDRINUSE = WSAEADDRINUSE;
  Id_WSAEADDRNOTAVAIL = WSAEADDRNOTAVAIL;
  Id_WSAENETDOWN = WSAENETDOWN;
  Id_WSAENETUNREACH = WSAENETUNREACH;
  Id_WSAENETRESET = WSAENETRESET;
  Id_WSAECONNABORTED = WSAECONNABORTED;
  Id_WSAECONNRESET = WSAECONNRESET;
  Id_WSAENOBUFS = WSAENOBUFS;
  Id_WSAEISCONN = WSAEISCONN;
  Id_WSAENOTCONN = WSAENOTCONN;
  Id_WSAESHUTDOWN = WSAESHUTDOWN;
  Id_WSAETOOMANYREFS = WSAETOOMANYREFS;
  Id_WSAETIMEDOUT = WSAETIMEDOUT;
  Id_WSAECONNREFUSED = WSAECONNREFUSED;
  Id_WSAELOOP = WSAELOOP;
  Id_WSAENAMETOOLONG = WSAENAMETOOLONG;
  Id_WSAEHOSTDOWN = WSAEHOSTDOWN;
  Id_WSAEHOSTUNREACH = WSAEHOSTUNREACH;
  Id_WSAENOTEMPTY = WSAENOTEMPTY;
  {$ENDIF}
  {$ifdef DOTNET}
//In DotNET, the constants are the same as in Winsock2.

//Ripped from IdWinsock2 - don't use that in DotNET.

    wsabaseerr              = 10000;

// Windows Sockets definitions of regular Microsoft C error constants

  wsaeintr                = wsabaseerr+  4;
  wsaebadf                = wsabaseerr+  9;
  wsaeacces               = wsabaseerr+ 13;
  wsaefault               = wsabaseerr+ 14;
  wsaeinval               = wsabaseerr+ 22;
  wsaemfile               = wsabaseerr+ 24;

// Windows Sockets definitions of regular Berkeley error constants

  wsaewouldblock          = wsabaseerr+ 35;
  wsaeinprogress          = wsabaseerr+ 36;
  wsaealready             = wsabaseerr+ 37;
  wsaenotsock             = wsabaseerr+ 38;
  wsaedestaddrreq         = wsabaseerr+ 39;
  wsaemsgsize             = wsabaseerr+ 40;
  wsaeprototype           = wsabaseerr+ 41;
  wsaenoprotoopt          = wsabaseerr+ 42;
  wsaeprotonosupport      = wsabaseerr+ 43;
  wsaesocktnosupport      = wsabaseerr+ 44;
  wsaeopnotsupp           = wsabaseerr+ 45;
  wsaepfnosupport         = wsabaseerr+ 46;
  wsaeafnosupport         = wsabaseerr+ 47;
  wsaeaddrinuse           = wsabaseerr+ 48;
  wsaeaddrnotavail        = wsabaseerr+ 49;
  wsaenetdown             = wsabaseerr+ 50;
  wsaenetunreach          = wsabaseerr+ 51;
  wsaenetreset            = wsabaseerr+ 52;
  wsaeconnaborted         = wsabaseerr+ 53;
  wsaeconnreset           = wsabaseerr+ 54;
  wsaenobufs              = wsabaseerr+ 55;
  wsaeisconn              = wsabaseerr+ 56;
  wsaenotconn             = wsabaseerr+ 57;
  wsaeshutdown            = wsabaseerr+ 58;
  wsaetoomanyrefs         = wsabaseerr+ 59;
  wsaetimedout            = wsabaseerr+ 60;
  wsaeconnrefused         = wsabaseerr+ 61;
  wsaeloop                = wsabaseerr+ 62;
  wsaenametoolong         = wsabaseerr+ 63;
  wsaehostdown            = wsabaseerr+ 64;
  wsaehostunreach         = wsabaseerr+ 65;
  wsaenotempty            = wsabaseerr+ 66;
  wsaeproclim             = wsabaseerr+ 67;
  wsaeusers               = wsabaseerr+ 68;
  wsaedquot               = wsabaseerr+ 69;
  wsaestale               = wsabaseerr+ 70;
  wsaeremote              = wsabaseerr+ 71;

// Extended Windows Sockets error constant definitions

  wsasysnotready          = wsabaseerr+ 91;
  wsavernotsupported      = wsabaseerr+ 92;
  wsanotinitialised       = wsabaseerr+ 93;
  wsaediscon              = wsabaseerr+101;
  wsaenomore              = wsabaseerr+102;
  wsaecancelled           = wsabaseerr+103;
  wsaeinvalidproctable    = wsabaseerr+104;
  wsaeinvalidprovider     = wsabaseerr+105;
  wsaeproviderfailedinit  = wsabaseerr+106;
  wsasyscallfailure       = wsabaseerr+107;
  wsaservice_not_found    = wsabaseerr+108;
  wsatype_not_found       = wsabaseerr+109;
  wsa_e_no_more           = wsabaseerr+110;
  wsa_e_cancelled         = wsabaseerr+111;
  wsaerefused             = wsabaseerr+112;


{ Error return codes from gethostbyname() and gethostbyaddr()
  (when using the resolver). Note that these errors are
  retrieved via WSAGetLastError() and must therefore follow
  the rules for avoiding clashes with error numbers from
  specific implementations or language run-time systems.
  For this reason the codes are based at WSABASEERR+1001.
  Note also that [WSA]NO_ADDRESS is defined only for
  compatibility purposes. }

// Authoritative Answer: Host not found
  wsahost_not_found        = wsabaseerr+1001;
  host_not_found           = wsahost_not_found;

// Non-Authoritative: Host not found, or SERVERFAIL
  wsatry_again             = wsabaseerr+1002;
  try_again                = wsatry_again;

// Non recoverable errors, FORMERR, REFUSED, NOTIMP
  wsano_recovery           = wsabaseerr+1003;
  no_recovery              = wsano_recovery;

// Valid name, no data record of requested type
  wsano_data               = wsabaseerr+1004;
  no_data                  = wsano_data;

// no address, look for MX record
  wsano_address            = wsano_data;
  no_address               = wsano_address;

// Define QOS related error return codes

  wsa_qos_receivers          = wsabaseerr+1005; // at least one reserve has arrived
  wsa_qos_senders            = wsabaseerr+1006; // at least one path has arrived
  wsa_qos_no_senders         = wsabaseerr+1007; // there are no senders
  wsa_qos_no_receivers       = wsabaseerr+1008; // there are no receivers
  wsa_qos_request_confirmed  = wsabaseerr+1009; // reserve has been confirmed
  wsa_qos_admission_failure  = wsabaseerr+1010; // error due to lack of resources
  wsa_qos_policy_failure     = wsabaseerr+1011; // rejected for administrative reasons - bad credentials
  wsa_qos_bad_style          = wsabaseerr+1012; // unknown or conflicting style
  wsa_qos_bad_object         = wsabaseerr+1013; // problem with some part of the filterspec or providerspecific buffer in general
  wsa_qos_traffic_ctrl_error = wsabaseerr+1014; // problem with some part of the flowspec
  wsa_qos_generic_error      = wsabaseerr+1015; // general error
  wsa_qos_eservicetype       = wsabaseerr+1016; // invalid service type in flowspec
  wsa_qos_eflowspec          = wsabaseerr+1017; // invalid flowspec
  wsa_qos_eprovspecbuf       = wsabaseerr+1018; // invalid provider specific buffer
  wsa_qos_efilterstyle       = wsabaseerr+1019; // invalid filter style
  wsa_qos_efiltertype        = wsabaseerr+1020; // invalid filter type
  wsa_qos_efiltercount       = wsabaseerr+1021; // incorrect number of filters
  wsa_qos_eobjlength         = wsabaseerr+1022; // invalid object length
  wsa_qos_eflowcount         = wsabaseerr+1023; // incorrect number of flows
  wsa_qos_eunkownpsobj       = wsabaseerr+1024; // unknown object in provider specific buffer
  wsa_qos_epolicyobj         = wsabaseerr+1025; // invalid policy object in provider specific buffer
  wsa_qos_eflowdesc          = wsabaseerr+1026; // invalid flow descriptor in the list
  wsa_qos_epsflowspec        = wsabaseerr+1027; // inconsistent flow spec in provider specific buffer
  wsa_qos_epsfilterspec      = wsabaseerr+1028; // invalid filter spec in provider specific buffer
  wsa_qos_esdmodeobj         = wsabaseerr+1029; // invalid shape discard mode object in provider specific buffer
  wsa_qos_eshaperateobj      = wsabaseerr+1030; // invalid shaping rate object in provider specific buffer
  wsa_qos_reserved_petype    = wsabaseerr+1031; // reserved policy element in provider specific buffer

  {This section defines error constants used in Winsock 2 indirectly.  These
  are from Borland's header.}
  { The handle is invalid. }
  ERROR_INVALID_HANDLE = 6;

  { Not enough storage is available to process this command. }
  ERROR_NOT_ENOUGH_MEMORY = 8;   { dderror }

  { The parameter is incorrect. }
  ERROR_INVALID_PARAMETER = 87;   { dderror }

  { The I/O operation has been aborted because of either a thread exit }
  { or an application request. }
  ERROR_OPERATION_ABORTED = 995;

  { Overlapped I/O event is not in a signalled state. }
  ERROR_IO_INCOMPLETE = 996;

  { Overlapped I/O operation is in progress. }
  ERROR_IO_PENDING = 997;   { dderror }

{ WinSock 2 extension -- new error codes and type definition }
  wsa_io_pending          = error_io_pending;
  wsa_io_incomplete       = error_io_incomplete;
  wsa_invalid_handle      = error_invalid_handle;
  wsa_invalid_parameter   = error_invalid_parameter;
  wsa_not_enough_memory   = error_not_enough_memory;
  wsa_operation_aborted   = error_operation_aborted;

  //TODO: Map these to .net constants. Unfortunately .net does not seem to
  //define these anywhere.


  Id_WSAEINTR = WSAEINTR;
  Id_WSAEBADF = WSAEBADF;
  Id_WSAEACCES = WSAEACCES;
  Id_WSAEFAULT = WSAEFAULT;
  Id_WSAEINVAL = WSAEINVAL;
  Id_WSAEMFILE = WSAEMFILE;
  Id_WSAEWOULDBLOCK = WSAEWOULDBLOCK;
  Id_WSAEINPROGRESS = WSAEINPROGRESS;
  Id_WSAEALREADY = WSAEALREADY;
  Id_WSAENOTSOCK = WSAENOTSOCK;
  Id_WSAEDESTADDRREQ = WSAEDESTADDRREQ;
  Id_WSAEMSGSIZE = WSAEMSGSIZE;
  Id_WSAEPROTOTYPE = WSAEPROTOTYPE;
  Id_WSAENOPROTOOPT = WSAENOPROTOOPT;
  Id_WSAEPROTONOSUPPORT = WSAEPROTONOSUPPORT;
  Id_WSAESOCKTNOSUPPORT = WSAESOCKTNOSUPPORT;

  Id_WSAEOPNOTSUPP = WSAEOPNOTSUPP;
  Id_WSAEPFNOSUPPORT = WSAEPFNOSUPPORT;
  Id_WSAEAFNOSUPPORT = WSAEAFNOSUPPORT;
  Id_WSAEADDRINUSE = WSAEADDRINUSE;
  Id_WSAEADDRNOTAVAIL = WSAEADDRNOTAVAIL;
  Id_WSAENETDOWN = WSAENETDOWN;
  Id_WSAENETUNREACH = WSAENETUNREACH;
  Id_WSAENETRESET = WSAENETRESET;
  Id_WSAECONNABORTED = WSAECONNABORTED;
  Id_WSAECONNRESET = WSAECONNRESET;
  Id_WSAENOBUFS = WSAENOBUFS;
  Id_WSAEISCONN = WSAEISCONN;
  Id_WSAENOTCONN = WSAENOTCONN;
  Id_WSAESHUTDOWN = WSAESHUTDOWN;
  Id_WSAETOOMANYREFS = WSAETOOMANYREFS;
  Id_WSAETIMEDOUT = WSAETIMEDOUT;
  Id_WSAECONNREFUSED = WSAECONNREFUSED;
  Id_WSAELOOP = WSAELOOP;
  Id_WSAENAMETOOLONG = WSAENAMETOOLONG;
  Id_WSAEHOSTDOWN = WSAEHOSTDOWN;
  Id_WSAEHOSTUNREACH = WSAEHOSTUNREACH;
  Id_WSAENOTEMPTY = WSAENOTEMPTY;
  Id_SD_Recv = SocketShutdown.Receive;
  Id_SD_Send = SocketShutdown.Send;
  Id_SD_Both = SocketShutdown.Both;
  {$endif}

implementation

end.
