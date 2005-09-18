unit IdAboutVCL;

interface
{$I IdCompilerDefines.inc}
uses
{$ifdef clx}
  QStdCtrls, QForms, QExtCtrls, QControls, QComCtrls, QGraphics,  Qt,
  {$ELSE}
   StdCtrls, Buttons, ExtCtrls, Graphics, Controls, ComCtrls, Forms,
  {$ENDIF}
{$ifdef Delphi6up}
  types
{$endif}

  {$IFDEF Windows}
    Windows,
 {$ENDIF}
  {$IFDEF LCL}
    LResources,
 {$ENDIF}
  classes, sysutils;

type
  TfrmAbout = class(TForm)
  protected
    FimLogo : TImage;
    FlblCopyRight : TLabel;
    FlblName : TLabel;
    FlblVersion : TLabel;
    FlblPleaseVisitUs : TLabel;
    FlblURL : TLabel;
    {$IFDEF FPC}
    FbbtnOk : TBitBtn;
    {$ELSE}
    FbbtnOk : TButton;
    {$ENDIF}
    procedure lblURLClick(Sender: TObject);
    function GetProductName: String;
    procedure SetProductName(const AValue: String);
    function GetVersion: String;
    procedure SetVersion(const AValue: String);
  public
    class procedure ShowDlg;
    class procedure ShowAboutBox(const AProductName, AProductVersion: String);
    constructor Create(AOwner : TComponent); overload; override;
    constructor Create; reintroduce; overload; 
    property ProductName : String read GetProductName write SetProductName;
    property Version : String read GetVersion write SetVersion;
  end;

Procedure ShowAboutBox(const AProductName, AProductVersion : String);
Procedure ShowDlg;

implementation
{$IFNDEF FPC}

{$R IdAboutVCL.RES}
{$ENDIF}
uses
  {$IFDEF MSWINDOWS}ShellApi, {$ENDIF}
  IdDsnCoreResourceStrings,
  IdGlobal,
  IdSys;

Procedure ShowAboutBox(const AProductName, AProductVersion : String);
begin
  with TfrmAbout.Create(Application) do
  try
    ProductName := AProductName;
    Version := Format ( RSAAboutBoxVersion, [ AProductVersion ] );
    ShowModal;
  finally
    Free;
  end;
end;

Procedure ShowDlg;
begin
  ShowAboutBox(RSAAboutBoxCompName, gsIdVersion);
end;

{ TfrmAbout }

constructor TfrmAbout.Create(AOwner: TComponent);
{$IFDEF FPC}
var Bmp : TBitmap;
{$ENDIF}
begin
  inherited CreateNew(AOwner,0);

  FimLogo := TImage.Create(Self);
  FlblCopyRight := TLabel.Create(Self);
  FlblName := TLabel.Create(Self);
  FlblVersion := TLabel.Create(Self);
  FlblPleaseVisitUs := TLabel.Create(Self);
  FlblURL := TLabel.Create(Self);
  {$IFDEF LCL}
  FbbtnOk := TBitBtn.Create(Self);
  {$ELSE}
  FbbtnOk := TButton.Create(Self);
  {$ENDIF}
    Name := 'formAbout';
    Left := 0;
    Top := 0;
    Anchors := [];//[akLeft, akTop, akRight,akBottom];
    BorderIcons := [biSystemMenu];
    BorderStyle := bsDialog;

    Caption := RSAAboutFormCaption;
    ClientHeight := 336;
    ClientWidth := 554;
    Color := clBtnFace;

    Font.Color := clBtnText;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    Position := poScreenCenter;
    {$IFNDEF FPC}
    Scaled := True;
    {$ENDIF}
    Self.Constraints.MinHeight := Height;
     Self.Constraints.MinWidth := Width;
  //  PixelsPerInch := 96;
  with FimLogo do
  begin
    Name := 'imLogo';
    Parent := Self;
    Left := 0;
    Top := 0;
    Width := 388;
    Height := 240;
