unit IdIconv;
interface
{$I IdCompilerDefines.inc}
uses
  IdCTypes,
  {$IFDEF KYLIXCOMPAT}
  libc;
  {$ENDIF}
 {$IFDEF UseBaseUnix}
  UnixType, 
  DynLibs;
  {$ENDIF}
  
  {$IFNDEF KYLIXCOMPAT}
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
  {$ENDIF}
  
implementation

end.