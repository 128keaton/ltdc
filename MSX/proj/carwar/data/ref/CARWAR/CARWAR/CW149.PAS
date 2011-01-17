{$G+}
{$E+}
{$F+}


uses
	crt,GraphAsm,TextAsm,_KeyBAsm,dos,_CarUnit,Joystick;


const
	AutoL=13;
	AutoH=11;
	ManL=10;
	ManH=9;


Type
	Vct= record
		Angl,Norm: real;
	end;
	Pt= record
		X,Y: word;
	end;
	Indic= record
		Pos: Pt;
		Chrono: PByte;
	end;
	Car= record
		Dire: 0..15;
		Sprt: array [0..15] of PByte;
		Cmpt: word;
		Sol,Laps: byte;
		Ader,Vir,TopSpeed,Break,Inertie,Spd,ChcCmp,z,BlastCmp,MaxLife,Life,FlyCmp,FlyVts: integer;
		Vts,Acc: Vct;
		x,y,Dlt: real;
		Key: array [0..4] of byte;
		Posit: array [0..13,0..11] of Pt;
		CheckValid: array [0..31] of boolean;
		FullTime,LapTime,OldTime,NewTime,BestTime: Time;
		ChcPt: Pt;
		Indicator: Indic;
	end;
	LigneCheck= record
		Dep: Pt;
		Long: word;
		Valid: boolean;
	end;
	_Auto= record
		Dep: Pt;
		Angle: real;
	end;
	Map= record
		Name: string;
		NbCP: byte;
		CP: array [0..31] of LigneCheck;
		SL: LigneCheck;
		Car: array [1..5] of _Auto;
		BigScr: Pt;
		BigScrValid: Boolean;
	end;
	Onlooker= record
		Dead: bit;
		EtatSprt: array [0..1] of PByte;
		Pos: Pt;
		face: byte;
	end;

var
	PxlPos: Pt;
	StopTest,NextPxl,StopTest2,Night: boolean;
	People: array [0..15] of Onlooker;
	Loop,Loop2,TTime: Time;
	VTxt: string;
	FileMap: Map;
	F: file of Map;
	Auto: array [1..5] of Car;
	Circuit,Image,EcrV,Titre,Ombre,AffNb,LifeBar: PByte;
	AlphSprt: array [0..59] of PByte;
	Aiguille: array [0..10] of PByte;
	Smoke: array [0..5] of PByte;
	Light: array [0..1] of PByte;
	Blast: array [0..7] of PByte;
	Alpha: array [0..9] of PByte;
	Pal: TPalette;
	Ok,Choc,Lap: boolean;
	i,j,k,PlyNum,PlyNumTest,MaxPly: byte;
	m,n,o,m2,n2: word;
	a,b,c,Xc,Yc: integer;
	Beta,Dlt,x,y,z,NewX,NewY,TmpAngle: real;
	Ground: array [0..255,0..1] of real;
	CosI,SinI: array [0..360] of real;

procedure InitPly(PlyNumero: byte);
begin
	if PlyNumero=1 then begin
		Auto[1].X:=FileMap.Car[1].Dep.X;
		Auto[1].Y:=FileMap.Car[1].Dep.Y;
		Auto[1].Vts.Angl:=FileMap.Car[1].Angle;
		Auto[1].Vts.Norm:=0;
		Auto[1].Acc.Angl:=FileMap.Car[1].Angle;
		Auto[1].Acc.Norm:=0;
		Auto[1].TopSpeed:=38;
		Auto[1].Ader:=4;
		Auto[1].Spd:=4;
		Auto[1].Vir:=9;
		Auto[1].Break:=3;
		Auto[1].Inertie:=20;
		Auto[1].Life:=95;
		Auto[1].MaxLife:=95;
		for j:=0 to FileMap.NbCP-1 do
			Auto[1].CheckValid[j]:=false;
	end
	else if PlyNumero=2 then begin
		Auto[2].X:=FileMap.Car[2].Dep.X;
		Auto[2].Y:=FileMap.Car[2].Dep.Y;
		Auto[2].Vts.Angl:=FileMap.Car[2].Angle;
		Auto[2].Vts.Norm:=0;
		Auto[2].Acc.Angl:=FileMap.Car[2].Angle;
		Auto[2].Acc.Norm:=0;
		Auto[2].TopSpeed:=40;
		Auto[2].Ader:=5;
		Auto[2].Spd:=7;
		Auto[2].Vir:=15;
		Auto[2].Break:=2;
		Auto[2].Inertie:=10;
		Auto[2].Life:=100;
		Auto[2].MaxLife:=100;
		for j:=0 to FileMap.NbCP-1 do
			Auto[2].CheckValid[j]:=false;
	end
	else if PlyNumero=3 then begin
		Auto[3].X:=FileMap.Car[3].Dep.X;
		Auto[3].Y:=FileMap.Car[3].Dep.Y;
		Auto[3].Vts.Angl:=FileMap.Car[3].Angle;
		Auto[3].Vts.Norm:=0;
		Auto[3].Acc.Angl:=FileMap.Car[3].Angle;
		Auto[3].Acc.Norm:=0;
		Auto[3].TopSpeed:=42;
		Auto[3].Ader:=5;
		Auto[3].Spd:=5;
		Auto[3].Vir:=15;
		Auto[3].Break:=2;
		Auto[3].Inertie:=10;
		Auto[3].Life:=85;
		Auto[3].MaxLife:=85;
		for j:=0 to FileMap.NbCP-1 do
			Auto[3].CheckValid[j]:=false;
	end
	else if PlyNumero=4 then begin
		Auto[4].X:=FileMap.Car[4].Dep.X;
		Auto[4].Y:=FileMap.Car[4].Dep.Y;
		Auto[4].Vts.Angl:=FileMap.Car[4].Angle;
		Auto[4].Vts.Norm:=0;
		Auto[4].Acc.Angl:=FileMap.Car[4].Angle;
		Auto[4].Acc.Norm:=0;
		Auto[4].TopSpeed:=40;
		Auto[4].Ader:=5;
		Auto[4].Spd:=5;
		Auto[4].Vir:=15;
		Auto[4].Break:=2;
		Auto[4].Inertie:=10;
		Auto[4].Life:=90;
		Auto[4].MaxLife:=90;
		for j:=0 to FileMap.NbCP-1 do
			Auto[4].CheckValid[j]:=false;
	end;
