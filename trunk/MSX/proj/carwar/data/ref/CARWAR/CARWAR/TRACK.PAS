{$G+}
{$E+}
{$F+}


uses
	crt,GraphAsm,TextAsm,_KeyBAsm,dos,_CarUnit;


type
	Pt= record
		X,Y: word;
	end;
	LigneCheck= record
		Dep: Pt;
		Long: word;
		Valid: boolean;
	end;
	Box= record
		X,Y,Larg,Haut: word;
		Sprt: PByte;
		Move: boolean;
		IconBDown,IconBUp,MoveDeb,MoveFin: array [1..10] of boolean;
	end;
	Pointeur= record
		Sprt: PByte;
		DecalX,DecalY: word;
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
	Affichage= record
		Txt: array [1..8,1..2] of byte;
		Sprt: PByte;
		AlphSprt: array [0..59] of PByte;
	end;


var
	Scr: Affichage;
	EcrV,Image,Circuit: PByte;
	CarSprt: array [0..15] of PByte;
	NbSprt: array [1..4] of PByte;
	Cursor: array [0..15] of Pointeur;
	Nombre: array [0..9] of PByte;
	ToolBox: Box;
	Ok,Move,Load,Save: boolean;
	SLMoveDeb,SLMoveFin,ScrMove: boolean;
	CPMoveDeb,CPMoveFin: array [0..31] of boolean;
	CarMove,CarDire: array [1..4] of boolean;
	Pal: TPalette;
	m,n,o,Btn,XM,YM,OldBtn,OldXM,OldYM: word;
	i,j,k,NumC,Dire: byte;
	x,y,z: real;
	a,b,c: integer;
	TmpMap,FileMap: Map;
	F: file of Map;
	ch: char;


procedure Init;
begin
	clrscr;
	TmpMap.Name:=paramstr(1);
	writeln;
	if FileExists(TmpMap.Name+'.PCX') then begin
		writeln('ş FOUND FILE : '+TmpMap.Name+'.PCX');
		writeln('  LOADING BACKGROUND ...');
		ChargePCX(TmpMap.Name+'.PCX',Circuit,Pal);
	end
	else begin
		writeln('ş ERROR 1 : BACKGOUND FILE NOT FOUND');
		halt(1);
	end;
	delay(100);
	assign(F,TmpMap.Name+'.DAT');
	if FileExists(TmpMap.Name+'.DAT') then begin
		writeln('ş FOUND FILE : '+TmpMap.Name+'.DAT');
		writeln('  LOADING DATA ...');
		reset(F);
		read(F,FileMap);
		TmpMap:=FileMap;
		rewrite(F);
		Load:=true;
	end
	else if TmpMap.Name='' then begin
		writeln('ş ERROR 2 : BAD DATA FILE NAME');
		halt(2);
	end
	else begin
		writeln('ş FILE NOT FOUND : '+TmpMap.Name+'.DAT');
		writeln('  CREATING DATA FILE ...');
		Load:=false;
	end;
	delay(100);
	Init_MOUSE(Ok);
	if Ok then
		writeln('ş MOUSE DETECTED')
	else begin
		writeln('ş ERROR 3 : MOUSE NOT DETECTED');
		halt(3);
	end;
	delay(1000);
	randomize;
	Mov_MOUSE(0,0);
	InitMode($13);
	InitNewKeyb;
end;


