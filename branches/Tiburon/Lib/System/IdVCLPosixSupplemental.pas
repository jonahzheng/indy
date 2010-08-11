unit IdVCLPosixSupplemental;

interface
{$I IdCompilerDefines.inc}

uses
{$IFDEF DARWIN} 
  CoreFoundation,
  CoreServices,
{$ENDIF}
  IdCTypes;

//tcp.hh
type
{Supplemental stuff from netinet/tcp.h}
  {$EXTERNALSYM tcp_seq}
  tcp_seq = TIdC_UINT32;
  {$EXTERNALSYM tcp_cc}
  tcp_cc  = TIdC_UINT32;		//* connection count per rfc1644 */
  {$EXTERNALSYM tcp6_seq}
  tcp6_seq = tcp_seq;	//* for KAME src sync over BSD*'s */' +


{stuff that may be needed for various socket functions.  Much of this may be
platform specific.  Defined in netinet/tcp.h}
const
  {$IFDEF BSD}
  //for BSD-based operating systems such as FreeBSD and Mac OS X
  {$EXTERNALSYM TCP_MAXSEG}
	TCP_MAXSEG              = $02;    //* set maximum segment size */
  {$EXTERNALSYM TCP_NOPUSH}
  TCP_NOPUSH              = $04 platform;   //* don't push last block of write */
  {$EXTERNALSYM TCP_NOOPT}
  TCP_NOOPT               = $08;    //* don't use TCP options */
  {$ENDIF}

  {$IFDEF FREEBSD}
  //specific to FreeBSD
  {$EXTERNALSYM TCP_MD5SIG}
  TCP_MD5SIG              = $10 platform;    //* use MD5 digests (RFC2385) */
  {$EXTERNALSYM TCP_INFO}
  TCP_INFO                = $20 platform;  //* retrieve tcp_info structure */
  {$EXTERNALSYM TCP_CONGESTION}
  TCP_CONGESTION          = $40 platform;   //* get/set congestion control algorithm */
  {$ENDIF}

  {$IFDEF DARWIN}
  //specific to Mac OS X
  {$EXTERNALSYM TCP_KEEPALIVE}
  TCP_KEEPALIVE           = $10 platform;    //* idle time used when SO_KEEPALIVE is enabled */
  {$EXTERNALSYM TCP_CONNECTIONTIMEOUT}
  TCP_CONNECTIONTIMEOUT   = $20 platform;    //* connection timeout */

  {$EXTERNALSYM TCPOPT_EOL}
  TCPOPT_EOL	=	0 platform;
  {$EXTERNALSYM TCPOPT_NOP}
  TCPOPT_NOP	=	1 platform;
  {$EXTERNALSYM TCPOPT_MAXSEG}
  TCPOPT_MAXSEG	 = 2 platform;
  {$EXTERNALSYM TCPOLEN_MAXSEG}
  TCPOLEN_MAXSEG	 = 4 platform;
  {$EXTERNALSYM TCPOPT_WINDOW}
  TCPOPT_WINDOW	 = 3 platform;
  {$EXTERNALSYM TCPOLEN_WINDOW}
  TCPOLEN_WINDOW = 3 platform;
  {$EXTERNALSYM TCPOPT_SACK_PERMITTED}
  TCPOPT_SACK_PERMITTED	= 4 platform;		//* Experimental */
  {$EXTERNALSYM TCPOLEN_SACK_PERMITTED}
  TCPOLEN_SACK_PERMITTED = 2 platform;
  {$EXTERNALSYM TCPOPT_SACK}
  TCPOPT_SACK	  = 5 platform;		//* Experimental */
  {$EXTERNALSYM TCPOLEN_SACK}
  TCPOLEN_SACK  =	8 platform;		//* len of sack block */
  {$EXTERNALSYM TCPOPT_TIMESTAMP}
  TCPOPT_TIMESTAMP = 8 platform;
  {$EXTERNALSYM TCPOLEN_TIMESTAMP}
  TCPOLEN_TIMESTAMP = 10 platform;
  {$EXTERNALSYM TCPOLEN_TSTAMP_APPA}
  TCPOLEN_TSTAMP_APPA	=	(TCPOLEN_TIMESTAMP+2) platform; //* appendix A */
  {$EXTERNALSYM TCPOPT_TSTAMP_HDR}
  TCPOPT_TSTAMP_HDR	=
    ((TCPOPT_NOP shl 24) or
    (TCPOPT_NOP shl 16) or
    (TCPOPT_TIMESTAMP shl 8) or
    (TCPOLEN_TIMESTAMP)) platform;
  {$EXTERNALSYM MAX_TCPOPTLEN}
  MAX_TCPOPTLEN	 =	40 platform;	//* Absolute maximum TCP options len */
  {$EXTERNALSYM TCPOPT_CC}
  TCPOPT_CC	 =	11 platform;		//* CC options: RFC-1644 */
  {$EXTERNALSYM TCPOPT_CCNEW}
  TCPOPT_CCNEW = 12 platform;
  {$EXTERNALSYM TCPOPT_CCECHO}
  TCPOPT_CCECHO	=	13 platform;
  {$EXTERNALSYM TCPOLEN_CC}
  TCPOLEN_CC		=	6 platform;
  {$EXTERNALSYM TCPOLEN_CC_APPA}
  TCPOLEN_CC_APPA	=	(TCPOLEN_CC+2);

  {$EXTERNALSYM TCPOPT_CC_HDR}
 function TCPOPT_CC_HDR(const ccopt : Integer)	: Integer; inline;

const
  {$EXTERNALSYM TCPOPT_SIGNATURE}
	TCPOPT_SIGNATURE	 =	19 platform;	//* Keyed MD5: RFC 2385 */
  {$EXTERNALSYM TCPOLEN_SIGNATURE}
  TCPOLEN_SIGNATURE	 = 18 platform;

//* Option definitions */
  {$EXTERNALSYM TCPOPT_SACK_PERMIT_HDR}
  TCPOPT_SACK_PERMIT_HDR	=
    ((TCPOPT_NOP shl 24) or
     (TCPOPT_NOP shl 16) or
     (TCPOPT_SACK_PERMITTED shl 8) or
      TCPOLEN_SACK_PERMITTED) platform;
  {$EXTERNALSYM TCPOPT_SACK_HDR}
  TCPOPT_SACK_HDR = ((TCPOPT_NOP shl 24) or (TCPOPT_NOP shl 16) or (TCPOPT_SACK shl 8)) platform;
//* Miscellaneous constants */
  {$EXTERNALSYM MAX_SACK_BLKS}
  MAX_SACK_BLKS	= 6 platform; //* Max # SACK blocks stored at sender side */
  {$EXTERNALSYM TCP_MAX_SACK}
  TCP_MAX_SACK	= 3 platform;	//* MAX # SACKs sent in any segment */


// /*
// * Default maximum segment size for TCP.
// * With an IP MTU of 576, this is 536,
// * but 512 is probably more convenient.
// * This should be defined as MIN(512, IP_MSS - sizeof (struct tcpiphdr)).
// */
  {$EXTERNALSYM TCP_MSS}
  TCP_MSS	= 512 platform;

// /*
// * TCP_MINMSS is defined to be 216 which is fine for the smallest
// * link MTU (256 bytes, SLIP interface) in the Internet.
// * However it is very unlikely to come across such low MTU interfaces
// * these days (anno dato 2004).
// * Probably it can be set to 512 without ill effects. But we play safe.
// * See tcp_subr.c tcp_minmss SYSCTL declaration for more comments.
// * Setting this to "0" disables the minmss check.
// */
  {$EXTERNALSYM TCP_MINMSS}
  TCP_MINMSS = 216 platform;

// /*
// * TCP_MINMSSOVERLOAD is defined to be 1000 which should cover any type
// * of interactive TCP session.
// * See tcp_subr.c tcp_minmssoverload SYSCTL declaration and tcp_input.c
// * for more comments.
// * Setting this to "0" disables the minmssoverload check.
// */
  {$EXTERNALSYM TCP_MINMSSOVERLOAD}
  TCP_MINMSSOVERLOAD = 1000 platform;
// *
// * Default maximum segment size for TCP6.
// * With an IP6 MSS of 1280, this is 1220,
// * but 1024 is probably more convenient. (xxx kazu in doubt)
// * This should be defined as MIN(1024, IP6_MSS - sizeof (struct tcpip6hdr))
// */
  {$EXTERNALSYM TCP6_MSS}
  TCP6_MSS = 1024 platform;
  {$EXTERNALSYM TCP_MAXWIN}
  TCP_MAXWIN =	65535 platform;	//* largest value for (unscaled) window */
  {$EXTERNALSYM TTCP_CLIENT_SND_WND}
  TTCP_CLIENT_SND_WND	= 4096 platform;	//* dflt send window for T/TCP client */
  {$EXTERNALSYM TCP_MAX_WINSHIFT}
  TCP_MAX_WINSHIFT =	14 platform;	//* maximum window shift */
  {$EXTERNALSYM TCP_MAXBURST}
  TCP_MAXBURST	 =	4 platform;	//* maximum segments in a burst */
  {$EXTERNALSYM TCP_MAXHLEN}
  TCP_MAXHLEN    = ($f shl 2) platform;	//* max length of header in bytes */
  {$ENDIF}

  {$IFDEF LINUX}
  //specific to Linux
  {$EXTERNALSYM TCP_MAXSEG}
  TCP_MAXSEG             = 2;       //* Limit MSS */
  {$EXTERNALSYM TCP_CORK}
  TCP_CORK               = 3 platform;   //* Never send partially complete segments */
  {$EXTERNALSYM TCP_KEEPIDLE}
  TCP_KEEPIDLE           = 4 platform    //* Start keeplives after this period */
  {$EXTERNALSYM TCP_KEEPINTVL}
  TCP_KEEPINTVL          = 5 platform;   //* Interval between keepalives */
  {$EXTERNALSYM TCP_KEEPCNT}
  TCP_KEEPCNT            = 6 platform;   //* Number of keepalives before death */
  {$EXTERNALSYM TCP_SYNCNT}
  TCP_SYNCNT             = 7 platform;   //* Number of SYN retransmits */
  {$EXTERNALSYM TCP_LINGER2}
  TCP_LINGER2             = 8 platform;   //* Life time of orphaned FIN-WAIT-2 state */
  {$EXTERNALSYM TCP_DEFER_ACCEPT}
  TCP_DEFER_ACCEPT       = 9 platform;      //* Wake up listener only when data arrive */
  {$EXTERNALSYM TCP_WINDOW_CLAMP}
  TCP_WINDOW_CLAMP       = 10 platform;     //* Bound advertised window */
  {$EXTERNALSYM TCP_WINDOW_CLAMP}
  TCP_INFO               = 11 platform;      //* Information about this connection. */
  {$EXTERNALSYM TCP_QUICKACK}
  TCP_QUICKACK           = 12 platform;     //* Block/reenable quick acks */
  {$EXTERNALSYM TCP_CONGESTION}
  TCP_CONGESTION         = 13 platform;     //* Congestion control algorithm */
  {$EXTERNALSYM TCP_MD5SIG}
  TCP_MD5SIG             = 14 platform;     //* TCP MD5 Signature (RFC2385) */
  {$EXTERNALSYM TCP_COOKIE_TRANSACTIONS}
  TCP_COOKIE_TRANSACTIONS = 15 platform;     //* TCP Cookie Transactions */
  {$EXTERNALSYM TCP_THIN_LINEAR_TIMEOUTS}
  TCP_THIN_LINEAR_TIMEOUTS = 16 platform;     //* Use linear timeouts for thin streams*/
  {$EXTERNALSYM TCP_THIN_DUPACK}
  TCP_THIN_DUPACK        = 17 platform;      //* Fast retrans. after 1 dupack */

  {$EXTERNALSYM TCPI_OPT_TIMESTAMPS}
  TCPI_OPT_TIMESTAMPS	= 1;
  {$EXTERNALSYM TCPI_OPT_SACK}
  TCPI_OPT_SACK	 = 2;
  {$EXTERNALSYM TCPI_OPT_WSCALE}
  TCPI_OPT_WSCALE	= 4;
  {$EXTERNALSYM TCPI_OPT_ECN}
  TCPI_OPT_ECN	  = 8;
  {$ENDIF}
//udp.h

  {$IFDEF DARWIN}
  {$EXTERNALSYM UDP_NOCKSUM}
  UDP_NOCKSUM            = $01;    //* don't checksum outbound payloads */
  {$ENDIF}

  {$IFDEF DARWIN}
///Developer/SDKs/MacOSX10.6.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/Headers/Gestalt.h
//* Environment Selectors */
//enum {
//  gestaltAddressingModeAttr     = 'addr', /* addressing mode attributes */
  gestaltAddressingModeAttr     = $61646472;
  gestalt32BitAddressing        = 0;    //* using 32-bit addressing mode */
  gestalt32BitSysZone           = 1;    //* 32-bit compatible system zone */
  gestalt32BitCapable           = 2;     //* Machine is 32-bit capable */
//};

//enum {
//  gestaltAFPClient              = 'afps',
  gestaltAFPClient              = $61667073;
  gestaltAFPClientVersionMask   = $0000FFFF; //* low word of SInt32 is the */
                                        //* client version 0x0001 -> 0x0007*/
  gestaltAFPClient3_5           = $0001;
  gestaltAFPClient3_6           = $0002;
  gestaltAFPClient3_6_1         = $0003;
  gestaltAFPClient3_6_2         = $0004;
  gestaltAFPClient3_6_3         = $0005; //* including 3.6.4, 3.6.5*/
  gestaltAFPClient3_7           = $0006; //* including 3.7.1*/
  gestaltAFPClient3_7_2         = $0007; //* including 3.7.3, 3.7.4*/
  gestaltAFPClient3_8           = $0008;
  gestaltAFPClient3_8_1         = $0009; //* including 3.8.2 */
  gestaltAFPClient3_8_3         = $000A;
  gestaltAFPClient3_8_4         = $000B; //* including 3.8.5, 3.8.6 */
  gestaltAFPClientAttributeMask = TIdC_INT($FFFF0000); //* high word of response is a */
                                        //* set of attribute bits*/
  gestaltAFPClientCfgRsrc       = 16;   //* Client uses config resources*/
  gestaltAFPClientSupportsIP    = 29;   //* Client supports AFP over TCP/IP*/
  gestaltAFPClientVMUI          = 30;   //* Client can put up UI from the PBVolMount trap*/
  gestaltAFPClientMultiReq      = 31;    //* Client supports multiple outstanding requests*/
//};


//enum {
//  gestaltAliasMgrAttr           = 'alis', /* Alias Mgr Attributes */
  gestaltAliasMgrAttr           = $616c6973;
  gestaltAliasMgrPresent        = 0;    //* True if the Alias Mgr is present */
  gestaltAliasMgrSupportsRemoteAppletalk = 1; //* True if the Alias Mgr knows about Remote Appletalk */
  gestaltAliasMgrSupportsAOCEKeychain = 2; //* True if the Alias Mgr knows about the AOCE Keychain */
  gestaltAliasMgrResolveAliasFileWithMountOptions = 3; //* True if the Alias Mgr implements gestaltAliasMgrResolveAliasFileWithMountOptions() and IsAliasFile() */
  gestaltAliasMgrFollowsAliasesWhenResolving = 4;
  gestaltAliasMgrSupportsExtendedCalls = 5;
  gestaltAliasMgrSupportsFSCalls = 6;   //* true if Alias Mgr supports HFS+ Calls */
  gestaltAliasMgrPrefersPath    = 7;    //* True if the Alias Mgr prioritizes the path over file id during resolution by default */
  gestaltAliasMgrRequiresAccessors = 8;  //* Set if Alias Manager requires accessors for size and usertype */
//};