end;

procedure Aff;
begin
	Vsync;
	AffSprt(EcrV,0,0,320,200,Circuit);
	for k:=1 to 15 do
		AffSprtC(0,0,320,200,EcrV,People[k].Pos.X,People[k].Pos.Y,9,8,People[k].EtatSprt[People[k].Dead]);
	for PlyNum:=1 to MaxPly do begin
		if Auto[PlyNum].Life=0 then begin
			if Auto[PlyNum].BlastCmp>0 then begin
				AffSprtC(0,0,320,200,EcrV,trunc(Auto[PlyNum].X-6),trunc(Auto[PlyNum].Y-5),AutoL,AutoH,Blast[7-Auto[PlyNum].BlastCmp]);
				dec(Auto[PlyNum].BlastCmp);
			end
			else begin
				AffSprtC(0,0,320,200,Circuit,trunc(Auto[PlyNum].X-6),trunc(Auto[PlyNum].Y-5),AutoL,AutoH,Blast[7]);
				InitPly(PlyNum);
			end;
		end
		else begin
			AffSprtC(0,0,320,200,EcrV,trunc(Auto[PlyNum].X-6),trunc(Auto[PlyNum].Y-5),AutoL,AutoH,Ombre);
			AffSprtC(0,0,320,200,EcrV,trunc(Auto[PlyNum].X-6),
				trunc(Auto[PlyNum].Y-5)-Auto[PlyNum].Z,AutoL,AutoH,Auto[PlyNum].Sprt[Auto[PlyNum].Dire]);
		end
	end;
	for PlyNum:=1 to MaxPly do begin
		if Auto[PlyNum].Cmpt<50 then begin
			if Auto[PlyNum].Laps<10 then
				AffSprtC(0,0,320,200,EcrV,trunc(Auto[PlyNum].X-6),trunc(Auto[PlyNum].Y-16),AutoL,AutoH,Alpha[Auto[PlyNum].Laps])
			else begin
				AffSprtC(0,0,320,200,EcrV,trunc(Auto[PlyNum].X-11),trunc(Auto[PlyNum].Y-16),AutoL,AutoH,Alpha[Auto[PlyNum].Laps div 10]);
				AffSprtC(0,0,320,200,EcrV,trunc(Auto[PlyNum].X-2),trunc(Auto[PlyNum].Y-16),AutoL,AutoH,Alpha[Auto[PlyNum].Laps mod 10]);
			end;
		end;
		if Auto[PlyNum].ChcCmp>0 then begin
			dec(Auto[PlyNum].ChcCmp);
			if Auto[PlyNum].ChcCmp=2 then
				AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].ChcPt.X-3,Auto[PlyNum].ChcPt.Y-4,7,9,Light[1])
			else
				AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].ChcPt.X-3,Auto[PlyNum].ChcPt.Y-4,7,9,Light[0]);
		end;
	end;
	for PlyNum:=1 to MaxPly do begin
		AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].Indicator.Pos.X,Auto[PlyNum].Indicator.Pos.Y,9,9,Auto[PlyNum].Indicator.Chrono);
		AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].Indicator.Pos.X+2,Auto[PlyNum].Indicator.Pos.Y+3,5,4,
			Aiguille[trunc(11*Auto[PlyNum].Vts.Norm/Auto[PlyNum].TopSpeed)]);
		AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].Indicator.Pos.X+10,Auto[PlyNum].Indicator.Pos.Y,23,9,AffNb);
		AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].Indicator.Pos.X+11,Auto[PlyNum].Indicator.Pos.Y,1+(20*Auto[PlyNum].Life)
			div Auto[PlyNum].MaxLife,1,LifeBar);
		AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].Indicator.Pos.X+11,Auto[PlyNum].Indicator.Pos.Y+3,
			4,5,AlphSprt[(Auto[PlyNum].BestTime.s div 10) mod 10]);
		AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].Indicator.Pos.X+16,Auto[PlyNum].Indicator.Pos.Y+3,
			4,5,AlphSprt[Auto[PlyNum].BestTime.s mod 10]);
		AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].Indicator.Pos.X+23,Auto[PlyNum].Indicator.Pos.Y+3,
			4,5,AlphSprt[(Auto[PlyNum].BestTime.ms div 10) mod 10]);
		AffSprtC(0,0,320,200,EcrV,Auto[PlyNum].Indicator.Pos.X+28,Auto[PlyNum].Indicator.Pos.Y+3,
			4,5,AlphSprt[Auto[PlyNum].BestTime.ms mod 10]);
	end;
	CopieBuffer(EcrV);