procedure InitEditor;
begin
	NumC:=0;
	Ok:=true;
	Cursor[0].DecalX:=0;
	Cursor[0].DecalY:=0;
	Cursor[1].DecalX:=0;
	Cursor[1].DecalY:=8;
	Cursor[2].DecalX:=0;
	Cursor[2].DecalY:=8;
	Cursor[3].DecalX:=4;
	Cursor[3].DecalY:=0;
	Cursor[4].DecalX:=4;
	Cursor[4].DecalY:=0;
	Cursor[5].DecalX:=4;
	Cursor[5].DecalY:=4;
	for i:=5 to 7 do begin
		Cursor[i].DecalX:=0;
		Cursor[i].DecalY:=0;
	end;
	ToolBox.X:=100;
	ToolBox.Y:=100;
	if not Load then begin
		TmpMap.SL.Dep.X:=0;
		TmpMap.SL.Dep.Y:=0;
		TmpMap.SL.Long:=999;
		TmpMap.NbCP:=0;
		for i:=1 to 5 do
			TmpMap.Car[i].Angle:=999;
	end;
	getmem(EcrV,64000);
	ChargePCX('ALPHA.PCX',Image,Pal);
	for i:=0 to 29 do begin
		GetMem(Scr.AlphSprt[i],4*5);
		CreatSprt(image,141+i*5,1,4,5,Scr.AlphSprt[i]);
		GetMem(Scr.AlphSprt[i+30],4*5);
		CreatSprt(image,141+i*5,7,4,5,Scr.AlphSprt[i+30]);
	end;
	GetMem(Scr.Sprt,49*21);
	CreatSprt(image,65,45,49,21,Scr.Sprt);
	Scr.Txt[1,1]:=13;
	Scr.Txt[2,1]:=32;
	Scr.Txt[3,1]:=30;
	Scr.Txt[4,1]:=47;
	Scr.Txt[5,1]:=52;
	Scr.Txt[6,1]:=30;
	Scr.Txt[7,1]:=47;
	Scr.Txt[8,1]:=13;
	Scr.Txt[1,2]:=15;
	Scr.Txt[2,2]:=34;
	Scr.Txt[3,2]:=33;
	Scr.Txt[4,2]:=38;
	Scr.Txt[5,2]:=49;
	Scr.Txt[6,2]:=44;
	Scr.Txt[7,2]:=47;
	Scr.Txt[8,2]:=16;
	for i:=0 to 15 do begin
		getmem(Cursor[i].Sprt,9*9);
		CreatSprt(Image,1+10*i,13,9,9,Cursor[i].Sprt);
		getmem(CarSprt[i],13*11);
		CreatSprt(Image,65+14*i,33,13,11,CarSprt[i]);
	end;
	for i:=0 to 9 do begin
		getmem(Nombre[i],4*5);
		CreatSprt(Image,141+5*i,1,4,5,Nombre[i]);
	end;
	for i:=1 to 4 do begin
		getmem(NbSprt[i],9*9);
		CreatSprt(Image,81+10*(i-1),23,9,9,NbSprt[i]);
	end;
	getmem(ToolBox.Sprt,31*95);
	CreatSprt(Image,33,33,31,95,ToolBox.Sprt);
	freemem(Image,64000);
	SetPalette(Pal);
end;


procedure CloseAll;
begin
	freemem(Circuit,64000);
	freemem(EcrV,64000);
	for i:=0 to 15 do begin
		freemem(Cursor[i].Sprt,9*9);
		freemem(CarSprt[i],13*11);
	end;
	for i:=1 to 4 do
		freemem(NbSprt[i],9*9);
	for i:=0 to 9 do
		freemem(Nombre[i],4*5);
	freemem(ToolBox.Sprt,31*39);
	freemem(Scr.Sprt,49*21);
	for i:=0 to 59 do
		freemem(Scr.AlphSprt[i],4*5);
	InitOldKeyb;
	InitMode($03);
	if Load then
		write(F,FileMap);
	if (load or Save) then
		close(F);
end;