//* Gestalt selector and values for the Appearance Manager */
//enum {
//  gestaltAppearanceAttr         = 'appr',
  gestaltAppearanceAttr         =  $61707072;
  gestaltAppearanceExists       = 0;
  gestaltAppearanceCompatMode   = 1;
//};

//* Gestalt selector for determining Appearance Manager version   */
//* If this selector does not exist, but gestaltAppearanceAttr    */
//* does, it indicates that the 1.0 version is installed. This    */
//* gestalt returns a BCD number representing the version of the  */
//* Appearance Manager that is currently running, e.g. 0x0101 for */
//* version 1.0.1.                                                */
//enum {
//  gestaltAppearanceVersion      = 'apvr'
  gestaltAppearanceVersion      =  $61707672;
//};

//enum {
//  gestaltArbitorAttr            = 'arb ',
  gestaltArbitorAttr            = $61726220;
  gestaltSerialArbitrationExists = 0;    //* this bit if the serial port arbitrator exists*/
//};

//enum {
//  gestaltAppleScriptVersion     = 'ascv' /* AppleScript version*/
  gestaltAppleScriptVersion     = $61736376;
//};

//enum {
//  gestaltAppleScriptAttr        = 'ascr', /* AppleScript attributes*/
  gestaltAppleScriptAttr        =  $61736372;
  gestaltAppleScriptPresent     = 0;
  gestaltAppleScriptPowerPCSupport = 1;
//};

//enum {
//  gestaltATAAttr                = 'ata ', /* ATA is the driver to support IDE hard disks */
  gestaltATAAttr                = $61746120;
  gestaltATAPresent             = 0;     //* if set, ATA Manager is present */
//};

//enum {
//  gestaltATalkVersion           = 'atkv' /* Detailed AppleTalk version; see comment above for format */
  gestaltATalkVersion           = $61746b76;
//};

//enum {
//  gestaltAppleTalkVersion       = 'atlk' /* appletalk version */
  gestaltAppleTalkVersion       = $61746c6b;
//};

{*
    FORMAT OF gestaltATalkVersion RESPONSE
    --------------------------------------
    The version is stored in the high three bytes of the response value.  Let us number
    the bytes in the response value from 0 to 3, where 0 is the least-significant byte.

        Byte#:     3 2 1 0
        Value:  0xMMNNRR00

    Byte 3 (MM) contains the major revision number, byte 2 (NN) contains the minor
    revision number, and byte 1 (RR) contains a constant that represents the release
    stage.  Byte 0 always contains 0x00.  The constants for the release stages are:

        development = 0x20
        alpha       = 0x40
        beta        = 0x60
        final       = 0x80
        release     = 0x80

    For example, if you call Gestalt with the 'atkv' selector when AppleTalk version 57
    is loaded, you receive the integer response value 0x39008000.
*}
//enum {
//  gestaltAUXVersion             = 'a/ux' /* a/ux version, if present */
  gestaltAUXVersion             = $612f7578;
//};

//enum {
//  gestaltMacOSCompatibilityBoxAttr = 'bbox',  //* Classic presence and features */
  gestaltMacOSCompatibilityBoxAttr = $62626f78;
  gestaltMacOSCompatibilityBoxPresent = 0; //* True if running under the Classic */
  gestaltMacOSCompatibilityBoxHasSerial = 1; //* True if Classic serial support is implemented. */
  gestaltMacOSCompatibilityBoxless = 2; //* True if we're Boxless (screen shared with Carbon/Cocoa) */
//};

//enum {
//  gestaltBusClkSpeed            = 'bclk' /* main I/O bus clock speed in hertz */
  gestaltBusClkSpeed            =  $62636c6b;
//};

//enum {
//  gestaltBusClkSpeedMHz         = 'bclm' /* main I/O bus clock speed in megahertz ( a UInt32 ) */
  gestaltBusClkSpeedMHz         = $62636c6d;
//};

//enum {
//  gestaltCloseViewAttr          = 'BSDa', /* CloseView attributes */
  gestaltCloseViewAttr          =  $42534461;
  gestaltCloseViewEnabled       = 0;    //* Closeview enabled (dynamic bit - returns current state) */
  gestaltCloseViewDisplayMgrFriendly = 1; //* Closeview compatible with Display Manager (FUTURE) */
//};

//enum {
//  gestaltCarbonVersion          = 'cbon' /* version of Carbon API present in system */
  gestaltCarbonVersion          = $63626f6e;
//};

//enum {
//  gestaltCFMAttr                = 'cfrg', /* Selector for information about the Code Fragment Manager */
  gestaltCFMAttr                =  $63667267;
   gestaltCFMPresent             = 0;    //* True if the Code Fragment Manager is present */
  gestaltCFMPresentMask         = $0001;
  gestaltCFM99Present           = 2;    //* True if the CFM-99 features are present. */
  gestaltCFM99PresentMask       = $0004;
//};

//enum {
//  gestaltProcessorCacheLineSize = 'csiz' /* The size, in bytes, of the processor cache line. */
  gestaltProcessorCacheLineSize = $6373697a;
//};

//enum {
//  gestaltCollectionMgrVersion   = 'cltn' /* Collection Manager version */
  gestaltCollectionMgrVersion   = $636c746e; 
//};

//enum {
//  gestaltColorMatchingAttr      = 'cmta', /* ColorSync attributes */
  gestaltColorMatchingAttr      = $636d7461;
  gestaltHighLevelMatching      = 0;
  gestaltColorMatchingLibLoaded = 1;
//};

//enum {
//  gestaltColorMatchingVersion   = 'cmtc',
  gestaltColorMatchingVersion   = $636d7463;
  gestaltColorSync10            = $0100; //* 0x0100 & 0x0110 _Gestalt versions for 1.0-1.0.3 product */
  gestaltColorSync11            = $0110; //*   0x0100 == low-level matching only */
  gestaltColorSync104           = $0104; //* Real version, by popular demand */
  gestaltColorSync105           = $0105;
  gestaltColorSync20            = $0200; //* ColorSync 2.0 */
  gestaltColorSync21            = $0210;
  gestaltColorSync211           = $0211;
  gestaltColorSync212           = $0212;
  gestaltColorSync213           = $0213;
  gestaltColorSync25            = $0250;
  gestaltColorSync26            = $0260;
  gestaltColorSync261           = $0261;
  gestaltColorSync30            = $0300;
//};

//enum {
//  gestaltControlMgrVersion      = 'cmvr' /* NOTE: The first version we return is 3.0.1, on Mac OS X plus update 2*/
  gestaltControlMgrVersion      = $636d7672;
//};

//enum {
//  gestaltControlMgrAttr         = 'cntl', /* Control Mgr*/
  gestaltControlMgrAttr         = $636e746c;
  gestaltControlMgrPresent      = (1 shl 0); //* NOTE: this is a bit mask, whereas all other Gestalt constants of*/
                                        //* this type are bit index values.   Universal Interfaces 3.2 slipped*/
                                        //* out the door with this mistake.*/
  gestaltControlMgrPresentBit   = 0;    //* bit number*/
  gestaltControlMsgPresentMask  = (1 shl gestaltControlMgrPresentBit);
//};

//enum {
//  gestaltConnMgrAttr            = 'conn', /* connection mgr attributes    */
  gestaltConnMgrAttr            = $636f6e6e;
  gestaltConnMgrPresent         = 0;
  gestaltConnMgrCMSearchFix     = 1;    //* Fix to CMAddSearch?     */
  gestaltConnMgrErrorString     = 2;    //* has CMGetErrorString() */
  gestaltConnMgrMultiAsyncIO    = 3;    //* CMNewIOPB, CMDisposeIOPB, CMPBRead, CMPBWrite, CMPBIOKill */
//};

//enum {
//  gestaltColorPickerVersion     = 'cpkr', /* returns version of ColorPicker */
  gestaltColorPickerVersion     = $63706b72;
//  gestaltColorPicker            = 'cpkr' /* gestaltColorPicker is old name for gestaltColorPickerVersion */
  gestaltColorPicker            = $63706b72;
//};

//enum {
//  gestaltComponentMgr           = 'cpnt', /* Component Mgr version */
  gestaltComponentMgr           = $63706e74;
//  gestaltComponentPlatform      = 'copl' /* Component Platform number */
  gestaltComponentPlatform      =  $636f706c;
//};

{*
    The gestaltNativeCPUtype ('cput') selector can be used to determine the
    native CPU type for all Macs running System 7.5 or later.

    However, the use of these selectors for pretty much anything is discouraged.
    If you are trying to determine if you can use a particular processor or
    operating system feature, it would be much better to check directly for that
    feature using one of the apis for doing so -- like, sysctl() or sysctlbyname().
    Those apis return information directly from the operating system and kernel.  By
    using those apis you may be able to avoid linking against Frameworks which you
    otherwise don't need, and may lessen the memory and code footprint of your
    applications.
    
    The gestaltNativeCPUfamily ('cpuf') selector can be used to determine the
    general family the native CPU is in.

    gestaltNativeCPUfamily uses the same results as gestaltNativeCPUtype, but
    will only return certain CPU values.
    
    IMPORTANT NOTE: gestaltNativeCPUFamily may no longer be updated for any new
                    processor families introduced after the 970.  If there are
                    processor specific features you need to be checking for in
                    your code, use one of the appropriate apis to get for those
                    exact features instead of assuming that all members of a given
                    cpu family exhibit the same behaviour.  The most appropriate api
                    to look at is sysctl() and sysctlbyname(), which return information
                    direct from the kernel about the system.
*}
//enum {
//  gestaltNativeCPUtype          = 'cput', /* Native CPU type                          */
  gestaltNativeCPUtype          = $63707574; 
//  gestaltNativeCPUfamily        = 'cpuf', /* Native CPU family                      */
  gestaltNativeCPUfamily        = $63707566;
  gestaltCPU68000               = 0;    //* Various 68k CPUs...    */
  gestaltCPU68010               = 1;
  gestaltCPU68020               = 2;
  gestaltCPU68030               = 3;
  gestaltCPU68040               = 4;
  gestaltCPU601                 = $0101; //* IBM 601                               */
  gestaltCPU603                 = $0103;
  gestaltCPU604                 = $0104;
  gestaltCPU603e                = $0106;
  gestaltCPU603ev               = $0107;
  gestaltCPU750                 = $0108; //* Also 740 - "G3" */
  gestaltCPU604e                = $0109;
  gestaltCPU604ev               = $010A; //* Mach 5, 250Mhz and up */
  gestaltCPUG4                  = $010C; //* Max */
  gestaltCPUG47450              = $0110; //* Vger , Altivec */
//};

//enum {
  gestaltCPUApollo              = $0111; //* Apollo , Altivec, G4 7455 */
  gestaltCPUG47447              = $0112;
  gestaltCPU750FX               = $0120; //* Sahara,G3 like thing */
  gestaltCPU970                 = $0139; //* G5 */
  gestaltCPU970FX               = $013C; //* another G5 */
  gestaltCPU970MP               = $0144;
//};

//enum {
                                        //* x86 CPUs all start with 'i' in the high nybble */
//  gestaltCPU486                 = 'i486',
  gestaltCPU486                 = $69343836;
//  gestaltCPUPentium             = 'i586',
  gestaltCPUPentium             = $69353836;
//  gestaltCPUPentiumPro          = 'i5pr',
  gestaltCPUPentiumPro          =  $69357072;
//  gestaltCPUPentiumII           = 'i5ii',
  gestaltCPUPentiumII           = $69356969;
//  gestaltCPUX86                 = 'ixxx',
  gestaltCPUX86                 = $69787878;
//  gestaltCPUPentium4            = 'i5iv'
  gestaltCPUPentium4            = $69356976;
//};

//enum {
//  gestaltCRMAttr                = 'crm ', /* comm resource mgr attributes */
  gestaltCRMAttr                =  $63726d20;
  gestaltCRMPresent             = 0;
  gestaltCRMPersistentFix       = 1;    //* fix for persistent tools */
  gestaltCRMToolRsrcCalls       = 2;    //* has CRMGetToolResource/ReleaseToolResource */
//};

//enum {
//  gestaltControlStripVersion    = 'csvr' /* Control Strip version (was 'sdvr') */
  gestaltControlStripVersion    = $63737672;
//};

//enum {
//  gestaltCountOfCPUs            = 'cpus' /* the number of CPUs on the computer, Mac OS X 10.4 and later */
  gestaltCountOfCPUs            = $63707573;
//};

//enum {
//  gestaltCTBVersion             = 'ctbv' /* CommToolbox version */
  gestaltCTBVersion             = $63746276;
//};

//enum {
//  gestaltDBAccessMgrAttr        = 'dbac', /* Database Access Mgr attributes */
  gestaltDBAccessMgrAttr        = $64626163;
  gestaltDBAccessMgrPresent     = 0;     //* True if Database Access Mgr present */
//};

//enum {
//  gestaltDiskCacheSize          = 'dcsz' /* Size of disk cache's buffers, in bytes */
  gestaltDiskCacheSize          = $6463737a;
//};

//enum {
//  gestaltSDPFindVersion         = 'dfnd' /* OCE Standard Directory Panel*/
  gestaltSDPFindVersion         =  $64666e64;
//};

//enum {
//  gestaltDictionaryMgrAttr      = 'dict', /* Dictionary Manager attributes */
  gestaltDictionaryMgrAttr      = $64696374;
  gestaltDictionaryMgrPresent   = 0;     //* Dictionary Manager attributes */
//};

//enum {
//  gestaltDITLExtAttr            = 'ditl', /* AppenDITL, etc. calls from CTB */
  gestaltDITLExtAttr            = $6469746c;
  gestaltDITLExtPresent         = 0;    //* True if calls are present */
  gestaltDITLExtSupportsIctb    = 1;     //* True if AppendDITL, ShortenDITL support 'ictb's */
//};

//enum {
//  gestaltDialogMgrAttr          = 'dlog', /* Dialog Mgr*/
  gestaltDialogMgrAttr          = $646c6f67;
  gestaltDialogMgrPresent       = (1 shl 0); //* NOTE: this is a bit mask, whereas all other Gestalt constants of*/
                                        //* this type are bit index values.   Universal Interfaces 3.2 slipped*/
                                        //* out the door with this mistake.*/
  gestaltDialogMgrPresentBit    = 0;    //* bit number*/
  gestaltDialogMgrHasAquaAlertBit = 2;  //* bit number*/
  gestaltDialogMgrPresentMask   = (1 shl gestaltDialogMgrPresentBit);
  gestaltDialogMgrHasAquaAlertMask = (1 shl gestaltDialogMgrHasAquaAlertBit);
  gestaltDialogMsgPresentMask   = gestaltDialogMgrPresentMask; //* compatibility mask*/
//};

//enum {
//  gestaltDesktopPicturesAttr    = 'dkpx', /* Desktop Pictures attributes */
  gestaltDesktopPicturesAttr    = $646b7078;
  gestaltDesktopPicturesInstalled = 0;  //* True if control panel is installed */
  gestaltDesktopPicturesDisplayed = 1;  //* True if a picture is currently displayed */
//};

//enum {
//  gestaltDisplayMgrVers         = 'dplv' /* Display Manager version */
  gestaltDisplayMgrVers         = $64706c76;
//};

//enum {
//  gestaltDisplayMgrAttr         = 'dply', /* Display Manager attributes */
  gestaltDisplayMgrAttr         = $64706c79;
  gestaltDisplayMgrPresent      = 0;    //* True if Display Mgr is present */
  gestaltDisplayMgrCanSwitchMirrored = 2; //* True if Display Mgr can switch modes on mirrored displays */
  gestaltDisplayMgrSetDepthNotifies = 3; //* True SetDepth generates displays mgr notification */
  gestaltDisplayMgrCanConfirm   = 4;    //* True Display Manager supports DMConfirmConfiguration */
  gestaltDisplayMgrColorSyncAware = 5;  //* True if Display Manager supports profiles for displays */
  gestaltDisplayMgrGeneratesProfiles = 6; //* True if Display Manager will automatically generate profiles for displays */
  gestaltDisplayMgrSleepNotifies = 7;    //* True if Display Mgr generates "displayWillSleep", "displayDidWake" notifications */
