program LazPkgGen;

{$APPTYPE CONSOLE}

uses
  ShellAPI,
  Windows,
  ExceptionLog,
  Classes,
  SysUtils,
  IdGlobal,
  DBTables,
  DModule in 'DModule.pas' {DM: TDataModule};

{
I can't use PkgGen to create packages at all.

There are two reasons:

1) We are only going to make one complete set of .lpk (Lazarus package files.
The same .lpk file will be used for Linux, FreeBSD, Windows, and whatever else
because we will NOT list any system-specific units.  We let the compiler link
those in.  I am doing this to provide developers a way to cross-compile
Indy units and have more than one set of binaries for different
platform/operating system combinations.  I also do not have to know
what system Indy will be compiled on.  I'm thinking a hierarchy such as this:

===
  System
    lib
      i386-win32
      arm-wince
      i386-linux
      x64-linux
      sparc-linux
      ppc-linux
  Core
    lib
      i386-win32
      arm-wince
      i386-linux
      x64-linux
      sparc-linux
      ppc-linux
  Protocols
    lib
      i386-win32
      arm-wince
      i386-linux
      x64-linux
      sparc-linux
      ppc-linux
===

2) The program assumes all you pass to a code generation
procedure is a unit file name.  In Lazarus, this is NOT so.  In Lazarus,
each file is listed as an XML entry.  This entry has attributes such as
"hasregisterproc".  Then for a few design-time packages, there is an associated
(.LRS file that contains resources such as our XPM component icons and that an
additional entry.

Not only do you need file entries but a count of the entries.

The format is like this:

===
    <Files Count="9">
      <Item1>
        <Filename Value="IdAbout.pas"/>
        <UnitName Value="IdAbout"/>
      </Item1>
      <Item2>
        <Filename Value="IdAboutVCL.pas"/>
        <UnitName Value="IdAboutVCL"/>
      </Item2>
      <Item3>
        <Filename Value="IdAboutVCL.lrs"/>
        <Type Value="LRS"/>
      </Item3>
      <Item4>
        <Filename Value="IdAntiFreeze.pas"/>
        <UnitName Value="IdAntiFreeze"/>
      </Item4>
      <Item5>
        <Filename Value="IdDsnBaseCmpEdt.pas"/>
        <UnitName Value="IdDsnBaseCmpEdt"/>
      </Item5>
      <Item6>
        <Filename Value="IdDsnCoreResourceStrings.pas"/>
        <UnitName Value="IdDsnCoreResourceStrings"/>
      </Item6>
      <Item7>
        <Filename Value="IdRegisterCore.pas"/>
        <HasRegisterProc Value="True"/>
        <UnitName Value="IdRegisterCore"/>
      </Item7>
      <Item8>
        <Filename Value="IdRegisterCore.lrs"/>
        <Type Value="LRS"/>
      </Item8>
      <Item9>
        <Filename Value="IdCoreDsnRegister.pas"/>
        <HasRegisterProc Value="True"/>
        <UnitName Value="IdCoreDsnRegister"/>
      </Item9>
    </Files>
===
}
//i is a var that this procedure will cmanage for the main loop.
procedure WriteLRSEntry(var VEntryCount : Integer; var VOutput : String);
var s : String;
begin
  Inc(VEntryCount);
  s := '      <Item'+IntToStr(VEntryCount)+'>'+EOL;
  s := s +'        <Filename Value="' +DM.tablFileFileName.Value + '.pas"/>'+EOL;
  if DM.tablFileFPCHasRegProc.Value then
  begin
    s := s +'        <HasRegisterProc Value="True"/>'+EOL;
  end;
  s := s +'        <UnitName Value="'+ DM.tablFileFileName.Value + '"/>'+EOL;
  s := s +'      </Item'+IntToStr(VEntryCount)+'>'+EOL;
  if DM.tablFileFPCHasLRSFile.Value then
  begin
    Inc(VEntryCount);
    s := s +'      <Item'+IntToStr(VEntryCount)+'>'+EOL;
    s := s +'        <Filename Value="'+DM.tablFileFileName.Value +'.lrs"/>'+EOL;
    s := s +'        <Type Value="LRS"/>'+EOL;
    s := s +'      </Item'+IntToStr(VEntryCount)+'>'+EOL;
  end;
  VOUtput := VOUtput + s;