procedure	Aff;
begin
	Vsync;
	AffSprt(EcrV,0,0,320,200,Circuit);
	if TmpMap.SL.Long<>999 then begin
		AffSprtC(0,0,320,200,EcrV,TmpMap.SL.Dep.X,TmpMap.SL.Dep.Y-8,9,9,Cursor[1].Sprt);
		AffSprtC(0,0,320,200,EcrV,TmpMap.SL.Dep.X+TmpMap.SL.Long-1,TmpMap.SL.Dep.Y-8,9,9,Cursor[1].Sprt);
		AffLineV(EcrV,TmpMap.SL.Dep.X,TmpMap.SL.Dep.Y,TmpMap.SL.Long,255);
	end;
	for i:=1 to TmpMap.NbCP do begin
		AffSprtC(0,0,320,200,EcrV,TmpMap.CP[i-1].Dep.X,TmpMap.CP[i-1].Dep.Y-8,9,9,Cursor[2].Sprt);
		AffSprtC(0,0,320,200,EcrV,TmpMap.CP[i-1].Dep.X+TmpMap.CP[i-1].Long-1,TmpMap.CP[i-1].Dep.Y-8,9,9,Cursor[2].Sprt);
		AffLineV(EcrV,TmpMap.CP[i-1].Dep.X,TmpMap.CP[i-1].Dep.Y,TmpMap.CP[i-1].Long,113);
	end;
	for i:=1 to 5 do begin
		if TmpMap.Car[i].Angle<>999 then begin
			Dire:=trunc((TmpMap.Car[i].Angle+11.25)/22.5);
			if Dire>15 then
				Dire:=0;
			AffSprtC(0,0,320,200,EcrV,TmpMap.Car[i].Dep.X-6,TmpMap.Car[i].Dep.Y-5,13,11,CarSprt[Dire]);
			AffSprtC(0,0,320,200,EcrV,TmpMap.Car[i].Dep.X-4,TmpMap.Car[i].Dep.Y-4,9,9,NbSprt[i]);
		end;
	end;
	if TmpMap.BigScrValid then begin
		AffSprtC(0,0,320,200,EcrV,TmpMap.BigScr.X,TmpMap.BigScr.Y,49,21,Scr.Sprt);
		for i:=1 to 8 do
			for j:=1 to 2 do
				if Scr.Txt[i,j]<>255 then
					AffSprtC(0,0,320,200,EcrV,TmpMap.BigScr.X+i*5,TmpMap.BigScr.Y+j*6-1,4,5,Scr.AlphSprt[Scr.Txt[i,j]]);
	end;
	AffSprtC(0,0,320,200,EcrV,ToolBox.X,ToolBox.Y,31,95,ToolBox.Sprt);
	AffSprtC(0,0,320,200,EcrV,ToolBox.X+16,ToolBox.Y+84,4,5,Nombre[TmpMap.NbCP div 10]);
	AffSprtC(0,0,320,200,EcrV,ToolBox.X+21,ToolBox.Y+84,4,5,Nombre[TmpMap.NbCP mod 10]);
	AffSprtC(0,0,320,200,EcrV,XM-Cursor[NumC].DecalX,YM-Cursor[NumC].DecalY,9,9,Cursor[NumC].Sprt);
	CopieBuffer(EcrV);
end;


begin
	Init;
	InitEditor;

	while Ok do begin
		delay(50);
		OldBtn:=Btn;
		OldXM:=Xm;
		OldYm:=Ym;
		Coord_MOUSE(Btn,XM,YM);
		Xm:=Xm div 2;

(* SPECIAL CLICK *)
		if ((Btn=1) and (ToolBox.IconBUp[1])) then begin
			ToolBox.IconBUp[1]:=false;
			TmpMap.SL.Dep.X:=Xm;
			TmpMap.SL.Dep.Y:=Ym;
			TmpMap.SL.Long:=20;
			NumC:=0;
		end
		else if ((Btn=1) and (ToolBox.IconBUp[2])) then begin
			ToolBox.IconBUp[2]:=false;
			TmpMap.Car[1].Dep.X:=Xm;
			TmpMap.Car[1].Dep.Y:=Ym;
			TmpMap.Car[1].Angle:=90;
			NumC:=0;
		end
		else if ((Btn=1) and (ToolBox.IconBUp[3])) then begin
			ToolBox.IconBUp[3]:=false;
			TmpMap.Car[3].Dep.X:=Xm;
			TmpMap.Car[3].Dep.Y:=Ym;
			TmpMap.Car[3].Angle:=90;
			NumC:=0;
		end
		else if ((Btn=1) and (ToolBox.IconBUp[4])) then begin
			ToolBox.IconBUp[4]:=false;
			TmpMap.BigScr.X:=Xm;
			TmpMap.BigScr.Y:=Ym;
			TmpMap.BigScrValid:=true;
			NumC:=0;
		end
		else if (ToolBox.IconBDown[5]) then begin
			if not Load then
				rewrite(F);
			FileMap:=TmpMap;
			write(F,FileMap);
			Save:=true;
		end
		else if ((Btn=1) and (ToolBox.IconBUp[6])) then begin
			ToolBox.IconBUp[6]:=false;
			TmpMap.CP[TmpMap.NbCP].Dep.X:=Xm;
			TmpMap.CP[TmpMap.NbCP].Dep.Y:=Ym;
			TmpMap.CP[TmpMap.NbCP].Long:=20;
			inc(TmpMap.NbCP);
			NumC:=0;
		end
		else if ((Btn=1) and (ToolBox.IconBUp[7])) then begin
			ToolBox.IconBUp[7]:=false;
			TmpMap.Car[2].Dep.X:=Xm;
			TmpMap.Car[2].Dep.Y:=Ym;
			TmpMap.Car[2].Angle:=90;
			NumC:=0;
		end
		else if ((Btn=1) and (ToolBox.IconBUp[8])) then begin
			ToolBox.IconBUp[8]:=false;
			TmpMap.Car[4].Dep.X:=Xm;
			TmpMap.Car[4].Dep.Y:=Ym;
			TmpMap.Car[4].Angle:=90;
			NumC:=0;
		end
		else if (ToolBox.IconBDown[10]) then
			Ok:=false;