//};

//enum {
//  gestaltDragMgrAttr            = 'drag', /* Drag Manager attributes */
  gestaltDragMgrAttr            = $64726167;
  gestaltDragMgrPresent         = 0;    //* Drag Manager is present */
  gestaltDragMgrFloatingWind    = 1;    //* Drag Manager supports floating windows */
  gestaltPPCDragLibPresent      = 2;    //* Drag Manager PPC DragLib is present */
  gestaltDragMgrHasImageSupport = 3;    //* Drag Manager allows SetDragImage call */
  gestaltCanStartDragInFloatWindow = 4; //* Drag Manager supports starting a drag in a floating window */
  gestaltSetDragImageUpdates    = 5;     //* Drag Manager supports drag image updating via SetDragImage */
//};

//enum {
//  gestaltDrawSprocketVersion    = 'dspv' /* Draw Sprocket version (as a NumVersion) */
  gestaltDrawSprocketVersion    =  $64737076;
//};

//enum {
//  gestaltDigitalSignatureVersion = 'dsig' /* returns Digital Signature Toolbox version in low-order word*/
  gestaltDigitalSignatureVersion = $64736967;
//};

{*
   Desktop Printing Feature Gestalt
   Use this gestalt to check if third-party printer driver support is available
*}
//enum {
//  gestaltDTPFeatures            = 'dtpf',
  gestaltDTPFeatures            = $64747066;
  kDTPThirdPartySupported       = $00000004; //* mask for checking if third-party drivers are supported*/
//};


{*
   Desktop Printer Info Gestalt
   Use this gestalt to get a hold of information for all of the active desktop printers
*}
//enum {
//  gestaltDTPInfo                = 'dtpx' /* returns GestaltDTPInfoHdle*/
  gestaltDTPInfo                =  $64747078;
//};

//enum {
//  gestaltEasyAccessAttr         = 'easy', /* Easy Access attributes */
  gestaltEasyAccessAttr         = $65617379;
  gestaltEasyAccessOff          = 0;    //* if Easy Access present, but off (no icon) */
  gestaltEasyAccessOn           = 1;    //* if Easy Access "On" */
  gestaltEasyAccessSticky       = 2;    //* if Easy Access "Sticky" */
  gestaltEasyAccessLocked       = 3;    //* if Easy Access "Locked" */
//};

//enum {
//  gestaltEditionMgrAttr         = 'edtn', /* Edition Mgr attributes */
  gestaltEditionMgrAttr         = $6564746e;
  gestaltEditionMgrPresent      = 0;    //* True if Edition Mgr present */
  gestaltEditionMgrTranslationAware = 1; //* True if edition manager is translation manager aware */
//};

//enum {
//  gestaltAppleEventsAttr        = 'evnt', /* Apple Events attributes */
   gestaltAppleEventsAttr        = $65766e74;
  gestaltAppleEventsPresent     = 0;    //* True if Apple Events present */
  gestaltScriptingSupport       = 1;
  gestaltOSLInSystem            = 2;    //* OSL is in system so don’t use the one linked in to app */
  gestaltSupportsApplicationURL = 4;     //* Supports the typeApplicationURL addressing mode */
//};

//enum {
//  gestaltExtensionTableVersion  = 'etbl' /* ExtensionTable version */
  gestaltExtensionTableVersion  = $6574626c;
//};


//enum {
//  gestaltFBCIndexingState       = 'fbci', /* Find By Content indexing state*/
  gestaltFBCIndexingState       = $66626369;
  gestaltFBCindexingSafe        = 0;    //* any search will result in synchronous wait*/
  gestaltFBCindexingCritical    = 1;     //* any search will execute immediately*/
//};

//enum {
//  gestaltFBCVersion             = 'fbcv', /* Find By Content version*/
  gestaltFBCVersion             = $66626376;
  gestaltFBCCurrentVersion      = $0011; //* First release for OS 8/9*/
  gestaltOSXFBCCurrentVersion   = $0100; //* First release for OS X*/
//};


//enum {
//  gestaltFileMappingAttr        = 'flmp', /* File mapping attributes*/
  gestaltFileMappingAttr        = $666c6d70;
  gestaltFileMappingPresent     = 0;    //* bit is set if file mapping APIs are present*/
  gestaltFileMappingMultipleFilesFix = 1; //* bit is set if multiple files per volume can be mapped*/
//};

//enum {
//  gestaltFloppyAttr             = 'flpy', /* Floppy disk drive/driver attributes */
  gestaltFloppyAttr             = $666c7079;
  gestaltFloppyIsMFMOnly        = 0;    //* Floppy driver only supports MFM disk formats */
  gestaltFloppyIsManualEject    = 1;    //* Floppy drive, driver, and file system are in manual-eject mode */
  gestaltFloppyUsesDiskInPlace  = 2;     //* Floppy drive must have special DISK-IN-PLACE output; standard DISK-CHANGED not used */
//};

//enum {
//  gestaltFinderAttr             = 'fndr', //* Finder attributes */
  gestaltFinderAttr             = $666e6472;
  gestaltFinderDropEvent        = 0;    //* Finder recognizes drop event */
  gestaltFinderMagicPlacement   = 1;    //* Finder supports magic icon placement */
  gestaltFinderCallsAEProcess   = 2;    //* Finder calls AEProcessAppleEvent */
  gestaltOSLCompliantFinder     = 3;    //* Finder is scriptable and recordable */
  gestaltFinderSupports4GBVolumes = 4;  //* Finder correctly handles 4GB volumes */
  gestaltFinderHasClippings     = 6;    //* Finder supports Drag Manager clipping files */
  gestaltFinderFullDragManagerSupport = 7; //* Finder accepts 'hfs ' flavors properly */
  gestaltFinderFloppyRootComments = 8;  //* in MacOS 8 and later, will be set if Finder ever supports comments on Floppy icons */
  gestaltFinderLargeAndNotSavedFlavorsOK = 9; //* in MacOS 8 and later, this bit is set if drags with >1024-byte flavors and flavorNotSaved flavors work reliably */
  gestaltFinderUsesExtensibleFolderManager = 10; //* Finder uses Extensible Folder Manager (for example, for Magic Routing) */
  gestaltFinderUnderstandsRedirectedDesktopFolder = 11; //* Finder deals with startup disk's desktop folder residing on another disk */
//};

//enum {
//  gestaltFindFolderAttr         = 'fold', /* Folder Mgr attributes */
  gestaltFindFolderAttr         = $666f6c64;
  gestaltFindFolderPresent      = 0;    //* True if Folder Mgr present */
  gestaltFolderDescSupport      = 1;    //* True if Folder Mgr has FolderDesc calls */
  gestaltFolderMgrFollowsAliasesWhenResolving = 2; //* True if Folder Mgr follows folder aliases */
  gestaltFolderMgrSupportsExtendedCalls = 3; //* True if Folder Mgr supports the Extended calls */
  gestaltFolderMgrSupportsDomains = 4;  //* True if Folder Mgr supports domains for the first parameter to FindFolder */
  gestaltFolderMgrSupportsFSCalls = 5;   //* True if FOlder manager supports __FindFolderFSRef & __FindFolderExtendedFSRef */
//};

//enum {
//  gestaltFindFolderRedirectionAttr = 'fole'
  gestaltFindFolderRedirectionAttr = $666f6c65;
//};


//enum {
//  gestaltFontMgrAttr            = 'font', /* Font Mgr attributes */
  gestaltFontMgrAttr            = $666f6e74;
  gestaltOutlineFonts           = 0;     //* True if Outline Fonts supported */
//};

//enum {
//  gestaltFPUType                = 'fpu ', /* fpu type */
  gestaltFPUType                = $66707520;
  gestaltNoFPU                  = 0;    //* no FPU */
  gestalt68881                  = 1;    //* 68881 FPU */
  gestalt68882                  = 2;    //* 68882 FPU */
  gestalt68040FPU               = 3;    //* 68040 built-in FPU */
//};

//enum {
//  gestaltFSAttr                 = 'fs  ', /* file system attributes */
  gestaltFSAttr                 = $66732020;
  gestaltFullExtFSDispatching   = 0;    //* has really cool new HFSDispatch dispatcher */
  gestaltHasFSSpecCalls         = 1;    //* has FSSpec calls */
  gestaltHasFileSystemManager   = 2;    //* has a file system manager */
  gestaltFSMDoesDynamicLoad     = 3;    //* file system manager supports dynamic loading */
  gestaltFSSupports4GBVols      = 4;    //* file system supports 4 gigabyte volumes */
  gestaltFSSupports2TBVols      = 5;    //* file system supports 2 terabyte volumes */
  gestaltHasExtendedDiskInit    = 6;    //* has extended Disk Initialization calls */
  gestaltDTMgrSupportsFSM       = 7;    //* Desktop Manager support FSM-based foreign file systems */
  gestaltFSNoMFSVols            = 8;    //* file system doesn't supports MFS volumes */
  gestaltFSSupportsHFSPlusVols  = 9;    //* file system supports HFS Plus volumes */
  gestaltFSIncompatibleDFA82    = 10;    //* VCB and FCB structures changed; DFA 8.2 is incompatible */
//};

//enum {
  gestaltFSSupportsDirectIO     = 11;    //* file system supports DirectIO */
//};

//enum {
  gestaltHasHFSPlusAPIs         = 12;   //* file system supports HFS Plus APIs */
  gestaltMustUseFCBAccessors    = 13;   //* FCBSPtr and FSFCBLen are invalid - must use FSM FCB accessor functions*/
  gestaltFSUsesPOSIXPathsForConversion = 14; //* The path interchange routines operate on POSIX paths instead of HFS paths */
  gestaltFSSupportsExclusiveLocks = 15; //* File system uses POSIX O_EXLOCK for opens */
  gestaltFSSupportsHardLinkDetection = 16; //* File system returns if an item is a hard link */
  gestaltFSAllowsConcurrentAsyncIO = 17; //* File Manager supports concurrent async reads and writes */
//};

//enum {
//  gestaltAdminFeaturesFlagsAttr = 'fred', /* a set of admin flags, mostly useful internally. */
  gestaltAdminFeaturesFlagsAttr = $66726564;
  gestaltFinderUsesSpecialOpenFoldersFile = 0; //* the Finder uses a special file to store the list of open folders */
//};

//enum {
//  gestaltFSMVersion             = 'fsm ' /* returns version of HFS External File Systems Manager (FSM) */
  gestaltFSMVersion             = $66736d20;
//};

//enum {
//  gestaltFXfrMgrAttr            = 'fxfr', /* file transfer manager attributes */
  gestaltFXfrMgrAttr            = $66786672;
  gestaltFXfrMgrPresent         = 0;
  gestaltFXfrMgrMultiFile       = 1;    //* supports FTSend and FTReceive */
  gestaltFXfrMgrErrorString     = 2;    //* supports FTGetErrorString */
  gestaltFXfrMgrAsync           = 3;    //*supports FTSendAsync, FTReceiveAsync, FTCompletionAsync*/
//};

//enum {
//  gestaltGraphicsAttr           = 'gfxa', /* Quickdraw GX attributes selector */
  gestaltGraphicsAttr           = $67667861;
  gestaltGraphicsIsDebugging    = $00000001;
  gestaltGraphicsIsLoaded       = $00000002;
  gestaltGraphicsIsPowerPC      = $00000004;
//};

//enum {
//  gestaltGraphicsVersion        = 'grfx', /* Quickdraw GX version selector */
  gestaltGraphicsVersion        = $67726678;
  gestaltCurrentGraphicsVersion = $00010200; //* the version described in this set of headers */
//};

//enum {
//  gestaltHardwareAttr           = 'hdwr', /* hardware attributes */
  gestaltHardwareAttr           = $68647772;
  gestaltHasVIA1                = 0;    //* VIA1 exists */
  gestaltHasVIA2                = 1;    //* VIA2 exists */
  gestaltHasASC                 = 3;    //* Apple Sound Chip exists */
  gestaltHasSCC                 = 4;    //* SCC exists */
  gestaltHasSCSI                = 7;    //* SCSI exists */
  gestaltHasSoftPowerOff        = 19;   //* Capable of software power off */
  gestaltHasSCSI961             = 21;   //* 53C96 SCSI controller on internal bus */
  gestaltHasSCSI962             = 22;   //* 53C96 SCSI controller on external bus */
  gestaltHasUniversalROM        = 24;   //* Do we have a Universal ROM? */
  gestaltHasEnhancedLtalk       = 30;   //* Do we have Enhanced LocalTalk? */
//};

//enum {
//  gestaltHelpMgrAttr            = 'help', /* Help Mgr Attributes */
  gestaltHelpMgrAttr            = $68656c70;
  gestaltHelpMgrPresent         = 0;    //* true if help mgr is present */
  gestaltHelpMgrExtensions      = 1;    //* true if help mgr extensions are installed */
  gestaltAppleGuideIsDebug      = 30;
  gestaltAppleGuidePresent      = 31;   //* true if AppleGuide is installed */
//};

//enum {
//  gestaltHardwareVendorCode     = 'hrad', /* Returns hardware vendor information */
  gestaltHardwareVendorCode     = $68726164;
//  gestaltHardwareVendorApple    = 'Appl' /* Hardware built by Apple */
  gestaltHardwareVendorApple    = $4170706c;
//};

//enum {
//  gestaltCompressionMgr         = 'icmp' /* returns version of the Image Compression Manager */
  gestaltCompressionMgr         =  $69636d70;
//};

//enum {
//  gestaltIconUtilitiesAttr      = 'icon', /* Icon Utilities attributes  (Note: available in System 7.0, despite gestalt) */
  gestaltIconUtilitiesAttr      =  $69636f6e;
   gestaltIconUtilitiesPresent   = 0;    //* true if icon utilities are present */
  gestaltIconUtilitiesHas48PixelIcons = 1; //* true if 48x48 icons are supported by IconUtilities */
  gestaltIconUtilitiesHas32BitIcons = 2; //* true if 32-bit deep icons are supported */
  gestaltIconUtilitiesHas8BitDeepMasks = 3; //* true if 8-bit deep masks are supported */
  gestaltIconUtilitiesHasIconServices = 4; //* true if IconServices is present */
//};

//enum {
//  gestaltInternalDisplay        = 'idsp' //* slot number of internal display location */
  gestaltInternalDisplay        =  $69647370;
//};

