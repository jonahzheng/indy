unit IdFakePosixSockets;

{
IMPORTANT!!!

This unit is just a temporary dummy unit that WILL be deleted when Embarcadero
provides the BSD Socket API.  It's here just to compile IdStackConsts so I can
build a rough frame that we can build in.  It's just like a wall made up of only
studs.

Mostly, this is a ripoff from the FreeCLX project.
}
interface
{$MESSAGE WARN 'IdFakePosixSockets WILL be deleted when Embarcadero provides the BSD Socket API.  This unit is only for prototyping.'}

{ Options for use with `getsockopt' and `setsockopt' at the IPv6 level.
   The first word in the comment at the right is the data type used;
   "bool" means a boolean value stored in an `int'.  }
const
  IPV6_ADDRFORM         = 1;
  {$EXTERNALSYM IPV6_ADDRFORM}
  IPV6_PKTINFO          = 2;
  {$EXTERNALSYM IPV6_PKTINFO}
  IPV6_HOPOPTS          = 3;
  {$EXTERNALSYM IPV6_HOPOPTS}
  IPV6_DSTOPTS          = 4;
  {$EXTERNALSYM IPV6_DSTOPTS}
  IPV6_RTHDR            = 5;
  {$EXTERNALSYM IPV6_RTHDR}
  IPV6_PKTOPTIONS       = 6;
  {$EXTERNALSYM IPV6_PKTOPTIONS}
  IPV6_CHECKSUM         = 7;
  {$EXTERNALSYM IPV6_CHECKSUM}
  IPV6_HOPLIMIT         = 8;
  {$EXTERNALSYM IPV6_HOPLIMIT}
  IPV6_NEXTHOP          = 9;
  {$EXTERNALSYM IPV6_NEXTHOP}
  IPV6_AUTHHDR          = 10;
  {$EXTERNALSYM IPV6_AUTHHDR}
  IPV6_UNICAST_HOPS     = 16;
  {$EXTERNALSYM IPV6_UNICAST_HOPS}
  IPV6_MULTICAST_IF     = 17;
  {$EXTERNALSYM IPV6_MULTICAST_IF}
  IPV6_MULTICAST_HOPS   = 18;
  {$EXTERNALSYM IPV6_MULTICAST_HOPS}
  IPV6_MULTICAST_LOOP   = 19;
  {$EXTERNALSYM IPV6_MULTICAST_LOOP}
  IPV6_JOIN_GROUP       = 20;
  {$EXTERNALSYM IPV6_JOIN_GROUP}
  IPV6_LEAVE_GROUP      = 21;
  {$EXTERNALSYM IPV6_LEAVE_GROUP}
  IPV6_ROUTER_ALERT     = 22;
  {$EXTERNALSYM IPV6_ROUTER_ALERT}
  IPV6_MTU_DISCOVER     = 23;
  {$EXTERNALSYM IPV6_MTU_DISCOVER}
  IPV6_MTU              = 24;
  {$EXTERNALSYM IPV6_MTU}
  IPV6_RECVERR          = 25;
  {$EXTERNALSYM IPV6_RECVERR}

(* IPV6_RXSRCRT completely undefined. Bug in glibc 2.2?
  SCM_SRCRT             = IPV6_RXSRCRT;
  {$EXTERNALSYM SCM_SRCRT}
*)

{ Obsolete synonyms for the above.  }
  IPV6_RXHOPOPTS        = IPV6_HOPOPTS;
  {$EXTERNALSYM IPV6_RXHOPOPTS}
  IPV6_RXDSTOPTS        = IPV6_DSTOPTS;
  {$EXTERNALSYM IPV6_RXDSTOPTS}
  IPV6_ADD_MEMBERSHIP   = IPV6_JOIN_GROUP;
  {$EXTERNALSYM IPV6_ADD_MEMBERSHIP}
  IPV6_DROP_MEMBERSHIP  = IPV6_LEAVE_GROUP;
  {$EXTERNALSYM IPV6_DROP_MEMBERSHIP}


{ IPV6_MTU_DISCOVER values.  }
  IPV6_PMTUDISC_DONT    = 0;      { Never send DF frames.  }
  {$EXTERNALSYM IPV6_PMTUDISC_DONT}
  IPV6_PMTUDISC_WANT    = 1;      { Use per route hints.  }
  {$EXTERNALSYM IPV6_PMTUDISC_WANT}
  IPV6_PMTUDISC_DO      = 2;      { Always DF.  }
  {$EXTERNALSYM IPV6_PMTUDISC_DO}

{ Socket level values for IPv6.  }
  SOL_IPV6        = 41;
  {$EXTERNALSYM SOL_IPV6}
  SOL_ICMPV6      = 58;
  {$EXTERNALSYM SOL_ICMPV6}

{ Routing header options for IPv6.  }
  IPV6_RTHDR_LOOSE      = 0;      { Hop doesn't need to be neighbour. }
  {$EXTERNALSYM IPV6_RTHDR_LOOSE}
  IPV6_RTHDR_STRICT     = 1;      { Hop must be a neighbour.  }
  {$EXTERNALSYM IPV6_RTHDR_STRICT}

  IPV6_RTHDR_TYPE_0     = 0;      { IPv6 Routing header type 0.  }
  {$EXTERNALSYM IPV6_RTHDR_TYPE_0}

// Translated from bits/in.h, inlined in netinet/in.h

{ Options for use with `getsockopt' and `setsockopt' at the IP level.
   The first word in the comment at the right is the data type used;
   "bool" means a boolean value stored in an `int'.  }
const
  IP_TOS             = 1;  { int; IP type of service and precedence.  }
  {$EXTERNALSYM IP_TOS}
  IP_TTL             = 2;  { int; IP time to live.  }
  {$EXTERNALSYM IP_TTL}
  IP_HDRINCL         = 3;  { int; Header is included with data.  }
  {$EXTERNALSYM IP_HDRINCL}
  IP_OPTIONS         = 4;  { ip_opts; IP per-packet options.  }
  {$EXTERNALSYM IP_OPTIONS}
  IP_ROUTER_ALERT    = 5;  { bool }
  {$EXTERNALSYM IP_ROUTER_ALERT}
  IP_RECVOPTS        = 6;  { bool }
  {$EXTERNALSYM IP_RECVOPTS}
  IP_RETOPTS         = 7;  { bool }
  {$EXTERNALSYM IP_RETOPTS}
  IP_PKTINFO         = 8;  { bool }
  {$EXTERNALSYM IP_PKTINFO}
  IP_PKTOPTIONS      = 9;
  {$EXTERNALSYM IP_PKTOPTIONS}
  IP_PMTUDISC        = 10; { obsolete name? }
  {$EXTERNALSYM IP_PMTUDISC}
  IP_MTU_DISCOVER    = 10; { int; see below }
  {$EXTERNALSYM IP_MTU_DISCOVER}
  IP_RECVERR         = 11; { bool }
  {$EXTERNALSYM IP_RECVERR}
  IP_RECVTTL         = 12; { bool }
  {$EXTERNALSYM IP_RECVTTL}
  IP_RECVTOS         = 13; { bool }
  {$EXTERNALSYM IP_RECVTOS}
  IP_MULTICAST_IF    = 32; { in_addr; set/get IP multicast i/f }
  {$EXTERNALSYM IP_MULTICAST_IF}
  IP_MULTICAST_TTL   = 33; { u_char; set/get IP multicast ttl }
  {$EXTERNALSYM IP_MULTICAST_TTL}
  IP_MULTICAST_LOOP  = 34; { i_char; set/get IP multicast loopback }
  {$EXTERNALSYM IP_MULTICAST_LOOP}
  IP_ADD_MEMBERSHIP  = 35; { ip_mreq; add an IP group membership }
  {$EXTERNALSYM IP_ADD_MEMBERSHIP}
  IP_DROP_MEMBERSHIP = 36; { ip_mreq; drop an IP group membership }
  {$EXTERNALSYM IP_DROP_MEMBERSHIP}

{ For BSD compatibility.  }
  IP_RECVRETOPTS     = IP_RETOPTS;
  {$EXTERNALSYM IP_RECVRETOPTS}

{ IP_MTU_DISCOVER arguments.  }
  IP_PMTUDISC_DONT = 0; { Never send DF frames.  }
  {$EXTERNALSYM IP_PMTUDISC_DONT}
  IP_PMTUDISC_WANT = 1; { Use per route hints.  }
  {$EXTERNALSYM IP_PMTUDISC_WANT}
  IP_PMTUDISC_DO   = 2; { Always DF.  }
  {$EXTERNALSYM IP_PMTUDISC_DO}

{ To select the IP level.  }
  SOL_IP = 0;
  {$EXTERNALSYM SOL_IP}

  IP_DEFAULT_MULTICAST_TTL        = 1;
  {$EXTERNALSYM IP_DEFAULT_MULTICAST_TTL}
  IP_DEFAULT_MULTICAST_LOOP       = 1;
  {$EXTERNALSYM IP_DEFAULT_MULTICAST_LOOP}
  IP_MAX_MEMBERSHIPS              = 20;
  {$EXTERNALSYM IP_MAX_MEMBERSHIPS}

type
  TSocket = type Integer;
  PSocket = ^TSocket;

{ Types of sockets.  }
type
  __socket_type =
  (
    { Sequenced, reliable, connection-based byte streams.  }
    SOCK_STREAM     = 1,               // stream socket
    {$EXTERNALSYM SOCK_STREAM}

    { Connectionless, unreliable datagrams of fixed maximum length.  }
    SOCK_DGRAM      = 2,               // datagram socket
    {$EXTERNALSYM SOCK_DGRAM}

    { Raw protocol interface.  }
    SOCK_RAW        = 3,               // raw-protocol interface
    {$EXTERNALSYM SOCK_RAW}

    { Reliably-delivered messages.  }
    SOCK_RDM        = 4,               // reliably-delivered message
    {$EXTERNALSYM SOCK_RDM}

    { Sequenced, reliable, connection-based, datagrams of fixed maximum length.  }
    SOCK_SEQPACKET  = 5,               // sequenced packet stream
    {$EXTERNALSYM SOCK_SEQPACKET}

    { Linux specific way of getting packets at the dev level.
      For writing rarp and other similar things on the user level. }
    SOCK_PACKET  = 10                  // Linux specific way of getting packets
    {$EXTERNALSYM SOCK_PACKET}
  );
  {$EXTERNALSYM __socket_type}

const
{ Protocol families.  }
  PF_UNSPEC       = 0;               // Unspecified.
  {$EXTERNALSYM PF_UNSPEC}
  PF_LOCAL        = 1;               // Local to host (pipes and file-domain).
  {$EXTERNALSYM PF_LOCAL}
  PF_UNIX         = PF_LOCAL;        // Old BSD name for PF_LOCAL.
  {$EXTERNALSYM PF_UNIX}
  PF_FILE         = PF_LOCAL;        // Another non-standard name for PF_LOCAL.
  {$EXTERNALSYM PF_FILE}
  PF_INET         = 2;               // IP protocol family
  {$EXTERNALSYM PF_INET}
  PF_AX25         = 3;               // Amateur Radio AX.25.
  {$EXTERNALSYM PF_AX25}
  PF_IPX          = 4;               // Novell Internet Protocol.
  {$EXTERNALSYM PF_IPX}
  PF_APPLETALK    = 5;               // Appletalk DDP.
  {$EXTERNALSYM PF_APPLETALK}
  PF_NETROM       = 6;               // Amateur radio NetROM.
  {$EXTERNALSYM PF_NETROM}
  PF_BRIDGE       = 7;               // Multiprotocol bridge.
  {$EXTERNALSYM PF_BRIDGE}
  PF_ATMPVC       = 8;               // ATM PVCs.
  {$EXTERNALSYM PF_ATMPVC}
  PF_X25          = 9;               // Reserved for X.25 project.
  {$EXTERNALSYM PF_X25}
  PF_INET6        = 10;              // IP version 6.
  {$EXTERNALSYM PF_INET6}
  PF_ROSE         = 11;              // Amateur radio X.25 PLP.
  {$EXTERNALSYM PF_ROSE}
  PF_DECnet       = 12;              // Reserved for DECnet project.
  {$EXTERNALSYM PF_DECnet}
  PF_NETBEUI      = 13;              // Reserved for 802.2LLC project.
  {$EXTERNALSYM PF_NETBEUI}
  PF_SECURITY     = 14;              // Security callback pseudo AF.
  {$EXTERNALSYM PF_SECURITY}
  PF_KEY          = 15;              // PFKEY key management API.
  {$EXTERNALSYM PF_KEY}
  PF_NETLINK      = 16;
  {$EXTERNALSYM PF_NETLINK}
  PF_ROUTE        = PF_NETLINK;      // Alias to emulate 4.4BSD.
  {$EXTERNALSYM PF_ROUTE}
  PF_PACKET       = 17;              // Packet family.
  {$EXTERNALSYM PF_PACKET}
  PF_ASH          = 18;              // Ash.
  {$EXTERNALSYM PF_ASH}
  PF_ECONET       = 19;              // Acorn Econet.
  {$EXTERNALSYM PF_ECONET}
  PF_ATMSVC       = 20;              // ATM SVCs.
  {$EXTERNALSYM PF_ATMSVC}
  PF_SNA          = 22;              // Linux SNA project.
  {$EXTERNALSYM PF_SNA}
  PF_IRDA         = 23;              // IRDA sockets.
  {$EXTERNALSYM PF_IRDA}
  PF_PPPOX        = 24;              // PPPoX sockets.
  {$EXTERNALSYM PF_PPPOX}
  PF_MAX          = 32;              // For now ...
  {$EXTERNALSYM PF_MAX}

{ Address families.  }
  AF_UNSPEC       = PF_UNSPEC;
  {$EXTERNALSYM AF_UNSPEC}
  AF_LOCAL        = PF_LOCAL;
  {$EXTERNALSYM AF_LOCAL}
  AF_UNIX         = PF_UNIX;
  {$EXTERNALSYM AF_UNIX}
  AF_FILE         = PF_FILE;
  {$EXTERNALSYM AF_FILE}
  AF_INET         = PF_INET;
  {$EXTERNALSYM AF_INET}
  AF_AX25         = PF_AX25;
  {$EXTERNALSYM AF_AX25}
  AF_IPX          = PF_IPX;
  {$EXTERNALSYM AF_IPX}
  AF_APPLETALK    = PF_APPLETALK;
  {$EXTERNALSYM AF_APPLETALK}
  AF_NETROM       = PF_NETROM;
  {$EXTERNALSYM AF_NETROM}
  AF_BRIDGE       = PF_BRIDGE;
  {$EXTERNALSYM AF_BRIDGE}
  AF_ATMPVC       = PF_ATMPVC;
  {$EXTERNALSYM AF_ATMPVC}
  AF_X25          = PF_X25;
  {$EXTERNALSYM AF_X25}
  AF_INET6        = PF_INET6;
  {$EXTERNALSYM AF_INET6}
  AF_ROSE         = PF_ROSE;
  {$EXTERNALSYM AF_ROSE}
  AF_DECnet       = PF_DECnet;
  {$EXTERNALSYM AF_DECnet}
  AF_NETBEUI      = PF_NETBEUI;
  {$EXTERNALSYM AF_NETBEUI}
  AF_SECURITY     = PF_SECURITY;
  {$EXTERNALSYM AF_SECURITY}
  AF_KEY          = PF_KEY;
  {$EXTERNALSYM AF_KEY}
  AF_NETLINK      = PF_NETLINK;
  {$EXTERNALSYM AF_NETLINK}
  AF_ROUTE        = PF_ROUTE;
  {$EXTERNALSYM AF_ROUTE}
  AF_PACKET       = PF_PACKET;
  {$EXTERNALSYM AF_PACKET}
  AF_ASH          = PF_ASH;
  {$EXTERNALSYM AF_ASH}
  AF_ECONET       = PF_ECONET;
  {$EXTERNALSYM AF_ECONET}
  AF_ATMSVC       = PF_ATMSVC;
  {$EXTERNALSYM AF_ATMSVC}
  AF_SNA          = PF_SNA;
  {$EXTERNALSYM AF_SNA}
  AF_IRDA         = PF_IRDA;
  {$EXTERNALSYM AF_IRDA}
  AF_PPPOX        = PF_PPPOX;
  {$EXTERNALSYM AF_PPPOX}
  AF_MAX          = PF_MAX;
  {$EXTERNALSYM AF_MAX}


  { Socket level values . Others are defined in the appropriate headers

    XXX These definitions also should go into the appropriate headers as
    far as they are available.  }

  SOL_RAW       = 255;
  {$EXTERNALSYM SOL_RAW}
  SOL_DECNET    = 261;
  {$EXTERNALSYM SOL_DECNET}
  SOL_X25       = 262;
  {$EXTERNALSYM SOL_X25}
  SOL_PACKET    = 263;
  {$EXTERNALSYM SOL_PACKET}
  SOL_ATM       = 264;                  // ATM layer (cell level).
  {$EXTERNALSYM SOL_ATM}
  SOL_AAL       = 265;                  // ATM Adaption Layer (packet level).
  {$EXTERNALSYM SOL_AAL}
  SOL_IRDA      = 266;
  {$EXTERNALSYM SOL_IRDA}

  // Maximum queue length specifiable by listen.
  SOMAXCONN     = 128;
  {$EXTERNALSYM SOMAXCONN}


{ Standard well-defined IP protocols.  }
const
  IPPROTO_IP = 0;               // Dummy protocol for TCP.
  {$EXTERNALSYM IPPROTO_IP}
  IPPROTO_HOPOPTS = 0;          // IPv6 Hop-by-Hop options.
  {$EXTERNALSYM IPPROTO_HOPOPTS}
  IPPROTO_ICMP = 1;             // Internet Control Message Protocol.
  {$EXTERNALSYM IPPROTO_ICMP}
  IPPROTO_IGMP = 2;             // Internet Group Management Protocol.
  {$EXTERNALSYM IPPROTO_IGMP}
  IPPROTO_IPIP = 4;             // IPIP tunnels (older KA9Q tunnels use 94).
  {$EXTERNALSYM IPPROTO_IPIP}
  IPPROTO_TCP = 6;              // Transmission Control Protocol.
  {$EXTERNALSYM IPPROTO_TCP}
  IPPROTO_EGP = 8;              // Exterior Gateway Protocol.
  {$EXTERNALSYM IPPROTO_EGP}
  IPPROTO_PUP = 12;             // PUP protocol.
  {$EXTERNALSYM IPPROTO_PUP}
  IPPROTO_UDP = 17;             // User Datagram Protocol.
  {$EXTERNALSYM IPPROTO_UDP}
  IPPROTO_IDP = 22;             // XNS IDP protocol.
  {$EXTERNALSYM IPPROTO_IDP}
  IPPROTO_TP = 29;              // SO Transport Protocol Class 4.
  {$EXTERNALSYM IPPROTO_TP}
  IPPROTO_IPV6 = 41;	        // IPv6 header.
  {$EXTERNALSYM IPPROTO_IPV6}
  IPPROTO_ROUTING = 43;	        // IPv6 routing header.
  {$EXTERNALSYM IPPROTO_ROUTING}
  IPPROTO_FRAGMENT = 44;        // IPv6 fragmentation header.
  {$EXTERNALSYM IPPROTO_FRAGMENT}
  IPPROTO_RSVP = 46;            // Reservation Protocol.
  {$EXTERNALSYM IPPROTO_RSVP}
  IPPROTO_GRE = 47;     	// General Routing Encapsulation.
  {$EXTERNALSYM IPPROTO_GRE}
  IPPROTO_ESP = 50;             // encapsulating security payload.
  {$EXTERNALSYM IPPROTO_ESP}
  IPPROTO_AH = 51;              // authentication header.
  {$EXTERNALSYM IPPROTO_AH}
  IPPROTO_ICMPV6 = 58;          // ICMPv6.
  {$EXTERNALSYM IPPROTO_ICMPV6}
  IPPROTO_NONE = 59;            // IPv6 no next header.
  {$EXTERNALSYM IPPROTO_NONE}
  IPPROTO_DSTOPTS = 60;         // IPv6 destination options.
  {$EXTERNALSYM IPPROTO_DSTOPTS}
  IPPROTO_MTP = 92;             // Multicast Transport Protocol.
  {$EXTERNALSYM IPPROTO_MTP}
  IPPROTO_ENCAP = 98;           // Encapsulation Header.
  {$EXTERNALSYM IPPROTO_ENCAP}
  IPPROTO_PIM = 103;            // Protocol Independent Multicast.
  {$EXTERNALSYM IPPROTO_PIM}
  IPPROTO_COMP = 108;           // Compression Header Protocol.
  {$EXTERNALSYM IPPROTO_COMP}
  IPPROTO_RAW = 255;            // Raw IP packets.
  {$EXTERNALSYM IPPROTO_RAW}
  IPPROTO_MAX = 256;
  {$EXTERNALSYM IPPROTO_MAX}

const
{ For setsockoptions(2) }
  SOL_SOCKET    = 1;
  {$EXTERNALSYM SOL_SOCKET}

  SO_DEBUG      = 1;
  {$EXTERNALSYM SO_DEBUG}
  SO_REUSEADDR  = 2;
  {$EXTERNALSYM SO_REUSEADDR}
  SO_TYPE       = 3;
  {$EXTERNALSYM SO_TYPE}
  SO_ERROR      = 4;
  {$EXTERNALSYM SO_ERROR}
  SO_DONTROUTE  = 5;
  {$EXTERNALSYM SO_DONTROUTE}
  SO_BROADCAST  = 6;
  {$EXTERNALSYM SO_BROADCAST}
  SO_SNDBUF     = 7;
  {$EXTERNALSYM SO_SNDBUF}
  SO_RCVBUF     = 8;
  {$EXTERNALSYM SO_RCVBUF}
  SO_KEEPALIVE  = 9;
  {$EXTERNALSYM SO_KEEPALIVE}
  SO_OOBINLINE  = 10;
  {$EXTERNALSYM SO_OOBINLINE}
  SO_NO_CHECK   = 11;
  {$EXTERNALSYM SO_NO_CHECK}
  SO_PRIORITY   = 12;
  {$EXTERNALSYM SO_PRIORITY}
  SO_LINGER     = 13;
  {$EXTERNALSYM SO_LINGER}
  SO_BSDCOMPAT  = 14;
  {$EXTERNALSYM SO_BSDCOMPAT}
{ To add : SO_REUSEPORT = 15; }
  SO_PASSCRED   = 16;
  {$EXTERNALSYM SO_PASSCRED}
  SO_PEERCRED   = 17;
  {$EXTERNALSYM SO_PEERCRED}
  SO_RCVLOWAT   = 18;
  {$EXTERNALSYM SO_RCVLOWAT}
  SO_SNDLOWAT   = 19;
  {$EXTERNALSYM SO_SNDLOWAT}
  SO_RCVTIMEO   = 20;
  {$EXTERNALSYM SO_RCVTIMEO}
  SO_SNDTIMEO   = 21;
  {$EXTERNALSYM SO_SNDTIMEO}

{ Security levels - as per NRL IPv6 - don't actually do anything }
  SO_SECURITY_AUTHENTICATION       = 22;
  {$EXTERNALSYM SO_SECURITY_AUTHENTICATION}
  SO_SECURITY_ENCRYPTION_TRANSPORT = 23;
  {$EXTERNALSYM SO_SECURITY_ENCRYPTION_TRANSPORT}
  SO_SECURITY_ENCRYPTION_NETWORK   = 24;
  {$EXTERNALSYM SO_SECURITY_ENCRYPTION_NETWORK}

  SO_BINDTODEVICE                  = 25;
  {$EXTERNALSYM SO_BINDTODEVICE}

{ Socket filtering }
  SO_ATTACH_FILTER = 26;
  {$EXTERNALSYM SO_ATTACH_FILTER}
  SO_DETACH_FILTER = 27;
  {$EXTERNALSYM SO_DETACH_FILTER}


const
  INVALID_SOCKET = -1;
  {$EXTERNALSYM INVALID_SOCKET}
  SOCKET_ERROR = -1;
  {$EXTERNALSYM SOCKET_ERROR}

  // Address to accept any incoming messages.
  INADDR_ANY = 0;
  {$EXTERNALSYM INADDR_ANY}

  // Address to send to all hosts.
  INADDR_BROADCAST = -1;
  {$EXTERNALSYM INADDR_BROADCAST}

  // Address indicating an error return.
  INADDR_NONE = $FFFFFFFF;
  {$EXTERNALSYM INADDR_NONE}

{ Number of descriptors that can fit in an `fd_set'.  }
const
  __FD_SETSIZE    = 1024;
  {$EXTERNALSYM __FD_SETSIZE}

{ fd_set for select and pselect.  }
type
{ One element in the file descriptor mask array.  }
  __fd_mask = LongWord;
  {$EXTERNALSYM __NFDBITS}

const
  {$EXTERNALSYM __fd_mask}
{ It's easier to assume 8-bit bytes than to get CHAR_BIT.  }
  __NFDBITS       = 8 * sizeof(__fd_mask);

type
  __fd_set = {packed} record { XPG4.2 requires this member name.  Otherwise avoid the name
       from the global namespace.  }
    fds_bits: packed array[0..(__FD_SETSIZE div __NFDBITS)-1] of __fd_mask;
  end;
  {$EXTERNALSYM __fd_set}
  TFdSet = __fd_set;
  PFdSet = ^TFdSet;

const
  { The following constants should be used for the second parameter of `shutdown'. }
  SHUT_RD = 0;                  { No more receptions. }
  {$EXTERNALSYM SHUT_RD}
  SHUT_WR = 1;                  { No more transmissions. }
  {$EXTERNALSYM SHUT_WR}
  SHUT_RDWR = 2;                { No more receptions or transmissions. }
  {$EXTERNALSYM SHUT_RDWR}


// Translated from asm/errno.h included via linux/errno.h via bits/errno.h

const
  EPERM                       = 1;        {  Operation not permitted  }
  {$EXTERNALSYM EPERM}
  ENOENT                      = 2;        {  No such file or directory  }
  {$EXTERNALSYM ENOENT}
  ESRCH                       = 3;        {  No such process  }
  {$EXTERNALSYM ESRCH}
  EINTR                       = 4;        {  Interrupted system call  }
  {$EXTERNALSYM EINTR}
  EIO                         = 5;        {  I/O error  }
  {$EXTERNALSYM EIO}
  ENXIO                       = 6;        {  No such device or address  }
  {$EXTERNALSYM ENXIO}
  E2BIG                       = 7;        {  Arg list too long  }
  {$EXTERNALSYM E2BIG}
  ENOEXEC                     = 8;        {  Exec format error  }
  {$EXTERNALSYM ENOEXEC}
  EBADF                       = 9;        {  Bad file number  }
  {$EXTERNALSYM EBADF}
  ECHILD                     = 10;        {  No child processes  }
  {$EXTERNALSYM ECHILD}
  EAGAIN                     = 11;        {  Try again  }
  {$EXTERNALSYM EAGAIN}
  ENOMEM                     = 12;        {  Out of memory  }
  {$EXTERNALSYM ENOMEM}
  EACCES                     = 13;        {  Permission denied  }
  {$EXTERNALSYM EACCES}
  EFAULT                     = 14;        {  Bad address  }
  {$EXTERNALSYM EFAULT}
  ENOTBLK                    = 15;        {  Block device required  }
  {$EXTERNALSYM ENOTBLK}
  EBUSY                      = 16;        {  Device or resource busy  }
  {$EXTERNALSYM EBUSY}
  EEXIST                     = 17;        {  File exists  }
  {$EXTERNALSYM EEXIST}
  EXDEV                      = 18;        {  Cross-device link  }
  {$EXTERNALSYM EXDEV}
  ENODEV                     = 19;        {  No such device  }
  {$EXTERNALSYM ENODEV}
  ENOTDIR                    = 20;        {  Not a directory  }
  {$EXTERNALSYM ENOTDIR}
  EISDIR                     = 21;        {  Is a directory  }
  {$EXTERNALSYM EISDIR}
  EINVAL                     = 22;        {  Invalid argument  }
  {$EXTERNALSYM EINVAL}
  ENFILE                     = 23;        {  File table overflow  }
  {$EXTERNALSYM ENFILE}
  EMFILE                     = 24;        {  Too many open files  }
  {$EXTERNALSYM EMFILE}
  ENOTTY                     = 25;        {  Not a typewriter  }
  {$EXTERNALSYM ENOTTY}
  ETXTBSY                    = 26;        {  Text file busy  }
  {$EXTERNALSYM ETXTBSY}
  EFBIG                      = 27;        {  File too large  }
  {$EXTERNALSYM EFBIG}
  ENOSPC                     = 28;        {  No space left on device  }
  {$EXTERNALSYM ENOSPC}
  ESPIPE                     = 29;        {  Illegal seek  }
  {$EXTERNALSYM ESPIPE}
  EROFS                      = 30;        {  Read-only file system  }
  {$EXTERNALSYM EROFS}
  EMLINK                     = 31;        {  Too many links  }
  {$EXTERNALSYM EMLINK}
  EPIPE                      = 32;        {  Broken pipe  }
  {$EXTERNALSYM EPIPE}
  EDOM                       = 33;        {  Math argument out of domain of func  }
  {$EXTERNALSYM EDOM}
  ERANGE                     = 34;        {  Math result not representable  }
  {$EXTERNALSYM ERANGE}
  EDEADLK                    = 35;        {  Resource deadlock would occur  }
  {$EXTERNALSYM EDEADLK}
  ENAMETOOLONG               = 36;        {  File name too long  }
  {$EXTERNALSYM ENAMETOOLONG}
  ENOLCK                     = 37;        {  No record locks available  }
  {$EXTERNALSYM ENOLCK}
  ENOSYS                     = 38;        {  Function not implemented  }
  {$EXTERNALSYM ENOSYS}
  ENOTEMPTY                  = 39;        {  Directory not empty  }
  {$EXTERNALSYM ENOTEMPTY}
  ELOOP                      = 40;        {  Too many symbolic links encountered  }
  {$EXTERNALSYM ELOOP}
  EWOULDBLOCK                = EAGAIN;    {  Operation would block  }
  {$EXTERNALSYM EWOULDBLOCK}
  ENOMSG                     = 42;        {  No message of desired type  }
  {$EXTERNALSYM ENOMSG}
  EIDRM                      = 43;        {  Identifier removed  }
  {$EXTERNALSYM EIDRM}
  ECHRNG                     = 44;        {  Channel number out of range  }
  {$EXTERNALSYM ECHRNG}
  EL2NSYNC                   = 45;        {  Level 2; not synchronized  }
  {$EXTERNALSYM EL2NSYNC}
  EL3HLT                     = 46;        {  Level 3; halted  }
  {$EXTERNALSYM EL3HLT}
  EL3RST                     = 47;        {  Level 3; reset  }
  {$EXTERNALSYM EL3RST}
  ELNRNG                     = 48;        {  Link number out of range  }
  {$EXTERNALSYM ELNRNG}
  EUNATCH                    = 49;        {  Protocol driver not attached  }
  {$EXTERNALSYM EUNATCH}
  ENOCSI                     = 50;        {  No CSI structure available  }
  {$EXTERNALSYM ENOCSI}
  EL2HLT                     = 51;        {  Level 2; halted  }
  {$EXTERNALSYM EL2HLT}
  EBADE                      = 52;        {  Invalid exchange  }
  {$EXTERNALSYM EBADE}
  EBADR                      = 53;        {  Invalid request descriptor  }
  {$EXTERNALSYM EBADR}
  EXFULL                     = 54;        {  Exchange full  }
  {$EXTERNALSYM EXFULL}
  ENOANO                     = 55;        {  No anode  }
  {$EXTERNALSYM ENOANO}
  EBADRQC                    = 56;        {  Invalid request code  }
  {$EXTERNALSYM EBADRQC}
  EBADSLT                    = 57;        {  Invalid slot  }
  {$EXTERNALSYM EBADSLT}

  EDEADLOCK                  = EDEADLK;
  {$EXTERNALSYM EDEADLOCK}

  EBFONT                     = 59;        {  Bad font file format  }
  {$EXTERNALSYM EBFONT}
  ENOSTR                     = 60;        {  Device not a stream  }
  {$EXTERNALSYM ENOSTR}
  ENODATA                    = 61;        {  No data available  }
  {$EXTERNALSYM ENODATA}
  ETIME                      = 62;        {  Timer expired  }
  {$EXTERNALSYM ETIME}
  ENOSR                      = 63;        {  Out of streams resources  }
  {$EXTERNALSYM ENOSR}
  ENONET                     = 64;        {  Machine is not on the network  }
  {$EXTERNALSYM ENONET}
  ENOPKG                     = 65;        {  Package not installed  }
  {$EXTERNALSYM ENOPKG}
  EREMOTE                    = 66;        {  Object is remote  }
  {$EXTERNALSYM EREMOTE}
  ENOLINK                    = 67;        {  Link has been severed  }
  {$EXTERNALSYM ENOLINK}
  EADV                       = 68;        {  Advertise error  }
  {$EXTERNALSYM EADV}
  ESRMNT                     = 69;        {  Srmount error  }
  {$EXTERNALSYM ESRMNT}
  ECOMM                      = 70;        {  Communication error on send  }
  {$EXTERNALSYM ECOMM}
  EPROTO                     = 71;        {  Protocol error  }
  {$EXTERNALSYM EPROTO}
  EMULTIHOP                  = 72;        {  Multihop attempted  }
  {$EXTERNALSYM EMULTIHOP}
  EDOTDOT                    = 73;        {  RFS specific error  }
  {$EXTERNALSYM EDOTDOT}
  EBADMSG                    = 74;        {  Not a data message  }
  {$EXTERNALSYM EBADMSG}
  EOVERFLOW                  = 75;        {  Value too large for defined data type  }
  {$EXTERNALSYM EOVERFLOW}
  ENOTUNIQ                   = 76;        {  Name not unique on network  }
  {$EXTERNALSYM ENOTUNIQ}
  EBADFD                     = 77;        {  File descriptor in bad state  }
  {$EXTERNALSYM EBADFD}
  EREMCHG                    = 78;        {  Remote address changed  }
  {$EXTERNALSYM EREMCHG}
  ELIBACC                    = 79;        {  Can not access a needed shared library  }
  {$EXTERNALSYM ELIBACC}
  ELIBBAD                    = 80;        {  Accessing a corrupted shared library  }
  {$EXTERNALSYM ELIBBAD}
  ELIBSCN                    = 81;        {  .lib section in a.out corrupted  }
  {$EXTERNALSYM ELIBSCN}
  ELIBMAX                    = 82;        {  Attempting to link in too many shared libraries  }
  {$EXTERNALSYM ELIBMAX}
  ELIBEXEC                   = 83;        {  Cannot exec a shared library directly  }
  {$EXTERNALSYM ELIBEXEC}
  EILSEQ                     = 84;        {  Illegal byte sequence  }
  {$EXTERNALSYM EILSEQ}
  ERESTART                   = 85;        {  Interrupted system call should be restarted  }
  {$EXTERNALSYM ERESTART}
  ESTRPIPE                   = 86;        {  Streams pipe error  }
  {$EXTERNALSYM ESTRPIPE}
  EUSERS                     = 87;        {  Too many users  }
  {$EXTERNALSYM EUSERS}
  ENOTSOCK                   = 88;        {  Socket operation on non-socket  }
  {$EXTERNALSYM ENOTSOCK}
  EDESTADDRREQ               = 89;        {  Destination address required  }
  {$EXTERNALSYM EDESTADDRREQ}
  EMSGSIZE                   = 90;        {  Message too long  }
  {$EXTERNALSYM EMSGSIZE}
  EPROTOTYPE                 = 91;        {  Protocol wrong type for socket  }
  {$EXTERNALSYM EPROTOTYPE}
  ENOPROTOOPT                = 92;        {  Protocol not available  }
  {$EXTERNALSYM ENOPROTOOPT}
  EPROTONOSUPPORT            = 93;        {  Protocol not supported  }
  {$EXTERNALSYM EPROTONOSUPPORT}
  ESOCKTNOSUPPORT            = 94;        {  Socket type not supported  }
  {$EXTERNALSYM ESOCKTNOSUPPORT}
  EOPNOTSUPP                 = 95;        {  Operation not supported on transport endpoint  }
  {$EXTERNALSYM EOPNOTSUPP}
  EPFNOSUPPORT               = 96;        {  Protocol family not supported  }
  {$EXTERNALSYM EPFNOSUPPORT}
  EAFNOSUPPORT               = 97;        {  Address family not supported by protocol  }
  {$EXTERNALSYM EAFNOSUPPORT}
  EADDRINUSE                 = 98;        {  Address already in use  }
  {$EXTERNALSYM EADDRINUSE}
  EADDRNOTAVAIL              = 99;        {  Cannot assign requested address  }
  {$EXTERNALSYM EADDRNOTAVAIL}
  ENETDOWN                  = 100;        {  Network is down  }
  {$EXTERNALSYM ENETDOWN}
  ENETUNREACH               = 101;        {  Network is unreachable  }
  {$EXTERNALSYM ENETUNREACH}
  ENETRESET                 = 102;        {  Network dropped connection because of reset  }
  {$EXTERNALSYM ENETRESET}
  ECONNABORTED              = 103;        {  Software caused connection abort  }
  {$EXTERNALSYM ECONNABORTED}
  ECONNRESET                = 104;        {  Connection reset by peer  }
  {$EXTERNALSYM ECONNRESET}
  ENOBUFS                   = 105;        {  No buffer space available  }
  {$EXTERNALSYM ENOBUFS}
  EISCONN                   = 106;        {  Transport endpoint is already connected  }
  {$EXTERNALSYM EISCONN}
  ENOTCONN                  = 107;        {  Transport endpoint is not connected  }
  {$EXTERNALSYM ENOTCONN}
  ESHUTDOWN                 = 108;        {  Cannot send after transport endpoint shutdown  }
  {$EXTERNALSYM ESHUTDOWN}
  ETOOMANYREFS              = 109;        {  Too many references: cannot splice  }
  {$EXTERNALSYM ETOOMANYREFS}
  ETIMEDOUT                 = 110;        {  Connection timed out  }
  {$EXTERNALSYM ETIMEDOUT}
  ECONNREFUSED              = 111;        {  Connection refused  }
  {$EXTERNALSYM ECONNREFUSED}
  EHOSTDOWN                 = 112;        {  Host is down  }
  {$EXTERNALSYM EHOSTDOWN}
  EHOSTUNREACH              = 113;        {  No route to host  }
  {$EXTERNALSYM EHOSTUNREACH}
  EALREADY                  = 114;        {  Operation already in progress  }
  {$EXTERNALSYM EALREADY}
  EINPROGRESS               = 115;        {  Operation now in progress  }
  {$EXTERNALSYM EINPROGRESS}
  ESTALE                    = 116;        {  Stale NFS file handle  }
  {$EXTERNALSYM ESTALE}
  EUCLEAN                   = 117;        {  Structure needs cleaning  }
  {$EXTERNALSYM EUCLEAN}
  ENOTNAM                   = 118;        {  Not a XENIX named type file  }
  {$EXTERNALSYM ENOTNAM}
  ENAVAIL                   = 119;        {  No XENIX semaphores available  }
  {$EXTERNALSYM ENAVAIL}
  EISNAM                    = 120;        {  Is a named type file  }
  {$EXTERNALSYM EISNAM}
  EREMOTEIO                 = 121;        {  Remote I/O error  }
  {$EXTERNALSYM EREMOTEIO}
  EDQUOT                    = 122;        {  Quota exceeded  }
  {$EXTERNALSYM EDQUOT}
  ENOMEDIUM                 = 123;        {  No medium found  }
  {$EXTERNALSYM ENOMEDIUM}
  EMEDIUMTYPE               = 124;        {  Wrong medium type  }
  {$EXTERNALSYM EMEDIUMTYPE}

// Translated from bits/errno.h

  {  Linux has no ENOTSUP error code.  }
  ENOTSUP                   = EOPNOTSUPP;
  {$EXTERNALSYM ENOTSUP}

  {  Linux has no ECANCELED error code.  Since it is not used here
     we define it to an invalid value.  }
  ECANCELED                 = 125;
  {$EXTERNALSYM ECANCELED}

implementation

end.