(* MOVE FEATURES *)
		if SLMoveDeb then begin
			TmpMap.SL.Dep.X:=TmpMap.SL.Dep.X+Xm-OldXm;
			TmpMap.SL.Dep.Y:=TmpMap.SL.Dep.Y+Ym-OldYm;
		end;
		if ScrMove then begin
			TmpMap.BigScr.X:=TmpMap.BigScr.X+Xm-OldXm;
			TmpMap.BigScr.Y:=TmpMap.BigScr.Y+Ym-OldYm;
		end;
		if ToolBox.Move then begin
			if ((ToolBox.X+Xm-OldXm>=0) and (ToolBox.X+Xm-OldXm<=320-31)) then
				ToolBox.X:=ToolBox.X+Xm-OldXm;
			if ((ToolBox.Y+Ym-OldYm>=0) and (ToolBox.Y+Ym-OldYm<=200-95)) then
				ToolBox.Y:=ToolBox.Y+Ym-OldYm;
		end;
		if SLMoveFin then
			if TmpMap.SL.Long+Xm-OldXm>20 then
				TmpMap.SL.Long:=TmpMap.SL.Long+Xm-OldXm;
		for i:=1 to TmpMap.NbCP do begin
			if CPMoveDeb[i-1] then begin
				TmpMap.CP[i-1].Dep.X:=TmpMap.CP[i-1].Dep.X+Xm-OldXm;
				TmpMap.CP[i-1].Dep.Y:=TmpMap.CP[i-1].Dep.Y+Ym-OldYm;
			end;
			if CPMoveFin[i-1] then
				if TmpMap.CP[i-1].Long+Xm-OldXm>20 then
					TmpMap.CP[i-1].Long:=TmpMap.CP[i-1].Long+Xm-OldXm;
		end;
		for i:=1 to 4 do begin
			if ((CarMove[i]) and (TmpMap.Car[i].Angle<>999)) then begin
				TmpMap.Car[i].Dep.X:=TmpMap.Car[i].Dep.X+Xm-OldXm;
				TmpMap.Car[i].Dep.Y:=TmpMap.Car[i].Dep.Y+Ym-OldYm;
			end;
		end;