end;


procedure GetKey;
begin
	if ((PlyNum=1) or (PlyNum=2) or (PlyNum=3)) then begin
		if TabKey[Auto[PlyNum].Key[0]] then begin
			if Auto[PlyNum].Acc.Angl<Auto[PlyNum].Vir then
				Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl+360;
			Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl-Auto[PlyNum].Vir;
		end;
		if TabKey[Auto[PlyNum].Key[1]] then begin
			if Auto[PlyNum].Acc.Angl>359-Auto[PlyNum].Vir then
				Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl-360;
			Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl+Auto[PlyNum].Vir;
		end;
		if TabKey[Auto[PlyNum].Key[2]] then begin
			if Auto[PlyNum].Acc.Norm<Auto[PlyNum].TopSpeed then
				Auto[PlyNum].Acc.Norm:=Auto[PlyNum].Acc.Norm+(Auto[PlyNum].TopSpeed-Auto[PlyNum].Acc.Norm)/Auto[PlyNum].Spd;
		end
		else begin
			if Auto[PlyNum].Acc.Norm>0 then
				Auto[PlyNum].Acc.Norm:=Auto[PlyNum].Acc.Norm-Auto[PlyNum].Acc.Norm/Auto[PlyNum].Inertie;
		end;
		if TabKey[Auto[PlyNum].Key[3]] then begin
			if Auto[PlyNum].Acc.Norm>0 then
				Auto[PlyNum].Acc.Norm:=Auto[PlyNum].Acc.Norm-Auto[PlyNum].Acc.Norm/Auto[PlyNum].Break;
		end;
	end
	else begin
		if JoystickRight then begin
			if Auto[PlyNum].Acc.Angl<Auto[PlyNum].Vir then
				Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl+360;
			Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl-Auto[PlyNum].Vir;
		end;
		if JoystickLeft then begin
			if Auto[PlyNum].Acc.Angl>359-Auto[PlyNum].Vir then
				Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl-360;
			Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl+Auto[PlyNum].Vir;
		end;
		if JoystickButtonA then begin
			if Auto[PlyNum].Acc.Norm<Auto[PlyNum].TopSpeed then
				Auto[PlyNum].Acc.Norm:=Auto[PlyNum].Acc.Norm+(Auto[PlyNum].TopSpeed-Auto[PlyNum].Acc.Norm)/Auto[PlyNum].Spd;
		end
		else begin
			if Auto[PlyNum].Acc.Norm>0 then
				Auto[PlyNum].Acc.Norm:=Auto[PlyNum].Acc.Norm-Auto[PlyNum].Acc.Norm/Auto[PlyNum].Inertie;
		end;
		if JoystickButtonB then begin
			if Auto[PlyNum].Acc.Norm>0 then
				Auto[PlyNum].Acc.Norm:=Auto[PlyNum].Acc.Norm-Auto[PlyNum].Acc.Norm/Auto[PlyNum].Break;
		end;
	end
end;


procedure Init;
begin
	FileMap.Name:=paramstr(1);
	if paramstr(2)='2' then	MaxPly:=2
	else if paramstr(2)='3' then	MaxPly:=3
	else if paramstr(2)='4' then	MaxPly:=4
	else MaxPly:=1;
	clrscr;
	writeln;
	if FileExists(FileMap.Name+'.PCX') then begin
		writeln('þ FOUND FILE : '+FileMap.Name+'.PCX');
		writeln('  LOADING BACKGROUND ...');
		ChargePCX(FileMap.Name+'.PCX',Circuit,Pal);
	end
	else begin
		writeln('þ ERROR 1 : BACKGOUND FILE NOT FOUND');
		halt(1);
	end;
	delay(100);
	assign(F,FileMap.Name+'.DAT');
	if FileExists(FileMap.Name+'.DAT') then begin
		writeln('þ FOUND FILE : '+FileMap.Name+'.DAT');
		writeln('  LOADING DATA ...');
		reset(F);
		read(F,FileMap);
	end
	else begin
		writeln('þ ERROR 2 : DATA FILE NOT FOUND');
		halt(2);
	end;
	delay(100);
	Init_MOUSE(Ok);
	if Ok then
		writeln('þ MOUSE DETECTED')
	else
		writeln('þ WARNING : MOUSE NOT DETECTED');
	delay(100);
	if JoystickExists then begin
		writeln('þ JOYSTICK CARD DETECTED');
		if MaxPly>3 then
			CalibrateJoystick;
	end
	else
		writeln('þ WARNING : JOYSTICK CARD NOT DETECTED');
	delay(1000);
	InitMode($13);
