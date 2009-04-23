unit IdIconv;

interface

{$I IdCompilerDefines.inc}

uses
  IdCTypes,
  IdException,
  {$IFDEF KYLIXCOMPAT}
  libc;
  {$ENDIF}
  {$IFDEF UseBaseUnix}
  UnixType, 
  DynLibs;
  {$ENDIF}

//These should be defined in libc.pas.
type
  Piconv_tv = ^iconv_t;
  iconv_t = Pointer;
  
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
    
function Load : Boolean;
procedure Unload;
function Loaded : Boolean;
  
implementation

uses
  IdResourceStrings, SysUtils;

var
  {$IFDEF UNIX}
  hIconv: HModule = nilhandle;
  {$ELSE}
  hIconv: THandle = 0;
  {$ENDIF}

const
  {$IFDEF UNIX}
  LIBC = 'libc.so.6';
  LICONV = 'libiconv.so';
  {$ELSE}
  // TODO: support static linking, such as via the "win_iconv" library
  LICONV = 'libiconv.dll';
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
    {$ELSE}
      {$IFDEF UNIX}
    hIconv := LoadLibrary(LICONV);
    if hIconv = NilHandle then  begin
      hIconv := LoadLibrary(LIBC);
    end;
      {$ELSE}
    hIconv := LoadLibrary(libzlib);
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
  iconv_open := Fixup('iconv_open');
  Result := iconv_open(__tocode, __fromcode);
end;

function stub_iconv(__cd : iconv_t; __inbuf : PPAnsiChar; 
                    __inbytesleft : Psize_t; 
		    __outbuf : PPAnsiChar;
		    __outbytesleft : Psize_t ) : size_t; cdecl;
begin
  iconv := Fixup('iconv');
  Result := iconv(__cd,__inbuf,__inbytesleft,__outbuf,__outbytesleft);
end;

function stub_iconv_close(__cd : iconv_t) : TIdC_INT; cdecl;
begin
  iconv_close := Fixup('iconv_close');
  Result := iconv_close(__cd);
end;

{end stub sections}

procedure InitializeStubs;
begin
  iconv_open  := Stub_iconv_open;
  iconv       := Stub_iconv;
  iconv_close := iconv_close;
end;

procedure Unload;
begin
  if Loaded then begin
    FreeLibrary(hIconv);
    hIconv := 0;
    InitializeStubs;
  end;
end;

function Loaded : Boolean;
begin
  Result := (hIconv <> 0);
end;

initialization
  InitializeStubs;
  Load;

finalization
  Unload;
end.
