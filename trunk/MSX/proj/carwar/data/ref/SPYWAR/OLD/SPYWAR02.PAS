{$G+}
{$E+}
{$F+}


uses crt,GraphAsm,_KeybAsm;


const
  HeroL=14;
  HeroH=23;
  SolL=28;
  SolH=13;
  MurL=14;
  MurH=30;
  LevelLarg=100;
  LevelHaut=100;
  ArbreL=28;
  ArbreH=47;
  BuissL=28;
  BuissH=28;
  NbPLY=2;


type
  Touche=record
    TurnL,TurnR,Front,Back,Left,Right,Fire,Select: byte;
  end;
  Hero= 0..3;
  Position=record
    X,Y: word;
  end;
	Direction= 0..7;
  PJ=record
	  Spy: Hero;
    Pos: Position;
    Dir: Direction;
    Vie: Boolean;
    CX,CY,CLPX1,CLPY1,CLPX2,CLPY2: word;
    KyB: Touche;
  end;


var
	Decort: array [1..255] of PByte;
	SpySprt: array [0..3,0..7] of PByte;
  Perso: array [0..3] of PByte;
	Arb,Arbre,Tmp,ImF,Fond,Titre,ImPerso: PByte;
  EcrV: PByte;
	ChxPersp,i,j,k,Color: byte;
	a,b,c,d: integer;
	Rest: boolean;
	Pal,PalTmp: TPalette;
  PLY: array [1..4] of Pj;
	FLOOR1: array [1..LevelLarg,1..LevelHaut] of word;
	ITEMS1: array [1..LevelLarg,1..LevelHaut] of word;


procedure	ClearKeyB;
var
	CKBi: byte;
begin
  for CKBi:=0 to 127 do
   	TabKey[CKBi]:=false;
end;


procedure CreerImageSprite;
var
	image: Pbyte;
	palette: TPalette;
begin
(************************   I N I T   P E R S O   ***************************)
	ChargePCX('spywar.pcx',image,palette);
  for i:=0 to 3 do
  	for j:=0 to 7 do
	    GetMem(SpySprt[i,j],HeroL*HeroH);
  CreatSprt(image,001,25,HeroL,HeroH,SpySprt[0,0]);
  CreatSprt(image,016,25,HeroL,HeroH,SpySprt[0,1]);
  CreatSprt(image,031,25,HeroL,HeroH,SpySprt[0,2]);
  CreatSprt(image,046,25,HeroL,HeroH,SpySprt[0,3]);
  CreatSprt(image,061,25,HeroL,HeroH,SpySprt[0,4]);
  CreatSprt(image,076,25,HeroL,HeroH,SpySprt[0,5]);
  CreatSprt(image,091,25,HeroL,HeroH,SpySprt[0,6]);
  CreatSprt(image,106,25,HeroL,HeroH,SpySprt[0,7]);
  CreatSprt(image,001,01,HeroL,HeroH,SpySprt[1,0]);
  CreatSprt(image,016,01,HeroL,HeroH,SpySprt[1,1]);
  CreatSprt(image,031,01,HeroL,HeroH,SpySprt[1,2]);
  CreatSprt(image,046,01,HeroL,HeroH,SpySprt[1,3]);
  CreatSprt(image,061,01,HeroL,HeroH,SpySprt[1,4]);
  CreatSprt(image,076,01,HeroL,HeroH,SpySprt[1,5]);
  CreatSprt(image,091,01,HeroL,HeroH,SpySprt[1,6]);
  CreatSprt(image,106,01,HeroL,HeroH,SpySprt[1,7]);
  CreatSprt(image,001,49,HeroL,HeroH,SpySprt[2,0]);
  CreatSprt(image,016,49,HeroL,HeroH,SpySprt[2,1]);
  CreatSprt(image,031,49,HeroL,HeroH,SpySprt[2,2]);
  CreatSprt(image,046,49,HeroL,HeroH,SpySprt[2,3]);
  CreatSprt(image,061,49,HeroL,HeroH,SpySprt[2,4]);
  CreatSprt(image,076,49,HeroL,HeroH,SpySprt[2,5]);
  CreatSprt(image,091,49,HeroL,HeroH,SpySprt[2,6]);
  CreatSprt(image,106,49,HeroL,HeroH,SpySprt[2,7]);
  CreatSprt(image,001,73,HeroL,HeroH,SpySprt[3,0]);
  CreatSprt(image,016,73,HeroL,HeroH,SpySprt[3,1]);
  CreatSprt(image,031,73,HeroL,HeroH,SpySprt[3,2]);
  CreatSprt(image,046,73,HeroL,HeroH,SpySprt[3,3]);
  CreatSprt(image,061,73,HeroL,HeroH,SpySprt[3,4]);
  CreatSprt(image,076,73,HeroL,HeroH,SpySprt[3,5]);
  CreatSprt(image,091,73,HeroL,HeroH,SpySprt[3,6]);
  CreatSprt(image,106,73,HeroL,HeroH,SpySprt[3,7]);
  freemem(image,64000);

