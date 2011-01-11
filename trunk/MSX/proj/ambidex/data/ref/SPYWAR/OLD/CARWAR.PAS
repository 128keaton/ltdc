{$G+}
{$E+}
{$F+}


uses
	crt,GraphAsm,_KeybAsm;


const
  AutoL=20;
  AutoH=20;


Type
	Car= record
    Dire: 0..31;
    Sprt: array [0..31] of PByte;
    x,y,Vts,Dlt,TopSpeed: real;
  end;
  Box= record
  	X1,Y1,X2,Y2: integer;
  end;


var
  Obs: array [1..100] of Box;
  Opt: Box;
	Auto: array [1..10] of Car;
  Image,EcrV: PByte;
  Pal: TPalette;
  Ok,Chc: boolean;
	i,j,k,NbPLY,NbObs: byte;
  a,b,c,xt,yt: integer;
  x,y,z: real;


procedure Touche;
begin
	if TabKey[ESC] then (************************** EXIT *)
		Ok:=false;
	if TabKey[25] then begin (********************* PAUSE *)
     delay(100);
     repeat until TabKey[25];
     delay(100);
  end;
	if TabKey[DROITE] then (*********************** PLY1 RIGHT *)
		Auto[1].Dire:=(Auto[1].Dire+1) mod 32;
	if TabKey[BAS] then (************************** PLY1 BREAK *)
		if Auto[1].Vts>0 then
			Auto[1].Vts:=Auto[1].Vts/2;(* -2*Auto[1].Dlt;*)
	if TabKey[GAUCHE] then (*********************** PLY1 LEFT *)
		Auto[1].Dire:=(Auto[1].Dire+31) mod 32;
	if TabKey[45] then (*************************** PLY2 RIGHT *)
		Auto[2].Dire:=(Auto[2].Dire+1) mod 32;
	if TabKey[44] then (*************************** PLY2 BREAK *)
		if Auto[2].Vts>0 then
			Auto[2].Vts:=Auto[2].Vts-2*Auto[2].Dlt;
	if TabKey[86] then (*************************** PLY2 LEFT *)
		Auto[2].Dire:=(Auto[2].Dire+31) mod 32;
	if TabKey[73] then (*************************** PLY3 RIGHT *)
		Auto[3].Dire:=(Auto[3].Dire+1) mod 32;
	if TabKey[72] then (*************************** PLY3 BREAK *)
		if Auto[3].Vts>0 then
			Auto[3].Vts:=Auto[3].Vts-2*Auto[3].Dlt;
	if TabKey[71] then (*************************** PLY3 LEFT *)
		Auto[3].Dire:=(Auto[3].Dire+31) mod 32;
	if TabKey[53] then (*************************** PLY4 RIGHT *)
		Auto[4].Dire:=(Auto[4].Dire+1) mod 32;
	if TabKey[52] then (*************************** PLY4 BREAK *)
		if Auto[4].Vts>0 then
			Auto[4].Vts:=Auto[4].Vts-2*Auto[4].Dlt;
	if TabKey[51] then (*************************** PLY4 LEFT *)
		Auto[4].Dire:=(Auto[4].Dire+31) mod 32;
	if TabKey[49] then (*************************** PLY5 RIGHT *)
		Auto[5].Dire:=(Auto[5].Dire+1) mod 32;
	if TabKey[48] then (*************************** PLY5 BREAK *)
		if Auto[5].Vts>0 then
			Auto[5].Vts:=Auto[5].Vts-2*Auto[5].Dlt;
	if TabKey[47] then (*************************** PLY5 LEFT *)
		Auto[5].Dire:=(Auto[5].Dire+31) mod 32;
end;


procedure Aff;
begin
	Vsync;
	EffaceBuffer(EcrV,0);
	for k:=1 to NbPLY do
		AffSprtC(1,1,319,199,EcrV,trunc(Auto[k].X),trunc(Auto[k].Y),AutoL,AutoH,Auto[k].Sprt[Auto[k].Dire]);
	CopieBuffer(EcrV);
  for i:=1 to NbObs do begin
		H_LineMCGA(Obs[i].X1,Obs[i].Y1,Obs[i].X2,100);
		H_LineMCGA(Obs[i].X1,Obs[i].Y2,Obs[i].X2,100);
		V_LineMCGA(Obs[i].X1,Obs[i].Y1,Obs[i].Y2,100);
		V_LineMCGA(Obs[i].X2,Obs[i].Y1,Obs[i].Y2,100);
  end;
		H_LineMCGA(Opt.X1,Opt.Y1,Opt.X2,200);
		H_LineMCGA(Opt.X1,Opt.Y2,Opt.X2,200);
		V_LineMCGA(Opt.X1,Opt.Y1,Opt.Y2,200);
		V_LineMCGA(Opt.X2,Opt.Y1,Opt.Y2,200);
end;


procedure InitObs;
begin
  for i:=1 to NbObs do begin
	  Obs[i].X1:=random(310);
	  Obs[i].Y1:=random(190);
	  Obs[i].X2:=Obs[i].X1+10;
	  Obs[i].Y2:=Obs[i].Y1+10;
  end;
  Opt.X1:=random(310);
  Opt.Y1:=random(190);
  Opt.X2:=Opt.X1+10;
  Opt.Y2:=Opt.Y1+10;
end;