(* TITRE *)
(*
	ChargePCX('TITRE.PCX',Titre,Pal);
	SetPalette(Pal);
	PCX320x200(Titre);
	FadeInBlack(Pal);
	readkey;
	FadeOutBlack(Pal);
	freemem(Titre,64000);
*)
	randomize;
	InitNewKeyb;
	for a:=0 to 360 do begin
		SinI[a]:=sin(a/180*Pi);
		CosI[a]:=cos(a/180*Pi);
	end;
	Night:=true;
end;


procedure InitRace;
var
	TmpStr: string;
begin
(* INIT DATA *)
	ChargePCX('ALPHA.PCX',Image,Pal);
	for i:=0 to 9 do begin
		GetMem(Alpha[i],AutoL*AutoH);
		CreatSprt(image,1+i*(AutoL+1),1,AutoL,AutoH,Alpha[i]);
	end;
	for i:=0 to 29 do begin
		GetMem(AlphSprt[i],4*5);
		CreatSprt(image,141+i*5,1,4,5,AlphSprt[i]);
		GetMem(AlphSprt[i+30],4*5);
		CreatSprt(image,141+i*5,7,4,5,AlphSprt[i+30]);
	end;
	for i:=1 to MaxPly do begin
		GetMem(Auto[i].Indicator.Chrono,9*9);
		CreatSprt(image,1,73+(i-1)*10,9,9,Auto[i].Indicator.Chrono);
		Auto[i].Indicator.Pos.X:=1;
		Auto[i].Indicator.Pos.Y:=1+15*(i-1);
	end;
	for i:=0 to 10 do begin
		GetMem(Aiguille[i],5*4);
		CreatSprt(image,27,73+5*i,5,4,Aiguille[i]);
	end;
	GetMem(AffNb,23*9);
	CreatSprt(image,1,113,23,9,AffNb);
	GetMem(LifeBar,21);
	CreatSprt(image,1,123,21,1,LifeBar);
	freemem(image,64000);

	ChargePCX('DECORS.PCX',Image,Pal);
	for i:=0 to 5 do begin
		GetMem(Smoke[i],5*5);
		CreatSprt(image,195+i*6,47,5,5,Smoke[i]);
	end;
	for i:=0 to 1 do begin
		GetMem(Light[i],7*9);
		CreatSprt(image,195+i*8,53,7,9,Light[i]);
	end;
	for i:=0 to 7 do begin
		GetMem(Blast[i],13*11);
		CreatSprt(image,195+i*14,63,13,11,Blast[i]);
	end;
	for i:=0 to 15 do begin
		a:=random(2);
		b:=random(4);
		for j:=0 to 1 do begin
			GetMem(People[i].EtatSprt[j],9*8);
			CreatSprt(image,155+10*j+20*a,47+9*b,9,8,People[i].EtatSprt[j]);
		end;
		People[i].Pos.X:=10+random(300);
		People[i].Pos.Y:=10+random(180);
		People[i].Dead:=0;
	end;
	freemem(image,64000);

(* INIT GROUND *)
	for i:=0 to 255 do begin
		Ground[i,0]:=1;
		Ground[i,1]:=1;
	end;
	Ground[1,0]:=100;        (* OIL *)
	Ground[2,0]:=100;
	Ground[1,1]:=1;
	Ground[2,1]:=1;
	Ground[237,0]:=1.5;      (* MUD *)
	Ground[242,0]:=1.5;
	Ground[237,1]:=1.5;
	Ground[242,1]:=1.5;
	Ground[244,0]:=3;        (* ICE *)
	Ground[248,0]:=3;
	Ground[244,1]:=1;
	Ground[248,1]:=1;
	Ground[203,0]:=1.5;      (* WATER *)
	Ground[207,0]:=1.5;
	Ground[203,1]:=3;
	Ground[207,1]:=3;
	Ground[16,0]:=1.2;       (* SAND *)
	Ground[20,0]:=1.2;
	Ground[16,1]:=1.8;
	Ground[20,1]:=1.8;

	ChargePCX('COP.PCX',Image,Pal);
	GetMem(Ombre,13*11);
	CreatSprt(image,225,1,13,11,Ombre);
	freemem(image,64000);

