// General

// Make this $DEFINE to use the 16 color icons required by Borland
// or DEFINE to use the 256 color Indy versions
{DEFINE Borland}

//Widget defines are for the design-time GUI and TIdAntiFreeze
// S.G. 4/9/2002: IPv4/IPv6 general switch (for defaults only)
{$DEFINE IdIPv4}

{$DEFINE INDY100}

{$IFDEF BCB}
  {$DEFINE CBUILDER}
{$ELSE}
  {$DEFINE DELPHI}
{$ENDIF}

// Delphi 4
{$IFDEF VER120}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL40}
  {$DEFINE DELPHI4}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE MSWINDOWS}
  {$DEFINE WIN32}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$define WidgetVCLLike} // LCL included.
  {$define WidgetVCL}
{$ENDIF}

// C++ Builder 4
{$IFDEF VER125}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL40}
  {$DEFINE CBUILDER4}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE MSWINDOWS}
  {$DEFINE WIN32}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$define WidgetVCLLike} // LCL included.
  {$define WidgetVCL}
  {$define WidgetVCLLikeOrKylix}
{$ENDIF}

// Delphi 5 & CBuilder 5
{$IFDEF VER130}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$DEFINE VCL5}
  {$IFDEF BCB}
    {$DEFINE CBUILDER5}
  {$ELSE}
    {$DEFINE DELPHI5}
  {$ENDIF}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE MSWINDOWS}
  {$DEFINE WIN32}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$define WidgetVCLLike} // LCL included.
  {$define WidgetVCL}
  {$define WidgetVCLLikeOrKylix}
{$ENDIF}

//Delphi 6
{$IFDEF VER140}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$IFDEF BCB}
    {$DEFINE CBUILDER6}
    {$DEFINE ALLOW_NAMED_THREADS}
  {$ELSE}
    {$DEFINE DELPHI6}
  {$ENDIF}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE VCL6ORABOVE}
  {$DEFINE VCL60}
  {$DEFINE TFormatSettings}
  {$DEFINE WIN32}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$define WidgetVCLLike} // LCL included.
  {$define WidgetVCL}
  {$define VCL60plus}
  {$define WidgetVCLLikeOrKylix}
{$ENDIF}

//Delphi 7
{$IFDEF VER150}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$DEFINE VCL6ORABOVE}
  {$DEFINE VCL7ORABOVE}
  {$DEFINE VCL70}
  {$IFDEF BCB}
    {$DEFINE CBUILDER7}
  {$ELSE}
    {$DEFINE DELPHI7}
  {$ENDIF}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE ALLOW_NAMED_THREADS}
  {$DEFINE WIN32}
  {$DEFINE TFormatSettings}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$define WidgetVCLLike} // LCL included.
  {$define WidgetVCLLikeOrKylix}
  {$define WidgetVCL}
  {$define VCL60plus}
{$ENDIF}

//Delphi 8
{$IFDEF VER160}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$DEFINE VCL6ORABOVE}
  {$DEFINE VCL7ORABOVE}
  {$DEFINE VCL8ORABOVE}
  {$DEFINE VCL80}
  {$DEFINE DELPHI8}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE ALLOW_NAMED_THREADS}
  {$DEFINE TFormatSettings}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
//Widget defines are omitted since D8 only supports NET
{$ENDIF}

//Delphi 9
{$IFDEF VER170}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$DEFINE VCL6ORABOVE}
  {$DEFINE VCL7ORABOVE}
  {$DEFINE VCL8ORABOVE}
  {$DEFINE VCL9ORABOVE}
  {$DEFINE VCL90}
  {$DEFINE DELPHI9}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE ALLOW_NAMED_THREADS}
  {$DEFINE TFormatSettings}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$ifndef CIL}
    {$define WidgetVCLLike} // LCL included.
    {$define WidgetVCLLikeOrKylix}
    {$define WidgetVCL}
    {$define VCL60plus}
  {$endif}
{$ENDIF}