(*************************   I N I T   D E C O   ****************************)
  ChargePCX('decors01.pcx',image,palette);
 	for i:=1 to 18 do
    GetMem(Decort[i],SolL*SolH);
  CreatSprt(image,1,32,SolL,SolH,Decort[1]);
  CreatSprt(image,30,32,SolL,SolH,Decort[2]);
  CreatSprt(image,59,32,SolL,SolH,Decort[3]);
	CreatSprt(image,88,32,SolL,SolH,Decort[4]);
	CreatSprt(image,117,32,SolL,SolH,Decort[5]);
	CreatSprt(image,146,32,SolL,SolH,Decort[6]);
	CreatSprt(image,175,32,SolL,SolH,Decort[7]);
	CreatSprt(image,204,32,SolL,SolH,Decort[8]);
	CreatSprt(image,233,32,SolL,SolH,Decort[9]);
  CreatSprt(image,1,46,SolL,SolH,Decort[10]);
  CreatSprt(image,30,46,SolL,SolH,Decort[11]);
  CreatSprt(image,59,46,SolL,SolH,Decort[12]);
	CreatSprt(image,88,46,SolL,SolH,Decort[13]);
	CreatSprt(image,117,46,SolL,SolH,Decort[14]);
	CreatSprt(image,146,46,SolL,SolH,Decort[15]);
	CreatSprt(image,175,46,SolL,SolH,Decort[16]);
	CreatSprt(image,204,46,SolL,SolH,Decort[17]);
	CreatSprt(image,233,46,SolL,SolH,Decort[18]);
 	for i:=100 to 115 do
	  GetMem(Decort[i],MurL*MurH);
  CreatSprt(image,001,1,MurL,MurH,Decort[100]);
  CreatSprt(image,016,1,MurL,MurH,Decort[101]);
  CreatSprt(image,031,1,MurL,MurH,Decort[102]);
  CreatSprt(image,046,1,MurL,MurH,Decort[103]);
  CreatSprt(image,061,1,MurL,MurH,Decort[104]);
  CreatSprt(image,076,1,MurL,MurH,Decort[105]);
  CreatSprt(image,091,1,MurL,MurH,Decort[106]);
  CreatSprt(image,106,1,MurL,MurH,Decort[107]);
  CreatSprt(image,121,1,MurL,MurH,Decort[108]);
  CreatSprt(image,136,1,MurL,MurH,Decort[109]);
  CreatSprt(image,151,1,MurL,MurH,Decort[110]);
  CreatSprt(image,166,1,MurL,MurH,Decort[111]);
  CreatSprt(image,181,1,MurL,MurH,Decort[112]);
  CreatSprt(image,196,1,MurL,MurH,Decort[113]);
  CreatSprt(image,211,1,MurL,MurH,Decort[114]);
  CreatSprt(image,226,1,MurL,MurH,Decort[115]);

  GetMem(Decort[200],ArbreL*ArbreH);
  GetMem(Decort[201],ArbreL*ArbreH);
  GetMem(Decort[202],ArbreL*ArbreH);
  GetMem(Decort[204],BuissL*BuissH);
  GetMem(Decort[205],BuissL*BuissH);
  GetMem(Decort[206],BuissL*BuissH);
  GetMem(Decort[207],BuissL*BuissH);
  CreatSprt(image,001,60,ArbreL,ArbreH,Decort[200]);
  CreatSprt(image,030,60,ArbreL,ArbreH,Decort[201]);
  CreatSprt(image,059,60,ArbreL,ArbreH,Decort[202]);
  CreatSprt(image,001,108,BuissL,BuissH,Decort[204]);
  CreatSprt(image,030,108,BuissL,BuissH,Decort[205]);
  CreatSprt(image,059,108,BuissL,BuissH,Decort[206]);
  CreatSprt(image,088,108,BuissL,BuissH,Decort[207]);

  GetMem(Decort[50],BuissL*BuissH);
  CreatSprt(image,117,108,BuissL,BuissH,Decort[50]);

  freemem(image,64000);
end;


procedure AffSprite(x,y,largeur,hauteur: integer; sprite: Pbyte);
assembler;
asm
  push ds
  lds si,sprite
  mov ax,0A000h
  mov es,ax
  mov ax,y
  shl ax,6
  mov bx,ax
  shl ax,2
  add ax,bx
  add ax,x
  mov di,ax
  mov bx,0140h
  sub bx,largeur
  mov dx,hauteur
 @Boucle_PutSpriteY:
  mov cx,largeur
 @Boucle_PutSpriteX:
  mov al,[SI]
  cmp al,00h
  jz @Sauter_ce_pixel
  mov es:[DI],al
 @Sauter_ce_pixel:
  inc si
  inc di
	dec cx
  jnz @Boucle_PutSpriteX
  add di,bx
  dec dx
  jnz @Boucle_PutSpriteY
  pop ds
end;