{*
    To obtain information about the connected keyboard(s), one should
    use the ADB Manager API.  See Technical Note OV16 for details.
*}
//enum {
//  gestaltKeyboardType           = 'kbd ', /* keyboard type */
  gestaltKeyboardType           = $6b626420;
  gestaltMacKbd                 = 1;
  gestaltMacAndPad              = 2;
  gestaltMacPlusKbd             = 3;    //* OBSOLETE: This pre-ADB keyboard is not supported by any Mac OS X hardware and this value now means gestaltUnknownThirdPartyKbd */
  gestaltUnknownThirdPartyKbd   = 3;    //* Unknown 3rd party keyboard. */
  gestaltExtADBKbd              = 4;
  gestaltStdADBKbd              = 5;
  gestaltPrtblADBKbd            = 6;
  gestaltPrtblISOKbd            = 7;
  gestaltStdISOADBKbd           = 8;
  gestaltExtISOADBKbd           = 9;
  gestaltADBKbdII               = 10;
  gestaltADBISOKbdII            = 11;
  gestaltPwrBookADBKbd          = 12;
  gestaltPwrBookISOADBKbd       = 13;
  gestaltAppleAdjustKeypad      = 14;
  gestaltAppleAdjustADBKbd      = 15;
  gestaltAppleAdjustISOKbd      = 16;
  gestaltJapanAdjustADBKbd      = 17;   //* Japan Adjustable Keyboard */
  gestaltPwrBkExtISOKbd         = 20;   //* PowerBook Extended International Keyboard with function keys */
  gestaltPwrBkExtJISKbd         = 21;   //* PowerBook Extended Japanese Keyboard with function keys      */
  gestaltPwrBkExtADBKbd         = 24;   //* PowerBook Extended Domestic Keyboard with function keys      */
  gestaltPS2Keyboard            = 27;   //* PS2 keyboard */
  gestaltPwrBkSubDomKbd         = 28;   //* PowerBook Subnote Domestic Keyboard with function keys w/  inverted T  */
  gestaltPwrBkSubISOKbd         = 29;   //* PowerBook Subnote International Keyboard with function keys w/  inverted T     */
  gestaltPwrBkSubJISKbd         = 30;   //* PowerBook Subnote Japanese Keyboard with function keys w/ inverted T    */
  gestaltPortableUSBANSIKbd     = 37;   //* Powerbook USB-based internal keyboard, ANSI layout */
  gestaltPortableUSBISOKbd      = 38;   //* Powerbook USB-based internal keyboard, ISO layout */
  gestaltPortableUSBJISKbd      = 39;   //* Powerbook USB-based internal keyboard, JIS layout */
  gestaltThirdPartyANSIKbd      = 40;   //* Third party keyboard, ANSI layout.  Returned in Mac OS X Tiger and later. */
  gestaltThirdPartyISOKbd       = 41;   //* Third party keyboard, ISO layout. Returned in Mac OS X Tiger and later. */
  gestaltThirdPartyJISKbd       = 42;   //* Third party keyboard, JIS layout. Returned in Mac OS X Tiger and later. */
  gestaltPwrBkEKDomKbd          = 195;  //* (0xC3) PowerBook Domestic Keyboard with Embedded Keypad, function keys & inverted T    */
  gestaltPwrBkEKISOKbd          = 196;  //* (0xC4) PowerBook International Keyboard with Embedded Keypad, function keys & inverted T   */
  gestaltPwrBkEKJISKbd          = 197;  //* (0xC5) PowerBook Japanese Keyboard with Embedded Keypad, function keys & inverted T      */
  gestaltUSBCosmoANSIKbd        = 198;  //* (0xC6) original USB Domestic (ANSI) Keyboard */
  gestaltUSBCosmoISOKbd         = 199;  //* (0xC7) original USB International (ISO) Keyboard */
  gestaltUSBCosmoJISKbd         = 200;  //* (0xC8) original USB Japanese (JIS) Keyboard */
  gestaltPwrBk99JISKbd          = 201;  //* (0xC9) '99 PowerBook JIS Keyboard with Embedded Keypad, function keys & inverted T               */
  gestaltUSBAndyANSIKbd         = 204;  //* (0xCC) USB Pro Keyboard Domestic (ANSI) Keyboard                                 */
  gestaltUSBAndyISOKbd          = 205;  //* (0xCD) USB Pro Keyboard International (ISO) Keyboard                               */
  gestaltUSBAndyJISKbd          = 206;  //* (0xCE) USB Pro Keyboard Japanese (JIS) Keyboard                                    */
//};


//enum {
  gestaltPortable2001ANSIKbd    = 202;  //* (0xCA) PowerBook and iBook Domestic (ANSI) Keyboard with 2nd cmd key right & function key moves.     */
  gestaltPortable2001ISOKbd     = 203;  //* (0xCB) PowerBook and iBook International (ISO) Keyboard with 2nd cmd key right & function key moves.   */
  gestaltPortable2001JISKbd     = 207;   //* (0xCF) PowerBook and iBook Japanese (JIS) Keyboard with function key moves.                   */
//};

//enum {
  gestaltUSBProF16ANSIKbd       = 34;   //* (0x22) USB Pro Keyboard w/ F16 key Domestic (ANSI) Keyboard */
  gestaltUSBProF16ISOKbd        = 35;   //* (0x23) USB Pro Keyboard w/ F16 key International (ISO) Keyboard */
  gestaltUSBProF16JISKbd        = 36;   //* (0x24) USB Pro Keyboard w/ F16 key Japanese (JIS) Keyboard */
  gestaltProF16ANSIKbd          = 31;   //* (0x1F) Pro Keyboard w/F16 key Domestic (ANSI) Keyboard */
  gestaltProF16ISOKbd           = 32;   //* (0x20) Pro Keyboard w/F16 key International (ISO) Keyboard */
  gestaltProF16JISKbd           = 33;   //* (0x21) Pro Keyboard w/F16 key Japanese (JIS) Keyboard */
//};

{*
    This gestalt indicates the highest UDF version that the active UDF implementation supports.
    The value should be assembled from a read version (upper word) and a write version (lower word)
*}
//enum {
//  gestaltUDFSupport             = 'kudf' /*    Used for communication between UDF implementations*/
  gestaltUDFSupport             =  $6b756466;
//};

//enum {
//  gestaltLowMemorySize          = 'lmem' /* size of low memory area */
  gestaltLowMemorySize          =  $6c6d656d;
//};

//enum {
//  gestaltLogicalRAMSize         = 'lram' /* logical ram size */
  gestaltLogicalRAMSize         = $6c72616d;
//};

{
    MACHINE TYPE CONSTANTS NAMING CONVENTION

        All future machine type constant names take the following form:

            gestalt<lineName><modelNumber>

    Line Names

        The following table contains the lines currently produced by Apple and the
        lineName substrings associated with them:

            Line                        lineName
            -------------------------   ------------
            Macintosh LC                "MacLC"
            Macintosh Performa          "Performa"
            Macintosh PowerBook         "PowerBook"
            Macintosh PowerBook Duo     "PowerBookDuo"
            Power Macintosh             "PowerMac"
            Apple Workgroup Server      "AWS"

        The following table contains lineNames for some discontinued lines:

            Line                        lineName
            -------------------------   ------------
            Macintosh Quadra            "MacQuadra" (preferred)
                                        "Quadra" (also used, but not preferred)
            Macintosh Centris           "MacCentris"

    Model Numbers

        The modelNumber is a string representing the specific model of the machine
        within its particular line.  For example, for the Power Macintosh 8100/80,
        the modelNumber is "8100".

        Some Performa & LC model numbers contain variations in the rightmost 1 or 2
        digits to indicate different RAM and Hard Disk configurations.  A single
        machine type is assigned for all variations of a specific model number.  In
        this case, the modelNumber string consists of the constant leftmost part
        of the model number with 0s for the variant digits.  For example, the
        Performa 6115 and Performa 6116 are both return the same machine type
        constant:  gestaltPerforma6100.


    OLD NAMING CONVENTIONS

    The "Underscore Speed" suffix

        In the past, Apple differentiated between machines that had the same model
        number but different speeds.  For example, the Power Macintosh 8100/80 and
        Power Macintosh 8100/100 return different machine type constants.  This is
        why some existing machine type constant names take the form:

            gestalt<lineName><modelNumber>_<speed>

        e.g.

            gestaltPowerMac8100_110
            gestaltPowerMac7100_80
            gestaltPowerMac7100_66

        It is no longer necessary to use the "underscore speed" suffix.  Starting with
        the Power Surge machines (Power Macintosh 7200, 7500, 8500 and 9500), speed is
        no longer used to differentiate between machine types.  This is why a Power
        Macintosh 7200/75 and a Power Macintosh 7200/90 return the same machine type
        constant:  gestaltPowerMac7200.

    The "Screen Type" suffix

        All PowerBook models prior to the PowerBook 190, and all PowerBook Duo models
        before the PowerBook Duo 2300 take the form:

            gestalt<lineName><modelNumber><screenType>

        Where <screenType> is "c" or the empty string.

        e.g.

            gestaltPowerBook100
            gestaltPowerBookDuo280
            gestaltPowerBookDuo280c
            gestaltPowerBook180
            gestaltPowerBook180c

        Starting with the PowerBook 190 series and the PowerBook Duo 2300 series, machine
        types are no longer differentiated based on screen type.  This is why a PowerBook
        5300cs/100 and a PowerBook 5300c/100 both return the same machine type constant:
        gestaltPowerBook5300.

        Macintosh LC 630                gestaltMacLC630
        Macintosh Performa 6200         gestaltPerforma6200
        Macintosh Quadra 700            gestaltQuadra700
        Macintosh PowerBook 5300        gestaltPowerBook5300
        Macintosh PowerBook Duo 2300    gestaltPowerBookDuo2300
        Power Macintosh 8500            gestaltPowerMac8500
*}

//enum {
//  gestaltMachineType            = 'mach', /* machine type */
  gestaltMachineType            = $6d616368;
  gestaltClassic                = 1;
  gestaltMacXL                  = 2;
  gestaltMac512KE               = 3;
  gestaltMacPlus                = 4;
  gestaltMacSE                  = 5;
  gestaltMacII                  = 6;
  gestaltMacIIx                 = 7;
  gestaltMacIIcx                = 8;
  gestaltMacSE030               = 9;
  gestaltPortable               = 10;
  gestaltMacIIci                = 11;
  gestaltPowerMac8100_120       = 12;
  gestaltMacIIfx                = 13;
  gestaltMacClassic             = 17;
  gestaltMacIIsi                = 18;
  gestaltMacLC                  = 19;
  gestaltMacQuadra900           = 20;
  gestaltPowerBook170           = 21;
  gestaltMacQuadra700           = 22;
  gestaltClassicII              = 23;
  gestaltPowerBook100           = 24;
  gestaltPowerBook140           = 25;
  gestaltMacQuadra950           = 26;
  gestaltMacLCIII               = 27;
  gestaltPerforma450            = gestaltMacLCIII;
  gestaltPowerBookDuo210        = 29;
  gestaltMacCentris650          = 30;
  gestaltPowerBookDuo230        = 32;
  gestaltPowerBook180           = 33;
  gestaltPowerBook160           = 34;
  gestaltMacQuadra800           = 35;
  gestaltMacQuadra650           = 36;
  gestaltMacLCII                = 37;
  gestaltPowerBookDuo250        = 38;
  gestaltAWS9150_80             = 39;
  gestaltPowerMac8100_110       = 40;
  gestaltAWS8150_110            = gestaltPowerMac8100_110;
  gestaltPowerMac5200           = 41;
  gestaltPowerMac5260           = gestaltPowerMac5200;
  gestaltPerforma5300           = gestaltPowerMac5200;
  gestaltPowerMac6200           = 42;
  gestaltPerforma6300           = gestaltPowerMac6200;
  gestaltMacIIvi                = 44;
  gestaltMacIIvm                = 45;
  gestaltPerforma600            = gestaltMacIIvm;
  gestaltPowerMac7100_80        = 47;
  gestaltMacIIvx                = 48;
  gestaltMacColorClassic        = 49;
  gestaltPerforma250            = gestaltMacColorClassic;
  gestaltPowerBook165c          = 50;
  gestaltMacCentris610          = 52;
  gestaltMacQuadra610           = 53;
  gestaltPowerBook145           = 54;
  gestaltPowerMac8100_100       = 55;
  gestaltMacLC520               = 56;
  gestaltAWS9150_120            = 57;
  gestaltPowerMac6400           = 58;
  gestaltPerforma6400           = gestaltPowerMac6400;
  gestaltPerforma6360           = gestaltPerforma6400;
  gestaltMacCentris660AV        = 60;
  gestaltMacQuadra660AV         = gestaltMacCentris660AV;
  gestaltPerforma46x            = 62;
  gestaltPowerMac8100_80        = 65;
  gestaltAWS8150_80             = gestaltPowerMac8100_80;
  gestaltPowerMac9500           = 67;
  gestaltPowerMac9600           = gestaltPowerMac9500;
  gestaltPowerMac7500           = 68;
  gestaltPowerMac7600           = gestaltPowerMac7500;
  gestaltPowerMac8500           = 69;
  gestaltPowerMac8600           = gestaltPowerMac8500;
  gestaltAWS8550                = gestaltPowerMac7500;
  gestaltPowerBook180c          = 71;
  gestaltPowerBook520           = 72;
  gestaltPowerBook520c          = gestaltPowerBook520;
  gestaltPowerBook540           = gestaltPowerBook520;
  gestaltPowerBook540c          = gestaltPowerBook520;
  gestaltPowerMac5400           = 74;
  gestaltPowerMac6100_60        = 75;
  gestaltAWS6150_60             = gestaltPowerMac6100_60;
  gestaltPowerBookDuo270c       = 77;
  gestaltMacQuadra840AV         = 78;
  gestaltPerforma550            = 80;
  gestaltPowerBook165           = 84;
  gestaltPowerBook190           = 85;
  gestaltMacTV                  = 88;
  gestaltMacLC475               = 89;
  gestaltPerforma47x            = gestaltMacLC475;
  gestaltMacLC575               = 92;
  gestaltMacQuadra605           = 94;
  gestaltMacQuadra630           = 98;
  gestaltMacLC580               = 99;
  gestaltPerforma580            = gestaltMacLC580;
  gestaltPowerMac6100_66        = 100;
  gestaltAWS6150_66             = gestaltPowerMac6100_66;
  gestaltPowerBookDuo280        = 102;
  gestaltPowerBookDuo280c       = 103;
  gestaltPowerMacLC475          = 104;  //* Mac LC 475 & PPC Processor Upgrade Card*/
  gestaltPowerMacPerforma47x    = gestaltPowerMacLC475;
  gestaltPowerMacLC575          = 105;  //* Mac LC 575 & PPC Processor Upgrade Card */
  gestaltPowerMacPerforma57x    = gestaltPowerMacLC575;
  gestaltPowerMacQuadra630      = 106;  //* Quadra 630 & PPC Processor Upgrade Card*/
  gestaltPowerMacLC630          = gestaltPowerMacQuadra630; //* Mac LC 630 & PPC Processor Upgrade Card*/
  gestaltPowerMacPerforma63x    = gestaltPowerMacQuadra630; //* Performa 63x & PPC Processor Upgrade Card*/
  gestaltPowerMac7200           = 108;
  gestaltPowerMac7300           = 109;
  gestaltPowerMac7100_66        = 112;
  gestaltPowerBook150           = 115;
  gestaltPowerMacQuadra700      = 116;  //* Quadra 700 & Power PC Upgrade Card*/
  gestaltPowerMacQuadra900      = 117;  //* Quadra 900 & Power PC Upgrade Card */
  gestaltPowerMacQuadra950      = 118;  //* Quadra 950 & Power PC Upgrade Card */
  gestaltPowerMacCentris610     = 119;  //* Centris 610 & Power PC Upgrade Card */
  gestaltPowerMacCentris650     = 120;  //* Centris 650 & Power PC Upgrade Card */
  gestaltPowerMacQuadra610      = 121;  //* Quadra 610 & Power PC Upgrade Card */
  gestaltPowerMacQuadra650      = 122;  //* Quadra 650 & Power PC Upgrade Card */
  gestaltPowerMacQuadra800      = 123;  //* Quadra 800 & Power PC Upgrade Card */
  gestaltPowerBookDuo2300       = 124;
  gestaltPowerBook500PPCUpgrade = 126;
  gestaltPowerBook5300          = 128;
  gestaltPowerBook1400          = 310;
  gestaltPowerBook3400          = 306;
  gestaltPowerBook2400          = 307;
  gestaltPowerBookG3Series      = 312;
  gestaltPowerBookG3            = 313;
  gestaltPowerBookG3Series2     = 314;
  gestaltPowerMacNewWorld       = 406;  //* All NewWorld architecture Macs (iMac, blue G3, etc.)*/
  gestaltPowerMacG3             = 510;
  gestaltPowerMac5500           = 512;
  gestalt20thAnniversary        = gestaltPowerMac5500;
  gestaltPowerMac6500           = 513;
  gestaltPowerMac4400_160       = 514;  //* slower machine has different machine ID*/
  gestaltPowerMac4400           = 515;
  gestaltMacOSCompatibility     = 1206;  //*    Mac OS Compatibility on Mac OS X (Classic)*/
