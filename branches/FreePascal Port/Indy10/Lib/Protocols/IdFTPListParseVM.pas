{
  $Project$
  $Workfile$
  $Revision$
  $DateUTC$
  $Id$

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log$


    Rev 1.8    2/24/2005 10:01:34 AM  JPMugaas
  Fixed estimation of filesize for variable record length files (V) in z/VM to
  conform to what was specified in:

  z/VMTCP/IP User�s Guide Version 5 Release 1.0

  This will not always give the same estimate as the server would when listing
  in Unix format "SITE LISTFORMAT UNIX" because we can't know the block size
  (we have to assume a size of 4096).


    Rev 1.7    10/26/2004 10:03:20 PM  JPMugaas
  Updated refs.


    Rev 1.6    9/7/2004 10:02:30 AM  JPMugaas
  Tightened the VM/BFS parser detector so that valid dates have to start the
  listing item.  This should reduce the likelyhood of error.


    Rev 1.5    6/28/2004 4:34:18 AM  JPMugaas
  VM_CMS-ftp.marist.edu-7.txt was being detected as VM/BFS instead of VM/CMS
  causing a date encode error.


    Rev 1.4    4/19/2004 5:05:32 PM  JPMugaas
  Class rework Kudzu wanted.


    Rev 1.3    2004.02.03 5:45:22 PM  czhower
  Name changes


    Rev 1.2    10/19/2003 3:48:12 PM  DSiders
  Added localization comments.


    Rev 1.1    4/7/2003 04:04:30 PM  JPMugaas
  User can now descover what output a parser may give.


    Rev 1.0    2/19/2003 04:18:20 AM  JPMugaas
  More things restructured for the new list framework.
}
unit IdFTPListParseVM;

interface
{$i IdCompilerDefines.inc}

uses
  IdFTPList, IdFTPListParseBase, IdFTPListTypes, IdObjs;

{
IBM VM and z/VM parser
}
type
  TIdVMCMSFTPListItem = class(TIdRecFTPListItem)
  protected
    FOwnerName : String;
    FNumberBlocks : Integer;
  public
    property RecLength : Integer read FRecLength write FRecLength;
    property RecFormat : String read FRecFormat write FRecFormat;
    property NumberRecs : Integer read FNumberRecs write FNumberRecs;
    property OwnerName : String read FOwnerName write FOwnerName;
    property NumberBlocks : Integer read FNumberBlocks write FNumberBlocks;
  end;
  TIdVMVirtualReaderFTPListItem = class(TIdFTPListItem)
  protected
    FNumberRecs : Integer;
  public
     constructor Create(AOwner: TIdCollection); override;
    property NumberRecs : Integer read FNumberRecs write FNumberRecs;
  end;
  TIdVMBFSFTPListItem = class(TIdFTPListItem);
  TIdFTPLPVMCMS = class(TIdFTPListBase)
  protected
    class function MakeNewItem(AOwner : TIdFTPListItems)  : TIdFTPListItem; override;
    class function ParseLine(const AItem : TIdFTPListItem; const APath : String=''): Boolean; override;
  public
    class function GetIdent : String; override;
    class function CheckListing(AListing : TIdStrings; const ASysDescript : String =''; const ADetails : Boolean = True): boolean; override;
  end;
  TIdFTPLPVMBFS = class(TIdFTPListBase)
  protected
    class function MakeNewItem(AOwner : TIdFTPListItems)  : TIdFTPListItem; override;
    class function ParseLine(const AItem : TIdFTPListItem; const APath : String=''): Boolean; override;
  public
    class function GetIdent : String; override;
    class function CheckListing(AListing : TIdStrings; const ASysDescript : String =''; const ADetails : Boolean = True): boolean; override;
  end;
  TIdFTPLVirtualReader = class(TIdFTPListBase)
  protected
    class function MakeNewItem(AOwner : TIdFTPListItems)  : TIdFTPListItem; override;
    class function ParseLine(const AItem : TIdFTPListItem; const APath : String=''): Boolean; override;
  public
    class function GetIdent : String; override;
    class function CheckListing(AListing : TIdStrings; const ASysDescript : String =''; const ADetails : Boolean = True): boolean; override;
  end;

implementation

uses
  IdGlobal, IdFTPCommon, IdGlobalProtocols,
  IdSys;

{ TIdFTPLPVMCMS }

class function TIdFTPLPVMCMS.CheckListing(AListing: TIdStrings;
  const ASysDescript: String; const ADetails: Boolean): boolean;
