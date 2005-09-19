program buildxpmlist;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils; 

var i : Integer;
  s : TSearchRec;

  st : String;
  F : Text;
begin

    i := SysUtils.FindFirst(ExtractFilePath(ParamStr(0))+'\*.xpm', SysUtils.faAnyFile ,s);
    if i = 0 then
    begin
      st := 'c:\Lazarus\tools\lazres IdRegister.lrs '+s.Name;
      while FindNext(s)=0 do
      begin
        st := st + ' ' + s.Name;
      end;
      FindClose(s);
      Assign(F,ExtractFilePath(ParamStr(0))+'\Makelrz.bat');
      Rewrite(F);
      try
        WritelN(F,st);
        WriteLn(F,'copy *.lrs ..');
      finally
        Close(F);
      end;
    end;

end.

