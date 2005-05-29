{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  116938: PackageSecurity.pas 
{
{   Rev 1.1    3/28/2005 1:11:46 PM  JPMugaas
{ Package build errors.
}
{
{   Rev 1.0    3/28/2005 5:53:06 AM  JPMugaas
{ New security package.
}
unit PackageSecurity;

interface
uses
  Package;

type
  TPackageSecurity = class(TPackage)
  public
    procedure Generate(ACompiler: TCompiler); override;
    procedure GenerateDT(ACompiler: TCompiler); override;
  end;

implementation
uses DModule;

{ TPackageSecurity }

procedure TPackageSecurity.GenerateDT(ACompiler: TCompiler);
begin
  if ACompiler = ctDelphi2005Net then
  begin
    inherited;
    FName := 'dclIndySecurity' + GCompilerID[Compiler];
    FDesc := 'Security';
    GenHeader;
    GenOptions;
    Code('');
    Code('requires');
    if ACompiler in DelphiNet then begin
      Code('  Borland.Delphi,');
      Code('  Borland.VclRtl,');
      Code('  Borland.Studio.Vcl.Design,');
    end;

    Code('  IndySystem' + GCompilerID[Compiler] + ',');
    Code('  IndyCore' + GCompilerID[Compiler] + ',');
    Code('  IndyProtocols'+ GCompilerID[Compiler] + ',');
    Code('  IndySecurity'+ GCompilerID[Compiler] + ',');
    Code('  dclIndyCore' + GCompilerID[Compiler]+',');
    Code('  dclIndyProtocols' + GCompilerID[Compiler]+',');
    Code('  Mono.Security,');
    Code('  System,');
    Code('  System.Data,');
    Code('  System.XML;');
    GenContains;
    //back door for embedding version information into an assembly
    //without having to do anything to the package directly.
    if Compiler = ctDelphi2005Net then
    begin
      Code('{$I IddclSecurity90ASM90.inc}');
    end;
    WriteFile(DM.OutputPath + '\Lib\Security\');
  end;
end;

procedure TPackageSecurity.Generate(ACompiler: TCompiler);
begin
  if ACompiler = ctDelphi2005Net then
  begin
    inherited;
    FName := 'IndySecurity' + GCompilerID[Compiler];
    FDesc := 'Security';
    GenHeader;
    GenOptions;
    Code('');
    Code('requires');
    if ACompiler in DelphiNet then begin
      Code('  Borland.Delphi,');
      Code('  Borland.VclRtl,');
    end;

    Code('  IndySystem' + GCompilerID[Compiler] + ',');
    Code('  IndyCore' + GCompilerID[Compiler] + ',');
    Code('  IndyProtocols'+ GCompilerID[Compiler] + ',');
    Code('  Mono.Security,');
    Code('  System,');
    Code('  System.Data,');
    Code('  System.XML;');
    GenContains;
    //back door for embedding version information into an assembly
    //without having to do anything to the package directly.
    if Compiler = ctDelphi2005Net then
    begin
      Code('{$I IdSecurity90ASM90.inc}');
    end;
    WriteFile(DM.OutputPath + '\Lib\Security\');
  end;
end;

end.