(* INIT PLAYER 1 *)
	ChargePCX('TURTLE.PCX',Image,Pal);
	for i:=0 to 15 do begin
		GetMem(Auto[1].Sprt[i],AutoL*AutoH);
		CreatSprt(image,1+i*(AutoL+1),1,AutoL,AutoH,Auto[1].Sprt[i]);
	end;
	Auto[1].Key[0]:=77;
	Auto[1].Key[1]:=75;
	Auto[1].Key[2]:=72;
	Auto[1].Key[3]:=76;
	Auto[1].Key[4]:=14;
	InitPly(1);
	freemem(image,64000);

(* INIT PLAYER 2 *)
	ChargePCX('COP.PCX',Image,Pal);
	for i:=0 to 15 do begin
		GetMem(Auto[2].Sprt[i],AutoL*AutoH);
		CreatSprt(image,1+i*(AutoL+1),1,AutoL,AutoH,Auto[2].Sprt[i]);
	end;
	Auto[2].Key[0]:=45;
	Auto[2].Key[1]:=44;
	Auto[2].Key[2]:=16;
	Auto[2].Key[3]:=30;
	Auto[2].Key[4]:=46;
	InitPly(2);
	freemem(image,64000);

(* INIT PLAYER 3 *)
	ChargePCX('CAMAROS.PCX',Image,Pal);
	for i:=0 to 15 do begin
		GetMem(Auto[3].Sprt[i],AutoL*AutoH);
		CreatSprt(image,1+i*(AutoL+1),1,AutoL,AutoH,Auto[3].Sprt[i]);
	end;
	Auto[3].Key[0]:=43;
	Auto[3].Key[1]:=40;
	Auto[3].Key[2]:=12;
	Auto[3].Key[3]:=26;
	Auto[3].Key[4]:=43;
	InitPly(3);
	freemem(image,64000);

(* INIT PLAYER 4 *)
	ChargePCX('COP.PCX',Image,Pal);
	for i:=0 to 15 do begin
		GetMem(Auto[4].Sprt[i],AutoL*AutoH);
		CreatSprt(image,1+i*(AutoL+1),1,AutoL,AutoH,Auto[4].Sprt[i]);
	end;
	InitPly(4);
	freemem(image,64000);

(* SETUP DATA *)
	SetPalette(Pal);
	getmem(EcrV,64000);
	for PlyNum:=1 to MaxPly do begin
		Auto[PlyNum].ChcCmp:=0;
		GetTime(Auto[PlyNum].OldTime.h,Auto[PlyNum].OldTime.m,Auto[PlyNum].OldTime.s,Auto[PlyNum].OldTime.ms);
		Auto[PlyNum].BestTime.h:=1;
	end;
end;

procedure CommunKey;
begin
	if TabKey[ESC] then
		Ok:=false;
	if TabKey[59] then begin
		delay(100);
		repeat until TabKey[59];
		delay(100);
	end;
end;



procedure CloseAll;
begin
	for i:=0 to 9 do
		freemem(Alpha[i],AutoL*AutoH);
	freemem(Circuit,64000);
	freemem(EcrV,64000);
	for PlyNum:=1 to MaxPly do begin
		freemem(Auto[PlyNum].Indicator.Chrono,9*9);
		for i:=0 to 15 do
			freemem(Auto[PlyNum].Sprt[i],AutoL*AutoH);
	end;
	freemem(Ombre,13*11);
	for i:=0 to 5 do
		freemem(Smoke[i],5*5);
	for i:=0 to 1 do
		freemem(Light[i],7*9);
	for i:=0 to 7 do
		freemem(Blast[i],13*11);
	for i:=0 to 15 do
		for j:=0 to 1 do
			freemem(People[i].EtatSprt[j],9*8);
	for i:=0 to 10 do
		freemem(Aiguille[i],5*4);
	freemem(AffNb,23*9);
	freemem(LifeBar,21);
	close(F);
end;


(****************************************************************************)
(*                                                                          *)
(*                                 G A M E S                                *)
(*                                                                          *)
(****************************************************************************)
begin
 Init;
 InitRace;
 Ok:=true;
(************************************** ENTER IN GAME                       *)
 while Ok do begin
	GetTime(Loop.h,Loop.m,Loop.s,Loop.ms);
	for PlyNum:=1 to MaxPly do begin
	 if Auto[PlyNum].Life>0 then begin
