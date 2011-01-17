uses crt,TextAsm,GraphAsm;
(*
 T E X T A S M
	type
		Option=
			record
				Texte: string[80];
				Valid: boolean;
			end;
		Menu= array[1..100] of Option;
		Carac=
			record
				Code: byte;
				Attrib: byte;
			end;
		Ecran= array[0..79, 0..49] of Carac;
		Bit= 0..1;
	procedure	Init_MODE( Mode: byte );
	procedure Form_CURSOR( DebFC,FinFC: byte );
	procedure Kill_CURSOR;
	procedure Aff_CURSOR;
	procedure Mov_CURSOR( Num_Page,tX,tY: byte );
	procedure Select_PAGE( Num_Page: byte );
	procedure Lire_CARAC( Num_Page: byte; var Code,Attrib: byte );
	procedure Aff_CARAC( Num_Page: byte; Long: Word; Code,Attrib: Byte );
	procedure Lire_MODE( var Mode,CaracLgn,Num_Page: byte );
	procedure Aff_ECRAN( Num_Page: byte; Ecr: Ecran; Ecr50: Bit );
	procedure Aff_TEXT( Num_Page,tX,tY: byte; Txt: string; C_Carc,C_Fond,Clign: Byte );
	procedure Init_MOUSE( var Driver_Mouse: boolean );
	procedure Aff_MOUSE;
	procedure Kill_MOUSE;
	procedure Coord_MOUSE( var Bouton_Mouse,XMouse,YMouse: word );
	procedure Mov_MOUSE( X_Mouse,Y_Mouse: word );
	procedure Vitesse_MOUSE( Vts_X,Vts_Y: word ); { Vts_X=8 Vts_Y=16 }
	procedure Sensib_MOUSE( Sensi_X,Sensi_Y,Accel: word );
	procedure	Aff_MENU( Num_Page,BX,BY,Larg,NbOpt,Esp:Byte;OptMenu:Menu;var Opt:Byte;FdW,TTxt,FTxt,FdB,TxtB:Byte;Ombr,T50:Bit );
	procedure	Box_TEXT( Num_Page,BX1,BY1,BX2,BY2,TClr: Byte; BCadre,B50: Bit );
	procedure	Fond_TEXT( Num_Page,TTxt,TFnd: byte; TBar,T50: Bit );
	function  Init_MouseDrv_Dos( Chemin_Drv: string ): boolean;
*)
(*
 G R A P H A S M
	type
		Pbyte= ^byte;   { TSprite = pointeur sur le type octet }
		TPalette= array [0..767] of byte; { type palette de couleur }
		PtMCGA= record
		  X,Y: integer;
	  end;
	procedure ClsMCGA(couleur: byte);
	procedure DetectVESA(var segm,offs: word; var Vesa: boolean);
	procedure InitMode(mode: byte);
	procedure InitModeVESA(mode: word);
	procedure EffaceBuffer(buffer: pointer; couleur: byte);
	procedure CopieBuffer(buffer: pointer);
	procedure VSync;
	procedure Pxl(PxX,PxY:word; clr:byte);
	procedure PixelMCGA(Pxx,Pxy:word; clr:byte);
	procedure H_LineMCGA(HP1_X,HP1_Y,HP2_X:word; Clr:byte);
	procedure V_LineMCGA(HP1_X,HP1_Y,HP2_Y:word; Clr:byte);
	procedure LineMCGA(P1X,P1Y,P2X,P2Y:integer; Color:byte);
	procedure PixelVESA(PxX,PxY:word; clr:byte);
	procedure SetPalette(Colors: TPalette);
	procedure SetColor(index,r,g,b: byte);
	procedure ChargePCX(nomfichier: string; var destination: Pbyte; var Palette: TPalette);
	procedure SetClipZone(x1,y1,x2,y2: integer);
	procedure PutSprite(Buffer: pointer; x,y,largeur,hauteur: integer; sprite: Pbyte);
	procedure PutSpriteClip(Buffer: pointer; x,y,largeur,hauteur: integer; sprite: Pbyte);
	procedure GetSprite(source: Pbyte; x1,y1,largeur,hauteur: integer; sprite: Pbyte);
*)
var
	Chaine: string;
  Ok: boolean;
  i,j,k: byte;
  a,b,c: integer;
  x,y,z: real;