const VMTypes : array [1..3] of string = ('F','V','DIR'); {do not localize}
var LData : String;
begin
  Result := False;
  if AListing.Count > 0 then
  begin
    LData := AListing[0];
    Result := PosInStrArray(( Sys.Trim(Copy(LData,19,3))),VMTypes) <> -1;
    if Result then
    begin
      Result := (Copy(LData,56,1)='/') and (Copy(LData,59,1)='/');
      if Result = False then
      begin
        Result := (Copy(LData,58,1)='-') and (Copy(LData,61,1)='-');
        if Result = False then
        begin
          Result := (Copy(LData,48,1)='-') and (Copy(LData,51,1)='-');
        end;
      end;
    end;
  end;
end;

class function TIdFTPLPVMCMS.GetIdent: String;
begin
  Result := 'VM/CMS'; {do not localize}
end;

class function TIdFTPLPVMCMS.MakeNewItem(
  AOwner: TIdFTPListItems): TIdFTPListItem;
begin
  Result := TIdVMCMSFTPListItem.Create(AOwner);
end;

class function TIdFTPLPVMCMS.ParseLine(const AItem: TIdFTPListItem;
  const APath: String): Boolean;
var LBuffer : String;
  LCols : TIdStrings;
  LI : TIdVMCMSFTPListItem;
  LSize : Int64;
begin
{Some of this is based on the following:

http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&oe=utf-8&threadm=4e7k0p%24t1v%40blackice.winternet.com&rnum=4&prev=/groups%3Fq%3DVM%2BFile%2BRecords%2Bdirectory%26hl%3Den%26lr%3D%26ie%3DUTF-8%26oe%3Dutf-8%26selm%3D4e7k0p%2524t1v%2540blackice.winternet.com%26rnum%3D4

and

http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&oe=utf-8&selm=DLspv2.G2w%40epsilon.com&rnum=2
}
{
123456789012345678901234567890123456789012345678901234567890123456789012
         1         2         3         4         5         6         7
OMA00215 PLAN     V         64         28          1  6/26/02  9:33:21 -
WEBSHARE          DIR        -          -          -  5/30/97 18:44:17 -

or

README   ANONYMOU V         71         26          1 1997-04-02 12:33:20 TCP291

or maybe this:

ENDTRACE TCPIP    F      80       1      1 1999-07-28 12:24:01 TCM191
23456789012345678901234567890123456789012345678901234567890123456789012
         1         2         3         4         5         6         7
}
  LI := AItem as TIdVMCMSFTPListItem;
  //File Name
  LI.FileName := Copy(AItem.Data,1,8);
  LI.FileName := Sys.Trim(AItem.FileName);
  //File Type - extension
  if (LI.Data[9] = ' ') then
  begin
    LBuffer := Copy(AItem.Data,10,9);
  end
  else
  begin
    LBuffer := Copy(AItem.Data,9,9);
  end;
  LBuffer := Sys.Trim(LBuffer);
  if (LBuffer <> '') then
  begin
    LI.FileName := LI.FileName + '.'+LBuffer;
  end;
  //Record format
  LBuffer := Copy(AItem.Data,19,3);
  LBuffer := Sys.Trim(LBuffer);
  LI.RecFormat := LBuffer;
  if LI.RecFormat = 'DIR' then {do not localize}
  begin
    LI.ItemType := ditDirectory;
    LI.RecLength := 0;
  end
  else
  begin
    LI.ItemType := ditFile;
    //Record Length - for files
    LBuffer := Copy(AItem.Data,22,9);
    LBuffer := Sys.Trim(LBuffer);
    LI.RecLength := Sys.StrToInt(LBuffer,0);
    //Record numbers
    LBuffer := Copy(AItem.Data,31,11);
    LBuffer := Sys.Trim(LBuffer);
    LBuffer := Fetch(LBuffer);
    LI.NumberRecs := Sys.StrToInt(LBuffer,0);
    //Number of Blocks
    {
    From:

    http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&oe=utf-8&selm=DLspv2.G2w%40epsilon.com&rnum=2

    Block sizes can be 800, 512, 1024,
    2048, or 4096, per the whim of the user.  IBM loves 4096, but it wastes
    space (just like on FAT partitions on DOS.)

    For F files (any type which begins with F), record count times logical
    record length.

    For V files, you need to read the file for an exact count, or the block
    size (times block count) for a good guess.  In other words, you're up
    the creek because you don't KNOW the block size.  Use record size times
    record length for a _maximum_ file size.

    Anyway, you can not know from the directory list.
    }
    LBuffer := Copy(AItem.Data,42,11);
    LBuffer := Sys.Trim(LBuffer);
    LI.NumberBlocks := Sys.StrToInt(LBuffer,0);
    LI.Size := LI.RecLength * LI.NumberRecs;
    //File Size - note that this is just an estimiate

    {From:
    z/VMTCP/IP User�s Guide Version 5 Release 1.0
    � Copyright International Business Machines Corporation 1987, 2004.
    All rights reserved.

    For fixed-record (F) format minidisk and SFS files,
    the size field indicates the actual size of a file.
    For variable-record (V) format minidisk and SFS files,
    the size field contains an estimated file size, this
    being the lesser value determined by:

    � the number of records in the file and its maximum record length
    � the size and number of blocks required to maintain the file.

    For virtual reader files, a size of 0 is always indicated.}

    if LI.RecFormat = 'V' then
    begin
      LSize := LI.NumberBlocks * 4096;

      if LI.Size > LSize then
      begin
        LI.Size := LSize;
      end;
    end;
  end;
  LCols := TIdStringList.Create;
  try
    // we do things this way for the rest because vm.sc.edu has
    // a variation on VM/CMS that does directory dates differently
    //and some columns could be off.
    //Note that the start position in one server it's column 44 while in others, it's column 54
    // handle both cases.
    if (Copy(AItem.Data,48,1)='-') and (Copy(AItem.Data,51,1)='-') then
    begin
      LBuffer := Sys.Trim(Copy(AItem.Data, 44,Length(AItem.Data)));
    end
    else
    begin
      LBuffer := Sys.Trim(Copy(AItem.Data, 54,Length(AItem.Data)));
    end;
    SplitColumns(LBuffer,LCols);
    //LCols - 0 - Date
    //LCols - 1 - Time
    //LCols - 2 - Owner if present
    if (LCols.Count >0) then
    begin
      //date
      if IsNumeric(Copy(LCols[0],1,3)) then
      begin
        // vm.sc.edu date stamps yyyy-mm-dd
        LI.ModifiedDate := DateYYMMDD(LCols[0]);
      end
      else
      begin
        //Note that the date is displayed as 2 digits not 4 digits
        //mm/dd/yy
        LI.ModifiedDate := DateMMDDYY(LCols[0]);
      end;
      //time
      LI.ModifiedDate := LI.ModifiedDate + TimeHHMMSS(LCols[1]);
      //owner
      if (LCols.Count > 2) and (LCols[2]<>'-') then
      begin
        LI.OwnerName := LCols[2];
      end;
    end;
  finally
    Sys.FreeAndNil(LCols);
  end;
  Result := True;