//    AutoSize := True;
    {$IFDEF FPC}

   Picture.Bitmap.LoadFromLazarusResource('IndyCar');//this is XPM format
   Picture.Bitmap.TransparentColor := Picture.Bitmap.Canvas.Pixels[0,0];
   Picture.Bitmap.Transparent := True;
      {$ELSE}
    Picture.Bitmap.LoadFromResourceName(HInstance, 'INDYCAR');    {Do not Localize}
    {$ENDIF}
    Transparent := True;
  end;
  with FlblName do
  begin
    Name := 'lblName';
    Parent := Self;
    Left := 390;
    Top := 8;
    Width := 160;
    Height := 104;
    Alignment := taCenter;
    AutoSize := False;
    Anchors := [akLeft, akTop, akRight];
     {$IFNDEF FPC}
    Font.Charset := DEFAULT_CHARSET;
    {$ENDIF}
    Font.Color := clBtnText;
    Font.Height := -16;
    Font.Name := 'Verdana';
    Font.Style := [fsBold];
    ParentFont := False;
    {$IFNDEF FPC}
    Transparent := True;
    {$ENDIF}
    WordWrap := True;

  end;
  with FlblVersion do
  begin
    Name := 'lblVersion';
    Parent := Self;
    Left := 390;
    Top := 72;
    Width := 160;
    Height := 40;
    Alignment := taCenter;
    AutoSize := False;
    {$IFNDEF FPC}
    Font.Charset := DEFAULT_CHARSET;
    {$ENDIF}
    Font.Color := clBtnText;
    Font.Height := -15;
    Font.Name := 'Verdana';
    Font.Style := [fsBold];
    ParentFont := False;
    {$IFNDEF FPC}
    Transparent := True;
    {$ENDIF}
    Anchors := [akLeft, akTop, akRight];
  end;
  with FlblCopyRight do
  begin
    Name := 'lblCopyRight';
    Parent := Self;
    Left := 390;
    Top := 128;
    Width := 160;
    Height := 112;
    Alignment := taCenter;
    Anchors := [akLeft, akTop, akRight];
    AutoSize := False;
    Caption := RSAAboutBoxCopyright;
    {$IFNDEF FPC}
    Font.Charset := DEFAULT_CHARSET;
    {$ENDIF}
    Font.Color := clBtnText;
    Font.Height := -13;
    Font.Name := 'Verdana';
    Font.Style := [fsBold];
    ParentFont := False;
    {$IFNDEF FPC}
    Transparent := True;
    {$ENDIF}
    WordWrap := True;
  end;


  with FlblPleaseVisitUs do
  begin
    Name := 'lblPleaseVisitUs';
    Parent := Self;
    Left := 8;
    Top := 244;
    Width := 540;
    Height := 23;
    Alignment := taCenter;
    AutoSize := False;
        {$IFNDEF FPC}
    Font.Charset := DEFAULT_CHARSET;
    {$ENDIF}
    {$IFNDEF FPC}
    Transparent := True;
    {$ENDIF}
    Font.Height := -13;
    Font.Name := 'Verdana';
    Caption := RSAAboutBoxPleaseVisit;
    Anchors := [akLeft, akTop, akRight];
  end;
  with FlblURL do
  begin
    Name := 'lblURL';
    Left := 8;
    Top := 260;
    Width := 540;
    Height := 23;

    Cursor := crHandPoint;
    Alignment := taCenter;
    AutoSize := False;
    {$IFNDEF FPC}
    Font.Charset := DEFAULT_CHARSET;
    {$ENDIF}
    Font.Color := clBlue;
    Font.Height := -13;
    Font.Name := 'Verdana';
    Font.Style := [fsUnderline];
    ParentFont := False;
    {$IFNDEF FPC}
    Transparent := True;
    {$ENDIF}
    OnClick := lblURLClick;
    Caption := RSAAboutBoxIndyWebsite;
    Anchors := [akLeft, akTop, akRight];
    Parent := Self;
  end;
  with FbbtnOk do
  begin
    Name := 'bbtnOk';

    Left := 475;
    {$IFDEF FPC}
    Top := 297;
    {$ELSE}
      Top := 302;
      Height := 25;
    {$ENDIF}
    Width := 75;

    Anchors := [akRight, akBottom];
    {$IFDEF FPC}
     Kind := bkOk;
    {$ELSE}
    Cancel := True;
    Default := True;
    ModalResult := 1;

     Caption := RSOk;
     {$ENDIF}
     TabOrder := 0;
    Anchors := [akLeft, akTop, akRight];
    Parent := Self;

  end;
end;

function TfrmAbout.GetVersion: String;
begin
  Result :=  FlblVersion.Caption;
end;

function TfrmAbout.GetProductName: String;
begin
  Result := FlblName.Caption;
end;

procedure TfrmAbout.lblURLClick(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
  ShellAPI.shellExecute(Handle,PChar('open'),PChar(FlblURL.Caption),nil,nil, 0);    {Do not Localize}
  FlblURL.Font.Color := clPurple;
  {$ENDIF}
end;

procedure TfrmAbout.SetVersion(const AValue: String);
begin
  FlblVersion.Caption := AValue;
end;

procedure TfrmAbout.SetProductName(const AValue: String);
begin
  FlblName.Caption := AValue;
end;

class procedure TfrmAbout.ShowAboutBox(const AProductName,
  AProductVersion: String);
begin
  with TfrmAbout.Create do
  try
     Version := Sys.Format ( RSAAboutBoxVersion, [AProductVersion] );
     ProductName := AProductName;
     ShowModal;
  finally
    Free;
  end;
end;

class procedure TfrmAbout.ShowDlg;
begin
  ShowAboutBox(RSAAboutBoxCompName, gsIdVersion);
end;

constructor TfrmAbout.Create;
begin
  Create(nil);
end;

{$IFDEF FPC}
initialization
  {$i IdAboutVCL.lrs}
{$ENDIF}
end.