//};


//enum {
  gestaltQuadra605              = gestaltMacQuadra605;
  gestaltQuadra610              = gestaltMacQuadra610;
  gestaltQuadra630              = gestaltMacQuadra630;
  gestaltQuadra650              = gestaltMacQuadra650;
  gestaltQuadra660AV            = gestaltMacQuadra660AV;
  gestaltQuadra700              = gestaltMacQuadra700;
  gestaltQuadra800              = gestaltMacQuadra800;
  gestaltQuadra840AV            = gestaltMacQuadra840AV;
  gestaltQuadra900              = gestaltMacQuadra900;
  gestaltQuadra950              = gestaltMacQuadra950;
//};

//enum {
  kMachineNameStrID             = -16395;
//};

//enum {
//  gestaltSMPMailerVersion       = 'malr' /* OCE StandardMail*/
  gestaltSMPMailerVersion       =  $6d616c72;
//};

//enum {
//  gestaltMediaBay               = 'mbeh', /* media bay driver type */
  gestaltMediaBay               = $6d626568;
  gestaltMBLegacy               = 0;    //* media bay support in PCCard 2.0 */
  gestaltMBSingleBay            = 1;    //* single bay media bay driver */
  gestaltMBMultipleBays         = 2;     //* multi-bay media bay driver */
//};

//enum {
//  gestaltMessageMgrVersion      = 'mess' //* GX Printing Message Manager Gestalt Selector */
  gestaltMessageMgrVersion      =  $6d657373;
//};


//*  Menu Manager Gestalt (Mac OS 8.5 and later)*/
//enum {
//  gestaltMenuMgrAttr            = 'menu', /* If this Gestalt exists, the Mac OS 8.5 Menu Manager is installed */
  gestaltMenuMgrAttr            = $6d656e75;
  gestaltMenuMgrPresent         = (1 shl 0); //* NOTE: this is a bit mask, whereas all other Gestalt constants of this nature */
                                        //* are bit index values. 3.2 interfaces slipped out with this mistake unnoticed. */
                                        //* Sincere apologies for any inconvenience.*/
  gestaltMenuMgrPresentBit      = 0;    //* bit number */
  gestaltMenuMgrAquaLayoutBit   = 1;    //* menus have the Aqua 1.0 layout*/
  gestaltMenuMgrMultipleItemsWithCommandIDBit = 2; //* CountMenuItemsWithCommandID/GetIndMenuItemWithCommandID support multiple items with the same command ID*/
  gestaltMenuMgrRetainsIconRefBit = 3;  //* SetMenuItemIconHandle, when passed an IconRef, calls AcquireIconRef*/
  gestaltMenuMgrSendsMenuBoundsToDefProcBit = 4; //* kMenuSizeMsg and kMenuPopUpMsg have menu bounding rect information*/
  gestaltMenuMgrMoreThanFiveMenusDeepBit = 5; //* the Menu Manager supports hierarchical menus more than five deep*/
  gestaltMenuMgrCGImageMenuTitleBit = 6; //* SetMenuTitleIcon supports CGImageRefs*/
                                        //* masks for the above bits*/
  gestaltMenuMgrPresentMask     = (1 shl gestaltMenuMgrPresentBit);
  gestaltMenuMgrAquaLayoutMask  = (1 shl gestaltMenuMgrAquaLayoutBit);
  gestaltMenuMgrMultipleItemsWithCommandIDMask = (1 shl gestaltMenuMgrMultipleItemsWithCommandIDBit);
  gestaltMenuMgrRetainsIconRefMask = (1 shl gestaltMenuMgrRetainsIconRefBit);
  gestaltMenuMgrSendsMenuBoundsToDefProcMask = (1 shl gestaltMenuMgrSendsMenuBoundsToDefProcBit);
  gestaltMenuMgrMoreThanFiveMenusDeepMask = (1 shl gestaltMenuMgrMoreThanFiveMenusDeepBit);
  gestaltMenuMgrCGImageMenuTitleMask = (1 shl gestaltMenuMgrCGImageMenuTitleBit);
//};


//enum {
//  gestaltMultipleUsersState     = 'mfdr' //* Gestalt selector returns MultiUserGestaltHandle (in Folders.h)*/
  gestaltMultipleUsersState     =  $6d666472;
//};


//enum {
//  gestaltMachineIcon            = 'micn' /* machine icon */
  gestaltMachineIcon            = $6d69636e;
//};

//enum {
//  gestaltMiscAttr               = 'misc', /* miscellaneous attributes */
  gestaltMiscAttr               = $6d697363;
  gestaltScrollingThrottle      = 0;    //* true if scrolling throttle on */
  gestaltSquareMenuBar          = 2;    //* true if menu bar is square */
//};


{*
    The name gestaltMixedModeVersion for the 'mixd' selector is semantically incorrect.
    The same selector has been renamed gestaltMixedModeAttr to properly reflect the
    Inside Mac: PowerPC System Software documentation.  The gestaltMixedModeVersion
    symbol has been preserved only for backwards compatibility.

    Developers are forewarned that gestaltMixedModeVersion has a limited lifespan and
    will be removed in a future release of the Interfaces.

    For the first version of Mixed Mode, both meanings of the 'mixd' selector are
    functionally identical.  They both return 0x00000001.  In subsequent versions
    of Mixed Mode, however, the 'mixd' selector will not respond with an increasing
    version number, but rather, with 32 attribute bits with various meanings.
*}
//enum {
//  gestaltMixedModeVersion       = 'mixd' /* returns version of Mixed Mode */
  gestaltMixedModeVersion       = $6d697864;
//};

//enum {
//  gestaltMixedModeAttr          = 'mixd', /* returns Mixed Mode attributes */
  gestaltMixedModeAttr          = $6d697864;
  gestaltMixedModePowerPC       = 0;    //* true if Mixed Mode supports PowerPC ABI calling conventions */
  gestaltPowerPCAware           = 0;    //* old name for gestaltMixedModePowerPC */
  gestaltMixedModeCFM68K        = 1;    //* true if Mixed Mode supports CFM-68K calling conventions */
  gestaltMixedModeCFM68KHasTrap = 2;    //* true if CFM-68K Mixed Mode implements _MixedModeDispatch (versions 1.0.1 and prior did not) */
  gestaltMixedModeCFM68KHasState = 3;    //* true if CFM-68K Mixed Mode exports Save/RestoreMixedModeState */
//};

//enum {
//  gestaltQuickTimeConferencing  = 'mtlk' /* returns QuickTime Conferencing version */
  gestaltQuickTimeConferencing  = $6d746c6b;
//};

//enum {
//  gestaltMemoryMapAttr          = 'mmap', /* Memory map type */
  gestaltMemoryMapAttr          = $6d6d6170;
  gestaltMemoryMapSparse        = 0;     //* Sparse memory is on */
//};

//enum {
//  gestaltMMUType                = 'mmu ', /* mmu type */
  gestaltMMUType                = $6d6d7520;
  gestaltNoMMU                  = 0;    //* no MMU */
  gestaltAMU                    = 1;    //* address management unit */
  gestalt68851                  = 2;    //* 68851 PMMU */
  gestalt68030MMU               = 3;    //* 68030 built-in MMU */
  gestalt68040MMU               = 4;    //* 68040 built-in MMU */
  gestaltEMMU1                  = 5;     //* Emulated MMU type 1  */
//};

//enum {
                                        //*    On Mac OS X, the user visible machine name may something like "PowerMac3,4", which is*/
                                        //*    a unique string for each signifigant Macintosh computer which Apple creates, but is*/
                                        //*    not terribly useful as a user visible string.*/
//  gestaltUserVisibleMachineName = 'mnam' /* Coerce response into a StringPtr to get a user visible machine name */
 gestaltUserVisibleMachineName = $6d6e616d;
//};

//enum {
//  gestaltMPCallableAPIsAttr     = 'mpsc', /* Bitmap of toolbox/OS managers that can be called from MPLibrary MPTasks */
  gestaltMPCallableAPIsAttr     = $6d707363;
  gestaltMPFileManager          = 0;    //* True if File Manager calls can be made from MPTasks */
  gestaltMPDeviceManager        = 1;    //* True if synchronous Device Manager calls can be made from MPTasks */
  gestaltMPTrapCalls            = 2;     //* True if most trap-based calls can be made from MPTasks */
//};

//enum {
//  gestaltStdNBPAttr             = 'nlup', /* standard nbp attributes */
  gestaltStdNBPAttr             = $6e6c7570;
  gestaltStdNBPPresent          = 0;
  gestaltStdNBPSupportsAutoPosition = 1; //* StandardNBP takes (-1,-1) to mean alert position main screen */
//};

//enum {
//  gestaltNotificationMgrAttr    = 'nmgr', /* notification manager attributes */
  gestaltNotificationMgrAttr    = $6e6d6772;
  gestaltNotificationPresent    = 0;     //* notification manager exists */
//};

//enum {
//  gestaltNameRegistryVersion    = 'nreg' /* NameRegistryLib version number, for System 7.5.2+ usage */
  gestaltNameRegistryVersion    = $6e726567;
//};

//enum {
//  gestaltNuBusSlotCount         = 'nubs' /* count of logical NuBus slots present */
  gestaltNuBusSlotCount         = $6e756273;
//};

//enum {
//  gestaltOCEToolboxVersion      = 'ocet', /* OCE Toolbox version */
  gestaltOCEToolboxVersion      = $6f636574;
  gestaltOCETB                  = $0102; //* OCE Toolbox version 1.02 */
  gestaltSFServer               = $0100; //* S&F Server version 1.0 */
//};

//enum {
//  gestaltOCEToolboxAttr         = 'oceu', /* OCE Toolbox attributes */
  gestaltOCEToolboxAttr         = $6f636575;
  gestaltOCETBPresent           = $01; //* OCE toolbox is present, not running */
  gestaltOCETBAvailable         = $02; //* OCE toolbox is running and available */
  gestaltOCESFServerAvailable   = $04; //* S&F Server is running and available */
  gestaltOCETBNativeGlueAvailable = $10; //* Native PowerPC Glue routines are availible */
//};

//enum {
//  gestaltOpenFirmwareInfo       = 'opfw' /* Open Firmware info */
  gestaltOpenFirmwareInfo       =  $6f706677;
//};

//enum {
//  gestaltOSAttr                 = 'os  ', /* o/s attributes */
  gestaltOSAttr                 = $6f732020;
  gestaltSysZoneGrowable        = 0;    //* system heap is growable */
  gestaltLaunchCanReturn        = 1;    //* can return from launch */
  gestaltLaunchFullFileSpec     = 2;    //* can launch from full file spec */
  gestaltLaunchControl          = 3;    //* launch control support available */
  gestaltTempMemSupport         = 4;    //* temp memory support */
  gestaltRealTempMemory         = 5;    //* temp memory handles are real */
  gestaltTempMemTracked         = 6;    //* temporary memory handles are tracked */
  gestaltIPCSupport             = 7;    //* IPC support is present */
  gestaltSysDebuggerSupport     = 8;    //* system debugger support is present */
  gestaltNativeProcessMgrBit    = 19;   //* the process manager itself is native */
  gestaltAltivecRegistersSwappedCorrectlyBit = 20; //* Altivec registers are saved correctly on process switches */
//};

//enum {
//  gestaltOSTable                = 'ostt' /*  OS trap table base  */
  gestaltOSTable                =  $6f737474;
//};


{*******************************************************************************
*   Gestalt Selectors for Open Transport Network Setup
*
*   Note: possible values for the version "stage" byte are:
*   development = 0x20, alpha = 0x40, beta = 0x60, final & release = 0x80
********************************************************************************}
//enum {
//  gestaltOpenTptNetworkSetup    = 'otcf',
  gestaltOpenTptNetworkSetup    = $6f746366;
  gestaltOpenTptNetworkSetupLegacyImport = 0;
  gestaltOpenTptNetworkSetupLegacyExport = 1;
  gestaltOpenTptNetworkSetupSupportsMultihoming = 2;
//};

//enum {
//  gestaltOpenTptNetworkSetupVersion = 'otcv'
  gestaltOpenTptNetworkSetupVersion =  $6f746376;
//};

{*******************************************************************************
*   Gestalt Selectors for Open Transport-based Remote Access/PPP
*
*   Note: possible values for the version "stage" byte are:
*   development = 0x20, alpha = 0x40, beta = 0x60, final & release = 0x80
********************************************************************************}
//enum {
//  gestaltOpenTptRemoteAccess    = 'otra',
  gestaltOpenTptRemoteAccess    = $6f747261;
  gestaltOpenTptRemoteAccessPresent = 0;
  gestaltOpenTptRemoteAccessLoaded = 1;
  gestaltOpenTptRemoteAccessClientOnly = 2;
  gestaltOpenTptRemoteAccessPServer = 3;
  gestaltOpenTptRemoteAccessMPServer = 4;
  gestaltOpenTptPPPPresent      = 5;
  gestaltOpenTptARAPPresent     = 6;
//};

//enum {
//  gestaltOpenTptRemoteAccessVersion = 'otrv'
  gestaltOpenTptRemoteAccessVersion =  $6f747276;
//};


//* ***** Open Transport Gestalt ******/


//enum {
//  gestaltOpenTptVersions        = 'otvr' /* Defined by OT 1.1 and higher, response is NumVersion.*/
  gestaltOpenTptVersions        =  $6f747672;
//};

//enum {
//  gestaltOpenTpt                = 'otan', /* Defined by all versions, response is defined below.*/
  gestaltOpenTpt                = $6f74616e;
  gestaltOpenTptPresentMask     = $00000001;
  gestaltOpenTptLoadedMask      = $00000002;
  gestaltOpenTptAppleTalkPresentMask = $00000004;
  gestaltOpenTptAppleTalkLoadedMask = $00000008;
  gestaltOpenTptTCPPresentMask  = $00000010;
  gestaltOpenTptTCPLoadedMask   = $00000020;
  gestaltOpenTptIPXSPXPresentMask = $00000040;
  gestaltOpenTptIPXSPXLoadedMask = $00000080;
  gestaltOpenTptPresentBit      = 0;
  gestaltOpenTptLoadedBit       = 1;
  gestaltOpenTptAppleTalkPresentBit = 2;
  gestaltOpenTptAppleTalkLoadedBit = 3;
  gestaltOpenTptTCPPresentBit   = 4;
  gestaltOpenTptTCPLoadedBit    = 5;
  gestaltOpenTptIPXSPXPresentBit = 6;
  gestaltOpenTptIPXSPXLoadedBit = 7;
//};


//enum {
//  gestaltPCCard                 = 'pccd', /*    PC Card attributes*/
  gestaltPCCard                 = $70636364;
  gestaltCardServicesPresent    = 0;    //*    PC Card 2.0 (68K) API is present*/
  gestaltPCCardFamilyPresent    = 1;    //*    PC Card 3.x (PowerPC) API is present*/
  gestaltPCCardHasPowerControl  = 2;    //*    PCCardSetPowerLevel is supported*/
  gestaltPCCardSupportsCardBus  = 3;     //*    CardBus is supported*/
//};

//enum {
//  gestaltProcClkSpeed           = 'pclk' /* processor clock speed in hertz (a UInt32) */
  gestaltProcClkSpeed           = $70636c6b;
//};

//enum {
//  gestaltProcClkSpeedMHz        = 'mclk' /* processor clock speed in megahertz (a UInt32) */
  gestaltProcClkSpeedMHz        =  $6d636c6b;
//};