end;

{ TIdFTPLPVMBFS }

class function TIdFTPLPVMBFS.CheckListing(AListing: TIdStrings;
  const ASysDescript: String; const ADetails: Boolean): boolean;
var s : TIdStrings;
begin
  Result := False;

  if AListing.Count >0 then
  begin
    //should have a "'" as the terminator
    if AListing[0]<>'' then
    begin
      if Copy(AListing[0],Length(AListing[0]),1)<>'''' then
      begin
        Exit;
      end;
    end;
    s := TIdStringList.Create;
    try
      SplitColumns(Sys.TrimRight(AListing[0]),s);
      if s.Count >4 then
      begin
        if not IsMMDDYY(s[0],'/') then
        begin
          Exit;
        end;
        Result := (s[2]='F') or (s[2]='D');
        if Result then
        begin
          Result := IsNumeric(s[4]) or (s[4]<>'-');
        end;
      end;
    finally
      Sys.FreeAndNil(s);
    end;
  end;
end;

class function TIdFTPLPVMBFS.GetIdent: String;
begin
  Result := 'VM/BFS'; {do not localize}
end;

class function TIdFTPLPVMBFS.MakeNewItem(
  AOwner: TIdFTPListItems): TIdFTPListItem;
begin
  Result := TIdVMBFSFTPListItem.Create(AOwner);
end;

class function TIdFTPLPVMBFS.ParseLine(const AItem: TIdFTPListItem;
  const APath: String): Boolean;
var LBuffer : String;
    LCols : TIdStrings;
// z/VM Byte File System

//This is based on:
//
//   z/VM: TCP/IP Level 430 User's Guide Version 4 Release 3.0
//
// http://www.vm.ibm.com/pubs/pdf/hcsk7a10.pdf
//
begin
  LBuffer := AItem.Data;
  LCols := TIdStringList.Create;
  try
    SplitColumns(Fetch(LBuffer,''''),LCols);
    //0 - date
    //1 - time
    //2 - (D) dir or file (F)
    //3 - not sure what this is
    //4 - file size
    AItem.FileName :=  LBuffer;
    if (Length(AItem.FileName)>0) and (AItem.FileName[Length(AItem.FileName)]='''') then
    begin
      AItem.FileName := Copy(AItem.FileName,1,Length(AItem.FileName)-1);
    end;
    //date
    if (LCols.Count > 0) then
    begin
      AItem.ModifiedDate := DateMMDDYY(LCols[0]);
    end;
    if (LCols.Count > 1) then
    begin
      AItem.ModifiedDate := AItem.ModifiedDate + TimeHHMMSS( LCols[1] );
    end;
    if (LCols.Count > 2) then
    begin
      if LCols[2]='D' then
      begin
        AItem.ItemType := ditDirectory;
      end else begin
        AItem.ItemType := ditFile;
      end;
    end;
    //file size
    if (LCols.Count > 4) then
    begin
      AItem.Size := Sys.StrToInt64(LCols[4],0);
    end;
  finally
    Sys.FreeAndNil(LCols);
  end;
  Result := True;
end;

{ TIdFTPLVirtualReader }

class function TIdFTPLVirtualReader.CheckListing(AListing: TIdStrings;
  const ASysDescript: String; const ADetails: Boolean): boolean;
var s : TIdStrings;
begin
  Result := False;
  if AListing.Count > 0 then
  begin
    s := TIdStringList.Create;
    try
      SplitColumns(AListing[0],s);
      if s.Count >2 then
      begin
        if (Length(s[0])=4) and IsNumeric(s[0]) then
        begin
          Result := (Length(s[2])=8) and (IsNumeric(s[2]));
        end;
      end;
    finally
      Sys.FreeAndNil(s);
    end;
  end;
end;

class function TIdFTPLVirtualReader.GetIdent: String;
begin
  Result := 'VM Virtual Reader';  {do not localize}
end;

class function TIdFTPLVirtualReader.MakeNewItem(
  AOwner: TIdFTPListItems): TIdFTPListItem;
begin
  Result := TIdVMVirtualReaderFTPListItem.Create(AOwner);
end;

class function TIdFTPLVirtualReader.ParseLine(const AItem: TIdFTPListItem;
  const APath: String): Boolean;
//This is based on:
//
//   z/VM: TCP/IP Level 430 User's Guide Version 4 Release 3.0
//
// http://www.vm.ibm.com/pubs/pdf/hcsk7a10.pdf
//

// z/VM Virtual Reader (RDR)
//Col 0 - spool ID
//Col 1 - origin
//Col 2 - records
//Col 3 - date
//Col 4 - time
//Col 5 - filename
//Col 6 - file type
var
    LCols : TIdStrings;
  LI : TIdVMVirtualReaderFTPListItem;
// z/VM Byte File System
begin
  LI := AItem as TIdVMVirtualReaderFTPListItem;
  LCols := TIdStringList.Create;
  try
    SplitColumns(AItem.Data,LCols);
    if (LCols.Count > 5) then
    begin
      LI.FileName := LCols[5];
    end;
    if (LCols.Count > 6) then
    begin
      LI.FileName := LI.FileName + '.' + LCols[6];
    end;
    //record count
    if (LCols.Count > 2) then
    begin
      LI.NumberRecs := Sys.StrToInt(LCols[2],0);
    end;
    //date
    if (LCols.Count > 3) then
    begin
      LI.ModifiedDate := DateYYMMDD(LCols[3]);
    end;
    //Time
    if (LCols.Count > 4) then
    begin
      LI.ModifiedDate := LI.ModifiedDate + TimeHHMMSS( LCols[1] );
    end;
    //Note that IBM does not even try to give an estimate
    //with reader file sizes when emulating Unix. We can't support file sizes
    //with this.
  finally
    Sys.FreeAndNil(LCols);
  end;
  Result := True;
end;

{ TIdVMVirtualReaderFTPListItem }

constructor TIdVMVirtualReaderFTPListItem.Create(AOwner: TIdCollection);
begin
  inherited Create(AOwner);
  //There's no size for things in a virtual reader
  Self.SizeAvail := False;
end;

initialization
  RegisterFTPListParser(TIdFTPLVirtualReader);
  RegisterFTPListParser(TIdFTPLPVMBFS);
  RegisterFTPListParser(TIdFTPLPVMCMS);
finalization
  UnRegisterFTPListParser(TIdFTPLVirtualReader);
  UnRegisterFTPListParser(TIdFTPLPVMBFS);
  UnRegisterFTPListParser(TIdFTPLPVMCMS);
end.