procedure ZoomSprite(Buffer: pointer; Multi,x,y,largeur,hauteur: integer; sprite: Pbyte);
assembler;
asm
  push ds
  lds si,sprite
  les di,buffer
  mov ax,0140h
  mul y
  add ax,x
  add di,ax
  mov bx,0140h
  sub bx,largeur
  mov ax,Multi
  mul bx
  mov bx,ax
  mov dx,hauteur
 @Boucle_PutSpriteY:
  mov cx,largeur
 @Boucle_PutSpriteX:
  mov al,[SI]
  cmp al,00
  jz @Sauter_ce_pixel
  push di
  push cx
  mov cx,Multi
 @Y:
  push di
  push cx
  mov cx,Multi
 @X:
  mov es:[di],al
  inc di
  loop @X
  pop  cx
  pop  di
  add di,0140h
  loop @Y
  pop  cx
  pop  di
 @Sauter_ce_pixel:
  add di,Multi
  inc si
	dec cx
  jnz @Boucle_PutSpriteX
  add di,bx
  dec dx
  jnz @Boucle_PutSpriteY
  pop ds
end;

(*
procedure ZoomSprite(Multi,x,y,largeur,hauteur: integer; sprite: Pbyte);
assembler;
asm
  push ds
  lds si,sprite
  mov ax,0A000h
  mov es,ax
  mov ax,y
  shl ax,0006h
  mov bx,ax
  shl ax,0002h
  add ax,bx
  add ax,x
  mov di,ax
  mov bx,0140h
  sub bx,largeur
  mov ax,Multi
  mul bx
  mov bx,ax
  mov dx,hauteur
 @Boucle_PutSpriteY:
  mov cx,largeur
 @Boucle_PutSpriteX:
  mov al,[si]
  cmp al,00h
  jz @Sauter_ce_pixel
  push di
  push cx
  mov cx,Multi
 @Y:
  push di
  push cx
  mov cx,Multi
 @X:
  mov es:[di],al
  inc di
  loop @X
  pop  cx
  pop  di
  add di,0140h
  loop @Y
  pop  cx
  pop  di
 @Sauter_ce_pixel:
  add di,Multi
  inc si
	dec cx
  jnz @Boucle_PutSpriteX
  add di,bx
  dec dx
  jnz @Boucle_PutSpriteY
  pop ds
end;
*)

procedure FondSprite(x1,y1,largeur,hauteur: integer; sprite: Pbyte);
assembler;
asm
	push ds
	mov  ax,0A000h
	mov  ds,ax
	les  di,sprite
	mov  ax,0140h
	mul  y1
	add  ax,x1
	mov  si,ax
	mov  bx,0140h
	sub  bx,largeur
	mov  dx,hauteur
 @BoucleHauteur:
	mov  cx,largeur
	rep  movsb
	add  si,bx
	dec  dx
	jnz @BoucleHauteur
	pop  ds
end;


procedure BoxPerso(BPx,BClr: byte);
begin
	V_LineMCGA(12+BPx*80,49,143,BClr);
	V_LineMCGA(66+BPx*80,49,143,BClr);
	H_LineMCGA(12+BPx*80,49,66+BPx*80,BClr);
	H_LineMCGA(12+BPx*80,143,66+BPx*80,BClr);
end;


procedure ChoixPerso(var Chx: Hero);
begin
(********************************   F O N D   *******************************)
	ChargePCX('fond.pcx',ImF,Pal);
	for b:=0 to 767 do
		PalTmp[b]:=0;
  SetPalette(PalTmp);
	PCX320x200(Imf);
	freemem(ImF,64000);
(***********************   S P R I T E   P L A Y E R   **********************)
	ChargePCX('4perso.pcx',ImPerso,Pal);
	GetMem(Titre,830);
  for a:=0 to 3 do begin
	  GetMem(Perso[a],4929);
	  CreatSprt(ImPerso,53*a,0,53,93,Perso[a]);
    AffSprite(13+80*a,50,53,93,Perso[a]);
  end;
	CreatSprt(ImPerso,212,0,83,10,Titre);
	AffSprite(120,20,83,10,Titre);
  FreeMem(ImPerso,64000);
(************************   S E L E C T   P L A Y E R   *********************)
  BoxPerso(0,0);
  BoxPerso(1,0);
  BoxPerso(2,0);
  BoxPerso(3,0);
  Chx:=random(4);
  BoxPerso(Chx,100);
  for a:=0 to 64 do begin
  	for b:=0 to 767 do
    	if PalTmp[b]<Pal[b] then
      	inc(PalTmp[b]);
    SetPalette(PalTmp);
    Delay(10);
  end;
	Rest:=true;
	while Rest do begin
		If keypress then begin
      delay(100);
			if Tabkey[GAUCHE] then begin
			  BoxPerso(Chx,0);
        if Chx>0 then
        	dec(Chx)
        else
        	Chx:=3;
      end
      else if TabKey[DROITE] then begin
			  BoxPerso(Chx,0);
        if Chx<3 then
					inc(Chx)
        else
        	Chx:=0;
      end
			else if TabKey[ENTER] then
				Rest:=false
			else if TabKey[ESC] then
				Rest:=false;
		  BoxPerso(Chx,100);
		end;
	end;
  ZoomSprite(EcrV,2,30,10,53,93,Perso[chx]);
  ZoomSprite(EcrV,2,175,10,53,93,Perso[(chx+1) mod 2]);
  CopieBuffer(EcrV);
  repeat until TabKey[ESC];
  FreeMem(Titre,830);
  for a:=0 to 3 do
	  FreeMem(Perso[a],4929);
