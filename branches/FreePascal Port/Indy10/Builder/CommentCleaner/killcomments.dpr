Program dotest;

{$ifdef FPC}
{$mode delphi}
{$ENDIF}

Uses SysUtils,classes;

Var logfile : textfile;

Function searchfor(t:TStringlist;token:String): integer;

Var i,j,k : integer;

Begin
  i := 0;
  j := t.count;
  k := length(token);
  while (i<j) and (copy(trim(t[i]),1,k)<>token) Do
   inc(i);
  If j=i Then i := -1;
  result := i;
End;

Function searchforci(t:TStringlist;token:String): integer;

Var i,j,k : integer;

Begin
  token := uppercase(token);
  i := 0;
  j := t.count;
  k := length(token);
  while (i<j) and (copy(uppercase(trim(t[i])),1,k)<>token) Do
   inc(i);
  If j=i Then i := -1;
  result := i;
End;


Procedure fixfile(filename:String);

Var t : TStringList;
    i,
    includeline : integer;
    intline,
    dollarlog,
    unitline  : integer;
    hasdefine : boolean;
    s: string;

Begin

  t := TStringList.create;
  t.loadfromfile(filename);
  // make sure includefile gets moved to the right place.
  includeline := searchforci(t,'{$i idcompiler');
  If includeline<>-1 Then
    t.delete(includeline);

  dollarlog := searchfor(t,'$Log$');
  If dollarlog<>-1 Then
    Begin
      unitline := searchfor(t,'unit');
      If (unitline<>-1) And ((unitline-dollarlog)>3) Then
        Begin
          For i:=dollarlog+1 To unitline-1 Do
            Begin
              If (length(t[i])>0) And (t[i][1] In ['{','}']) Then
                Begin
                  s := t[i];
                  s[1] := ' ';
                  t[i] := trimright(s);
                End;
            End;
          If length(t[unitline-1])=0 Then
            t[unitline-1] := '}';
          intline := searchfor(t,'interface');
          If intline<>-1 Then
            Begin
              hasdefine := false;
              For i:=0 To 3 Do
                hasdefine := hasdefine Or (pos('idcompilerdefine',uppercase(t[intline+i+1]
                             ))>0);
              If Not hasdefine Then

                 t.insert(intline+1,'{$i idcompilerdefines.inc}');
            End;
          t.savetofile(changefileext(filename,'.pp'));
          writeln(logfile,filename);
        End;
    End;
End;

Var info : TSearchrec;

Begin
  assignfile(logfile,'conversion.log');
  rewrite(logfile);
  If findfirst ('*.pas',faanyfile,info)=0 Then
    Begin
      Repeat
        fixfile(info.name);
      Until findnext(info)<>0
    End;
  findclose(info);
  closefile(logfile);
End.