(************************************** Nouveau angle Vts-Acc               *)
		if abs(Auto[PlyNum].Acc.Angl-Auto[PlyNum].Vts.Angl)>180 then begin
		 if ((Auto[PlyNum].Acc.Angl<=90) and (Auto[PlyNum].Vts.Angl>=270)) then
			Auto[PlyNum].Vts.Angl:=Auto[PlyNum].Vts.Angl+(Auto[PlyNum].Acc.Angl-Auto[PlyNum].Vts.Angl+360)
			 /(Auto[PlyNum].Ader*Ground[Auto[PlyNum].Sol,0])
		 else
			Auto[PlyNum].Vts.Angl:=Auto[PlyNum].Vts.Angl+(Auto[PlyNum].Acc.Angl-Auto[PlyNum].Vts.Angl-360)
			 /(Auto[PlyNum].Ader*Ground[Auto[PlyNum].Sol,0]);
		end
		else
		 Auto[PlyNum].Vts.Angl:=Auto[PlyNum].Vts.Angl+(Auto[PlyNum].Acc.Angl-Auto[PlyNum].Vts.Angl)
			/(Auto[PlyNum].Ader*Ground[Auto[PlyNum].Sol,0]);
		Mod360(Auto[PlyNum].Vts.Angl);
		Auto[PlyNum].Vts.Norm:=Auto[PlyNum].Vts.Norm+(Auto[PlyNum].Acc.Norm-Auto[PlyNum].Vts.Norm)
		 /(Auto[PlyNum].Ader*Ground[Auto[PlyNum].Sol,0]);
(************************************** NEW POSITIONS                       *)
		NewX:=Auto[PlyNum].X+(Auto[PlyNum].Vts.Norm/10/Ground[Auto[PlyNum].Sol,1])*CosI[trunc(Auto[PlyNum].Vts.Angl)];
		NewY:=Auto[PlyNum].Y-(Auto[PlyNum].Vts.Norm/10/Ground[Auto[PlyNum].Sol,1])*SinI[trunc(Auto[PlyNum].Vts.Angl)];
		if NewX>319 then NewX:=0 else if NewX<0 then NewX:=319;
		if NewY>199 then NewY:=0 else if NewY<0 then NewY:=199;
		Auto[PlyNum].Dire:=trunc((Auto[PlyNum].Acc.Angl+11.25)/22.5);
		if Auto[PlyNum].Dire>15 then	Auto[PlyNum].Dire:=0;
(************************************** DEBUT DE TEST                       *)
		StopTest:=false;
		for m:=0 to 12 do begin
		 for n:=0 to 10 do begin
			if not StopTest then begin
			 PxlPos.X:=trunc(NewX)+m-6;
			 PxlPos.Y:=trunc(NewY)+n-5;
			 NextPxl:=false;
(*------------------------------------- OUT OF RANGE                        *)
			 if ((PxlPos.Y<0) and (PxlPos.Y>=200)) then NextPxl:=true;
(*------------------------------------- TRANSPARENT                         *)
			 if ((not NextPxl) and (not DetectTrans(m,n,Auto[PlyNum].Sprt[Auto[PlyNum].Dire]))) then begin
				Auto[PlyNum].Posit[m,n].X:=PxlPos.X;
				Auto[PlyNum].Posit[m,n].Y:=PxlPos.Y;
			 end
			 else begin
				Auto[PlyNum].Posit[m,n].X:=0;
				Auto[PlyNum].Posit[m,n].Y:=0;
				NextPxl:=true;
			 end;
(*------------------------------------- ONLOOKER                            *)
			 if not NextPxl then begin
				for k:=1 to 15 do begin
				 if ((PxlPos.X=People[k].Pos.X+4) and (PxlPos.Y=People[k].Pos.Y+4) and (People[k].dead=0)) then begin
					People[k].dead:=1;
					People[k].Pos.X:=trunc(People[k].Pos.X+(Auto[PlyNum].Vts.Norm/10/Ground[Auto[PlyNum].Sol,1])
					 *CosI[trunc(Auto[PlyNum].Vts.Angl)]);
					People[k].Pos.Y:=trunc(People[k].Pos.Y-(Auto[PlyNum].Vts.Norm/10/Ground[Auto[PlyNum].Sol,1])
					 *SinI[trunc(Auto[PlyNum].Vts.Angl)]);
					NextPxl:=true;
				 end;
				end;
			 end;
(*------------------------------------- CHECKS POINTS                       *)
			 if not NextPxl then begin
				for j:=0 to FileMap.NbCP-1 do begin
				 if ((PxlPos.Y=FileMap.CP[j].Dep.Y) and (PxlPos.X>=FileMap.CP[j].Dep.X)
					and (PxlPos.X<FileMap.CP[j].Dep.X+FileMap.CP[j].Long)) then begin
					Auto[PlyNum].CheckValid[j]:=true;
					NextPxl:=true;
				 end;
				end;
			 end;