(* DETECT ICONS AND OPTIONS *)
		for i:=1 to 5 do begin
			if ((not Move) and (Btn=1) and (Xm>=ToolBox.X+2) and (Xm<=ToolBox.X+14)
			and (Ym>=ToolBox.Y+10+14*(i-1)) and (Ym<=ToolBox.Y+23+14*(i-1))) then begin
				ToolBox.IconBDown[i]:=true;
				Move:=true;
			end;
			if ((ToolBox.IconBDown[i]) and (Btn=0) and (Xm>=ToolBox.X+2) and (Xm<=ToolBox.X+15)
			and (Ym>=ToolBox.Y+10+14*(i-1)) and (Ym<=ToolBox.Y+23+14*(i-1))) then begin
				ToolBox.IconBDown[i]:=false;
				ToolBox.IconBUp[i]:=true;
				Move:=false;
			end;
			if ((not Move) and (Btn=1) and (Xm>=ToolBox.X+16) and (Xm<=ToolBox.X+29)
			and (Ym>=ToolBox.Y+10+14*(i-1)) and (Ym<=ToolBox.Y+23+14*(i-1))) then begin
				ToolBox.IconBDown[i+5]:=true;
				Move:=true;
			end;
			if ((ToolBox.IconBDown[i+5]) and (Btn=0) and (Xm>=ToolBox.X+16) and (Xm<=ToolBox.X+29)
			and (Ym>=ToolBox.Y+10+14*(i-1)) and (Ym<=ToolBox.Y+23+14*(i-1))) then begin
				ToolBox.IconBDown[i+5]:=false;
				ToolBox.IconBUp[i+5]:=true;
				Move:=false;
			end;
		end;
		if ((not Move) and (Btn=1) and (Xm>=ToolBox.X+2) and (Xm<=ToolBox.X+27)
			and (Ym>=ToolBox.Y+2) and (Ym<=ToolBox.Y+8)) then begin
			ToolBox.Move:=true;
			Move:=true;
			NumC:=3;
		end;
		if ((Btn=0) and (ToolBox.Move)) then begin
			ToolBox.Move:=false;
			Move:=false;
			NumC:=0;
		end;
		if ((not Move) and (Btn=1) and (Xm>=TmpMap.BigScr.X) and (Xm<=TmpMap.BigScr.X+48)
		and (Ym>=TmpMap.BigScr.Y) and (Ym<=TmpMap.BigScr.Y+20)) then begin
			ScrMove:=true;
			Move:=true;
			NumC:=3;
		end;
		if ((Btn=0) and (ScrMove)) then begin
			ScrMove:=false;
			Move:=false;
			NumC:=0;
		end;
		if ((not Move) and (Btn=1) and (Xm>=TmpMap.SL.Dep.X-4) and (Xm<=TmpMap.SL.Dep.X+4)
		and (Ym>=TmpMap.SL.Dep.Y-4) and (Ym<=TmpMap.SL.Dep.Y+4)) then begin
			SLMoveDeb:=true;
			Move:=true;
			NumC:=3;
		end;
		if ((Btn=0) and (SLMoveDeb)) then begin
			SLMoveDeb:=false;
			Move:=false;
			NumC:=0;
		end;
		if ((not Move) and (Btn=1) and (Xm>=TmpMap.SL.Dep.X+TmpMap.SL.Long-5) and (Xm<=TmpMap.SL.Dep.X+TmpMap.SL.Long+3)
		and (Ym>=TmpMap.SL.Dep.Y-4) and (Ym<=TmpMap.SL.Dep.Y+4)) then begin
			SLMoveFin:=true;
			Move:=true;
			NumC:=3;
		end;
		if ((Btn=0) and (SLMoveFin)) then begin
			SLMoveFin:=false;
			Move:=false;
			NumC:=0;
		end;
		for i:=1 to TmpMap.NbCP do begin
			if ((not Move) and (Btn=1) and (Xm>=TmpMap.CP[i-1].Dep.X-4) and (Xm<=TmpMap.CP[i-1].Dep.X+4)
			and (Ym>=TmpMap.CP[i-1].Dep.Y-4) and (Ym<=TmpMap.CP[i-1].Dep.Y+4)) then begin
				CPMoveDeb[i-1]:=true;
				Move:=true;
				NumC:=3;
			end;
			if ((Btn=0) and (CPMoveDeb[i-1])) then begin
				CPMoveDeb[i-1]:=false;
				Move:=false;
				NumC:=0;
			end;
			if ((not Move) and (Btn=1)
			and (Xm>=TmpMap.CP[i-1].Dep.X+TmpMap.CP[i-1].Long-5) and (Xm<=TmpMap.CP[i-1].Dep.X+TmpMap.CP[i-1].Long+3)
			and (Ym>=TmpMap.CP[i-1].Dep.Y-4) and (Ym<=TmpMap.CP[i-1].Dep.Y+4)) then begin
				CPMoveFin[i-1]:=true;
				Move:=true;
				NumC:=3;
			end;
			if ((Btn=0) and (CPMoveFin[i-1])) then begin
				CPMoveFin[i-1]:=false;
				Move:=false;
				NumC:=0;
			end;
		end;
		for i:=1 to 4 do begin
			if ((not Move) and (Btn=1) and (Xm>=TmpMap.Car[i].Dep.X-6) and (Xm<=TmpMap.Car[i].Dep.X+6)
			and (Ym>=TmpMap.Car[i].Dep.Y-5) and (Ym<=TmpMap.Car[i].Dep.Y+5)) then begin
				CarMove[i]:=true;
				Move:=true;
				NumC:=3;
			end;
			if ((Btn=0) and (CarMove[i])) then begin
				CarMove[i]:=false;
				Move:=false;
				NumC:=0;
			end;
			if ((not Move) and (Btn=2) and (Xm>=TmpMap.Car[i].Dep.X-6) and (Xm<=TmpMap.Car[i].Dep.X+6)
			and (Ym>=TmpMap.Car[i].Dep.Y-5) and (Ym<=TmpMap.Car[i].Dep.Y+5)) then begin
				TmpMap.Car[i].Angle:=TmpMap.Car[i].Angle+5;
				if TmpMap.Car[i].Angle>360 then
					TmpMap.Car[i].Angle:=TmpMap.Car[i].Angle-360;
			end;
		end;

