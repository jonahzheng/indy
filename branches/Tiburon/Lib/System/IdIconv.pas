unit IdIconv;

interface

{$I IdCompilerDefines.inc}

uses
  {$IFDEF FPC}
  DynLibs,  
  {$ENDIF}
  IdCTypes,
  IdException,
  {$IFDEF UseBaseUnix}
  UnixType; 
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  Windows;
  {$ENDIF}

{.$DEFINE STATICLOAD_ICONV}
//These should be defined in libc.pas.
type
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  {$EXTERNALSYM SIZE_T}
      {$IFDEF CPU64}
  size_t = QWord;
       {$ELSE}
  size_t = DWord;
      {$ENDIF}
  Psize_t = ^size_t;
  {$ENDIF}

  Piconv_t = ^iconv_t;
  iconv_t = Pointer;

{$IFNDEF STATICLOAD_ICONV}
//   This function is a possible cancellation points and therefore not
//   marked with __THROW.  */
//extern iconv_t iconv_open (__const char *__tocode, __const char *__fromcode);
  TIdiconv_open = function (__tocode : PAnsiChar; __fromcode : PAnsiChar) : iconv_t;  cdecl;
///* Convert at most *INBYTESLEFT bytes from *INBUF according to the
//   code conversion algorithm specified by CD and place up to
//   *OUTBYTESLEFT bytes in buffer at *OUTBUF.  */
//extern size_t iconv (iconv_t __cd, char **__restrict __inbuf,
//		     size_t *__restrict __inbytesleft,
//		     char **__restrict __outbuf,
//		     size_t *__restrict __outbytesleft);
  TIdiconv = function (__cd : iconv_t; __inbuf : PPAnsiChar;
                    __inbytesleft : Psize_t;
		    __outbuf : PPAnsiChar;
		    __outbytesleft : Psize_t ) : size_t; cdecl;
//   This function is a possible cancellation points and therefore not
//   marked with __THROW.  */
//extern int iconv_close (iconv_t __cd);
  TIdiconv_close = function (__cd : iconv_t) : TIdC_INT; cdecl;

type
  EIdIconvStubError = class(EIdException)
  protected
    FError : LongWord;
    FErrorMessage : String;
    FTitle : String;
  public
    constructor Build(const ATitle : String; AError : LongWord);
    property Error : LongWord read FError;
    property ErrorMessage : String read FErrorMessage;
    property Title : String read FTitle;
  end;
  
var
  iconv_open  : TIdiconv_open = nil;
  iconv        : TIdiconv = nil;
  iconv_close :  TIdiconv_close = nil;
{$ENDIF}

{$IFDEF WIN32_OR_WIN64}
//errno.h constants that are needed for this and possibly other API's.
//It's here only because it seems to be the most sensible place to put it.
//These are defined in other operating systems.

const
  EPERM          =  1;
  ENOENT         =  2;
  ESRCH          =  3;
  EINTR          =  4;
  EIO            =  5;
  ENXIO          =  6;
  E2BIG          =  7;
  ENOEXEC        =  8;
  EBADF          =  9;
  ECHILD         = 10;
  EAGAIN         = 11;
  ENOMEM         = 12;
  EACCES         = 13;
  EFAULT         = 14;
  EBUSY          = 16;
  EEXIST         = 17;
  EXDEV          = 18;
  ENODEV         = 19;
  ENOTDIR        = 20;
  EISDIR         = 21;
  EINVAL         = 22;
  ENFILE         = 23;
  EMFILE         = 24;
  ENOTTY         = 25;
  EFBIG          = 27;
  ENOSPC         = 28;
  ESPIPE         = 29;
  EROFS          = 30;
  EMLINK         = 31;
  EPIPE          = 32;
  EDOM           = 33;
  ERANGE         = 34;
  EDEADLK        = 36;
  ENAMETOOLONG   = 38;
  ENOLCK         = 39;
  ENOSYS         = 40;
  ENOTEMPTY      = 41;
  EILSEQ         = 42;

type
  EIdMSVCRTStubError = class(EIdException)
  protected
    FError : TIdC_INT;
    FErrorMessage : String;
    FTitle : String;
  public
    constructor Build(const ATitle : String; AError : TIdC_INT);
    property Error : TIdC_INT read FError;
    property ErrorMessage : String read FErrorMessage;
    property Title : String read FTitle;
  end;
{$ENDIF}