end;


procedure Aff_PLY(P: Pj);
begin
  d:=5;
  c:=3;
	for a:=10 downto -10 do begin
    if a in [4..10] then
    	inc(c)
    else
    	dec(c);
    if a+4 in [0..14] then
    	dec(d)
    else
    	inc(d);
		for b:=c downto d do begin
			if ((P.POS.X+a in [1..LevelLarg]) and (P.POS.Y+b in [1..LevelHaut]) and (FLOOR1[P.POS.X+a,P.POS.Y+b]=50)) then
			  AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-14+14*a-14*b,P.CY-21-7*b-7*a,BuissL,BuissH,Decort[50])
			else if ((P.POS.X+a in [1..LevelLarg]) and (P.POS.Y+b in [1..LevelHaut]) and (FLOOR1[P.POS.X+a,P.POS.Y+b]
			   in [1..99])) then
			  AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-14+14*a-14*b,P.CY-6-7*b-7*a,SolL,SolH,
				              Decort[FLOOR1[P.POS.X+a,P.POS.Y+b]])
			else if ((P.POS.X+a in [1..LevelLarg]) and (P.POS.Y+b in [1..LevelHaut]) and (FLOOR1[P.POS.X+a,P.POS.Y+b]
			        in [100..199])) then begin
			  AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-14+14*a-14*b,P.CY-23-7*b-7*a,MurL,MurH,
											Decort[FLOOR1[P.POS.X+a,P.POS.Y+b]]);
			  AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-14+14+14*a-14*b,P.CY-23-7*b-7*a,MurL,MurH,
				              Decort[FLOOR1[P.POS.X+a,P.POS.Y+b]+1]);
			  AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-14+14*a-14*b,P.CY-30-7*b-7*a,SolL,SolH,Decort[5]);
			end
			else if ((P.POS.X+a in [1..LevelLarg]) and (P.POS.Y+b in [1..LevelHaut]) and (FLOOR1[P.POS.X+a,P.POS.Y+b]
			  in [200..202])) then begin
			  AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-14+14*a-14*b,P.CY-40-7*b-7*a,ArbreL,ArbreH,
					Decort[FLOOR1[P.POS.X+a,P.POS.Y+b]]);
			end
			else if ((P.POS.X+a in [1..LevelLarg]) and (P.POS.Y+b in [1..LevelHaut]) and (FLOOR1[P.POS.X+a,P.POS.Y+b]
				in [204..255])) then begin
			  AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-14+14*a-14*b,P.CY-21-7*b-7*a,BuissL,BuissH,
					Decort[FLOOR1[P.POS.X+a,P.POS.Y+b]]);
			end;
			if ((P.POS.X+a=PLY[1].POS.X) and (P.POS.Y+b=PLY[1].POS.Y) and (PLY[1].VIE)) then
				AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-7+14*a-14*b,P.CY-20-7*a-7*b,HeroL,HeroH,SpySprt[PLY[1].SPY,PLY[1].DIR])
			else if ((P.POS.X+a=PLY[2].POS.X) and (P.POS.Y+b=PLY[2].POS.Y) and (PLY[2].VIE)) then
				AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-7+14*a-14*b,P.CY-20-7*a-7*b,HeroL,HeroH,SpySprt[PLY[2].SPY,PLY[2].DIR])
			else if ((P.POS.X+a=PLY[3].POS.X) and (P.POS.Y+b=PLY[3].POS.Y) and (PLY[3].VIE)) then
				AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-7+14*a-14*b,P.CY-20-7*a-7*b,HeroL,HeroH,SpySprt[PLY[3].SPY,PLY[3].DIR])
			else if ((P.POS.X+a=PLY[4].POS.X) and (P.POS.Y+b=PLY[4].POS.Y) and (PLY[4].VIE)) then
				AffSprtC(P.CLPX1,P.CLPY1,P.CLPX2,P.CLPY2,EcrV,P.CX-7+14*a-14*b,P.CY-20-7*a-7*b,HeroL,HeroH,SpySprt[PLY[4].SPY,PLY[4].DIR]);
		end;
	end;
end;


procedure Plan;
begin
  EffaceBuffer(EcrV,0);
  for k:=1 to NbPLY do
	  Aff_PLY(PLY[k]);
  CopieBuffer(EcrV);
  Vsync;
end;


procedure	Move_PLY(var P: PJ);
begin
(****************** TURN LEFT *)
 	if ((TabKey[P.KYB.TurnL]) and not (TabKey[P.KYB.TurnR])) then
   	if P.DIR>0 then
     	dec(P.DIR)
    else
    	P.DIR:=7
(****************** TURN RIGHT *)
	else if ((TabKey[P.KYB.TurnR]) and not (TabKey[P.KYB.TurnL])) then
    if P.DIR<7 then
 	  	inc(P.DIR)
   	else
     	P.DIR:=0;
