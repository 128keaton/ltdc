{$G+}
{$E+}
{$F+}

unit _CarUnit;


(****************************************************************************)

																	 INTERFACE

(****************************************************************************)

uses
	crt,GraphAsm,TextAsm,_KeyBAsm,dos;

Type
	Time= record
		h,m,s,ms: word;
	end;

procedure Mod360(var Angl: real);
function LeadingZero(w:Word):string;
function FileExists(FileName: String): Boolean;
function DetectTrans(DtX,DtY: word; DtSprt: PByte): boolean;
function DetectSol(Circ: PByte; AtX,AtY: word): byte;
procedure MinTime(T1,T2: time; var T3: Time);
procedure SubTime(T1,T2: Time; var T3: Time);
procedure AddTime(T1,T2: Time; var T3: Time);
procedure FadeOutBlack (PalFOB: TPalette);
procedure FadeInBlack (PalFIB: TPalette);
procedure Logo;


(****************************************************************************)

																 IMPLEMENTATION

(****************************************************************************)

procedure Mod360(var Angl: real);
begin
	while ((Angl<0) or (Angl>=360)) do begin
		if Angl<0 then
			Angl:=Angl+360
		else if Angl>=360 then
			Angl:=Angl-360;
	end;
end;

function LeadingZero(w:Word):string;
var
	s: String;
begin
	str(w:0,s);
	if length(s)=1 then
		s:='0'+s;
	LeadingZero:=s;
end;


function FileExists(FileName: String): Boolean;
var
 F: file;
begin
 {$I-}
 Assign(F,FileName);
 Reset(F);
 Close(F);
 {$I+}
 FileExists:=(IOResult=0) and (FileName<>'');
end;


function DetectTrans(DtX,DtY: word; DtSprt: PByte): boolean;
var
	DtR: byte;
begin
	DtR:=0;
	asm
		push ds
		lds  si,DtSprt
		add  si,DtX
		mov  ax,13
		mul  DtY
		add  si,ax
		mov  al,[si]
		cmp  al,0Fh
		jnz  @FIN
		mov  DtR,1
	 @FIN:
		pop  ds
	end;
	if DtR=1 then
		DetectTrans:=true
	else
		DetectTrans:=false;
end;


function DetectSol(Circ: PByte; AtX,AtY: word): byte;
var
	TmpByte: byte;
begin
	asm
		les di,Circ
		add di,AtX
		mov ax,320
		mul AtY
		add di,ax
		mov ax,es:[di]
		mov TmpByte,al
	end;
	DetectSol:=TmpByte;
end;


procedure MinTime(T1,T2: time; var T3: Time);
begin
	if T1.h<T2.h then
		T3:=T1
	else if T2.h<T1.h then
		T3:=T2
	else if T1.m<T2.m then
		T3:=T1
	else if T2.m<T1.m then
		T3:=T2
	else if T1.s<T2.s then
		T3:=T1
	else if T2.s<T1.s then
		T3:=T2
	else if T1.s<T2.s then
		T3:=T1
	else if T2.s<T1.s then
		T3:=T2;
end;


procedure SubTime(T1,T2: Time; var T3: Time);
begin
	if T1.h>=T2.h then
		T3.h:=T1.h-T2.h
	else
		T3.h:=24+T1.h-T2.h;
	if T1.m>=T2.m then
		T3.m:=T1.m-T2.m
	else begin
		T3.m:=60+T1.m-T2.m;
		if T3.h>0 then
			T3.h:=T3.h-1
		else
			T3.h:=0;
	end;
	if T1.s>=T2.s then
		T3.s:=T1.s-T2.s
	else begin
		T3.s:=60+T1.s-T2.s;
		if T3.m>0 then
			T3.m:=T3.m-1
		else
			T3.m:=0;
	end;
	if T1.ms>=T2.ms then
		T3.ms:=T1.ms-T2.ms
	else begin
		T3.ms:=100+T1.ms-T2.ms;
		if T3.s>0 then
			T3.s:=T3.s-1
		else
			T3.s:=0;
	end;
end;


procedure AddTime(T1,T2: Time; var T3: Time);
begin
	T3.h:=T1.h+T2.h;
	if T3.h>23 then
		T3.h:=T3.h-24;
	T3.m:=T1.m+T2.m;
	if T3.m>59 then begin
		T3.m:=T3.m-60;
		if T3.h<23 then
			inc(T3.h)
		else
			T3.h:=0;
	end;
	T3.s:=T1.s+T2.s;
	if T3.s>59 then begin
		T3.s:=T3.s-60;
		if T3.m<59 then
			inc(T3.m)
		else
			T3.m:=0;
	end;
	T3.ms:=T1.ms+T2.ms;
	if T3.ms>99 then begin
		T3.ms:=T3.ms-100;
		if T3.s<59 then
			inc(T3.s)
		else
			T3.s:=0;
	end;
end;


procedure FadeOutBlack (PalFOB: TPalette);
var
	aFOB,bFOB: word;
begin
	for aFOB:=0 to 64 do begin
		for bFOB:=0 to 767 do
			if PalFOB[bFOB]>0 then
				dec(PalFOB[bFOB]);
		SetPalette(PalFOB);
		Delay(20);
	end;
end;


procedure FadeInBlack (PalFIB: TPalette);
var
	TmpPal:TPAlette;
	aFIB,bFIB,cFIB: word;
begin
	for cFIB:=0 to 767 do
		TmpPal[cFIB]:=0;
	for aFIB:=0 to 64 do begin
		for bFIB:=0 to 767 do
			if TmpPal[bFIB]<PalFIB[bFIB] then
				inc(TmpPal[bFIB]);
		SetPalette(TmpPal);
		Delay(20);
	end;
end;


procedure Logo;
begin
	clrscr;
	writeln('          ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
	writeln('          ³                                                           ³');
	writeln('          ³                   CarWar version 1.53                     ³');
	writeln('          ³          by ReDragoN of PHENIX Corporation 1997           ³');
	writeln('          ³                                                           ³');
	writeln('          ³              ÚÄÄÄ¿Ä¿ÚÄ¿ÄÄÄ¿Ä¿ ÚÄ¿ÄÄ¿Ä¿  ÚÄ¿               ³');
	writeln('          ³              ³ O ³ ÀÙ ³ ÄÂÙ  \³ ³  ³\ \/ /                ³');
	writeln('          ³              ³ ÚÄÙ Ú¿ ³ ÄÁ¿ ³\  ³  ³/ /\ \  Corp.         ³');
	writeln('          ³ ÄÄÄÄÄÄÄÄÄÄÄÄÄÀÄÙ ÀÄÙÀÄÙÄÄÄÙÄÙ ÀÄÙÄÄÙÄÙ  ÀÄÙÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ³');
	writeln('          ³                                                           ³');
	writeln('          ³ CODE               GFX                SFX                 ³');
	writeln('          ³ À ReDragoN         Ã SEN              Ã Asterix           ³');
	writeln('          ³                    À PROF             Ã KRš$TY & Xaam     ³');
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
end;


end.