end;

function MakeLRS(const AWhere: string; const APackageName : String; const AFileName : String) : String;
var i : Integer;
  s : String;
  LS : TStrings;
begin
  LS := TStringList.Create;
  try
    LS.LoadFromFile('W:\Source\Indy10\Builder\Package Generator\LazTemplates\'+AFileName);
    Result := LS.Text;
  finally
    FreeAndNil(LS);
  end;
  i := 0;
  s := '';
  DM.tablFile.Filter := AWhere;
  DM.tablFile.Filtered := True;
  DM.tablFile.First;
  while not DM.tablFile.EOF do begin
    if APackageName<>'' then
    begin
      if DM.tablFilePkg.Value = APackageName then
      begin
        WriteLRSEntry(i,s);
      end;
    end
    else
    begin
        WriteLRSEntry(i,s);
    end;
    DM.tablFile.Next;
  end;
  DM.tablFile.Filtered := False;
  s := '    <Files Count="'+IntToStr(i)+'">'+ EOL +
    s +'    </Files>';
  Result := StringReplace(Result,'{%FILES}',s,[rfReplaceAll]);
end;

procedure WriteFile(const AContents, AFileName : String);
var
  LCodeOld: string;
begin
  if FileExists(AFileName) then begin
    with TStringList.Create do try
      LoadFromFile(AFileName);
      LCodeOld := Text;
    finally Free; end;
  end;
 // Only write out the code if its different. This prevents unnecessary checkins as well
  // as not requiring user to lock all packages

  if (LCodeOld = '') or (LCodeOld <> AContents) then begin
    with TStringList.Create do try
      Text := AContents;
      SaveToFile(AFileName);
    finally Free; end;
  end;
end;

function GetTempDirectory: String;

var  TempDir: TIdBytes;
   LLen : Cardinal;
begin
  SetLength(TempDir,MAX_PATH);
 // FillChar(TempDir[0],#0,MAX_PATH);
  repeat
    LLen := GetTempPath(MAX_PATH, @TempDir[0]);
    if (LLen=0) then
    begin
      Result := '';
      exit;
    end;
    if LLen > MAX_PATH then
    begin
       //increase array size, too small
       SetLength(TempDir,LLen);
    end
    else
    begin
      Break;
    end;
  until False;
  Result := IdGlobal.BytesToString(TempDir,0,LLen)
//  Result :=  PChar(@TempDir[0]);
end;

//This is from:
// http://www.delphidabbler.com/articles?article=6
function GetEnvVarValue(const VarName: string): string;
var
  BufSize: Integer;  // buffer size required for value
begin
  // Get required buffer size (inc. terminal #0)
  BufSize := GetEnvironmentVariable(
    PChar(VarName), nil, 0);
  if BufSize > 0 then
  begin
    // Read env var value into result string
    SetLength(Result, BufSize - 1); 
    GetEnvironmentVariable(PChar(VarName), 
      PChar(Result), BufSize);
  end
  else
    // No such environment variable
    Result := '';
end;

function SetEnvVarValue(const VarName,
  VarValue: string): Integer;
begin
  // Simply call API function
  if SetEnvironmentVariable(PChar(VarName),
    PChar(VarValue)) then
    Result := 0
  else
    Result := GetLastError;
end;

function DeleteEnvVar(const VarName: string): Integer;
begin
  if SetEnvironmentVariable(PChar(VarName), nil) then
    Result := 0
  else
    Result := GetLastError;
end;
function GetAllEnvVars(const Vars: TStrings): Integer;
var
  PEnvVars: PChar;    // pointer to start of environment block
  PEnvEntry: PChar;   // pointer to an env string in block
begin
  // Clear the list
  if Assigned(Vars) then
    Vars.Clear;
  // Get reference to environment block for this process
  PEnvVars := GetEnvironmentStrings;
  if PEnvVars <> nil then
  begin
    // We have a block: extract strings from it
    // Env strings are #0 separated and list ends with #0#0
    PEnvEntry := PEnvVars;
    try
      while PEnvEntry^ <> #0 do
      begin
        if Assigned(Vars) then
          Vars.Add(PEnvEntry);
        Inc(PEnvEntry, StrLen(PEnvEntry) + 1);
      end;
      // Calculate length of block
      Result := (PEnvEntry - PEnvVars) + 1;
    finally
      // Dispose of the memory block
      Windows.FreeEnvironmentStrings(PEnvEntry);
    end;
  end
  else
    // No block => zero length
    Result := 0;
end;
function CreateEnvBlock(const NewEnv: TStrings; 
  const IncludeCurrent: Boolean;
  const Buffer: Pointer; 
  const BufSize: Integer): Integer;
var
  EnvVars: TStringList; // env vars in new block
  Idx: Integer;         // loops thru env vars
  PBuf: PChar;          // start env var entry in block
begin
  // String list for new environment vars
  EnvVars := TStringList.Create;
  try
    // include current block if required
    if IncludeCurrent then
      GetAllEnvVars(EnvVars);
    // store given environment vars in list
    if Assigned(NewEnv) then
      EnvVars.AddStrings(NewEnv);
    // Calculate size of new environment block
    Result := 0;
    for Idx := 0 to Pred(EnvVars.Count) do
      Inc(Result, Length(EnvVars[Idx]) + 1);
    Inc(Result);
    // Create block if buffer large enough
    if (Buffer <> nil) and (BufSize >= Result) then
    begin
      // new environment blocks are always sorted
      EnvVars.Sorted := True;
      // do the copying
      PBuf := Buffer;
      for Idx := 0 to Pred(EnvVars.Count) do
      begin
        StrPCopy(PBuf, EnvVars[Idx]);
        Inc(PBuf, Length(EnvVars[Idx]) + 1);
      end;
      // terminate block with additional #0
      PBuf^ := #0;
    end;
  finally
    EnvVars.Free;
  end;
end;
procedure ExecAppWithEnvBlock;
var
  SI: TStartupInfo;         // start up info
  PI: TProcessInformation;  // process info
  NewEnv: TStringList;      // new env strings
  BufSize: Integer;         // env block size
  Buffer: PChar;            // env block
begin
  // Create new env block
  NewEnv := TStringList.Create;
  try
    NewEnv.Add('FOO=Bar');
    BufSize := CreateEnvBlock(NewEnv, False, nil, 0);
    Buffer := StrAlloc(BufSize);
    try
      CreateEnvBlock(NewEnv, False, Buffer, BufSize);
      // Exec child process 
      FillChar(SI, SizeOf(SI), 0);
      SI.cb := SizeOf(SI);
      // Execute the program
      CreateProcess(nil, 'ChildProg.exe', nil, nil, True, 
        0, Buffer, nil, SI, PI);
    finally
      // Free the memory
      StrDispose(Buffer);
    end;
  finally
    NewEnv.Free;
  end;
end;


function ExpandEnvVars(const Str: string): string;
var
  BufSize: Integer; // size of expanded string
begin
  // Get required buffer size 
  BufSize := ExpandEnvironmentStrings(
    PChar(Str), nil, 0);
  if BufSize > 0 then
  begin
    // Read expanded string into result string
    SetLength(Result, BufSize); 
    ExpandEnvironmentStrings(PChar(Str), 
      PChar(Result), BufSize);
  end
  else
    // Trying to expand empty string
    Result := '';
end;
   {==end block==}
   
//This is from:
//http://www.swissdelphicenter.ch/en/showcode.php?id=683
//
//We use it to run fpcmake so we can redirect the output from it
//onto our console instead of its own Window.  This is necessary
//so the results could appear in our caller's display.
function CreateDOSProcessRedirected(const CommandLine, CurrDir, InputFile, OutputFile,
  ErrMsg: string; const EnvVars : TStrings = nil): Boolean;
const
  ROUTINE_ID = '[function: CreateDOSProcessRedirected ]';
var
 // OldCursor: TCursor;
  pCommandLine: array[0..MAX_PATH] of Char;
  pInputFile, pOutPutFile: array[0..MAX_PATH] of Char;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  SecAtrrs: TSecurityAttributes;
  hAppProcess, hAppThread, hInputFile, hOutputFile: THandle;

  EnvBufSize: Integer;         // env block size
  EnvBuffer: PChar;            // env block
begin
  Result := False;
  EnvBufSize := 0;
  EnvBuffer := nil;
  { check for InputFile existence }
  if not FileExists(InputFile) then
  begin
    raise Exception.CreateFmt(ROUTINE_ID + #10 + #10 +
      'Input file * %s *' + #10 +
      'does not exist' + #10 + #10 +
      ErrMsg, [InputFile]);
  end;
  { save the cursor }
//  OldCursor     := Screen.Cursor;
//  Screen.Cursor := crHourglass;

  { copy the parameter Pascal strings to null terminated strings }
  StrPCopy(pCommandLine, CommandLine);
  StrPCopy(pInputFile, InputFile);
  StrPCopy(pOutPutFile, OutputFile);

  try

    { prepare SecAtrrs structure for the CreateFile calls
      This SecAttrs structure is needed in this case because
      we want the returned handle can be inherited by child process
      This is true when running under WinNT.
      As for Win95 the documentation is quite ambiguous }
    FillChar(SecAtrrs, SizeOf(SecAtrrs), #0);
    SecAtrrs.nLength        := SizeOf(SecAtrrs);
    SecAtrrs.lpSecurityDescriptor := nil;
    SecAtrrs.bInheritHandle := True;

    { create the appropriate handle for the input file }
    hInputFile := CreateFile(pInputFile,
      { pointer to name of the file }
      GENERIC_READ or GENERIC_WRITE,
      { access (read-write) mode }
      FILE_SHARE_READ or FILE_SHARE_WRITE,
      { share mode } @SecAtrrs,                             { pointer to security attributes }
      OPEN_ALWAYS,                           { how to create }
      FILE_ATTRIBUTE_TEMPORARY,              { file attributes }
      0);                                   { handle to file with attributes to copy }


    { is hInputFile a valid handle? }
    if hInputFile = INVALID_HANDLE_VALUE then
      raise Exception.CreateFmt(ROUTINE_ID + #10 + #10 +
        'WinApi function CreateFile returned an invalid handle value' +
        #10 +
        'for the input file * %s *' + #10 + #10 +
        ErrMsg, [InputFile]);

    { create the appropriate handle for the output file }
    hOutputFile := CreateFile(pOutPutFile,
      { pointer to name of the file }
      GENERIC_READ or GENERIC_WRITE,
      { access (read-write) mode }
      FILE_SHARE_READ or FILE_SHARE_WRITE,
      { share mode } @SecAtrrs,                             { pointer to security attributes }
      CREATE_ALWAYS,                         { how to create }
      FILE_ATTRIBUTE_TEMPORARY,              { file attributes }
      0);                                   { handle to file with attributes to copy }

    { is hOutputFile a valid handle? }
    if hOutputFile = INVALID_HANDLE_VALUE then
      raise Exception.CreateFmt(ROUTINE_ID + #10 + #10 +
        'WinApi function CreateFile returned an invalid handle value' +
        #10 +
        'for the output file * %s *' + #10 + #10 +
        ErrMsg, [OutputFile]);

    { prepare StartupInfo structure }
    FillChar(StartupInfo, SizeOf(StartupInfo), #0);
    StartupInfo.cb          := SizeOf(StartupInfo);
    StartupInfo.dwFlags     := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    StartupInfo.wShowWindow := SW_HIDE;
    StartupInfo.hStdOutput  := hOutputFile;
    StartupInfo.hStdInput   := hInputFile;
    if Assigned(EnvVars) and (EnvVars.Count > 0) then
    begin
      EnvBufSize := CreateEnvBlock(EnvVars, False, nil, 0);
      EnvBuffer := StrAlloc(EnvBufSize);
      CreateEnvBlock(EnvVars, False, EnvBuffer, EnvBufSize);
    end;

    try
    { create the app }
      Result := CreateProcess(nil,                           { pointer to name of executable module }
        pCommandLine,
        { pointer to command line string }
        nil,                           { pointer to process security attributes }
        nil,                           { pointer to thread security attributes }
        True,                          { handle inheritance flag }
        CREATE_NEW_CONSOLE or
        REALTIME_PRIORITY_CLASS,       { creation flags }
        EnvBuffer,                           { pointer to new environment block }
        PChar(CurrDir),                           { pointer to current directory name }
        StartupInfo,                   { pointer to STARTUPINFO }
        ProcessInfo);                  { pointer to PROCESS_INF }

      { wait for the app to finish its job and take the handles to free them later }
      if Result then
      begin
        WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
        hAppProcess := ProcessInfo.hProcess;
        hAppThread  := ProcessInfo.hThread;
      end
      else
        raise Exception.Create(ROUTINE_ID + #10 + #10 +
          'Function failure' + #10 + #10 +
          ErrMsg);
    finally
      // Free the memory
      if EnvBuffer <> nil then
      begin
        StrDispose(EnvBuffer);
      end;
    end;
  finally
    { close the handles
      Kernel objects, like the process and the files we created in this case,
      are maintained by a usage count.
      So, for cleaning up purposes we have to close the handles
      to inform the system that we don't need the objects anymore }
    if hOutputFile <> 0 then
      CloseHandle(hOutputFile);
    if hInputFile <> 0 then
      CloseHandle(hInputFile);
    if hAppThread <> 0 then
      CloseHandle(hAppThread);
    if hAppProcess <> 0 then
      CloseHandle(hAppProcess);
    { restore the old cursor }
  //  Screen.Cursor := OldCursor;
  end;
end;

procedure MakeMakefile(const AMakefileDir : String);
var LInputFile, LOutputFile : String;
  s : TStrings;
  i : Integer;
  NewEnv : TStrings;
begin
  s := TStringList.Create;
  try
    LInputFile := GetTempDirectory+'\inputdummy.txt';
     s.SaveToFile(LInputFile);
     LOutputFile := GetTempDirectory+'\output.txt';
    NewEnv := TStringList.Create;
    try
      NewEnv.Add('FPCDIR=w:\fpc');
      CreateDOSProcessRedirected('C:\lazarus\pp\bin\i386-win32\fpcmake.exe -vTall',
        AMakeFileDir,LInputFile,LOutputFile,'Error: ',NewEnv);
    finally
      FreeANdNil(NewEnv);
    end;
    s.LoadFromFile(LOutputFile);
    for i := 0 to s.Count - 1 do
    begin
      WriteLn(s[i]);
    end;  
  finally
    FreeAndNil(s);
  end;


end;

procedure MakeFPCMasterPackage(const AWhere: string; const AFileName : String;
   const AOutPath : String);
var s, LS : TStringList;
  Lst : String;
  i : Integer;
  LTemp : String;
begin
  DM.tablFile.Filter := AWhere;
  DM.tablFile.Filtered := True;
  DM.tablFile.First;
  s := TStringList.Create;
  try
    while not DM.tablFile.Eof do
    begin
      s.Add(DM.tablFileFileName.Value );
      DM.tablFile.Next;
    end;
    //construct our make file
    LS := TStringList.Create;
    try
      LS.LoadFromFile('W:\Source\Indy10\Builder\Package Generator\LazTemplates\'+AFileName+'-Makefile.fpc');
      LTemp := LS.Text;
    finally
      FreeAndNil(LS);
    end;
    Lst := '';
     for i := 0 to s.Count -1 do
     begin
       if (i = s.Count -1) then
       begin
           LSt := Lst +'  '+s[i]+EOL;
       end
       else
       begin
          LSt := Lst + '  '+s[i]+' \'+EOL;
       end;
     end;

     Lst := 'implicitunits='+TrimLeft(Lst);
     LTemp := StringReplace(LTemp,'{%FILES}',LSt,[rfReplaceAll]);
     WriteFile(LTemp,AOutPath+'\'+AFileName+'-Makefile.fpc');
  finally
    FreeAndNil(s);
  end;
  DM.tablFile.Filtered := False;
end;

procedure MakeFPCPackage(const AWhere: string; const AFileName : String;
  const APkgName : String; const AOutPath : String);
var s, LS : TStringList;
  Lst : String;
  i : Integer;
  LTemp : String;

begin
  DM.tablFile.Filter := AWhere;
  DM.tablFile.Filtered := True;
  DM.tablFile.First;
  s := TStringList.Create;
  try
    while not DM.tablFile.Eof do
    begin
      if DM.tablFilePkg.Value = APkgName then
      begin
        s.Add(DM.tablFileFileName.Value );
      end;
      DM.tablFile.Next;
    end;
    //construct our make file
    LS := TStringList.Create;
    try
      LS.LoadFromFile('W:\Source\Indy10\Builder\Package Generator\LazTemplates\'+AFileName+'-Makefile.fpc');
      LTemp := LS.Text;
    finally
      FreeAndNil(LS);
    end;

    //now make our package file.  This is basically a dummy unit that lists

     Lst := '';
     for i := 0 to s.Count -1 do
     begin
       if (i = s.Count -1) then
       begin
           LSt := Lst +'  '+s[i]+EOL;
       end
       else
       begin
          LSt := Lst + '  '+s[i]+' \'+EOL;
       end;
     end;

     Lst := 'implicitunits='+TrimLeft(Lst);
     LTemp := StringReplace(LTemp,'{%FILES}',LSt,[rfReplaceAll]);
     WriteFile(LTemp,AOutPath+ '\Makefile.fpc');

    //all of the files.
     for i := 0 to s.Count -1 do
     begin
       if (i = s.Count -1)  then
       begin
         s[i] := '  '+s[i]+';';
       end
       else
       begin
          s[i] := '  '+s[i]+',';
       end;
     end;

     s.Insert(0,'uses');
     s.Insert(0,'');
     s.Insert(0,'interface');
     s.Insert(0,'unit '+AFileName+';');
     //
     s.Add('');
     s.Add('implementation');
     s.Add('');
     s.Add('end.');
     WriteFile(s.text,AOutPath+ '\' + AFileName+'.pas');
      MakeMakeFile(AOutpath);
  finally
    FreeAndNil(s);
  end;
  DM.tablFile.Filtered := False;
end;

procedure Writelpk(const AWhere: string; const AFileName : String; const APkgName : String; const AOutPath : String);
var
  LCodeOld: string;
  LNewCode : String;
  LPathname: string;
begin
  LPathname := AOutPath + '\' + AFileName;

  LNewCode := MakeLRS(AWhere,APkgName,AFileName);
  WriteFile(LNewCode,LPathName);
end;


procedure MakeFileDistList;
var s : TStringList;
  Lst : String;
begin
  DM.tablFile.Filter := 'FPC=True and DesignUnit=False';
  DM.tablFile.Filtered := True;
  DM.tablFile.First;
  s := TStringList.Create;
  try
    while not DM.tablFile.Eof do
    begin
      LSt := DM.tablFile.FieldByName('Pkg').AsString+'\' + DM.tablFile.FieldByName('FileName').AsString+'.pas';
      s.Add(LSt);
      if DM.tablFile.FieldByName('FPCHasLRSFile').AsBoolean then
      begin
        LSt := DM.tablFile.FieldByName('Pkg').AsString+'\' + DM.tablFile.FieldByName('FileName').AsString+'.lrs';
        s.Add(LSt);
      end;
      DM.tablFile.Next;
    end;
    s.SaveToFile('W:\Source\Indy\Indy10FPC\Lib\RTFileList.txt');

  finally
    FreeAndNil(s);
  end;
  DM.tablFile.Filtered := False;
  DM.tablFile.Filter := 'FPC=True and DesignUnit=True';
  DM.tablFile.Filtered := True;
  DM.tablFile.First;
  s := TStringList.Create;
  try
    while not DM.tablFile.Eof do
    begin
      LSt := DM.tablFile.FieldByName('Pkg').AsString+'\' + DM.tablFile.FieldByName('FileName').AsString+'.pas';
      s.Add(LSt);
      if DM.tablFile.FieldByName('FPCHasLRSFile').AsBoolean then
      begin
        LSt := DM.tablFile.FieldByName('Pkg').AsString+'\' + DM.tablFile.FieldByName('FileName').AsString+'.lrs';
        s.Add(LSt);
      end;
      DM.tablFile.Next;
    end;
    s.SaveToFile('W:\Source\Indy\Indy10FPC\Lib\DTFileList.txt');
  finally
    FreeAndNil(s);
  end;
end;

begin
  { TODO -oUser -cConsole Main : Insert code here }
  DM := TDM.Create(nil); try
    with DM do begin
      // Default Output Path is w:\source\Indy10
      DM.OutputPath := 'w:\source\Indy10';
      // Default Data Path is W:\source\Indy10\builder\Package Generator\Data
      DM.DataPath   := 'W:\source\Indy10\builder\Package Generator\Data';
      tablFile.Open;
      MakeFPCPackage('FPC=True and FPCListInPkg=True and DesignUnit=False', 'indysystemfpc','System','w:\source\Indy\Indy10FPC\Lib\System');
   //   WriteLPK('FPC=True and FPCListInPkg=True and DesignUnit=False','indysystemlaz.lpk','System','w:\source\Indy\Indy10FPC\Lib\System');
      MakeFPCPackage('FPC=True and FPCListInPkg=True and DesignUnit=False','indycorefpc','Core','w:\source\Indy\Indy10FPC\Lib\Core');
//    WriteLPK      ('FPC=True and FPCListInPkg=True and DesignUnit=False','indycorefpc','Core','w:\source\Indy\Indy10FPC\Lib\Core');
      WriteLPK('FPC=True and FPCListInPkg=True and DesignUnit=true','dclindycorelaz.lpk', 'Core',          'w:\source\Indy\Indy10FPC\Lib\Core');
      MakeFPCPackage('FPC=True and FPCListInPkg=True and DesignUnit=False','indyprotocolsfpc',  'Protocols', 'W:\Source\Indy\Indy10FPC\Lib\Protocols');
      WriteLPK('FPC=True and FPCListInPkg=True and DesignUnit=true','dclindyprotocolslaz.lpk','Protocols', 'W:\Source\Indy\Indy10FPC\Lib\Protocols');
      WriteLPK('FPC=True and FPCListInPkg=True and DesignUnit=true','indylaz.lpk','', 'W:\Source\Indy\Indy10FPC\Lib');
      MakeFileDistList;
      MakeFPCMasterPackage('FPC=True and FPCListInPkg=True and DesignUnit=False','indymaster', 'W:\Source\Indy\Indy10FPC\Lib');
    end;
  finally
    FreeAndNil(DM);
  end;
end.