(****************** FRONT *)
  if ((TabKey[P.KYB.Front]) and not (TabKey[P.KYB.Back])) then begin
    if P.DIR=0 then begin
     	if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
 	  	if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
    end
  	else if P.DIR=1 then begin
     	if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X)
    end
    else if P.DIR=2 then begin
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
    end
  	else if P.DIR=3 then begin
     	if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y)
    end
    else if P.DIR=4 then begin
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
    end
    else if P.DIR=5 then begin
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
  			dec(P.POS.X)
    end
    else if P.DIR=6 then begin
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
  			inc(P.POS.Y);
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
    end
    else if P.DIR=7 then begin
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
  			inc(P.POS.Y);
    end
	end
(****************** BACK *)
	else if ((TabKey[P.KYB.Back]) and not (TabKey[P.KYB.Front])) then begin
		if P.DIR=0 then begin
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
		end
		else if P.DIR=1 then begin
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
		end
		else if P.DIR=2 then begin
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
  			inc(P.POS.Y);
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
		end
		else if P.DIR=3 then begin
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
		end
		else if P.DIR=4 then begin
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
		end
		else if P.DIR=5 then begin
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
		end
		else if P.DIR=6 then begin
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
		end
		else if P.DIR=7 then begin
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
		end;
	end;
(****************** LEFT *)
	if TabKey[P.KYB.Left] then begin
		if P.DIR=0 then begin
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
	  	if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
    end
	  else if P.DIR=1 then begin
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
	  end
	  else if P.DIR=2 then begin
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
		end
		else if P.DIR=3 then begin
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
		end
		else if P.DIR=4 then begin
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
					inc(P.POS.X);
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
		end
		else if P.DIR=5 then begin
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
		end
		else if P.DIR=6 then begin
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
		end
		else if P.DIR=7 then begin
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
					dec(P.POS.X);
		end;
	end
(****************** RIGHT *)
	else if TabKey[P.KYB.Right] then begin
		if P.DIR=0 then begin
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
    end
    else if P.DIR=1 then begin
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
		end
		else if P.DIR=2 then begin
			if ((P.POS.Y>1) and (FLOOR1[P.POS.X,P.POS.Y-1] in [0..99])) then
				dec(P.POS.Y);
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
		end
		else if P.DIR=3 then begin
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
		end
		else if P.DIR=4 then begin
			if ((P.POS.X>1) and (FLOOR1[P.POS.X-1,P.POS.Y] in [0..99])) then
				dec(P.POS.X);
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
		end
		else if P.DIR=5 then begin
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
		end
		else if P.DIR=6 then begin
			if ((P.POS.Y<LevelHaut) and (FLOOR1[P.POS.X,P.POS.Y+1] in [0..99])) then
				inc(P.POS.Y);
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
		end
		else if P.DIR=7 then begin
			if ((P.POS.X<LevelLarg) and (FLOOR1[P.POS.X+1,P.POS.Y] in [0..99])) then
				inc(P.POS.X);
		end;
	end;
