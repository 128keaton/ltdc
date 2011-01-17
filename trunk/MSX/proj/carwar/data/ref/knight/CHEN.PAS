uses crt,TEXTASM;

const O=false;
		  I=true;


type Ecran= array [0..79,0..49,0..1] of byte;
     Point= record
       X,Y:byte;
     end;
     Chenille= array [1..80] of Point;


var Ecr: Ecran;
    Direction,a,b,c,long: byte;
    Rest: boolean;
    Ch: char;
    Chen: Chenille;


procedure	Aff_Ecr(var T: Ecran);
	begin
	  for a:=0 to 79 do begin
  		for b:=0 to 49 do begin
    	  if T[a,b,0]<>0 then begin
    			Mov_CURSOR(0,a,b);
					Aff_CARAC(0,1,T[a,b,0],T[a,b,1]);
	    	end;
      end;
    end;
  end;


procedure	Eff_Ecr(var T: Ecran);
	begin
	  for a:=0 to 79 do
  		for b:=0 to 49 do
    	  if T[a,b,0]<>0 then
    	  	T[a,b,0]:=0;
  end;


procedure Decal(var C: chenille; L: Byte);
	var Di: byte;
begin
	for Di:=L+1 downto 2 do begin
  	C[Di].X:=C[Di-1].X;
  	C[Di].Y:=C[Di-1].Y;
  end;
end;


begin
  randomize;
  textmode(259);
  Kill_CURSOR;
	chen[01].X:=40; chen[01].Y:=20;
	chen[02].X:=41; chen[02].Y:=20;
	chen[03].X:=42; chen[03].Y:=20;
	chen[04].X:=43; chen[04].Y:=20;
	chen[05].X:=43; chen[05].Y:=21;
	chen[06].X:=44; chen[06].Y:=21;
	chen[07].X:=45; chen[07].Y:=21;
	chen[08].X:=45; chen[08].Y:=20;
	chen[09].X:=45; chen[09].Y:=19;
	chen[10].X:=46;	chen[10].Y:=19;
  Long:=10;
  Rest:=I;
  repeat
    Direction:=random(4);
  until Direction<>1;
  for c:=1 to Long do begin
   	Ecr[chen[c].X,chen[c].Y,0]:=176;
    if c mod 2=1 then
	   	Ecr[chen[c].X,chen[c].Y,1]:=12
    else
     	Ecr[chen[c].X,chen[c].Y,1]:=14
  end;
  Ecr[10,10,0]:=100;
  Ecr[10,10,1]:=15+1*16;
  Aff_Ecr(Ecr);
  while Rest do begin
		If keypressed then begin
			Ch:=readkey;
      if Ch=chr(77) then
      	if Direction<3 then
          inc(Direction)
        else
          Direction:=0
			else if Ch=chr(75) then
      	if Direction>0 then
          dec(Direction)
        else
          Direction:=3
			else if Ch=chr(43) then begin
        if Long<80 then
	      	inc(Long)
      end
			else if Ch=chr(45) then begin
        if Long>1 then
         	dec(Long)
      end
			else if ch=chr(27) then
				Rest:=O;
		end;
		Mov_CURSOR(0,Chen[Long].X,Chen[Long].Y);
		Aff_CARAC(0,1,0,15+0*16);
    Decal(Chen,Long);
    if Direction=0 then begin
      if Chen[1].Y>0 then
        dec(Chen[1].Y)
      else
        Chen[1].Y:=49;
    end
    else if direction=1 then begin
      if Chen[1].X<79 then
        inc(Chen[1].X)
      else
        Chen[1].X:=0;
    end
    else if direction=2 then begin
      if Chen[1].Y<49 then
        inc(Chen[1].Y)
      else
        Chen[1].Y:=0;
    end
    else if direction=3 then begin
      if Chen[1].X>0 then
        dec(Chen[1].X)
      else
        Chen[1].X:=79;
    end;
    if Ecr[Chen[1].X,Chen[1].Y,0]<>0 then
			Rest:=false
    else if Ecr[Chen[1].X,Chen[1].Y,0]=100 then
    	Long:=Long+5;
    Eff_Ecr(Ecr);
    for c:=1 to Long do begin
    	Ecr[chen[c].X,chen[c].Y,0]:=176;
      if c mod 2=1 then
       	Ecr[chen[c].X,chen[c].Y,1]:=12
      else
       	Ecr[chen[c].X,chen[c].Y,1]:=14
    end;
    Aff_Ecr(Ecr);
    delay(100);
	end;
  clrscr;
  Writeln('P E R D U');
  readkey;

end.