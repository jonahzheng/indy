unit IdZLibHeaders;

{
 zlibpas -- Pascal interface to the zlib data compression library
 * Gabriel Corneanu (gabrielcorneanu(AT)yahoo.com)
       Derived from original sources by Bob Dellaca and Cosmin Truta.
   - TZStreamType
   - deflateInitEx
   - inflateInitEx
*}
{
JPM - note that I made dynamic loading for FreePascal (since that still may not
suppport external .obj files properly.  It also makes it easier to support several
different platforms in one file.
}

interface
{$i IdCompilerDefines.inc}
{$IFNDEF FPC}
{$IFDEF WIN32}
  {$define STATICLOAD}
{$ENDIF}
{$ENDIF}
{$IFNDEF STATICLOAD}
uses
  IdException;
{$ENDIF}
const
  ZLIB_VERSION = '1.2.3';

type
{JPM - I made some types from our old header to the new C types defined originally
 for compatability.}
  alloc_func = function(opaque: Pointer; items, size: Integer): Pointer; cdecl;
  TAlloc     = alloc_func;
  free_func  = procedure(opaque, address: Pointer); cdecl;
  TFree      = free_func;
  in_func    = function(opaque: Pointer; var buf: PByte): Integer; cdecl;
  TInFunc    = in_func;
  out_func   = function(opaque: Pointer; buf: PByte; size: Integer): Integer; cdecl;
  TOutFunc   = out_func;

  z_streamp = ^z_stream;
  z_stream = packed record
    next_in: PChar;       (* next input byte *)
    avail_in: Integer;    (* number of bytes available at next_in *)
    total_in: LongInt;    (* total nb of input bytes read so far *)

    next_out: PChar;      (* next output byte should be put there *)
    avail_out: Integer;   (* remaining free space at next_out *)
    total_out: LongInt;   (* total nb of bytes output so far *)

    msg: PChar;           (* last error message, NULL if no error *)
    state: Pointer;       (* not visible by applications *)

    zalloc: alloc_func;   (* used to allocate the internal state *)
    zfree: free_func;     (* used to free the internal state *)
    opaque: Pointer;      (* private data object passed to zalloc and zfree *)

    data_type: Integer;   (* best guess about the data type: ascii or binary *)
    adler: LongInt;       (* adler32 value of the uncompressed data *)
    reserved: LongInt;    (* reserved for future use *)
  end;
  TZStreamRec = z_stream;
  PZStreamRec = z_streamp;

(*
  gzip header information passed to and from zlib routines.  See RFC 1952
  for more details on the meanings of these fields.
*)
  gz_headerp = ^gz_header;
  gz_header = packed record
    text       : integer;   //* true if compressed data believed to be text */
    time       : Cardinal;  //* modification time */
    xflags     : integer;   //* extra flags (not used when writing a gzip file) */
    os         : integer;   //* operating system */
    extra      : PByte;     //* pointer to extra field or Z_NULL if none */
    extra_len  : Cardinal;  //* extra field length (valid if extra != Z_NULL) */
    extra_max  : Cardinal;  //* space at extra (only when reading header) */
    name       : PChar;     //* pointer to zero-terminated file name or Z_NULL */
    name_max   : Cardinal;  //* space at name (only when reading header) */
    comment    : PChar;     //* pointer to zero-terminated comment or Z_NULL */
    comm_max   : Cardinal;  //* space at comment (only when reading header) */
    hcrc       : integer;   //* true if there was or will be a header crc */
    done       : integer;   //* true when done reading gzip header (not used when writing a gzip file) */
  end;
  PgzHeaderRec = gz_headerp;
  TgzHeaderRec = gz_header;

type
  TZStreamType = (
    zsZLib,  //standard zlib stream
    zsGZip,  //gzip stream
    zsRaw);  //raw stream (without any header)

(* constants *)
const
  Z_NO_FLUSH      = 0;
  Z_PARTIAL_FLUSH = 1;
  Z_SYNC_FLUSH    = 2;
  Z_FULL_FLUSH    = 3;
  Z_FINISH        = 4;
  Z_BLOCK         = 5;
  
  Z_OK            =  0;
  Z_STREAM_END    =  1;
  Z_NEED_DICT     =  2;
  Z_ERRNO         = -1;
  Z_STREAM_ERROR  = -2;
  Z_DATA_ERROR    = -3;
  Z_MEM_ERROR     = -4;
  Z_BUF_ERROR     = -5;
  Z_VERSION_ERROR = -6;

  Z_NO_COMPRESSION       =  0;
  Z_BEST_SPEED           =  1;
  Z_BEST_COMPRESSION     =  9;
  Z_DEFAULT_COMPRESSION  = -1;

  Z_FILTERED            = 1;
  Z_HUFFMAN_ONLY        = 2;
  Z_RLE                 = 3;
  Z_DEFAULT_STRATEGY    = 0;

  Z_BINARY   = 0;
  Z_ASCII    = 1;
  Z_UNKNOWN  = 2;

  Z_DEFLATED = 8;

  MAX_WBITS = 15; { 32K LZ77 window }

  MAX_MEM_LEVEL = 9;
  DEF_MEM_LEVEL = 8; { if MAX_MEM_LEVEL > 8 }
  
function inflateInit(var strm: z_stream): Integer;
function inflateBackInit(var strm: z_stream;
                         windowBits: Integer; window: PChar): Integer;
function inflateInit2(var strm: z_stream; windowBits: Integer): Integer;
function deflateInit(var strm: z_stream; level: Integer): Integer;
function deflateInit2(var strm: z_stream; level, method, windowBits,
                      memLevel, strategy: Integer): Integer;

function deflateInitEx(var strm: z_stream; level: Integer; streamtype: TZStreamType = zsZLib): Integer;
function inflateInitEx(var strm: z_stream; streamtype: TZStreamType = zsZLib): Integer;


{$IFNDEF STATICLOAD}
type
  EIdZLibStubError = class(EIdException)
  protected
    FError : DWORD;
    FErrorMessage : String;
    FTitle : String;
  public
    constructor Build(const ATitle : String; AError : DWORD);
    property Error : DWORD read FError;
    property ErrorMessage : String read FErrorMessage;
    property Title : String read FTitle;
  end;
  
type
  LPN_adler32 = function (adler: LongInt; 
    const buf: PChar; len: Integer): LongInt; cdecl;
  LPN_compress = function (dest: PChar; var destLen: LongInt;
    const source: PChar; sourceLen: LongInt): Integer;cdecl;
  LPN_compress2 = function(dest: PChar; var destLen: LongInt;
                  const source: PChar; sourceLen: LongInt;
                  level: Integer): Integer; cdecl;

  LPN_compressBound = function (sourceLen: LongInt): LongInt;cdecl;
  LPN_crc32 = function (crc: LongInt; const buf: PChar; 
                len: Integer): LongInt; cdecl;
  LPN_deflate = function (var strm: z_stream; flush: Integer): Integer; cdecl;
  LPN_deflateBound = function (var strm: z_stream; 
    sourceLen: LongInt): LongInt; cdecl;
  LPN_deflateCopy = function (var dest, source: z_stream): Integer; cdecl;
  LPN_deflateEnd = function (var strm: z_stream): Integer; cdecl;
  LPN_deflateInit_ = function (var strm: z_stream; level: Integer;
                      const version: PChar; stream_size: Integer): Integer;cdecl;
  LPN_deflateInit2_ = function (var strm: z_stream;
                       level, method, windowBits, memLevel, strategy: Integer;
                       const version: PChar; stream_size: Integer): Integer;cdecl;
  LPN_deflateParams = function (var strm: z_stream; level, strategy: Integer): Integer; cdecl;

  LPN_deflatePrime = function (var strm: z_stream; bits, value: Integer): Integer; cdecl;
  LPN_deflateTune = function (var strm : z_stream; good_length : Integer;
    max_lazy : Integer; nice_length : Integer; max_chain : Integer) : Integer; cdecl;
  LPN_deflateReset = function (var strm: z_stream): Integer; cdecl;
  LPN_deflateSetDictionary = function (var strm: z_stream; const dictionary: PChar;
                              dictLength: Integer): Integer; cdecl;
  LPN_inflate = function (var strm: z_stream; flush: Integer): Integer; cdecl;
  LPN_inflateBack = function (var strm: z_stream; in_fn: in_func; in_desc: Pointer;
                     out_fn: out_func; out_desc: Pointer): Integer; cdecl;   
  LPN_inflateBackEnd = function (var strm: z_stream): Integer; cdecl;     

  LPN_inflateBackInit_ = function (var strm: z_stream;
                          windowBits: Integer; window: PChar;
                          const version: PChar; stream_size: Integer): Integer; cdecl;
  LPN_inflateCopy = function (var dest, source: z_stream): Integer; cdecl;
  LPN_inflateEnd = function (var strm: z_stream): Integer; cdecl;
  LPN_inflateInit_ = function (var strm: z_stream; const version: PChar;
                      stream_size: Integer): Integer; cdecl;
  LPN_inflateInit2_ = function (var strm: z_stream; windowBits: Integer;
                       const version: PChar; stream_size: Integer): Integer;cdecl;
  LPN_inflateReset = function (var strm: z_stream): Integer; cdecl;
  LPN_inflateSetDictionary = function (var strm: z_stream; const dictionary: PChar;
                              dictLength: Integer): Integer; cdecl;

  LPN_inflateSync = function (var strm: z_stream): Integer; cdecl;
  LPN_uncompress = function (dest: PChar; var destLen: LongInt;
                   const source: PChar; sourceLen: LongInt): Integer;cdecl;
  LPN_zlibCompileFlags = function : LongInt; cdecl;
  LPN_zError = function (err : Integer) : PChar; cdecl;

  LPN_inflateSyncPoint = function (var z : TZStreamRec) : Integer; cdecl;
 

  LPN_get_crc_table = function : PLongInt; cdecl;
  
  LPN_zlibVersion = function : PChar; cdecl;

  LPN_deflateSetHeader = function (var strm: z_stream; var head: gz_header): integer; cdecl;
  LPN_inflateGetHeader = function (var strm: z_stream; var head: gz_header): integer; cdecl;
{Vars}
var
  adler32 : LPN_adler32 = nil;
  compress : LPN_compress = nil;
  compress2 : LPN_compress2 = nil;
  compressBound : LPN_compressBound = nil;
  crc32 : LPN_crc32 = nil;
  deflate : LPN_deflate = nil; 
  deflateBound : LPN_deflateBound = nil;
  deflateCopy : LPN_deflateCopy = nil;
  deflateEnd : LPN_deflateEnd = nil;
  deflateInit_ : LPN_deflateInit_ = nil; 
  deflateInit2_ : LPN_deflateInit2_ = nil;
  deflateParams : LPN_deflateParams = nil;
  
  deflatePrime :LPN_deflatePrime = nil;
  deflateTune : LPN_deflateTune = nil;
  deflateReset : LPN_deflateReset = nil;
  deflateSetDictionary : LPN_deflateSetDictionary = nil;
  inflate : LPN_inflate = nil; 
  inflateBack : LPN_inflateBack = nil;
  inflateBackEnd : LPN_inflateBackEnd = nil;
  inflateEnd : LPN_inflateEnd = nil; 
  inflateBackInit_ : LPN_inflateBackInit_ = nil;
  inflateCopy : LPN_inflateCopy = nil;
  inflateInit_ : LPN_inflateInit_ = nil;
  inflateInit2_ : LPN_inflateInit2_ = nil;
  inflateReset : LPN_inflateReset = nil;
  inflateSetDictionary : LPN_inflateSetDictionary = nil; 
  inflateSync : LPN_inflateSync = nil; 
  uncompress : LPN_uncompress = nil; 
  zlibCompileFlags : LPN_zlibCompileFlags = nil;
  zError : LPN_zError; 
  inflateSyncPoint : LPN_inflateSyncPoint;
  get_crc_table : LPN_get_crc_table;
  
  zlibVersion : LPN_zlibVersion;
  deflateSetHeader : LPN_deflateSetHeader;
  inflateGetHeader : LPN_inflateGetHeader;

{$ELSE}
(* basic functions *)
function zlibVersion: PChar;

function deflate(var strm: z_stream; flush: Integer): Integer;
function deflateEnd(var strm: z_stream): Integer;

function inflate(var strm: z_stream; flush: Integer): Integer;
function inflateEnd(var strm: z_stream): Integer;

(* advanced functions *)

function deflateSetDictionary(var strm: z_stream; const dictionary: PChar;
                              dictLength: Integer): Integer;
function deflateCopy(var dest, source: z_stream): Integer;
function deflateReset(var strm: z_stream): Integer;
function deflateParams(var strm: z_stream; level, strategy: Integer): Integer;
{JPM Addition}
function deflateTune(var strm : z_stream; good_length : Integer;
  max_lazy : Integer; nice_length : Integer; max_chain : Integer) : Integer;
function deflateBound(var strm: z_stream; sourceLen: LongInt): LongInt;
function deflatePrime(var strm: z_stream; bits, value: Integer): Integer;

function inflateSetDictionary(var strm: z_stream; const dictionary: PChar;
                              dictLength: Integer): Integer;
function inflateSync(var strm: z_stream): Integer;
function inflateCopy(var dest, source: z_stream): Integer;
function inflateReset(var strm: z_stream): Integer;

function inflateBack(var strm: z_stream; in_fn: in_func; in_desc: Pointer;
                     out_fn: out_func; out_desc: Pointer): Integer;
function inflateBackEnd(var strm: z_stream): Integer;

function zlibCompileFlags: LongInt;

{JPM Additional functions}
function  zError (err : Integer) : PChar;
function inflateSyncPoint(var z : TZStreamRec) : Integer;
//const uLongf * get_crc_table (void);

function  get_crc_table : PLongInt;
{end JPM additions}

(* utility functions *)
function compress(dest: PChar; var destLen: LongInt;
                  const source: PChar; sourceLen: LongInt): Integer;
function compress2(dest: PChar; var destLen: LongInt;
                  const source: PChar; sourceLen: LongInt;
                  level: Integer): Integer;
function compressBound(sourceLen: LongInt): LongInt;
function uncompress(dest: PChar; var destLen: LongInt;
                    const source: PChar; sourceLen: LongInt): Integer;

(* checksum functions *)
function adler32(adler: LongInt; const buf: PChar; len: Integer): LongInt;
function crc32(crc: LongInt; const buf: PChar; len: Integer): LongInt;

(* various hacks, don't look :) *)
function deflateInit_(var strm: z_stream; level: Integer;
                      const version: PChar; stream_size: Integer): Integer;
function inflateInit_(var strm: z_stream; const version: PChar;
                      stream_size: Integer): Integer;
function deflateInit2_(var strm: z_stream;
                       level, method, windowBits, memLevel, strategy: Integer;
                       const version: PChar; stream_size: Integer): Integer;
function inflateInit2_(var strm: z_stream; windowBits: Integer;
                       const version: PChar; stream_size: Integer): Integer;
function inflateBackInit_(var strm: z_stream;
                          windowBits: Integer; window: PChar;
                          const version: PChar; stream_size: Integer): Integer;

function deflateSetHeader(var strm: z_stream; var head: gz_header): integer;
function inflateGetHeader(var strm: z_stream; var head: gz_header): integer;
{$ENDIF}
function  zlibAllocMem(AppData: Pointer; Items, Size: Integer): Pointer; cdecl;
procedure zlibFreeMem(AppData, Block: Pointer); cdecl;

function Load : Boolean;
procedure Unload;
function Loaded : Boolean;

implementation
uses
  SysUtils
  {$IFNDEF STATICLOAD}
  , IdZLibConst
  {$ENDIF}
  {$IFDEF KYLIX}
  , libc;
  {$ENDIF}
  {$IFDEF FPC}
    {$IFDEF USELIBC}
    , libc
    {$ENDIF}
    , DynLibs // better add DynLibs only for fpc
  {$ENDIF};

{$IFDEF STATICLOAD}
{$L adler32.obj}
{$L compress.obj}
{$L crc32.obj}
{$L deflate.obj}
{$L infback.obj}
{$L inffast.obj}
{$L inflate.obj}
{$L inftrees.obj}
{$L trees.obj}
{$L uncompr.obj}
{$L zutil.obj}

function adler32; external;
function compress; external;
function compress2; external;
function compressBound; external;
function crc32; external;
function deflate; external;
function deflateBound; external;
function deflateCopy; external;
function deflateEnd; external;
function deflateInit_; external;
function deflateInit2_; external;
function deflateParams; external;
function deflatePrime; external;
function deflateTune; external;
function deflateReset; external;
function deflateSetDictionary; external;
function inflate; external;
function inflateBack; external;
function inflateBackEnd; external;
function inflateBackInit_; external;
function inflateCopy; external;
function inflateEnd; external;
function inflateInit_; external;
function inflateInit2_; external;
function inflateReset; external;
function inflateSetDictionary; external;
function inflateSync; external;
function uncompress; external;
function zlibCompileFlags; external;
function  zError (err : Integer) : PChar;
  external;

function inflateSyncPoint(var z : TZStreamRec) : Integer;
  external;

function  get_crc_table : PLongInt;
  external;
function zlibVersion; external;
function deflateSetHeader; external;
function inflateGetHeader; external;
{$ELSE}
var
  hZLib    : TlibHandle = 0;
  
const
  {$IFDEF UNIX} 
   libzlib = 'libz.so.1';
  {$ENDIF}
  {$ifdef netware}  {zlib.nlm comes with netware6}
   libzlib='zlib';
  {$ENDIF}
  {$IFDEF WIN32}
  //Note that this is the official ZLIB1 .DLL from the http://www.zlib.net/
  libzlib='zlib1.dll'; 
  {$ENDIF}
  
constructor EIdZLibStubError.Build(const ATitle : String; AError : DWORD);
begin
  FTitle := ATitle;
  FError := AError;
  if AError = 0 then begin
    inherited Create(ATitle);
  end else
  begin
    FErrorMessage := SysUtils.SysErrorMessage(AError);
    inherited Create(ATitle + ': ' + FErrorMessage);    {Do not Localize}
  end;
end;
  
function FixupStub(hDll: THandle; const AName: string):Pointer;
begin
  if hDll = 0 then begin
    EIdZLibStubError.Build(Format(RSZLibCallError, [AName]), 0);
  end;

  Result := GetProcAddress(hDll, PChar(AName));
  if Result = nil then begin
    EIdZLibStubError.Build(Format(RSZLibCallError, [AName]), 10022);
  end;
end;
 
function stub_adler32(adler: LongInt; const buf: PChar; len: Integer): LongInt; cdecl;
begin
  adler32 := FixupStub(hZLib, 'adler32'); {Do not Localize}
  Result := adler32(adler, buf, len);
end;

function stub_compress(dest: PChar; var destLen: LongInt;
    const source: PChar; sourceLen: LongInt): Integer;cdecl;
begin
  compress := FixupStub(hZLib, 'compress'); {Do not Localize}
  Result := compress(dest,destLen,source,sourceLen);
end;

function stub_compress2(dest: PChar; var destLen: LongInt;
                  const source: PChar; sourceLen: LongInt;
                  level: Integer): Integer; cdecl;
begin
  compress2 := FixupStub(hZLib, 'compress2'); {Do not Localize}
  Result := compress2(dest, destLen, source, sourceLen, level);
end;

function stub_compressBound (sourceLen: LongInt): LongInt; cdecl;
begin
  compressBound := FixupStub(hZLib, 'compressBound'); {Do not Localize}
  Result := compressBound(sourcelen);
end;

function stub_crc32(crc: LongInt; const buf: PChar; 
                len: Integer): LongInt; cdecl;
begin
  crc32 := FixupStub(hZLib, 'crc32'); {Do not Localize}
  Result := crc32(crc, buf, len);
end;

function stub_deflate(var strm: z_stream; flush: Integer): Integer; cdecl;
begin
  deflate := FixupStub(hZLib, 'deflate'); {Do not Localize}
  Result := deflate(strm, flush);
end;

function stub_deflateBound(var strm: z_stream; 
    sourceLen: LongInt): LongInt; cdecl;
begin
  deflateBound := FixupStub(hZLib, 'deflateBound'); {Do not Localize}
  Result := deflateBound(strm, sourceLen);
end;

function stub_deflateCopy(var dest, source: z_stream): Integer; cdecl;
begin
  deflateCopy := FixupStub(hZLib, 'deflateCopy'); {Do not Localize}
  Result := deflateCopy(dest, source);
end;

function stub_deflateEnd(var strm: z_stream): Integer; cdecl;
begin
  deflateEnd := FixupStub(hZLib, 'deflateEnd'); {Do not Localize}
  Result := deflateEnd(strm);
end;

function stub_deflateInit_(var strm: z_stream; level: Integer;
                      const version: PChar; stream_size: Integer): Integer;cdecl;
begin
  deflateInit_ := FixupStub(hZLib, 'deflateInit_'); {Do not Localize}
  Result := deflateInit_(strm, level, version, stream_size);
end;                

function stub_deflateInit2_(var strm: z_stream;
                       level, method, windowBits, memLevel, strategy: Integer;
                       const version: PChar; stream_size: Integer): Integer;cdecl;
begin
  deflateInit2_ := FixupStub(hZLib, 'deflateInit2_'); {Do not Localize}
  Result := deflateInit2_(strm,level, method, windowBits, memLevel, strategy,
                       version, stream_size);
end;

function stub_deflateParams (var strm: z_stream; level, strategy: Integer): Integer; cdecl;
begin
  deflateParams := FixupStub(hZLib, 'deflateParams'); {Do not Localize}
  Result := deflateParams (strm, level, strategy);
end;

function stub_deflatePrime (var strm: z_stream; bits, value: Integer): Integer; cdecl;
begin
  deflatePrime := FixupStub(hZLib, 'deflatePrime'); {Do not Localize}
  Result := deflateParams (strm, bits, value);
end;

function stub_deflateTune(var strm : z_stream; good_length : Integer;
    max_lazy : Integer; nice_length : Integer; max_chain : Integer) : Integer; cdecl;
begin
  deflateTune := FixupStub(hZLib, 'deflateTune'); {Do not Localize}
  Result := deflateTune(strm, good_length, max_lazy, nice_length, max_chain) ;
end;

function stub_deflateReset (var strm: z_stream): Integer; cdecl;
begin
  deflateReset := FixupStub(hZLib, 'deflateReset'); {Do not Localize}
  Result := deflateReset(strm);
end;
  
function stub_deflateSetDictionary(var strm: z_stream; const dictionary: PChar;
                              dictLength: Integer): Integer; cdecl;
begin
  deflateSetDictionary := FixupStub(hZLib, 'deflateSetDictionary'); {Do not Localize}
  Result := deflateSetDictionary(strm, dictionary, dictLength);
end;

function stub_inflate(var strm: z_stream; flush: Integer): Integer; cdecl;
begin
  inflate := FixupStub(hZLib, 'inflate'); {Do not Localize}
  Result := inflate(strm, flush);
end;

function stub_inflateBack(var strm: z_stream; in_fn: in_func; in_desc: Pointer;
                     out_fn: out_func; out_desc: Pointer): Integer; cdecl;  
begin
  inflateBack := FixupStub(hZLib, 'inflateBack'); {Do not Localize}
  Result := inflateBack(strm, in_fn, in_desc, out_fn, out_desc);
end;
 
function stub_inflateBackEnd(var strm: z_stream): Integer; cdecl;     
begin
  inflateBackEnd := FixupStub(hZLib, 'inflateBackEnd'); {Do not Localize}
  Result := inflateBackEnd(strm);
end;

function stub_inflateEnd(var strm: z_stream): Integer; cdecl;
begin
  inflateEnd := FixupStub(hZLib, 'inflateEnd'); {Do not Localize}
  Result := inflateEnd(strm);
end;

function stub_inflateBackInit_(var strm: z_stream;
                          windowBits: Integer; window: PChar;
                          const version: PChar; stream_size: Integer): Integer; cdecl;
begin
  inflateBackInit_ := FixupStub(hZLib, 'inflateBackInit_'); {Do not Localize}
  Result := inflateBackInit_(strm, windowBits, window, version, stream_size);
end;

function stub_inflateInit2_(var strm: z_stream; windowBits: Integer;
                       const version: PChar; stream_size: Integer): Integer;cdecl;
begin
  inflateInit2_ := FixupStub(hZLib, 'inflateInit2_'); {Do not Localize}
  Result := inflateInit2_(strm, windowBits, version, stream_size);
end;

function stub_inflateCopy(var dest, source: z_stream): Integer; cdecl;
begin
  inflateCopy := FixupStub(hZLib, 'inflateCopy'); {Do not Localize}
  Result := inflateCopy(dest, source);
end;


function  stub_inflateInit_(var strm: z_stream; const version: PChar;
                      stream_size: Integer): Integer; cdecl;
begin
  inflateInit_ := FixupStub(hZLib, 'inflateInit_'); {Do not Localize}
  Result := inflateInit_(strm, version, stream_size);
end;

function stub_inflateReset(var strm: z_stream): Integer; cdecl;
begin
  inflateReset := FixupStub(hZLib, 'inflateReset'); {Do not Localize}
  Result := inflateReset(strm);
end;

function stub_inflateSetDictionary(var strm: z_stream; const dictionary: PChar;
                              dictLength: Integer): Integer;cdecl;
begin
  inflateSetDictionary := FixupStub(hZLib, 'inflateSetDictionary'); {Do not Localize}
  Result := inflateSetDictionary(strm, dictionary, dictLength);
end;                              

function stub_inflateSync(var strm: z_stream): Integer; cdecl;
begin
  inflateSync := FixupStub(hZLib, 'inflateSync'); {Do not Localize}
  Result := inflateSync(strm);
end;
  
function stub_uncompress (dest: PChar; var destLen: LongInt;
                   const source: PChar; sourceLen: LongInt): Integer;cdecl;
begin
  uncompress := FixupStub(hZLib, 'uncompress'); {Do not Localize}
  Result := uncompress (dest, destLen, source, sourceLen);
end;
                   
function stub_zlibCompileFlags : LongInt; cdecl;
begin
  zlibCompileFlags := FixupStub(hZLib, 'zlibCompileFlags'); {Do not Localize}
  Result := zlibCompileFlags;
end;

function stub_zError(err : Integer) : PChar; cdecl;
begin
  zError := FixupStub(hZLib, 'zError'); {Do not Localize}
  Result := zError(err);
end;

function stub_inflateSyncPoint(var z : TZStreamRec) : Integer; cdecl;
begin
  inflateSyncPoint := FixupStub(hZLib, 'inflateSyncPoint'); {Do not Localize}
  Result := inflateSyncPoint(z);
end; 

function stub_get_crc_table : PLongInt; cdecl;
begin
  get_crc_table := FixupStub(hZLib, 'get_crc_table'); {Do not Localize}
  Result := get_crc_table;
end; 
  
function stub_zlibVersion : PChar; cdecl;
begin
  zlibVersion := FixupStub(hZLib, 'zlibVersion'); {Do not Localize}
  Result := zlibVersion;
end;

function stub_deflateSetHeader(var strm: z_stream; var head: gz_header): integer; cdecl;
begin
  deflateSetHeader := FixupStub(hZLib, 'deflateSetHeader'); {Do not Localize}
  Result := deflateSetHeader(strm, head);
end;  

function stub_inflateGetHeader(var strm: z_stream; var head: gz_header): integer; cdecl;
begin
  inflateGetHeader := FixupStub(hZLib, 'inflateGetHeader'); {Do not Localize}
  Result := inflateGetHeader(strm, head);
end;


procedure InitializeStubs;
begin
  adler32 := stub_adler32;
  compress := stub_compress;
  compress2 := stub_compress2;
  compressBound := stub_compressBound;
  crc32 := stub_crc32;
  deflate := stub_deflate;
  deflateBound := stub_deflateBound;
  deflateCopy := stub_deflateCopy;
  deflateEnd := stub_deflateEnd;
  deflateInit_ := stub_deflateInit_;
  deflateInit2_ := stub_deflateInit2_;
  deflateParams := stub_deflateParams;
  deflatePrime := stub_deflatePrime;
  deflateTune := stub_deflateTune;
  deflateReset := stub_deflateReset;
  deflateSetDictionary := stub_deflateSetDictionary;
  inflate := stub_inflate;
  inflateBack := stub_inflateBack;
  inflateBackEnd := stub_inflateBackEnd;
  inflateBackInit_ := stub_inflateBackInit_;
  inflateCopy := stub_inflateCopy;
  inflateEnd := stub_inflateEnd;
  inflateInit_ := stub_inflateInit_;
  inflateInit2_ := stub_inflateInit2_;
  inflateReset := stub_inflateReset;
  inflateSetDictionary := stub_inflateSetDictionary;
  inflateSync := stub_inflateSync;
  uncompress := stub_uncompress; 
  zlibCompileFlags := stub_zlibCompileFlags;
  zError := stub_zError;

  inflateSyncPoint := stub_inflateSyncPoint;

  get_crc_table := stub_get_crc_table;
  zlibVersion := stub_zlibVersion;
  deflateSetHeader := stub_deflateSetHeader;
  inflateGetHeader := stub_inflateGetHeader;
end;
{$ENDIF}

function deflateInit(var strm: z_stream; level: Integer): Integer;
begin
//  if not Assigned(strm.zalloc) then strm.zalloc := zlibAllocMem;
//  if not Assigned(strm.zfree)  then strm.zfree  := zlibFreeMem;
  Result := deflateInit_(strm, level, ZLIB_VERSION, sizeof(z_stream));
end;

function deflateInit2(var strm: z_stream; level, method, windowBits, memLevel,
                      strategy: Integer): Integer;
begin
//  if not Assigned(strm.zalloc) then strm.zalloc := zlibAllocMem;
//  if not Assigned(strm.zfree)  then strm.zfree  := zlibFreeMem;
  Result := deflateInit2_(strm, level, method, windowBits, memLevel, strategy,
                          ZLIB_VERSION, sizeof(z_stream));
end;

const
  WBits : array[TZStreamType] of integer = (MAX_WBITS, MAX_WBITS + 16, -MAX_WBITS);

function deflateInitEx(var strm: z_stream; level: Integer; streamtype: TZStreamType = zsZLib): Integer;
begin
  Result := deflateInit2(strm, level, Z_DEFLATED, WBits[streamtype],
    MAX_MEM_LEVEL, Z_DEFAULT_STRATEGY);
end;

function inflateInitEx(var strm: z_stream; streamtype: TZStreamType = zsZLib): Integer;
begin
  Result := inflateInit2(strm, WBits[streamtype]);
end;

function inflateInit(var strm: z_stream): Integer;
begin
//  if not Assigned(strm.zalloc) then strm.zalloc := zlibAllocMem;
//  if not Assigned(strm.zfree)  then strm.zfree  := zlibFreeMem;
  Result := inflateInit_(strm, ZLIB_VERSION, sizeof(z_stream));
end;

function inflateInit2(var strm: z_stream; windowBits: Integer): Integer;
begin
//  if not Assigned(strm.zalloc) then strm.zalloc := zlibAllocMem;
//  if not Assigned(strm.zfree)  then strm.zfree  := zlibFreeMem;
  Result := inflateInit2_(strm, windowBits, ZLIB_VERSION, sizeof(z_stream));
end;

function inflateBackInit(var strm: z_stream;
                         windowBits: Integer; window: PChar): Integer;
begin
  Result := inflateBackInit_(strm, windowBits, window,
                             ZLIB_VERSION, sizeof(z_stream));
end;


{minor additional helper functions}
function _malloc(Size: Integer): Pointer; cdecl;
begin
  GetMem(Result, Size);
end;

procedure _free(Block: Pointer); cdecl;
begin
  FreeMem(Block);
end;

procedure _memset(P: Pointer; B: Byte; count: Integer); cdecl;
begin
  FillChar(P^, count, B);
end;

procedure _memcpy(dest, source: Pointer; count: Integer); cdecl;
begin
  Move(source^, dest^, count);
end;

function zlibAllocMem(AppData: Pointer; Items, Size: Integer): Pointer; cdecl;
begin
  GetMem(Result, Items*Size);
//  Result := AllocMem(Items * Size);
end;

procedure zlibFreeMem(AppData, Block: Pointer); cdecl;
begin
  FreeMem(Block);
end;

{$IFDEF STATICLOAD}
function Load : Boolean;
begin
  Result := True;
end;

procedure Unload;
begin
end;

function Loaded : Boolean;
begin
  Result := True;
end;
{$ELSE}
function Load : Boolean;
begin
  Result := True;
  if not Loaded then
  begin
    hZLib := LoadLibrary(libzlib);
    Result := Loaded;
  end;
end;

procedure Unload;
begin
  if Loaded then
  begin
    FreeLibrary(hZLib);
    hZLib := 0;
    InitializeStubs;
  end;
end;

function Loaded : Boolean;
begin
  Result := (hZLib <> 0);
end;
{$ENDIF}

{$IFNDEF STATICLOAD}
initialization
  InitializeStubs;
  Load;
finalization
  Unload;
{$ENDIF}
end.