(****************** FIRE *)
	if TabKey[P.KYB.Fire] then begin
    if P.DIR=0 then begin
      i:=1;
 	    while i<11 do begin
   	  	if (FLOOR1[P.POS.X+i,P.POS.Y+i] in [100..255]) then begin
          if FLOOR1[P.POS.X+i,P.POS.Y+i]=102 then
            FLOOR1[P.POS.X+i,P.POS.Y+i]:=110
          else if FLOOR1[P.POS.X+i,P.POS.Y+i] in [200,201] then
            FLOOR1[P.POS.X+i,P.POS.Y+i]:=202
          else if FLOOR1[P.POS.X+i,P.POS.Y+i] in [204,206] then
            inc(FLOOR1[P.POS.X+i,P.POS.Y+i]);
          i:=11;
        end
      	else begin
					for k:=1 to NbPLY do begin
          	if ((P.POS.X+i=PLY[k].POS.X) and (P.POS.Y+i=PLY[k].POS.Y)) then begin
		 	        FLOOR1[P.POS.X+i,P.POS.Y+i]:=15;
   			      PLY[k].VIE:=false;
     	  		  i:=11;
       			end;
          end;
        end;
       	inc(i);
      end;
    end
		else if P.DIR=1 then begin
      i:=1;
 	    while i<11 do begin
   	  	if (FLOOR1[P.POS.X+i,P.POS.Y] in [100..255]) then begin
	   	  	if FLOOR1[P.POS.X+i,P.POS.Y]=102 then
	          FLOOR1[P.POS.X+i,P.POS.Y]:=110
	   	  	else if FLOOR1[P.POS.X+i,P.POS.Y] in [200,201] then
	          FLOOR1[P.POS.X+i,P.POS.Y]:=202
	   	  	else if FLOOR1[P.POS.X+i,P.POS.Y] in [204,206] then
	          inc(FLOOR1[P.POS.X+i,P.POS.Y]);
          i:=11;
        end
      	else begin
        	for k:=1 to NbPLY do begin
						if ((P.POS.X+i=PLY[k].POS.X) and (P.POS.Y=PLY[k].POS.Y)) then begin
 	  		      FLOOR1[P.POS.X+i,P.POS.Y]:=15;
   	    		  PLY[k].VIE:=false;
		     	    i:=11;
		        end
          end;
        end;
	     	inc(i);
 	    end;
    end
    else if P.DIR=2 then begin
      i:=1;
 	    while i<11 do begin
  	  	if (FLOOR1[P.POS.X+i,P.POS.Y-i] in [100..255]) then begin
	  	  	if FLOOR1[P.POS.X+i,P.POS.Y-i]=102 then
	          FLOOR1[P.POS.X+i,P.POS.Y-i]:=110
	  	  	else if FLOOR1[P.POS.X+i,P.POS.Y-i] in [200,201] then
	          FLOOR1[P.POS.X+i,P.POS.Y-i]:=202
	  	  	else if FLOOR1[P.POS.X+i,P.POS.Y-i] in [204,206] then
	          inc(FLOOR1[P.POS.X+i,P.POS.Y-i]);
          i:=11;
        end
	      else begin
					for k:=1 to NbPLY do begin
						if ((P.POS.X+i=PLY[k].POS.X) and (P.POS.Y-i=PLY[k].POS.Y)) then begin
		          FLOOR1[P.POS.X+i,P.POS.Y-i]:=15;
    		      PLY[k].VIE:=false;
		 	        i:=11;
		   	    end;
          end;
        end;
     		inc(i);
      end;
    end
		else if P.DIR=3 then begin
   	  i:=1;
     	while i<11 do begin
	      if (FLOOR1[P.POS.X,P.POS.Y-i] in [100..255]) then begin
		      if FLOOR1[P.POS.X,P.POS.Y-i]=102 then
	          FLOOR1[P.POS.X,P.POS.Y-i]:=110
		      else if FLOOR1[P.POS.X,P.POS.Y-i] in [200,201] then
  	        FLOOR1[P.POS.X,P.POS.Y-i]:=202
		      else if FLOOR1[P.POS.X,P.POS.Y-i] in [204,206] then
  	        inc(FLOOR1[P.POS.X,P.POS.Y-i]);
          i:=11
        end
	      else begin
					for k:=1 to NbPLY do begin
						if ((P.POS.X=PLY[k].POS.X) and (P.POS.Y-i=PLY[k].POS.Y)) then begin
		   	      FLOOR1[P.POS.X,P.POS.Y-i]:=15;
    		 	    PLY[k].VIE:=false;
       			  i:=11;
            end;
	        end;
        end;
       	inc(i);
 	    end;
		end
	  else if P.DIR=4 then begin
  	  i:=1;
    	while i<11 do begin
 	    	if (FLOOR1[P.POS.X-i,P.POS.Y-i] in [100..255]) then begin
		      if FLOOR1[P.POS.X-i,P.POS.Y-i]=102 then
	          FLOOR1[P.POS.X-i,P.POS.Y-i]:=110
		      else if FLOOR1[P.POS.X-i,P.POS.Y-i] in [200,201] then
  	        FLOOR1[P.POS.X-i,P.POS.Y-i]:=202
		      else if FLOOR1[P.POS.X-i,P.POS.Y-i] in [204,206] then
  	        inc(FLOOR1[P.POS.X-i,P.POS.Y-i]);
          i:=11;
        end
      	else begin
        	for k:=1 to NbPLY do begin
						if ((P.POS.X-i=PLY[k].POS.X) and (P.POS.Y-i=PLY[k].POS.Y)) then begin
 	  		      FLOOR1[P.POS.X-i,P.POS.Y-i]:=15;
   	    		  PLY[k].VIE:=false;
		     	    i:=11;
            end;
          end;
        end;
       	inc(i);
      end;
    end
    else if P.DIR=5 then begin
      i:=1;
 	    while i<11 do begin
   	  	if (FLOOR1[P.POS.X-i,P.POS.Y] in [100..255]) then begin
		      if FLOOR1[P.POS.X-i,P.POS.Y]=102 then
	          FLOOR1[P.POS.X-i,P.POS.Y]:=110
		      else if FLOOR1[P.POS.X-i,P.POS.Y] in [200,201] then
  	        FLOOR1[P.POS.X-i,P.POS.Y]:=202
		      else if FLOOR1[P.POS.X-i,P.POS.Y] in [204,206] then
  	        inc(FLOOR1[P.POS.X-i,P.POS.Y]);
          i:=11;
        end
 	    	else begin
        	for k:=1 to NbPLY do begin
						if ((P.POS.X-i=PLY[k].POS.X) and (P.POS.Y=PLY[k].POS.Y)) then begin
		   	      FLOOR1[P.POS.X-i,P.POS.Y]:=15;
    		      PLY[k].VIE:=false;
        		  i:=11;
            end;
          end;
        end;
 	    	inc(i);
     	end;
    end
    else if P.DIR=6 then begin
 	    i:=1;
   	  while i<11 do begin
    		if (FLOOR1[P.POS.X-i,P.POS.Y+i] in [100..255]) then begin
		      if FLOOR1[P.POS.X-i,P.POS.Y+i]=102 then
	          FLOOR1[P.POS.X-i,P.POS.Y+i]:=110
		      else if FLOOR1[P.POS.X-i,P.POS.Y+i] in [200,201] then
  	        FLOOR1[P.POS.X-i,P.POS.Y+i]:=202
		      else if FLOOR1[P.POS.X-i,P.POS.Y+i] in [204,206] then
  	        inc(FLOOR1[P.POS.X-i,P.POS.Y+i]);
          i:=11;
        end
      	else begin
        	for k:=1 to NbPLY do begin
						if ((P.POS.X-i=PLY[k].POS.X) and (P.POS.Y+i=PLY[k].POS.Y)) then begin
 	  		      FLOOR1[P.POS.X-i,P.POS.Y+i]:=15;
   	    		  PLY[k].VIE:=false;
		     	    i:=11;
		      	end;
          end;
        end;
       	inc(i);
      end;
   	end
    else if P.DIR=7 then begin
      i:=1;
      while i<11 do begin
	    	if (FLOOR1[P.POS.X,P.POS.Y+i] in [100..255]) then begin
		      if FLOOR1[P.POS.X,P.POS.Y+i]=102 then
	          FLOOR1[P.POS.X,P.POS.Y+i]:=110
		      else if FLOOR1[P.POS.X,P.POS.Y+i] in [200,201] then
  	        FLOOR1[P.POS.X,P.POS.Y+i]:=202
		      else if FLOOR1[P.POS.X,P.POS.Y+i] in [204,206] then
  	        inc(FLOOR1[P.POS.X,P.POS.Y+i]);
          i:=11;
        end
      	else begin
          for k:=1 to NbPLY do begin
						if ((P.POS.X=PLY[k].POS.X) and (P.POS.Y+i=PLY[k].POS.Y)) then begin
 			        FLOOR1[P.POS.X,P.POS.Y+i]:=15;
		   	      PLY[k].VIE:=false;
    		 	    i:=11;
            end;
          end;
       	end;
       	inc(i);
      end;
		end;
	end;