(* SELECT SPECIAL CURSOR *)
		if ToolBox.IconBDown[1] then
			NumC:=1
		else if ToolBox.IconBDown[6] then
			NumC:=2
		else if ToolBox.IconBDown[4] then
			NumC:=4
		else if (ToolBox.IconBDown[2] or ToolBox.IconBDown[3]
		or ToolBox.IconBDown[7] or ToolBox.IconBDown[8]) then
			NumC:=5;

		if TabKey[ESC] then
			Ok:=false;
		Aff;
	end;
	FadeOutBlack(Pal);
	CloseAll;
	writeln('          ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
	writeln('          ³                                                           ³');
	writeln('          ³                 Track editor version 1.5                  ³');
	writeln('          ³          by ReDragoN of PHENIX Corporation 1997           ³');
	writeln('          ³                                                           ³');
	writeln('          ³              ÚÄÄÄ¿Ä¿ÚÄ¿ÄÄÄ¿Ä¿ ÚÄ¿ÄÄ¿Ä¿  ÚÄ¿               ³');
	writeln('          ³              ³ O ³ ÀÙ ³ ÄÂÙ  \³ ³  ³\ \/ /                ³');
	writeln('          ³              ³ ÚÄÙ Ú¿ ³ ÄÁ¿ ³\  ³  ³/ /\ \  Corp.         ³');
	writeln('          ³ ÄÄÄÄÄÄÄÄÄÄÄÄÄÀÄÙ ÀÄÙÀÄÙÄÄÄÙÄÙ ÀÄÙÄÄÙÄÙ  ÀÄÙÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ³');
	writeln('          ³                                                           ³');
	writeln('          ³ CODE               GFX                SFX                 ³');
	writeln('          ³ À ReDragoN         Ã SEN              Ã Asterix           ³');
	writeln('          ³                    À PRO(F)           Ã KRU$TY & Xaam     ³');
	writeln('          ³                                       À Tora tora         ³');
	writeln('          ³                                                           ³');
	writeln('          ³ Ä PEACE FOR ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ³');
	writeln('          ³                                                           ³');
	writeln('          ³   Archy              BigBrother         SemiGod           ³');
	writeln('          ³   Gizmoo             EWF                SlowMotion        ³');
	writeln('          ³   Alex (Radar)       Geronimo           MSX spirit ...    ³');
	writeln('          ³                                                           ³');
	writeln('          ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
	writeln;
end.