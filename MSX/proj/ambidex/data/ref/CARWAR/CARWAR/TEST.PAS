uses exemod,crt;
type
  tNbutil = integer;
  tRegister=boolean;
  tIDName=String[15];
  tIDNumber=integer;
  tIDRegister=integer;
  tFirstTime=boolean;
const
  Nbutil : tNbutil =0;
  Register : Tregister=FALSE;
  IDNAME:tIDNAME='Not Registered';
  IDNUMBER:TIDNUMBER=0;
  IDREGISTER:TIDREGISTER=0;
  FIRSTTIME:TFIRSTTIME=TRUE;
var i:integer;
begin
  if FIRSTTIME=TRUE then
  begin
       randomize;
       FIRSTTIME:=FALSE;
       IDNUMBER:=random(32766)+1;
       Write2Exe(FIRSTTIME, SizeOf(FIRSTTIME));
       Write2Exe(IDNUMBER, SizeOf(IDNUMBER));
  end;
  writeln('Serial Number :',IDNUMBER);
  if REGISTER then
  begin
       writeln('Registered to :',IDNAME);
       writeln('With Number   :',IDREGISTER);
  end
     else
  writeln('!NOT REGISTERED!');
  if (paramstr(1)='/R') and (not REGISTER) then
  begin
       write('Your Name  :');readln(IDNAME);
       write('Your Number:');readln(IDREGISTER);
       for i:=1 to length(IDNAME) do
              IDNUMBER:=IDNUMBER+ord(IDNAME[i]);
       IDNUMBER:=(IDNUMBER div 2)*3;
       if (IDNUMBER-IDREGISTER=0) then
          begin
               REGISTER:=TRUE;
               Write2Exe(REGISTER, SizeOf(REGISTER));
               Write2Exe(IDREGISTER, SizeOf(IDREGISTER));
               Write2Exe(IDNAME, SizeOf(IDNAME));
          end;
  end;
  if not REGISTER then
  begin
       if Nbutil>10 then
       begin
            writeln(#7,'You can''t use this program any more!!!');
            writeln('You must register it!!!');
            halt(255);
       end;
       WriteLn(10-Nbutil,' uses left before the end...');
       Nbutil:=Nbutil+1;
       If Write2Exe(NButil, SizeOf(NButil)) <> 0 then
          WriteLn('Cannot write!');
  end;
  Writeln('19(C)97 KRš$tY.007');
end.