procedure	TestUn(S: string; var Suite: boolean);
begin
  Mov_CURSOR(0,5,4);
  Aff_CARAC(0,20,219,14+1*16);
  if ((S[1]='(') and (S[length(S)]=')')) then begin
	  Aff_TEXT(0,30,4,'TEST 1 REUSSIT',15,1,0);
    Suite:=true;
  end
  else begin
	  Aff_TEXT(0,30,4,'TEST 1 RATE',15,1,0);
    Suite:=false;
  end;
end;

procedure	TestDeux(S: string; var Suite: boolean);
var
	NbOuvre,NbFerme: integer;
begin
  NbOuvre:=0;
  NbFerme:=0;
  for i:=1 to length(S) do begin
  	if S[i]='(' then
    	inc(NbOuvre)
    else if S[i]=')' then
    	inc(NbFerme);
    for j:=1 to i do begin
      Mov_CURSOR(0,5,6);
      Aff_CARAC(0,(j*20 div length(S)),219,14+1*16);
    end;
    delay(10);
  end;
  if NbOuvre=NbFerme then begin
	  Aff_TEXT(0,30,6,'TEST 2 REUSSIT',15,1,0);
    Suite:=true;
  end
  else begin
	  Aff_TEXT(0,30,6,'TEST 2 RATE',15,1,0);
    Suite:=false;
  end;
end;

procedure	TestTrois(S: string; var Suite: boolean);
begin
  Suite:=true;
  for i:=1 to length(S) do begin
    if (( not (S[i] in ['0'..'9'])) and ( not (S[i] in ['+','-','*','/','(',')']))) then
    	Suite:=false;
    for j:=1 to i do begin
      Mov_CURSOR(0,5,8);
      Aff_CARAC(0,(j*20 div length(S)),219,14+1*16);
    end;
    delay(10);
  end;
  if Suite then begin
	  Aff_TEXT(0,30,8,'TEST 3 REUSSIT',15,1,0);
    Suite:=true;
  end
  else begin
	  Aff_TEXT(0,30,8,'TEST 3 RATE',15,1,0);
    Suite:=false;
  end;
end;

procedure	TestQuatre(S: string; var Suite: boolean; var MaxProf: integer);
var
	Prof: integer;
begin
  Prof:=0;
  MaxProf:=0;
  Suite:=true;
  for i:=1 to length(S) do begin
  	if S[i]='(' then
    	inc(Prof)
    else if S[i]=')' then
    	dec(Prof);
    for j:=1 to i do begin
      Mov_CURSOR(0,5,10);
      Aff_CARAC(0,(j*20 div length(S)),219,14+1*16);
    end;
    delay(10);
    if Prof>MaxProf then
    	inc(Maxprof);
    if ((Prof=0) and (i<>length(S))) then
			Suite:=false
  end;
  if Suite then begin
	  Aff_TEXT(0,30,10,'TEST 4 REUSSIT',15,1,0);
    Suite:=true;
  end
  else begin
	  Aff_TEXT(0,30,10,'TEST 4 RATE',15,1,0);
    Suite:=false;
  end;
end;







begin
  textbackground(1);
	clrscr;
  Aff_TEXT(0,10,2,'ENTREZ LA CHAINE A ANALYSER:',15,1,0);
  Mov_CURSOR(0,39,2);
  readln(Chaine);
  TestUn(Chaine,Ok);
  TestDeux(Chaine,Ok);
  TestTrois(Chaine,Ok);
  TestQuatre(Chaine,Ok,a);
  Kill_CURSOR;
  readkey;
end.