function Choc(At: car):boolean;
begin
  xt:=trunc(At.X);
  yt:=trunc(At.Y);
  choc:=false;
  for i:=1 to NbObs do
    for a:=xt to xt+AutoL-1 do
      for b:=yt to yt+AutoH-1 do
       	if ((a in [Obs[i].X1..Obs[i].X2]) and (b in [Obs[i].Y1..Obs[i].Y2])) then
          Choc:=true;
  for i:=1 to NbPly do
    for a:=xt to xt+AutoL-1 do
      for b:=yt to yt+AutoH-1 do
       	if ((i<>k) and (a in [trunc(Auto[i].X)..trunc(Auto[i].X)+AutoL])
					and (b in [trunc(Auto[i].Y)..trunc(Auto[i].Y)+AutoH])) then
          Choc:=true;
  for a:=xt to xt+AutoL-1 do
    for b:=yt to yt+AutoH-1 do
			if ((a<=0) or (a>=319) or (b<=0) or (b>=199)) then
  	   	Choc:=true;
end;


procedure InitPLY;
begin
	ChargePCX('carwar.pcx',Image,Pal);
	for k:=1 to NbPLY do begin
		for i:=0 to 15 do begin
			GetMem(Auto[k].Sprt[i],AutoL*AutoH);
			CreatSprt(image,20*i,0,AutoL,AutoH,Auto[k].Sprt[i]);
			GetMem(Auto[k].Sprt[i+16],AutoL*AutoH);
			CreatSprt(image,20*i,20,AutoL,AutoH,Auto[k].Sprt[i+16]);
		end;
    repeat
			Auto[k].X:=50+random(250);
			Auto[k].Y:=50+random(100);
    until not Choc(Auto[k]);
		Auto[k].Vts:=0;
		Auto[k].TopSpeed:=10;
		Auto[k].Dlt:=0.05;
		Auto[k].Dire:=random(32);
	end;
	freemem(image,64000);
	SetPalette(Pal);
end;


begin
  NbPLY:=5;
  NbObs:=0;
	InitMode($13);
	InitNewKeyb;
	randomize;
  InitPLY;
  InitObs;
	getmem(EcrV,64000);
	Ok:=true;
	while Ok do begin
		delay(50);
    Touche;
		for k:=1 to NbPLY do begin
			x:=Auto[k].X+Auto[k].Vts*(sin(Auto[k].Dire*Pi/16));
			y:=Auto[k].Y-Auto[k].Vts*(cos(Auto[k].Dire*Pi/16));
      xt:=trunc(x);
      yt:=trunc(y);
      chc:=false;
      for i:=1 to NbObs do
        for a:=xt to xt+AutoL-1 do
	        for b:=yt to yt+AutoH-1 do
          	if ((a in [Obs[i].X1..Obs[i].X2]) and (b in [Obs[i].Y1..Obs[i].Y2])) then
              Chc:=true;
      for i:=1 to NbPly do begin
        for a:=xt to xt+AutoL-1 do begin
	        for b:=yt to yt+AutoH-1 do begin
          	if ((i<>k) and (a in [trunc(Auto[i].X)..trunc(Auto[i].X)+AutoL])
							and (b in [trunc(Auto[i].Y)..trunc(Auto[i].Y)+AutoH])) then begin
							Auto[i].X:=Auto[i].X+2*Auto[k].Vts*(sin(Auto[k].Dire*Pi/16));
							Auto[i].Y:=Auto[i].Y-2*Auto[k].Vts*(cos(Auto[k].Dire*Pi/16));
              Chc:=true;
            end;
          end;
        end;
      end;
      for a:=xt to xt+AutoL-1 do
        for b:=yt to yt+AutoH-1 do
					if ((a<=0) or (a>=319) or (b<=0) or (b>=199)) then
           	Chc:=true;
      for a:=xt to xt+AutoL-1 do begin
        for b:=yt to yt+AutoH-1 do begin
         	if ((a in [Opt.X1..Opt.X2]) and (b in [Opt.Y1..Opt.Y2])) then begin
            Auto[k].Dlt:=Auto[k].Dlt+0.05;
					  Opt.X1:=5+random(300);
					  Opt.Y1:=5+random(180);
					  Opt.X2:=Opt.X1+10;
					  Opt.Y2:=Opt.Y1+10;
          end;
        end;
      end;
      if chc then
				Auto[k].Vts:=-Auto[k].Vts
			else begin
				Auto[k].X:=x;
     	  Auto[k].Y:=y;
      end;
			if Auto[k].Vts<0 then
				Auto[k].Vts:=Auto[k].Vts/1.1;
			if Auto[k].Vts<Auto[k].TopSpeed then
       	Auto[k].Vts:=Auto[k].Vts+Auto[k].Dlt;
		end;
    Aff;
	end;
	freemem(EcrV,64000);
	for k:=1 to NbPLY do
		for i:=0 to 31 do
			freemem(Auto[k].Sprt[i],AutoL*AutoH);
	for a:=0 to 64 do begin
		for b:=0 to 767 do
			if Pal[b]>0 then
				dec(Pal[b]);
		SetPalette(Pal);
		Delay(10);
	end;
	InitMode($03);
  Textcolor(8);
  writeln('-=ð CARWAR 1.01 by ReDragoN of PHENIX CORP. 1997 ð=-');
  Textcolor(7);
  writeln('-=ð CARWAR 1.01 by ReDragoN of PHENIX CORP. 1997 ð=-');
  Textcolor(15);
  writeln('-=ð CARWAR 1.01 by ReDragoN of PHENIX CORP. 1997 ð=-');
	InitOldKeyb;
end.