//Delphi 10
{$IFDEF VER180}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$DEFINE VCL6ORABOVE}
  {$DEFINE VCL7ORABOVE}
  {$DEFINE VCL8ORABOVE}
  {$DEFINE VCL9ORABOVE}
  {$DEFINE VCL10ORABOVE}
  {$DEFINE VCL10}
  {$DEFINE DELPHI10}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE ALLOW_NAMED_THREADS}
  {$DEFINE TFormatSettings}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$ifndef CIL}
    {$define Wi dgetVCLLike} // LCL included.
    {$define WidgetVCL}
    {$define WidgetVCLLikeOrKylix}
    {$define VCL60plus}
  {$endif}
{$ENDIF}

//Delphi 11
{$IFDEF VER190}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$DEFINE VCL6ORABOVE}
  {$DEFINE VCL7ORABOVE}
  {$DEFINE VCL8ORABOVE}
  {$DEFINE VCL9ORABOVE}
  {$DEFINE VCL10ORABOVE}
  {$DEFINE VCL11ORABOVE}
  {$DEFINE VCL11}
  {$DEFINE DELPHI11}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE ALLOW_NAMED_THREADS}
  {$DEFINE TFormatSettings}
  {$DEFINE FPC_CircularBug}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$ifndef CIL}
    {$define WidgetVCLLike} // LCL included.
    {$define WidgetVCLLikeOrKylix}
    {$define WidgetVCL}
    {$define VCL60plus}
  {$endif}
{$ENDIF}

//Delphi.NET
// Covers D8+
{$IFDEF CIL}
  // Platform specific conditional. Used for platform specific code.
  {$DEFINE DotNet}
  // Extra include used in D7 for testing. Remove later when all comps are
  // ported. Used to selectively exclude non ported parts. Allowed in places
  // IFDEFs are otherwise not permitted.
  {$DEFINE DotNetExclude}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$define WidgetWinForms}
{$ENDIF}

// FPC (2+)

{$IFDEF FPC}
  {$MODE Delphi}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$DEFINE VCL6ORABOVE}
  {$DEFINE VCL7ORABOVE}
  {$DEFINE VCL70}
  {$DEFINE DELPHI7}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE ALLOW_NAMED_THREADS}
  {$DEFINE NO_TMultiReadExclusiveWriteSynchronizer}
   {$DEFINE FPC_REINTRODUCE_BUG}
   {$DEFINE FPC_CircularBug}
   {$DEFINE NoRedeclare}
   {$DEFINE ByteCompareSets}
  {$define WidgetVCLLike} // LCL included.
  {$define WidgetVCLLikeOrKylix}
  {$define UseTBitBtn} //use Bit Buttons instead of Buttons
  {$define WidgetLCL}
  //note that we may need further defines for widget types depending on
  //what we do and what platforms we support in FPC.
  //I'll let Marco think about that one.
{$ENDIF}


// Kylix
//
//Important:  Don't use CompilerVersion here as
// $ IF's are evaluated before $ IFDEF's
//and Kylix 1 does not have CompilerVersion defined at all.
{$IFNDEF FPC}
{$IFDEF LINUX}
  {$DEFINE UNIX}
  {$IFDEF CONDITIONALEXPRESSIONS}
    {$IF RTLVersion = 14.0}
      {$DEFINE KYLIX1}
      {$DEFINE KYLIX}
      {$DEFINE KYLIX1ORABOVE}
    {$IFEND}
    {$IF RTLVersion = 14.2}
      {$DEFINE KYLIX2}
      {$DEFINE KYLIX}
      {$DEFINE USEZLIBUNIT}
      {$DEFINE KYLIX1ORABOVE}
      {$DEFINE KYLIX2ORABOVE}
    {$IFEND}
    {$IF RTLVersion = 14.5}
      {$DEFINE KYLIX3}
      {$DEFINE KYLIX}
      {$DEFINE USEZLIBUNIT}
      {$DEFINE KYLIX1ORABOVE}
      {$DEFINE KYLIX2ORABOVE}
      {$DEFINE KYLIX3ORABOVE}
    {$IFEND}
    
  {$ENDIF}
  {$DEFINE VCL4ORABOVE}
  {$DEFINE VCL5ORABOVE}
  {$DEFINE OPTIONALPARAMS}
  {$DEFINE SAMETEXT}
  {$DEFINE VCL6ORABOVE}
  {$DEFINE VCL60}
  {$define i386}
  {$define ENDIAN_LITTLE}
  {$define CPU32}
  {$define WidgetKylix}
  {$define WidgetVCLLikeOrKylix}
{$ENDIF}
{$ENDIF}