end;

begin
	InitMode($13);
	InitNewKeyb;
	randomize;
  getmem(EcrV,64000);
  EffaceBuffer(EcrV,0);
	ChoixPerso(PLY[1].SPY);
	CreerImageSprite;
	getmem(Fond,HeroL*HeroH);
	for i:=1 to LevelLarg do
		for j:=1 to LevelHaut do
			FLOOR1[i,j]:=1+5*random(2);
	for a:=1 to 500 do
		FLOOR1[2+random(LevelLarg-2),2+random(LevelHaut-2)]:=8;
	for a:=1 to 100 do
		FLOOR1[2+random(LevelLarg-2),2+random(LevelHaut-2)]:=7;
	for a:=1 to 500 do
		FLOOR1[2+random(LevelLarg-2),2+random(LevelHaut-2)]:=102;
	for a:=1 to 50 do
		FLOOR1[2+random(LevelLarg-2),2+random(LevelHaut-2)]:=200;
	for a:=1 to 50 do
		FLOOR1[2+random(LevelLarg-2),2+random(LevelHaut-2)]:=201;
	for a:=1 to 50 do
		FLOOR1[2+random(LevelLarg-2),2+random(LevelHaut-2)]:=204;
	for a:=1 to 50 do
		FLOOR1[2+random(LevelLarg-2),2+random(LevelHaut-2)]:=206;
	for a:=1 to 10 do
		for b:=1 to 10 do
			FLOOR1[a,b]:=50;
(* I N I T   P L A Y E R   1 *)
  repeat
		PLY[1].POS.X:=2+random(LevelLarg-2);
		PLY[1].POS.Y:=2+random(LevelHaut-2);
  until FLOOR1[PLY[1].POS.X,PLY[1].POS.Y]<100;
	PLY[1].DIR:=random(8);
  PLY[1].VIE:=true;
  if NbPLY=2 then begin
	  PLY[1].CX:=80;	   PLY[1].CY:=100;
		PLY[1].CLPX1:=0;   PLY[1].CLPY1:=2;
		PLY[1].CLPX2:=159; PLY[1].CLPY2:=199;
  end
  else if NbPLY=4 then begin
	  PLY[1].CX:=80;	   PLY[1].CY:=50;
		PLY[1].CLPX1:=2;   PLY[1].CLPY1:=2;
		PLY[1].CLPX2:=158; PLY[1].CLPY2:=98;
  end;
	PLY[1].KYB.TurnL:=16;
	PLY[1].KYB.TurnR:=18;
	PLY[1].KYB.Front:=17;
	PLY[1].KYB.Back:=31;
	PLY[1].KYB.Left:=30;
	PLY[1].KYB.Right:=32;
	PLY[1].KYB.Fire:=58;
	PLY[1].KYB.Select:=42;
