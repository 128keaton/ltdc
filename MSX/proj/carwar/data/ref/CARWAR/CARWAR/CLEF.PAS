var IDNAME:string[15];
    IDNUMBER:integer;
    IDREGISTER:integer;
    i:integer;
begin
     write('The Name     :');readln(IDNAME);
     write('Serial Number:');readln(IDNUMBER);
     for i:=1 to length(IDNAME) do
              IDNUMBER:=IDNUMBER+ord(IDNAME[i]);
     writeln('The Number to register :',(IDNUMBER div 2)*3);
       
end.