const
  FN_ICONV_OPEN = 'iconv_open';  {Do not localize}
  FN_ICONV = 'iconv';   {Do not localize}
  FN_ICONV_CLOSE = 'iconv_close';  {Do not localize}
  {$IFDEF UNIX}
  LIBC = 'libc.so.6';  {Do not localize}
  LICONV = 'libiconv.so';  {Do not localize}
  {$ELSE}
  // TODO: support static linking, such as via the "win_iconv" library
    {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  //http://yukihiro.nakadaira.googlepages.com/ seems to use the iconv.dll name.
  LICONV = 'iconv.dll';   {Do not localize}
  LICONV_ALT = 'libiconv.dll';   {Do not localize}
  LIBMSVCRTL = 'msvcrt.dll';  {Do not localize}
    {$ENDIF}
  {$ENDIF}

function Load : Boolean;
procedure Unload;
function Loaded : Boolean;

{$IFDEF STATICLOAD_ICONV}
function iconv_open(__tocode : PAnsiChar; __fromcode : PAnsiChar) : iconv_t; cdecl;
  external LICONV name FN_ICONV_OPEN;
function iconv(__cd : iconv_t; __inbuf : PPAnsiChar;
                    __inbytesleft : Psize_t;
		    __outbuf : PPAnsiChar;
		    __outbytesleft : Psize_t ) : size_t; cdecl;
  external LICONV name FN_ICONV;
function iconv_close(__cd : iconv_t) : TIdC_INT; cdecl;
  external LICONV name FN_ICONV_CLOSE;
{$ENDIF}

{
From http://gettext.sourceforge.net/

Dynamic linking to iconv
Note that the iconv function call in libiconv stores its error, if it fails,
in the stdc library's errno. iconv.dll links to msvcrt.dll, and stores the error
in its exported errno symbol (this is actually a memory location with an
exported accessor function). If your code does not link against msvcrt.dll, you
may wish to import this accessor function specifically to get iconv failure
codes. This is particularly important for Visual C++ projects, which are likely
to link to msvcrtd.dll in Debug configuration, rather than msvcrt.dll. I have
written a C++ wrapper for iconv use, which does this, and I will be adding it to
WinMerge (on sourceforge) shortly.
}
{$IFDEF WIN32_OR_WIN64}
var
  errno : function : PIdC_INT; cdecl;

function errnoStr(const AErrNo : TIdC_INT) : String;
{$ENDIF}

implementation

{$IFDEF STATICLOAD_ICONV}
  {$IFDEF WIN32_OR_WIN64}
var
  hmsvcrt : THandle = 0;
  {$ENDIF}

function Load : Boolean; {$IFDEF USEINLINE} inline; {$ENDIF}
begin
  Result := True;
end;

procedure Unload; {$IFDEF USEINLINE} inline; {$ENDIF}
begin
  {$IFDEF WIN32_OR_WIN64}
   if hmsvcrt <> 0 then begin
     FreeLibrary(hmsvcrt);
     hmsvcrt := 0;
   end;
  {$ENDIF}
end;

function Loaded : Boolean; {$IFDEF USEINLINE} inline; {$ENDIF}
begin
  Result := True;
end;

procedure InitializeStubs;
begin
  {$IFDEF WIN32_OR_WIN64}
  {$ENDIF}
end;

{$ELSE}
uses
  IdResourceStrings, SysUtils;

var
  {$IFDEF UNIX}
  hIconv: HModule = nilhandle;
  {$ELSE}
  hIconv: THandle = 0;
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64}
var
  hmsvcrt : THandle = 0;

function stub_errno : PIdC_INT; cdecl; forward;
  {$ENDIF}
  
constructor EIdIconvStubError.Build(const ATitle : String; AError : LongWord);
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

function Load : Boolean;
begin
  Result := True;
  if not Loaded then begin
    //In Windows, you should use SafeLoadLibrary instead of the LoadLibrary API
    //call because LoadLibrary messes with the FPU control word.
    {$IFDEF WIN32_OR_WIN64_OR_WINCE}
    hIconv := SafeLoadLibrary(LICONV);
    if hIconv = 0 then begin
      hIconv := SafeLoadLibrary(LICONV_ALT);
    end;
    {$ELSE}
      {$IFDEF UNIX}
    hIconv := LoadLibrary(LICONV);
    if hIconv = NilHandle then  begin
      hIconv := LoadLibrary(LIBC);
    end;
      {$ELSE}
    hIconv := LoadLibrary(LICONV);
      {$ENDIF}
    {$ENDIF}
    Result := Loaded;
  end;
end;

function Fixup(const AName: string): Pointer;
begin
  if hIconv = 0 then begin
    if not Load then begin
      EIdIconvStubError.Build(Format(RSIconvCallError, [AName]), 0);
    end;
  end;
  Result := GetProcAddress(hIconv, PChar(AName));
  if Result = nil then begin
    EIdIconvStubError.Build(Format(RSIconvCallError, [AName]), 10022);
  end;
end;

{stubs that automatically load the iconv library and then fixup the functions.}

function Stub_iconv_open(__tocode : PAnsiChar; __fromcode : PAnsiChar) : iconv_t;  cdecl;
begin
  iconv_open := Fixup(FN_ICONV_OPEN);
  Result := iconv_open(__tocode, __fromcode);