(* I N I T   P L A Y E R   2 *)
  repeat
		PLY[2].POS.X:=2+random(LevelLarg-2);
		PLY[2].POS.Y:=2+random(LevelHaut-2);
  until FLOOR1[PLY[2].POS.X,PLY[2].POS.Y]<100;
  PLY[2].SPY:=(PLY[1].SPY+1) mod 2;
	PLY[2].DIR:=random(8);
  PLY[2].VIE:=true;
  if NbPLY=2 then begin
	  PLY[2].CX:=240;	   PLY[2].CY:=100;
		PLY[2].CLPX1:=161; PLY[2].CLPY1:=2;
		PLY[2].CLPX2:=320; PLY[2].CLPY2:=199;
  end
  else if NbPLY=4 then begin
	  PLY[2].CX:=240;	   PLY[2].CY:=50;
		PLY[2].CLPX1:=162; PLY[2].CLPY1:=2;
		PLY[2].CLPX2:=318; PLY[2].CLPY2:=98;
  end;
	PLY[2].KYB.TurnL:=71;
	PLY[2].KYB.TurnR:=73;
	PLY[2].KYB.Front:=72;
	PLY[2].KYB.Back:=76;
	PLY[2].KYB.Left:=75;
	PLY[2].KYB.Right:=77;
	PLY[2].KYB.Fire:=28;
	PLY[2].KYB.Select:=54;
(* I N I T   P L A Y E R   3 *)
  repeat
		PLY[3].POS.X:=2+random(LevelLarg-2);
		PLY[3].POS.Y:=2+random(LevelHaut-2);
  until FLOOR1[PLY[3].POS.X,PLY[3].POS.Y]<100;
  PLY[3].SPY:=0;
	PLY[3].DIR:=random(8);
  PLY[3].VIE:=true;
  PLY[3].CX:=80;	   PLY[3].CY:=150;
	PLY[3].CLPX1:=2;   PLY[3].CLPY1:=102;
	PLY[3].CLPX2:=158; PLY[3].CLPY2:=198;
	PLY[3].KYB.TurnL:=25;
	PLY[3].KYB.TurnR:=27;
	PLY[3].KYB.Front:=26;
	PLY[3].KYB.Back:=40;
	PLY[3].KYB.Left:=39;
	PLY[3].KYB.Right:=43;
	PLY[3].KYB.Fire:=12;
	PLY[3].KYB.Select:=13;
(* I N I T   P L A Y E R   4 *)
  repeat
		PLY[4].POS.X:=2+random(LevelLarg-2);
		PLY[4].POS.Y:=2+random(LevelHaut-2);
  until FLOOR1[PLY[4].POS.X,PLY[4].POS.Y]<100;
  PLY[4].SPY:=1;
	PLY[4].DIR:=random(8);
  PLY[4].VIE:=true;
  PLY[4].CX:=240;	   PLY[4].CY:=150;
	PLY[4].CLPX1:=162; PLY[4].CLPY1:=102;
	PLY[4].CLPX2:=318; PLY[4].CLPY2:=198;
	PLY[4].KYB.TurnL:=20;
	PLY[4].KYB.TurnR:=22;
	PLY[4].KYB.Front:=21;
	PLY[4].KYB.Back:=35;
	PLY[4].KYB.Left:=34;
	PLY[4].KYB.Right:=36;
	PLY[4].KYB.Fire:=7;
	PLY[4].KYB.Select:=8;

	Plan;
	Rest:=true;
	while Rest do begin
		if keypress then begin
      delay(75);
			if TabKey[ESC] then
				Rest:=false;
      for k:=1 to NbPLY do
        if PLY[k].VIE then
		     	Move_PLY(PLY[k]);
      Plan;
	  end;
	end;
  for i:=0 to 3 do
  	for j:=0 to 7 do
      freemem(SpySprt[i,j],HeroL*HeroH);
  for i:=1 to 18 do
    freemem(Decort[i],SolL*SolH);
 	for i:=100 to 115 do
	  freemem(Decort[i],MurL*MurH);
  freemem(Decort[200],ArbreL*ArbreH);
  freemem(Decort[201],ArbreL*ArbreH);
  freemem(Decort[202],ArbreL*ArbreH);
  freemem(Decort[204],BuissL*BuissH);
  freemem(Decort[205],BuissL*BuissH);
  freemem(Decort[206],BuissL*BuissH);
  freemem(Decort[207],BuissL*BuissH);
  freemem(Decort[50],BuissL*BuissH);
	freemem(Fond,HeroL*HeroH);
  freemem(EcrV,64000);
  for a:=0 to 64 do begin
  	for b:=0 to 767 do
    	if Pal[b]>0 then
      	dec(Pal[b]);
    SetPalette(Pal);
    Delay(10);
  end;
	InitMode($3);
  Textcolor(8);
  writeln('-=ð SPYWAR 1.02 by ReDragoN of PHENIX CORP. 1997 ð=-');
  Textcolor(7);
  writeln('-=ð SPYWAR 1.02 by ReDragoN of PHENIX CORP. 1997 ð=-');
  Textcolor(15);
  writeln('-=ð SPYWAR 1.02 by ReDragoN of PHENIX CORP. 1997 ð=-');
	InitOldKeyb;
end.