//enum {
//  gestaltPCXAttr                = 'pcxg', /* PC Exchange attributes */
  gestaltPCXAttr                = $70637867;
  gestaltPCXHas8and16BitFAT     = 0;    //* PC Exchange supports both 8 and 16 bit FATs */
  gestaltPCXHasProDOS           = 1;    //* PC Exchange supports ProDOS */
  gestaltPCXNewUI               = 2;
  gestaltPCXUseICMapping        = 3;    //* PC Exchange uses InternetConfig for file mappings */
//};

//enum {
//  gestaltLogicalPageSize        = 'pgsz' /* logical page size */
  gestaltLogicalPageSize        = $7067737a;
//};

{*    System 7.6 and later.  If gestaltScreenCaptureMain is not implemented,
    PictWhap proceeds with screen capture in the usual way.

    The high word of gestaltScreenCaptureMain is reserved (use 0).

    To disable screen capture to disk, put zero in the low word.  To
    specify a folder for captured pictures, put the vRefNum in the
    low word of gestaltScreenCaptureMain, and put the directory ID in
    gestaltScreenCaptureDir.
*}
//enum {
//  gestaltScreenCaptureMain      = 'pic1', /* Zero, or vRefNum of disk to hold picture */
  gestaltScreenCaptureMain      =  $70696331;
//  gestaltScreenCaptureDir       = 'pic2' /* Directory ID of folder to hold picture */
  gestaltScreenCaptureDir       =  $70696332;
//};

//enum {
//  gestaltGXPrintingMgrVersion   = 'pmgr' /* QuickDraw GX Printing Manager Version*/
  gestaltGXPrintingMgrVersion   = $706d6772;
//};

//enum {
//  gestaltPopupAttr              = 'pop!', /* popup cdef attributes */
  gestaltPopupAttr              = $706f7021;
  gestaltPopupPresent           = 0;
//};

//enum {
//  gestaltPowerMgrAttr           = 'powr', /* power manager attributes */
  gestaltPowerMgrAttr           = $706f7772;
  gestaltPMgrExists             = 0;
  gestaltPMgrCPUIdle            = 1;
  gestaltPMgrSCC                = 2;
  gestaltPMgrSound              = 3;
  gestaltPMgrDispatchExists     = 4;
  gestaltPMgrSupportsAVPowerStateAtSleepWake = 5;
//};

//enum {
//  gestaltPowerMgrVers           = 'pwrv' /* power manager version */
  gestaltPowerMgrVers           = $70777276;
//};

{*
 * PPC will return the combination of following bit fields.
 * e.g. gestaltPPCSupportsRealTime +gestaltPPCSupportsIncoming + gestaltPPCSupportsOutGoing
 * indicates PPC is cuurently is only supports real time delivery
 * and both incoming and outgoing network sessions are allowed.
 * By default local real time delivery is supported as long as PPCInit has been called.*}
//enum {
//  gestaltPPCToolboxAttr         = 'ppc ', /* PPC toolbox attributes */
  gestaltPPCToolboxAttr         = $70706320;
  gestaltPPCToolboxPresent      = $0000; //* PPC Toolbox is present  Requires PPCInit to be called */
  gestaltPPCSupportsRealTime    = $1000; //* PPC Supports real-time delivery */
  gestaltPPCSupportsIncoming    = $0001; //* PPC will allow incoming network requests */
  gestaltPPCSupportsOutGoing    = $0002; //* PPC will allow outgoing network requests */
  gestaltPPCSupportsTCP_IP      = $0004; //* PPC supports TCP/IP transport  */
  gestaltPPCSupportsIncomingAppleTalk = $0010;
  gestaltPPCSupportsIncomingTCP_IP = $0020;
  gestaltPPCSupportsOutgoingAppleTalk = $0100;
  gestaltPPCSupportsOutgoingTCP_IP = $0200;
//};

{*
    Programs which need to know information about particular features of the processor should
    migrate to using sysctl() and sysctlbyname() to get this kind of information.  No new
    information will be added to the 'ppcf' selector going forward.
*}
//enum {
//  gestaltPowerPCProcessorFeatures = 'ppcf', //* Optional PowerPC processor features */
  gestaltPowerPCProcessorFeatures =  $70706366;
  gestaltPowerPCHasGraphicsInstructions = 0; //* has fres, frsqrte, and fsel instructions */
  gestaltPowerPCHasSTFIWXInstruction = 1; //* has stfiwx instruction */
  gestaltPowerPCHasSquareRootInstructions = 2; //* has fsqrt and fsqrts instructions */
  gestaltPowerPCHasDCBAInstruction = 3; //* has dcba instruction */
  gestaltPowerPCHasVectorInstructions = 4; //* has vector instructions */
  gestaltPowerPCHasDataStreams  = 5;    //* has dst, dstt, dstst, dss, and dssall instructions */
  gestaltPowerPCHas64BitSupport = 6;    //* double word LSU/ALU, etc. */
  gestaltPowerPCHasDCBTStreams  = 7;    //* TH field of DCBT recognized */
  gestaltPowerPCASArchitecture  = 8;    //* chip uses new 'A/S' architecture */
  gestaltPowerPCIgnoresDCBST    = 9;     //* */
//};

//enum {
//  gestaltProcessorType          = 'proc', /* processor type */
  gestaltProcessorType          = $70726f63;
  gestalt68000                  = 1;
  gestalt68010                  = 2;
  gestalt68020                  = 3;
  gestalt68030                  = 4;
  gestalt68040                  = 5;
//};

//enum {
//  gestaltSDPPromptVersion       = 'prpv' /* OCE Standard Directory Panel*/
  gestaltSDPPromptVersion       = $70727076;
//};

//enum {
//  gestaltParityAttr             = 'prty', /* parity attributes */
  gestaltParityAttr             = $70727479;
  gestaltHasParityCapability    = 0;    //* has ability to check parity */
  gestaltParityEnabled          = 1;     //* parity checking enabled */
//};

//enum {
//  gestaltQD3DVersion            = 'q3v ' /* Quickdraw 3D version in pack BCD*/
  gestaltQD3DVersion            =  $71337620;
//};

//enum {
//  gestaltQD3DViewer             = 'q3vc', /* Quickdraw 3D viewer attributes*/
  gestaltQD3DViewer             = $71337663;
  gestaltQD3DViewerPresent      = 0;     //* bit 0 set if QD3D Viewer is available*/
//};

//#if OLDROUTINENAMES
//enum {
  gestaltQD3DViewerNotPresent   = (0 shl gestaltQD3DViewerPresent);
  gestaltQD3DViewerAvailable    = (1 shl gestaltQD3DViewerPresent);
//};

//#endif  /* OLDROUTINENAMES */

//enum {
//  gestaltQuickdrawVersion       = 'qd  ', /* quickdraw version */
  gestaltQuickdrawVersion       = $71642020;
  gestaltOriginalQD             = $0000; //* original 1-bit QD */
  gestalt8BitQD                 = $0100; //* 8-bit color QD */
  gestalt32BitQD                = $0200; //* 32-bit color QD */
  gestalt32BitQD11              = $0201; //* 32-bit color QDv1.1 */
  gestalt32BitQD12              = $0220; //* 32-bit color QDv1.2 */
  gestalt32BitQD13              = $0230; //* 32-bit color QDv1.3 */
  gestaltAllegroQD              = $0250; //* Allegro QD OS 8.5 */
  gestaltMacOSXQD               = $0300; //* 0x310, 0x320 etc. for 10.x.y */
//};

//enum {
//  gestaltQD3D                   = 'qd3d', /* Quickdraw 3D attributes*/
  gestaltQD3D                   = $71643364;
  gestaltQD3DPresent            = 0;     //* bit 0 set if QD3D available*/
//};

//#if OLDROUTINENAMES
//enum {
  gestaltQD3DNotPresent         = (0 shl gestaltQD3DPresent);
  gestaltQD3DAvailable          = (1 shl gestaltQD3DPresent);
//};

//#endif  /* OLDROUTINENAMES */

//enum {
//  gestaltGXVersion              = 'qdgx' /* Overall QuickDraw GX Version*/
  gestaltGXVersion              = $71646778;
//};

//enum {
//  gestaltQuickdrawFeatures      = 'qdrw', /* quickdraw features */
  gestaltQuickdrawFeatures      =  $71647277;
  gestaltHasColor               = 0;    //* color quickdraw present */
  gestaltHasDeepGWorlds         = 1;    //* GWorlds can be deeper than 1-bit */
  gestaltHasDirectPixMaps       = 2;    //* PixMaps can be direct (16 or 32 bit) */
  gestaltHasGrayishTextOr       = 3;    //* supports text mode grayishTextOr */
  gestaltSupportsMirroring      = 4;    //* Supports video mirroring via the Display Manager. */
  gestaltQDHasLongRowBytes      = 5;     //* Long rowBytes supported in GWorlds */
//};

//enum {
//  gestaltQDTextVersion          = 'qdtx', /* QuickdrawText version */
  gestaltQDTextVersion          = $71647478;
  gestaltOriginalQDText         = $0000; //* up to and including 8.1 */
  gestaltAllegroQDText          = $0100; //* starting with 8.5 */
  gestaltMacOSXQDText           = $0200; //* we are in Mac OS X */
//};

//enum {
//  gestaltQDTextFeatures         = 'qdtf', /* QuickdrawText features */
  gestaltQDTextFeatures         = $71647466;
  gestaltWSIISupport            = 0;    //* bit 0: WSII support included */
  gestaltSbitFontSupport        = 1;    //* sbit-only fonts supported */
  gestaltAntiAliasedTextAvailable = 2;  //* capable of antialiased text */
  gestaltOFA2available          = 3;    //* OFA2 available */
  gestaltCreatesAliasFontRsrc   = 4;    //* "real" datafork font support */
  gestaltNativeType1FontSupport = 5;    //* we have scaler for Type1 fonts */
  gestaltCanUseCGTextRendering  = 6;
//};


//enum {
//  gestaltQuickTimeConferencingInfo = 'qtci' /* returns pointer to QuickTime Conferencing information */
  gestaltQuickTimeConferencingInfo = $71746369;
//};

//enum {
//  gestaltQuickTimeVersion       = 'qtim', /* returns version of QuickTime */
  gestaltQuickTimeVersion       = $7174696d;
//  gestaltQuickTime              = 'qtim' /* gestaltQuickTime is old name for gestaltQuickTimeVersion */
  gestaltQuickTime              = $7174696d;
//};

//enum {
//  gestaltQuickTimeFeatures      = 'qtrs',
  gestaltQuickTimeFeatures      = $71747273;
  gestaltPPCQuickTimeLibPresent = 0;     //* PowerPC QuickTime glue library is present */
//};

//enum {
//  gestaltQuickTimeStreamingFeatures = 'qtsf'
  gestaltQuickTimeStreamingFeatures = $71747366;
//};

//enum {
//  gestaltQuickTimeStreamingVersion = 'qtst'
  gestaltQuickTimeStreamingVersion = $71747374;
//};

//enum {
//  gestaltQuickTimeThreadSafeFeaturesAttr = 'qtth', /* Quicktime thread safety attributes */
  gestaltQuickTimeThreadSafeFeaturesAttr = $71747468;
  gestaltQuickTimeThreadSafeICM = 0;
  gestaltQuickTimeThreadSafeMovieToolbox = 1;
  gestaltQuickTimeThreadSafeMovieImport = 2;
  gestaltQuickTimeThreadSafeMovieExport = 3;
  gestaltQuickTimeThreadSafeGraphicsImport = 4;
  gestaltQuickTimeThreadSafeGraphicsExport = 5;
  gestaltQuickTimeThreadSafeMoviePlayback = 6;
//};

//enum {
//  gestaltQTVRMgrAttr            = 'qtvr', /* QuickTime VR attributes                               */
  gestaltQTVRMgrAttr            = $71747672;
   gestaltQTVRMgrPresent         = 0;   //* QTVR API is present                                   */
  gestaltQTVRObjMoviesPresent   = 1;    //* QTVR runtime knows about object movies                */
  gestaltQTVRCylinderPanosPresent = 2;  //* QTVR runtime knows about cylindrical panoramic movies */
  gestaltQTVRCubicPanosPresent  = 3;     //* QTVR runtime knows about cubic panoramic movies       */
//};

//enum {
//  gestaltQTVRMgrVers            = 'qtvv' /* QuickTime VR version                                  */
  gestaltQTVRMgrVers            = $71747676;
//};

{*    
    Because some PowerPC machines now support very large physical memory capacities, including
    some above the maximum value which can held in a 32 bit quantity, there is now a new selector,
    gestaltPhysicalRAMSizeInMegabytes, which returns the size of physical memory scaled
    in megabytes.  It is recommended that code transition to using this new selector if
    it wants to get a useful value for the amount of physical memory on the system.  Code can
    also use the sysctl() and sysctlbyname() BSD calls to get these kinds of values.
    
    For compatability with code which assumed that the value in returned by the
    gestaltPhysicalRAMSize selector would be a signed quantity of bytes, this selector will
    now return 2 gigabytes-1 ( INT_MAX ) if the system has 2 gigabytes of physical memory or more.
*}
//enum {
  //gestaltPhysicalRAMSize        = 'ram ' /* physical RAM size, in bytes */
  gestaltPhysicalRAMSize          =  $72616d20;
//};

//enum {
//  gestaltPhysicalRAMSizeInMegabytes = 'ramm' /* physical RAM size, scaled in megabytes */
  gestaltPhysicalRAMSizeInMegabytes = $72616d6d;
//};

//enum {
//  gestaltRBVAddr                = 'rbv ' /* RBV base address  */
  gestaltRBVAddr                = $72627620;
//};

//enum {
//  gestaltROMSize                = 'rom ' /* rom size */
  gestaltROMSize                = $726f6d20;
//};

//enum {
//  gestaltROMVersion             = 'romv' /* rom version */
  gestaltROMVersion             = $726f6d76;
//};

//enum {
//  gestaltResourceMgrAttr        = 'rsrc', /* Resource Mgr attributes */
  gestaltResourceMgrAttr        = $72737263;
  gestaltPartialRsrcs           = 0;    //* True if partial resources exist */
  gestaltHasResourceOverrides   = 1;    //* Appears in the ROM; so put it here. */
//};

//enum {
//  gestaltResourceMgrBugFixesAttrs = 'rmbg', /* Resource Mgr bug fixes */
  gestaltResourceMgrBugFixesAttrs = $726d6267;
  gestaltRMForceSysHeapRolledIn = 0;
  gestaltRMFakeAppleMenuItemsRolledIn = 1;
  gestaltSanityCheckResourceFiles = 2;  //* Resource manager does sanity checking on resource files before opening them */
  gestaltSupportsFSpResourceFileAlreadyOpenBit = 3; //* The resource manager supports GetResFileRefNum and FSpGetResFileRefNum and FSpResourceFileAlreadyOpen */
  gestaltRMSupportsFSCalls      = 4;    //* The resource manager supports OpenResFileFSRef, CreateResFileFSRef and  ResourceFileAlreadyOpenFSRef */
  gestaltRMTypeIndexOrderingReverse = 8; //* GetIndType() calls return resource types in opposite order to original 68k resource manager */
//};


//enum {
//  gestaltRealtimeMgrAttr        = 'rtmr', /* Realtime manager attributes         */
  gestaltRealtimeMgrAttr            = $72746d72;
  gestaltRealtimeMgrPresent       = 0;     //* true if the Realtime manager is present    */
//};


//enum {
//  gestaltSafeOFAttr             = 'safe',
  gestaltSafeOFAttr             = $73616665;
  gestaltVMZerosPagesBit        = 0;
  gestaltInitHeapZerosOutHeapsBit = 1;
  gestaltNewHandleReturnsZeroedMemoryBit = 2;
  gestaltNewPtrReturnsZeroedMemoryBit = 3;
  gestaltFileAllocationZeroedBlocksBit = 4;
//};


//enum {
//  gestaltSCCReadAddr            = 'sccr' /* scc read base address  */
  gestaltSCCReadAddr            = $73636372;  
//};