(*------------------------------------- START LINE                          *)
			 if ((not NextPxl) and (PxlPos.Y=FileMap.SL.Dep.Y) and (PxlPos.X>=FileMap.SL.Dep.X)
				and (PxlPos.X<=FileMap.SL.Dep.X+FileMap.SL.Long-1)) then begin
				Lap:=true;
				for j:=0 to FileMap.NbCP-1 do
				 if not Auto[PlyNum].CheckValid[j] then Lap:=false;
				if Lap then begin
				 if Auto[PlyNum].Laps<99 then inc(Auto[PlyNum].Laps)
				 else	Auto[PlyNum].Laps:=0;
				 Auto[PlyNum].Cmpt:=0;
				 for j:=0 to FileMap.NbCP-1 do
					Auto[PlyNum].CheckValid[j]:=false;
				 GetTime(Auto[PlyNum].NewTime.h,Auto[PlyNum].NewTime.m,Auto[PlyNum].NewTime.s,Auto[PlyNum].NewTime.ms);
				 SubTime(Auto[PlyNum].NewTime,Auto[PlyNum].OldTime,Auto[PlyNum].LapTime);
				 AddTime(Auto[PlyNum].FullTime,Auto[PlyNum].LapTime,Auto[PlyNum].FullTime);
				 Auto[PlyNum].OldTime:=Auto[PlyNum].NewTime;
				 MinTime(Auto[PlyNum].LapTime,Auto[PlyNum].BestTime,Auto[PlyNum].BestTime);
				 NextPxl:=true;
				end;
			 end;
(*------------------------------------- WALL CHOC                           *)
			 if ((not NextPxl) and (Auto[PlyNum].flyCmp<1) and ((DetectSol(Circuit,PxlPos.X,PxlPos.Y)=28)
				or (DetectSol(Circuit,PxlPos.X,PxlPos.Y)=202))) then begin
				if trunc(Auto[PlyNum].Vts.Norm/10)>1 then
				 Auto[PlyNum].Life:=Auto[PlyNum].Life-trunc(Auto[PlyNum].Vts.Norm/10)
				else dec(Auto[PlyNum].Life);
				if Auto[PlyNum].Life<=0 then begin
				 Auto[PlyNum].Life:=0;
				 Auto[PlyNum].BlastCmp:=7;
				end;
				Xc:=m-6;
				Yc:=n-5;
				if Xc=0 then begin
				 if Yc>0 then	Beta:=270
				 else	Beta:=90;
				end
				else begin
				 Dlt:=(Xc/sqrt(sqr(Xc)+sqr(Yc)));
				 if ((Xc>0) and (Yc<0)) then	Beta:=arctan(sqrt(1-sqr(Dlt))/Dlt)/Pi*180
				 else if ((Xc<0) and (Yc<0)) then Beta:=180+arctan(sqrt(1-sqr(Dlt))/Dlt)/Pi*180
				 else if ((Xc<0) and (Yc>0)) then	Beta:=180-arctan(sqrt(1-sqr(Dlt))/Dlt)/Pi*180
				 else if ((Xc>0) and (Yc>0)) then	Beta:=360-arctan(sqrt(1-sqr(Dlt))/Dlt)/Pi*180;
				end;
				Auto[PlyNum].Vts.Angl:=2*Auto[PlyNum].Vts.Angl-Beta;
				Mod360(Auto[PlyNum].Vts.Angl);
				Auto[PlyNum].Vts.Norm:=0;
				Auto[PlyNum].ChcPt.X:=PxlPos.X;
				Auto[PlyNum].ChcPt.Y:=PxlPos.Y;
				if Auto[PlyNum].ChcCmp=3 then	Auto[PlyNum].ChcCmp:=2
				else Auto[PlyNum].ChcCmp:=3;
				NewX:=Auto[PlyNum].X-1*CosI[trunc(Beta)];
				NewY:=Auto[PlyNum].Y+1*SinI[trunc(Beta)];
				NextPxl:=true;
			 end;