end;

function stub_iconv(__cd : iconv_t; __inbuf : PPAnsiChar; 
                    __inbytesleft : Psize_t; 
		    __outbuf : PPAnsiChar;
		    __outbytesleft : Psize_t ) : size_t; cdecl;
begin
  iconv := Fixup(FN_ICONV);
  Result := iconv(__cd,__inbuf,__inbytesleft,__outbuf,__outbytesleft);
end;

function stub_iconv_close(__cd : iconv_t) : TIdC_INT; cdecl;
begin
  iconv_close := Fixup(FN_ICONV_CLOSE);
  Result := iconv_close(__cd);
end;

{end stub sections}

procedure InitializeStubs;
begin
  iconv_open  := Stub_iconv_open;
  iconv       := Stub_iconv;
  iconv_close := Stub_iconv_close;
{$IFDEF WIN32_OR_WIN64}
  errno := Stub_errno;
{$ENDIF}
end;

procedure Unload;
begin
  if Loaded then begin
    FreeLibrary(hIconv);
    hIconv := 0;
  {$IFDEF WIN32_OR_WIN64}
   if hmsvcrt <> 0 then begin
     FreeLibrary(hmsvcrt);
     hmsvcrt := 0;
   end;
  {$ENDIF}
    InitializeStubs;
  end;
end;

function Loaded : Boolean;
begin
  Result := (hIconv <> 0);
end;
{$ENDIF}

{$IFDEF WIN32_OR_WIN64}
const
  FN_errno = '_errno';

constructor EIdMSVCRTStubError.Build(const ATitle : String; AError : TIdC_INT);
begin
  FTitle := ATitle;
  FError := AError;
  if AError = 0 then begin
    inherited Create(ATitle);
  end else
  begin
    FErrorMessage := errnoStr(AError);
    inherited Create(ATitle + ': ' + FErrorMessage);    {Do not Localize}
  end;
end;

function errnoStr(const AErrNo : TIdC_INT) : String;
{$IFDEF USEINLINE} inline; {$ENDIF}
begin
 case AErrNo of
  EPERM   : Result := 'EPERM';
  ENOENT  : Result := 'ENOENT';
  ESRCH   : Result := 'ESRCH';
  EINTR   : Result := 'EINTR';
  EIO     : Result := 'EIO';
  ENXIO   : Result := 'ENXIO';
  E2BIG   : Result := 'E2BIG';
  ENOEXEC : Result := 'ENOEXEC';
  EBADF   : Result := 'EBADF';
  ECHILD  : Result := 'ECHILD';
  EAGAIN  : Result := 'EAGAIN';
  ENOMEM  : Result := 'ENOMEM';
  EACCES  : Result := 'EACCES';
  EFAULT  : Result := 'EFAULT';
  EBUSY   : Result := 'EBUSY';
  EEXIST  : Result := 'EEXIST';
  EXDEV   : Result := 'EXDEV';
  ENODEV  : Result := 'ENODEV';
  ENOTDIR : Result := 'ENOTDIR';
  EISDIR  : Result := 'EISDIR';
  EINVAL  : Result := 'EINVAL';
  ENFILE  : Result := 'ENFILE';
  EMFILE  : Result := 'EMFILE';
  ENOTTY  : Result := 'ENOTTY';
  EFBIG   : Result := 'EFBIG';
  ENOSPC  : Result := 'ENOSPC';
  ESPIPE  : Result := 'ESPIPE';
  EROFS   : Result := 'EROFS';
  EMLINK  : Result := 'EMLINK';
  EPIPE   : Result := 'EPIPE';
  EDOM    : Result := 'EDOM';
  ERANGE  : Result := 'ERANGE';
  EDEADLK : Result := 'EDEADLK';
  ENAMETOOLONG : Result := 'ENAMETOOLONG';
  ENOLCK       : Result := 'ENOLCK';
  ENOSYS       : Result := 'ENOSYS';
  ENOTEMPTY    : Result := 'ENOTEMPTY';
  EILSEQ       : Result := 'EILSEQ';
  else
    Result := '';
  end;
end;

function stub_errno : PIdC_INT; cdecl;
begin
  if (hmsvcrt = 0) then begin
     hmsvcrt := SafeLoadLibrary(LIBMSVCRTL);
     if hmsvcrt = 0 then begin
       raise EIdMSVCRTStubError.Build('Failed to load '+LIBMSVCRTL,0);
     end;
     errno := GetProcAddress(hmsvcrt,PChar(FN_errno));
     if not Assigned(errno) then begin
       errno := stub_errno;
       raise EIdMSVCRTStubError.Build('Failed to load '+FN_errno+' in '+LIBMSVCRTL,0);
     end;
  end;
  Result := errno;  
end;
{$ENDIF}

initialization
  InitializeStubs;

finalization
  Unload;

end.