//enum {
//  gestaltSCCWriteAddr           = 'sccw' /* scc read base address  */
  gestaltSCCWriteAddr           = $73636377;
//};

//enum {
//  gestaltScrapMgrAttr           = 'scra', /* Scrap Manager attributes */
  gestaltScrapMgrAttr           = $73637261;
  gestaltScrapMgrTranslationAware = 0;   //* True if scrap manager is translation aware */
//};

//enum {
//  gestaltScriptMgrVersion       = 'scri' /* Script Manager version number     */
  gestaltScriptMgrVersion       =  $73637269;
//};

//enum {
//  gestaltScriptCount            = 'scr#' /* number of active script systems   */
  gestaltScriptCount            =  $73637223;
//};

//enum {
//  gestaltSCSI                   = 'scsi', /* SCSI Manager attributes */
  gestaltSCSI                   = $73637369;
  gestaltAsyncSCSI              = 0;    //* Supports Asynchronous SCSI */
  gestaltAsyncSCSIINROM         = 1;    //* Async scsi is in ROM (available for booting) */
  gestaltSCSISlotBoot           = 2;    //* ROM supports Slot-style PRAM for SCSI boots (PDM and later) */
  gestaltSCSIPollSIH            = 3;    //* SCSI Manager will poll for interrupts if Secondary Interrupts are busy. */
//};

//enum {
//  gestaltControlStripAttr       = 'sdev', /* Control Strip attributes */
  gestaltControlStripAttr       = $73646576;
  gestaltControlStripExists     = 0;    //* Control Strip is installed */
  gestaltControlStripVersionFixed = 1;  //* Control Strip version Gestalt selector was fixed */
  gestaltControlStripUserFont   = 2;    //* supports user-selectable font/size */
  gestaltControlStripUserHotKey = 3;     //* support user-selectable hot key to show/hide the window */
//};

//enum {
//  gestaltSDPStandardDirectoryVersion = 'sdvr' /* OCE Standard Directory Panel*/
  gestaltSDPStandardDirectoryVersion = $73647672;
//};

//enum {
//  gestaltSerialAttr             = 'ser ', /* Serial attributes */
  gestaltSerialAttr             = $73657220;
  gestaltHasGPIaToDCDa          = 0;    //* GPIa connected to DCDa*/
  gestaltHasGPIaToRTxCa         = 1;    //* GPIa connected to RTxCa clock input*/
  gestaltHasGPIbToDCDb          = 2;    //* GPIb connected to DCDb */
  gestaltHidePortA              = 3;    //* Modem port (A) should be hidden from users */
  gestaltHidePortB              = 4;    //* Printer port (B) should be hidden from users */
  gestaltPortADisabled          = 5;    //* Modem port (A) disabled and should not be used by SW */
  gestaltPortBDisabled          = 6;     //* Printer port (B) disabled and should not be used by SW */
//};

//enum {
//  gestaltShutdownAttributes     = 'shut', /* ShutDown Manager Attributes */
  gestaltShutdownAttributes     = $73687574;
  gestaltShutdownHassdOnBootVolUnmount = 0; //* True if ShutDown Manager unmounts boot & VM volume at shutdown time. */
//};

//enum {
//  gestaltNuBusConnectors        = 'sltc' /* bitmap of NuBus connectors*/
  gestaltNuBusConnectors        = $736c7463;
//};

//enum {
//  gestaltSlotAttr               = 'slot', /* slot attributes  */
  gestaltSlotAttr               = $736c6f74; 
  gestaltSlotMgrExists          = 0;    //* true is slot mgr exists  */
  gestaltNuBusPresent           = 1;    //* NuBus slots are present  */
  gestaltSESlotPresent          = 2;    //* SE PDS slot present  */
  gestaltSE30SlotPresent        = 3;    //* SE/30 slot present  */
  gestaltPortableSlotPresent    = 4;    //* Portable’s slot present  */
//};

//enum {
//  gestaltFirstSlotNumber        = 'slt1' /* returns first physical slot */
  gestaltFirstSlotNumber        = $736c7431;
//};

//enum {
//  gestaltSoundAttr              = 'snd ', /* sound attributes */
  gestaltSoundAttr              = $736e6420;
  gestaltStereoCapability       = 0;    //* sound hardware has stereo capability */
  gestaltStereoMixing           = 1;    //* stereo mixing on external speaker */
  gestaltSoundIOMgrPresent      = 3;    //* The Sound I/O Manager is present */
  gestaltBuiltInSoundInput      = 4;    //* built-in Sound Input hardware is present */
  gestaltHasSoundInputDevice    = 5;    //* Sound Input device available */
  gestaltPlayAndRecord          = 6;    //* built-in hardware can play and record simultaneously */
  gestalt16BitSoundIO           = 7;    //* sound hardware can play and record 16-bit samples */
  gestaltStereoInput            = 8;    //* sound hardware can record stereo */
  gestaltLineLevelInput         = 9;    //* sound input port requires line level */
                                        //* the following bits are not defined prior to Sound Mgr 3.0 */
  gestaltSndPlayDoubleBuffer    = 10;   //* SndPlayDoubleBuffer available, set by Sound Mgr 3.0 and later */
  gestaltMultiChannels          = 11;   //* multiple channel support, set by Sound Mgr 3.0 and later */
  gestalt16BitAudioSupport      = 12;    //* 16 bit audio data supported, set by Sound Mgr 3.0 and later */
//};

//enum {
//  gestaltSplitOSAttr            = 'spos',
  gestaltSplitOSAttr            = $73706f73;
  gestaltSplitOSBootDriveIsNetworkVolume = 0; //* the boot disk is a network 'disk', from the .LANDisk drive. */
  gestaltSplitOSAware           = 1;    //* the system includes the code to deal with a split os situation. */
  gestaltSplitOSEnablerVolumeIsDifferentFromBootVolume = 2; //* the active enabler is on a different volume than the system file. */
  gestaltSplitOSMachineNameSetToNetworkNameTemp = 3; //* The machine name was set to the value given us from the BootP server */
  gestaltSplitOSMachineNameStartupDiskIsNonPersistent = 5; //* The startup disk ( vRefNum == -1 ) is non-persistent, meaning changes won't persist across a restart. */
//};

//enum {
//  gestaltSMPSPSendLetterVersion = 'spsl' /* OCE StandardMail*/
  gestaltSMPSPSendLetterVersion = $7370736c;
//};

//enum {
//  gestaltSpeechRecognitionAttr  = 'srta', /* speech recognition attributes */
  gestaltSpeechRecognitionAttr  = $73727461; 
  gestaltDesktopSpeechRecognition = 1; //* recognition thru the desktop microphone is available */
  gestaltTelephoneSpeechRecognition = 2; //* recognition thru the telephone is available */
//};

//enum {
//  gestaltSpeechRecognitionVersion = 'srtb' /* speech recognition version (0x0150 is the first version that fully supports the API) */
  gestaltSpeechRecognitionVersion = $73727462;
//};

//enum {
  gestaltSoftwareVendorCode     = $73726164; //'srad', /* Returns system software vendor information */
  gestaltSoftwareVendorApple    = $4170706c; //'Appl', /* System software sold by Apple */
  //  gestaltSoftwareVendorLicensee = 'Lcns' /* System software sold by licensee */
  gestaltSoftwareVendorLicensee   = $4c636e73;
//};
//enum {
//  gestaltSysArchitecture        = 'sysa', /* Native System Architecture */
  gestaltSysArchitecture          = $73797361;
//  gestalt68k                    = 1,    /* Motorola MC68k architecture */
  gestalt68k                      = 1;
  //  gestaltPowerPC                = 2,    /* IBM PowerPC architecture */
  gestaltPowerPC                  = 2;
//  gestaltIntel                  = 10    /* Intel x86 architecture */
  gestaltIntel                    = 10;
//};

//enum {

//  gestaltSystemUpdateVersion    = 'sysu' /* System Update version */
  gestaltSystemUpdateVersion      = $73797375;
//};

//enum {
//  gestaltSystemVersion          = 'sysv', /* system version*/
  gestaltSystemVersion            = $73797376;
//  gestaltSystemVersionMajor     = 'sys1', /* The major system version number; in 10.4.17 this would be the decimal value 10 */
  gestaltSystemVersionMajor       = $73797331;
//  gestaltSystemVersionMinor     = 'sys2', /* The minor system version number; in 10.4.17 this would be the decimal value 4 */
  gestaltSystemVersionMinor       = $73797332;
//  gestaltSystemVersionBugFix    = 'sys3' /* The bug fix system version number; in 10.4.17 this would be the decimal value 17 */
  gestaltSystemVersionBugFix      = $73797333;
  //};

//enum {
  gestaltToolboxTable           =  $74627474; //'tbtt' /*  OS trap table base  */
//};

//enum {
  gestaltTextEditVersion        = $74652020; //'te  ', /* TextEdit version number */
  gestaltTE1                    = 1;    //* TextEdit in MacIIci ROM */
  gestaltTE2                    = 2;    //* TextEdit with 6.0.4 Script Systems on MacIIci (Script bug fixes for MacIIci) */
  gestaltTE3                    = 3;    //* TextEdit with 6.0.4 Script Systems all but MacIIci */
  gestaltTE4                    = 4;    //* TextEdit in System 7.0 */
  gestaltTE5                    = 5;    //* TextWidthHook available in TextEdit */
//};

//enum {
  gestaltTE6                    = 6;    //* TextEdit with integrated TSMTE and improved UI */
//};

//enum {
  gestaltTEAttr                 = $74656174; //'teat'; /* TextEdit attributes */
  gestaltTEHasGetHiliteRgn      = 0;    //* TextEdit has TEGetHiliteRgn */
  gestaltTESupportsInlineInput  = 1;    //* TextEdit does Inline Input */
  gestaltTESupportsTextObjects  = 2;    //* TextEdit does Text Objects */
  gestaltTEHasWhiteBackground   = 3;    //* TextEdit supports overriding the TERec's background to white */
//};

//enum {
  gestaltTeleMgrAttr            = $74656c65; //'tele', /* Telephone manager attributes */
  gestaltTeleMgrPresent         = 0;
  gestaltTeleMgrPowerPCSupport  = 1;
  gestaltTeleMgrSoundStreams    = 2;
  gestaltTeleMgrAutoAnswer      = 3;
  gestaltTeleMgrIndHandset      = 4;
  gestaltTeleMgrSilenceDetect   = 5;
  gestaltTeleMgrNewTELNewSupport = 6;
//};

//enum {
  gestaltTermMgrAttr            = $7465726d; //'term', /* terminal mgr attributes */
  gestaltTermMgrPresent         = 0;
  gestaltTermMgrErrorString     = 2;
//};

//enum {
  gestaltThreadMgrAttr          = $74686473; //'thds', /* Thread Manager attributes */
  gestaltThreadMgrPresent       = 0;    //* bit true if Thread Mgr is present */
  gestaltSpecificMatchSupport   = 1;    //* bit true if Thread Mgr supports exact match creation option */
  gestaltThreadsLibraryPresent  = 2;    //* bit true if Thread Mgr shared library is present */
//};

//enum {
  gestaltTimeMgrVersion         = $746d6772; //'tmgr', /* time mgr version */
  gestaltStandardTimeMgr        = 1;    //* standard time mgr is present */
  gestaltRevisedTimeMgr         = 2;    //* revised time mgr is present */
  gestaltExtendedTimeMgr        = 3;    //* extended time mgr is present */
  gestaltNativeTimeMgr          = 4;    //* PowerPC native TimeMgr is present */
//};

//enum {
  gestaltTSMTEVersion           = $746d5456; //'tmTV',
  gestaltTSMTE1                 = $0100; //* Original version of TSMTE */
  gestaltTSMTE15                = $0150; //* System 8.0 */
  gestaltTSMTE152               = $0152; //* System 8.2 */
//};

//enum {
  gestaltTSMTEAttr              = $746d5445; //'tmTE',
  gestaltTSMTEPresent           = 0;
  gestaltTSMTE                  = 0;     //* gestaltTSMTE is old name for gestaltTSMTEPresent */
//};

//enum {
  gestaltAVLTreeAttr            = $74726565; //'tree', /* AVLTree utility routines attributes. */
  gestaltAVLTreePresentBit      = 0;    //* if set, then the AVL Tree routines are available. */
  gestaltAVLTreeSupportsHandleBasedTreeBit = 1; //* if set, then the AVL Tree routines can store tree data in a single handle */
  gestaltAVLTreeSupportsTreeLockingBit = 2; //* if set, the AVLLockTree() and AVLUnlockTree() routines are available. */
//};

//enum {
  gestaltALMAttr                = $74726970; //'trip', /* Settings Manager attributes (see also gestaltALMVers) */
  gestaltALMPresent             = 0;    //* bit true if ALM is available */
  gestaltALMHasSFGroup          = 1;    //* bit true if Put/Get/Merge Group calls are implmented */
  gestaltALMHasCFMSupport       = 2;    //* bit true if CFM-based modules are supported */
  gestaltALMHasRescanNotifiers  = 3;    //* bit true if Rescan notifications/events will be sent to clients */
//};

//enum {
  gestaltALMHasSFLocation       = gestaltALMHasSFGroup;
//};

//enum {
  gestaltTSMgrVersion           = $74736d76; //'tsmv', /* Text Services Mgr version, if present */
  gestaltTSMgr15                = $0150;
  gestaltTSMgr20                = $0200; //* Version 2.0 as of MacOSX 10.0 */
  gestaltTSMgr22                = $0220; //* Version 2.2 as of MacOSX 10.3 */
  gestaltTSMgr23                = $0230; //* Version 2.3 as of MacOSX 10.4 */
//};

//enum {
  gestaltTSMgrAttr              = $74736d61; //'tsma', /* Text Services Mgr attributes, if present */
  gestaltTSMDisplayMgrAwareBit  = 0;    //* TSM knows about display manager */
  gestaltTSMdoesTSMTEBit        = 1;    //* TSM has integrated TSMTE */
//};

//enum {
  gestaltSpeechAttr             = $74747363; //'ttsc', /* Speech Manager attributes */
  gestaltSpeechMgrPresent       = 0;    //* bit set indicates that Speech Manager exists */
  gestaltSpeechHasPPCGlue       = 1;     //* bit set indicates that native PPC glue for Speech Manager API exists */
//};

//enum {
  gestaltTVAttr                 = $74762020; //'tv  ', /* TV version */
  gestaltHasTVTuner             = 0;    //* supports Philips FL1236F video tuner */
  gestaltHasSoundFader          = 1;    //* supports Philips TEA6330 Sound Fader chip */
  gestaltHasHWClosedCaptioning  = 2;    //* supports Philips SAA5252 Closed Captioning */
  gestaltHasIRRemote            = 3;    //* supports CyclopsII Infra Red Remote control */
  gestaltHasVidDecoderScaler    = 4;    //* supports Philips SAA7194 Video Decoder/Scaler */
  gestaltHasStereoDecoder       = 5;    //* supports Sony SBX1637A-01 stereo decoder */
  gestaltHasSerialFader         = 6;    //* has fader audio in serial with system audio */
  gestaltHasFMTuner             = 7;    //* has FM Tuner from donnybrook card */
  gestaltHasSystemIRFunction    = 8;    //* Infra Red button function is set up by system and not by Video Startup */
  gestaltIRDisabled             = 9;    //* Infra Red remote is not disabled. */
  gestaltINeedIRPowerOffConfirm = 10;   //* Need IR power off confirm dialog. */
  gestaltHasZoomedVideo         = 11;   //* Has Zoomed Video PC Card video input. */
//};