(*------------------------------------- CAR CHOC                            *)
			 if not NextPxl then begin
				for PlyNumTest:=1 to MaxPly do begin
				 if ((PlyNumTest<>PlyNum) and (Auto[PlyNumTest].Life>0)
					and (trunc(NewX)>trunc(Auto[PlyNumTest].X)-13) and (trunc(NewX)<trunc(Auto[PlyNumTest].X)+13)
					and (trunc(NewY)>trunc(Auto[PlyNumTest].Y)-11) and (trunc(NewY)<trunc(Auto[PlyNumTest].Y)+11)) then begin
					StopTest2:=false;
					for m2:=0 to 12 do begin
					 for n2:=0 to 10 do begin
						if ((PxlPos.X=Auto[PlyNumTest].Posit[m2,n2].X)
						 and (PxlPos.Y=Auto[PlyNumTest].Posit[m2,n2].Y)) then begin
						 StopTest2:=true;
						 Auto[PlyNum].Life:=Auto[PlyNum].Life-trunc(Auto[PlyNumTest].Vts.Norm/10);
						 if Auto[PlyNum].Life<=0 then begin
							Auto[PlyNum].Life:=0;
							Auto[PlyNum].BlastCmp:=7;
						 end;
						 Auto[PlyNumTest].Life:=Auto[PlyNumTest].Life-trunc(Auto[PlyNum].Vts.Norm/10);
						 if Auto[PlyNumTest].Life<=0 then begin
							Auto[PlyNumTest].Life:=0;
							Auto[PlyNumTest].BlastCmp:=7;
						 end;

						 if Auto[PlyNumTest].vts.norm>Auto[PlyNum].vts.norm then begin
							Auto[PlyNum].vts.norm:=(Auto[PlyNumTest].vts.norm+Auto[PlyNum].vts.norm)/2;
							Auto[PlyNumTest].vts.norm:=0;
						 end
						 else begin
							Auto[PlyNumTest].vts.norm:=(Auto[PlyNumTest].vts.norm+Auto[PlyNum].vts.norm)/2;
							Auto[PlyNum].vts.norm:=0;
						 end;
						 TmpAngle:=Auto[PlyNumTest].vts.angl;
						 Auto[PlyNumTest].vts.angl:=Auto[PlyNum].vts.angl;
						 Auto[PlyNum].vts.angl:=TmpAngle;

						 Auto[PlyNum].ChcPt.X:=PxlPos.X;
						 Auto[PlyNum].ChcPt.Y:=PxlPos.Y;
						 if Auto[PlyNum].ChcCmp=3 then	Auto[PlyNum].ChcCmp:=2
						 else Auto[PlyNum].ChcCmp:=3;
						 Xc:=m-6;
						 Yc:=n-5;
						 if Xc=0 then begin
							if Yc>0 then	Beta:=270
							else Beta:=90;
						 end
						 else begin
							Dlt:=(Xc/sqrt(sqr(Xc)+sqr(Yc)));
							if ((Xc>0) and (Yc<0)) then Beta:=arctan(sqrt(1-sqr(Dlt))/Dlt)/Pi*180
							else if ((Xc<0) and (Yc<0)) then Beta:=180+arctan(sqrt(1-sqr(Dlt))/Dlt)/Pi*180
							else if ((Xc<0) and (Yc>0)) then	Beta:=180-arctan(sqrt(1-sqr(Dlt))/Dlt)/Pi*180
							else if ((Xc>0) and (Yc>0)) then	Beta:=360-arctan(sqrt(1-sqr(Dlt))/Dlt)/Pi*180;
						 end;
						 Auto[PlyNum].Vts.Angl:=2*Auto[PlyNum].Vts.Angl-Beta;
						 Mod360(Auto[PlyNum].Vts.Angl);
						 NewX:=Auto[PlyNum].X-1*CosI[trunc(Beta)];
						 NewY:=Auto[PlyNum].Y+1*SinI[trunc(Beta)];
						 if Auto[PlyNum].ChcCmp=3 then Auto[PlyNum].ChcCmp:=2
						 else Auto[PlyNum].ChcCmp:=3;
						end;
					 end;
					end;
				 end;
				end;
(*------------------------------------- TEST END                             *)
			 end;
			end;
		 end;
		end;
		if Auto[PlyNum].flyCmp=0 then	Auto[PlyNum].Sol:=DetectSol(circuit,trunc(NewX),trunc(NewY));
		if (((Auto[PlyNum].Sol=237) or (Auto[PlyNum].Sol=242)) and (Auto[PlyNum].Vts.Norm>1)) then
		 Auto[PlyNum].Acc.Angl:=Auto[PlyNum].Acc.Angl+5-random(11);
		Mod360(Auto[PlyNum].Acc.Angl);
		if (((Auto[PlyNum].Sol=199) or (Auto[PlyNum].Sol=115)) and (Auto[PlyNum].flyCmp=0)and (Auto[PlyNum].Vts.Norm>1)) then begin
		 Auto[PlyNum].FlyVts:=trunc(Auto[PlyNum].Vts.Norm/2);
		 Auto[PlyNum].FlyCmp:=trunc(Auto[PlyNum].Vts.Norm/2);
		end;
		if Auto[PlyNum].flyCmp>0 then begin
		 Auto[PlyNum].Z:=trunc(Auto[PlyNum].FlyVts/2*SinI[trunc(180*(Auto[PlyNum].FlyVts-Auto[PlyNum].FlyCmp)
			/Auto[PlyNum].FlyVts)]);
		 dec(Auto[PlyNum].FlyCmp);
		end
		else Auto[PlyNum].Z:=0;
		GetKey;
		Auto[PlyNum].X:=NewX;
		Auto[PlyNum].Y:=NewY;
		if Auto[PlyNum].Cmpt<1000 then inc(Auto[PlyNum].Cmpt);
	 end;
	end;
	CommunKey;
	Aff;
	SubTime(Loop2,Loop,TTime);
	while TTime.ms<5 do begin
	 GetTime(Loop2.h,Loop2.m,Loop2.s,Loop2.ms);
	 SubTime(Loop2,Loop,TTime);
	end;
 end;
 CloseAll;
 FadeOutBlack(Pal);
 InitOldKeyb;
 InitMode($03);
 Logo;
end.