//enum {
  gestaltATSUVersion            = $75697376; //'uisv',
  gestaltOriginalATSUVersion    = (1 shl 16); //* ATSUI version 1.0 */
  gestaltATSUUpdate1            = (2 shl 16); //* ATSUI version 1.1 */
  gestaltATSUUpdate2            = (3 shl 16); //* ATSUI version 1.2 */
  gestaltATSUUpdate3            = (4 shl 16); //* ATSUI version 2.0 */
  gestaltATSUUpdate4            = (5 shl 16); //* ATSUI version in Mac OS X - SoftwareUpdate 1-4 for Mac OS 10.0.1 - 10.0.4 */
  gestaltATSUUpdate5            = (6 shl 16); //* ATSUI version 2.3 in MacOS 10.1 */
  gestaltATSUUpdate6            = (7 shl 16); //* ATSUI version 2.4 in MacOS 10.2 */
  gestaltATSUUpdate7            = (8 shl 16); //* ATSUI version 2.5 in MacOS 10.3 */
//};

//enum {
  gestaltATSUFeatures           = $75697366; //'uisf',
  gestaltATSUTrackingFeature    = $00000001; //* feature introduced in ATSUI version 1.1 */
  gestaltATSUMemoryFeature      = $00000001; //* feature introduced in ATSUI version 1.1 */
  gestaltATSUFallbacksFeature   = $00000001; //* feature introduced in ATSUI version 1.1 */
  gestaltATSUGlyphBoundsFeature = $00000001; //* feature introduced in ATSUI version 1.1 */
  gestaltATSULineControlFeature = $00000001; //* feature introduced in ATSUI version 1.1 */
  gestaltATSULayoutCreateAndCopyFeature = $00000001; //* feature introduced in ATSUI version 1.1 */
  gestaltATSULayoutCacheClearFeature = $00000001; //* feature introduced in ATSUI version 1.1 */
  gestaltATSUTextLocatorUsageFeature = $00000002; //* feature introduced in ATSUI version 1.2 */
  gestaltATSULowLevelOrigFeatures = $00000004; //* first low-level features introduced in ATSUI version 2.0 */
  gestaltATSUFallbacksObjFeatures = $00000008; //* feature introduced - ATSUFontFallbacks objects introduced in ATSUI version 2.3 */
  gestaltATSUIgnoreLeadingFeature = $00000008; //* feature introduced - kATSLineIgnoreFontLeading LineLayoutOption introduced in ATSUI version 2.3 */
  gestaltATSUByCharacterClusterFeature = $00000010; //* ATSUCursorMovementTypes introduced in ATSUI version 2.4 */
  gestaltATSUAscentDescentControlsFeature = $00000010; //* attributes introduced in ATSUI version 2.4 */
  gestaltATSUHighlightInactiveTextFeature = $00000010; //* feature introduced in ATSUI version 2.4 */
  gestaltATSUPositionToCursorFeature = $00000010; //* features introduced in ATSUI version 2.4 */
  gestaltATSUBatchBreakLinesFeature = $00000010; //* feature introduced in ATSUI version 2.4 */
  gestaltATSUTabSupportFeature  = $00000010; //* features introduced in ATSUI version 2.4 */
  gestaltATSUDirectAccess       = $00000010; //* features introduced in ATSUI version 2.4 */
  gestaltATSUDecimalTabFeature  = $00000020; //* feature introduced in ATSUI version 2.5 */
  gestaltATSUBiDiCursorPositionFeature = $00000020; //* feature introduced in ATSUI version 2.5 */
  gestaltATSUNearestCharLineBreakFeature = $00000020; //* feature introduced in ATSUI version 2.5 */
  gestaltATSUHighlightColorControlFeature = $00000020; //* feature introduced in ATSUI version 2.5 */
  gestaltATSUUnderlineOptionsStyleFeature = $00000020; //* feature introduced in ATSUI version 2.5 */
  gestaltATSUStrikeThroughStyleFeature = $00000020; //* feature introduced in ATSUI version 2.5 */
  gestaltATSUDropShadowStyleFeature = $00000020; //* feature introduced in ATSUI version 2.5 */
//};

//enum {
  gestaltUSBAttr                = $75736220; // 'usb ', /* USB Attributes */
  gestaltUSBPresent             = 0;    //* USB Support available */
  gestaltUSBHasIsoch            = 1;     //* USB Isochronous features available */
//};

//enum {
  gestaltUSBVersion             = $75736276; //'usbv' /* USB version */
//};

//enum {
  gestaltVersion                = $76657273; //'vers', /* gestalt version */
  gestaltValueImplementedVers   = 5;     //* version of gestalt where gestaltValue is implemented. */
//};

//enum {
  gestaltVIA1Addr               = $76696131; //'via1' /* via 1 base address  */
//};

//enum {
  gestaltVIA2Addr               = $76696132; //'via2' /* via 2 base address  */
//};

//enum {
  gestaltVMAttr                 = $766d2020; //'vm  ', /* virtual memory attributes */
  gestaltVMPresent              = 0;    //* true if virtual memory is present */
  gestaltVMHasLockMemoryForOutput = 1;  //* true if LockMemoryForOutput is available */
  gestaltVMFilemappingOn        = 3;    //* true if filemapping is available */
  gestaltVMHasPagingControl     = 4;    //* true if MakeMemoryResident, MakeMemoryNonResident, FlushMemory, and ReleaseMemoryData are available */
//};

//enum {
  gestaltVMInfoType             = $766d696e; // 'vmin', /* Indicates how the Finder should display information about VM in */
                                        //* the Finder about box. */
  gestaltVMInfoSizeStorageType  = 0;    //* Display VM on/off, backing store size and name */
  gestaltVMInfoSizeType         = 1;    //* Display whether VM is on or off and the size of the backing store */
  gestaltVMInfoSimpleType       = 2;    //* Display whether VM is on or off */
  gestaltVMInfoNoneType         = 3;    //* Display no VM information */
//};

//enum {
  gestaltVMBackingStoreFileRefNum = $766d6273; //'vmbs'; //* file refNum of virtual memory's main backing store file (returned in low word of result) */
//};



//enum {
  gestaltALMVers                = $77616c6b; //'walk' /* Settings Manager version (see also gestaltALMAttr) */
//};

//enum {
  gestaltWindowMgrAttr          = $77696e64; //'wind', /* If this Gestalt exists, the Mac OS 8.5 Window Manager is installed*/
  gestaltWindowMgrPresent       = (1 shl 0); //* NOTE: this is a bit mask, whereas all other Gestalt constants of*/
                                        //* this type are bit index values.   Universal Interfaces 3.2 slipped*/
                                        //* out the door with this mistake.*/
  gestaltWindowMgrPresentBit    = 0;    //* bit number*/
  gestaltExtendedWindowAttributes = 1;  //* Has ChangeWindowAttributes; GetWindowAttributes works for all windows*/
  gestaltExtendedWindowAttributesBit = 1; //* Has ChangeWindowAttributes; GetWindowAttributes works for all windows*/
  gestaltHasFloatingWindows     = 2;    //* Floating window APIs work*/
  gestaltHasFloatingWindowsBit  = 2;    //* Floating window APIs work*/
  gestaltHasWindowBuffering     = 3;    //* This system has buffering available*/
  gestaltHasWindowBufferingBit  = 3;    //* This system has buffering available*/
  gestaltWindowLiveResizeBit    = 4;    //* live resizing of windows is available*/
  gestaltWindowMinimizeToDockBit = 5;   //* windows minimize to the dock and do not windowshade (Mac OS X)*/
  gestaltHasWindowShadowsBit    = 6;    //* windows have shadows*/
  gestaltSheetsAreWindowModalBit = 7;   //* sheet windows are modal only to their parent window*/
  gestaltFrontWindowMayBeHiddenBit = 8; //* FrontWindow and related APIs will return the front window even when the app is hidden*/
                                        //* masks for the above bits*/
  gestaltWindowMgrPresentMask   = (1 shl gestaltWindowMgrPresentBit);
  gestaltExtendedWindowAttributesMask = (1 shl gestaltExtendedWindowAttributesBit);
  gestaltHasFloatingWindowsMask = (1 shl gestaltHasFloatingWindowsBit);
  gestaltHasWindowBufferingMask = (1 shl gestaltHasWindowBufferingBit);
  gestaltWindowLiveResizeMask   = (1 shl gestaltWindowLiveResizeBit);
  gestaltWindowMinimizeToDockMask = (1 shl gestaltWindowMinimizeToDockBit);
  gestaltHasWindowShadowsMask   = (1 shl gestaltHasWindowShadowsBit);
  gestaltSheetsAreWindowModalMask = (1 shl gestaltSheetsAreWindowModalBit);
  gestaltFrontWindowMayBeHiddenMask = (1 shl gestaltFrontWindowMayBeHiddenBit);
//};

//enum {
  gestaltHasSingleWindowModeBit = 8;    //* This system supports single window mode*/
  gestaltHasSingleWindowModeMask = (1 shl gestaltHasSingleWindowModeBit);
//};


{* gestaltX86Features is a convenience for 'cpuid' instruction.  Note
   that even though the processor may support a specific feature, the
   OS may not support all of these features.  These bitfields
   correspond directly to the bits returned by cpuid *}
//enum {
  gestaltX86Features            = $78383666; //'x86f',
  gestaltX86HasFPU              = 0;    //* has an FPU that supports the 387 instructions*/
  gestaltX86HasVME              = 1;    //* supports Virtual-8086 Mode Extensions*/
  gestaltX86HasDE               = 2;    //* supports I/O breakpoints (Debug Extensions)*/
  gestaltX86HasPSE              = 3;    //* supports 4-Mbyte pages (Page Size Extension)*/
  gestaltX86HasTSC              = 4;    //* supports RTDSC instruction (Time Stamp Counter)*/
  gestaltX86HasMSR              = 5;    //* supports Model Specific Registers*/
  gestaltX86HasPAE              = 6;    //* supports physical addresses > 32 bits (Physical Address Extension)*/
  gestaltX86HasMCE              = 7;    //* supports Machine Check Exception*/
  gestaltX86HasCX8              = 8;    //* supports CMPXCHG8 instructions (Compare Exchange 8 bytes)*/
  gestaltX86HasAPIC             = 9;    //* contains local APIC*/
  gestaltX86HasSEP              = 11;   //* supports fast system call (SysEnter Present)*/
  gestaltX86HasMTRR             = 12;   //* supports Memory Type Range Registers*/
  gestaltX86HasPGE              = 13;   //* supports Page Global Enable*/
  gestaltX86HasMCA              = 14;   //* supports Machine Check Architecture*/
  gestaltX86HasCMOV             = 15;   //* supports CMOVcc instruction (Conditional Move).*/
                                        //* If FPU bit is also set, supports FCMOVcc and FCOMI, too*/
  gestaltX86HasPAT              = 16;   //* supports Page Attribute Table*/
  gestaltX86HasPSE36            = 17;   //* supports 36-bit Page Size Extension*/
  gestaltX86HasPSN              = 18;   //* Processor Serial Number*/
  gestaltX86HasCLFSH            = 19;   //* CLFLUSH Instruction supported*/
  gestaltX86Serviced20          = 20;   //* do not count on this bit value*/
  gestaltX86HasDS               = 21;   //* Debug Store*/
  gestaltX86ResACPI             = 22;   //* Thermal Monitor, SW-controlled clock*/
  gestaltX86HasMMX              = 23;   //* supports MMX instructions*/
  gestaltX86HasFXSR             = 24;   //* Supports FXSAVE and FXRSTOR instructions (fast FP save/restore)*/
  gestaltX86HasSSE              = 25;   //* Streaming SIMD extensions*/
  gestaltX86HasSSE2             = 26;   //* Streaming SIMD extensions 2*/
  gestaltX86HasSS               = 27;   //* Self-Snoop*/
  gestaltX86HasHTT              = 28;   //* Hyper-Threading Technology*/
  gestaltX86HasTM               = 29;   //* Thermal Monitor*/
//};

{* 'cpuid' now returns a 64 bit value, and the following 
    gestalt selector and field definitions apply
    to the extended form of this instruction *}
//enum {
  gestaltX86AdditionalFeatures  = $78383661; //'x86a',
  gestaltX86HasSSE3             = 0;    //* Prescott New Inst.*/
  gestaltX86HasMONITOR          = 3;    //* Monitor/mwait*/
  gestaltX86HasDSCPL            = 4;    //* Debug Store CPL*/
  gestaltX86HasVMX              = 5;    //* VMX*/
  gestaltX86HasSMX              = 6;    //* SMX*/
  gestaltX86HasEST              = 7;    //* Enhanced SpeedsTep (GV3)*/
  gestaltX86HasTM2              = 8;    //* Thermal Monitor 2*/
  gestaltX86HasSupplementalSSE3 = 9;    //* Supplemental SSE3 instructions*/
  gestaltX86HasCID              = 10;   //* L1 Context ID*/
  gestaltX86HasCX16             = 13;   //* CmpXchg16b instruction*/
  gestaltX86HasxTPR             = 14;    //* Send Task PRiority msgs*/
//};

//enum {
  gestaltTranslationAttr        = $786c6174; //'xlat', /* Translation Manager attributes */
  gestaltTranslationMgrExists   = 0;    //* True if translation manager exists */
  gestaltTranslationMgrHintOrder = 1;   //* True if hint order reversal in effect */
  gestaltTranslationPPCAvail    = 2;
  gestaltTranslationGetPathAPIAvail = 3;
//};

//enum {
  gestaltExtToolboxTable        = $78747474; //'xttt' /* Extended Toolbox trap table base */
//};

//enum {
  gestaltUSBPrinterSharingVersion = $7a616b20; //'zak ', /* USB Printer Sharing Version*/
  gestaltUSBPrinterSharingVersionMask = $0000FFFF; //* mask for bits in version*/ 
  gestaltUSBPrinterSharingAttr  =  $7a616b20; //'zak ', /* USB Printer Sharing Attributes*/
  gestaltUSBPrinterSharingAttrMask = TIdC_INT($FFFF0000); //*  mask for attribute bits*/
  gestaltUSBPrinterSharingAttrRunning = TIdC_INT($80000000); //* printer sharing is running*/
  gestaltUSBPrinterSharingAttrBooted = $40000000; //* printer sharing was installed at boot time*/
//};

//*WorldScript settings;*/
//enum {
//  gestaltWorldScriptIIVersion   = 'doub',
  gestaltWorldScriptIIVersion   = $646f7562;
//  gestaltWorldScriptIIAttr      = $77736174; //'wsat',
  gestaltWSIICanPrintWithoutPrGeneralBit = 0; //* bit 0 is on if WS II knows about PrinterStatus callback */
//};

{$EXTERNALSYM Gestalt}
function Gestalt(selector : OSType; var response : SInt32 ) : OSErr {AVAILABLE_MAC_OS_X_VERSION_10_0_AND_LATER}; cdecl; 
 {$ENDIF}

  {$IFDEF LINUX}
  //* UDP socket options */
  {$EXTERNALSYM UDP_CORK}
  UDP_CORK	= 1;	//* Never send partially complete segments */
  {$EXTERNALSYM UDP_ENCAP}
  UDP_ENCAP	= 100;	//* Set the socket to accept encapsulated packets */

//* UDP encapsulation types */
  {$EXTERNALSYM UDP_ENCAP_ESPINUDP_NON_IKE}
  UDP_ENCAP_ESPINUDP_NON_IKE =	1; //* draft-ietf-ipsec-nat-t-ike-00/01 */
    {$EXTERNALSYM UDP_ENCAP_ESPINUDP}
  UDP_ENCAP_ESPINUDP	= 2; //* draft-ietf-ipsec-udp-encaps-06 */
  {$ENDIF}

implementation
  {$IFDEF DARWIN}


function  TCPOPT_CC_HDR(const ccopt : Integer) : Integer; inline;
begin
    Result := (TCPOPT_NOP shl 24) or
      (TCPOPT_NOP shl 16) or
      (ccopt shl 8) or
      TCPOLEN_CC;
end;

function Gestalt; external CarbonCoreLib name '_Gestalt';
  {$ENDIF}

end.
