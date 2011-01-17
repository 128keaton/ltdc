uses crt,TextAsm,_KeybAsm;
(*
  UNIT TEXTASM by ReDragoN 1997 (LARIDANP:PHE0NIX)
  -----------------------------
	{$M $4000,0,0 }
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
		Bit=0..1;
	procedure	Init_MODE ( Mode: byte );
	procedure Form_CURSOR ( DebFC,FinFC: byte );
	procedure Kill_CURSOR;
	procedure Aff_CURSOR;
	procedure Mov_CURSOR ( Num_Page,tX,tY: byte );
	procedure Select_PAGE ( Num_Page: byte );
	procedure Lire_CARAC ( Num_Page: byte; var Code,Attrib: byte );
	procedure Aff_CARAC ( Num_Page: byte; Long: Word; Code,Attrib: Byte );
	procedure Lire_MODE ( var Mode,CaracLgn,Num_Page: byte );
	procedure Aff_ECRAN ( Num_Page: byte; Ecr: Ecran; Ecr50: Bit );
	procedure Aff_TEXT ( Num_Page,tX,tY: byte; Txt: string; C_Carc,C_Fond,Clign: Byte );
	procedure Init_MOUSE ( var Driver_Mouse: boolean );
	procedure Aff_MOUSE;
	procedure Kill_MOUSE;
	procedure Coord_MOUSE ( var Bouton_Mouse,XMouse,YMouse: word );
	procedure Mov_MOUSE ( X_Mouse,Y_Mouse: word );
	procedure Vitesse_MOUSE ( Vts_X,Vts_Y: word ); { Vts_X=8 Vts_Y=16 }
	procedure Sensib_MOUSE ( Sensi_X,Sensi_Y,Accel: word );
	procedure	Aff_MENU( Num_Page,BX,BY,Larg,NbOpt,Esp:Byte;OptMenu:Menu;var Opt:Byte;FdW,TTxt,FTxt,FdB,TxtB:Byte;Ombr,T50:Bit );
	procedure	Box_TEXT ( Num_Page,BX1,BY1,BX2,BY2,TClr: Byte; BCadre,B50: Bit );
	procedure	Fond_TEXT ( Num_Page,TTxt,TFnd: byte; TBar,T50: Bit );
	function  Init_MouseDrv_Dos ( Chemin_Drv: string ): boolean;
*)
(*
  UNIT _KEYBASM by ReDragoN 1997
  ------------------------------
	{$G+}
	{$E+}
	{$F+}
	const
	  ESC=1;
	  CTRL=29;
	  ALT=56;
	  SPACE=57;
	  HAUT=72;
	  GAUCHE=75;
	  DROITE=77;
	  BAS=80;
	var
  	TabKey: array [0..127] of boolean;
	procedure NewInt$09;
	procedure InitNewKeyb;
	procedure InitOldKeyb;
	function KeyPress: boolean;
*)


const Max=500;
      Larg=75;
      Haut=45;
      NbMur=25;
      NbTrou=10;
      NbInvers=0;
      Vitesse=50;
      Joueur=2;
      TotChen=10;


type Point=record
       X,Y: word;
     end;
		 Chenille=record
		 	 Pos: array [1..Max] of Point;
       Direct: 0..3;
       Long: 1..Max;
       Valid: boolean;
       Salad: word;
     end;
     Objet=record
     	 Pos: Point;
       Etat: boolean;
     end;


var PLY: array [1..10] of Chenille;
    Chen: Chenille;
    Trou,Salade,Option: Objet;
    a,b,c,d,Choix,Devant,Droite,Gauche: byte;
    Nj,i,j,k: word;
    Tab: array [1..Larg,1..Haut] of byte;
    Direction: array [0..3] of byte;
    PasFini,Gagne,Rest: boolean;
    Ch: char;


procedure PosRandom(var RanX,RanY: word; Val: byte);
begin
	repeat
  	RanX:=1+random(Larg);
    RanY:=1+random(Haut);
  until Tab[RanX,RanY]=0;
  Tab[RanX,RanY]:=Val;
end;


procedure AffTab;
begin
  for i:=1 to TotChen do begin
	  if PLY[i].Valid then begin
		  Tab[PLY[i].Pos[PLY[i].Long+1].X,PLY[i].Pos[PLY[i].Long+1].Y]:=0;
		  Mov_CURSOR(0,PLY[i].Pos[PLY[i].Long+1].X,PLY[i].Pos[PLY[i].Long+1].Y);
	 	  Aff_CARAC(0,1,0,0);
	  end;
  end;
  for j:=1 to Haut do begin
  	for i:=1 to Larg do begin
      if Tab[i,j]=1 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,15);
      end
      else if Tab[i,j]=2 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,14);
      end
      else if Tab[i,j]=3 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,13);
      end
      else if Tab[i,j]=4 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,12);
      end
      else if Tab[i,j]=5 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,11);
      end
      else if Tab[i,j]=6 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,10);
      end
      else if Tab[i,j]=7 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,9);
      end
      else if Tab[i,j]=8 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,8);
      end
      else if Tab[i,j]=9 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,7);
      end
      else if Tab[i,j]=10 then begin
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,79,6);
      end
      else if Tab[i,j]=99 then begin (* MUR *)
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,219,1);
      end
      else if Tab[i,j]=100 then begin (* SALADES *)
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,254,2);
      end
      else if Tab[i,j]=101 then begin (* TROU NOIR *)
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,176,8);
      end
      else if Tab[i,j]=102 then begin (* INVERSEUR *)
	      Mov_CURSOR(0,i,j);
        Aff_CARAC(0,1,176,4);
      end;
    end;
  end;
end;


procedure Decal(var C: chenille; L: word);
	var Di: word;
begin
	for Di:=L+1 downto 2 do begin
  	C.Pos[Di].X:=C.Pos[Di-1].X;
  	C.Pos[Di].Y:=C.Pos[Di-1].Y;
  end;
	for Di:=L+1 to Max do begin
  	C.Pos[Di].X:=C.Pos[L+1].X;
  	C.Pos[Di].Y:=C.Pos[L+1].Y;
  end;
end;


procedure Reflech(var C: Chenille);
begin
  if C.Valid then begin
{ LAVAGE DE CERVEAU (INITIALISATION DES DIRECTIONS) }
    for i:=0 to 3 do
    	Direction[i]:=0;
{ TEST DES BLOCKS AUTOUR DE LA TETE DE CHENILLE }
    if Tab[C.Pos[1].X,C.Pos[1].Y-1] in [1..99] then begin
        inc(Direction[1]);
        inc(Direction[2]);
        inc(Direction[3]);
    end;
    if Tab[C.Pos[1].X+1,C.Pos[1].Y] in [1..99] then begin
      inc(Direction[0]);
      inc(Direction[2]);
      inc(Direction[3]);
    end;
    if Tab[C.Pos[1].X,C.Pos[1].Y+1] in [1..99] then begin
      inc(Direction[0]);
      inc(Direction[1]);
      inc(Direction[3]);
    end;
    if Tab[C.Pos[1].X-1,C.Pos[1].Y] in [1..99] then begin
      inc(Direction[0]);
      inc(Direction[1]);
      inc(Direction[2]);
    end;
{ ORIENTATION VERS LA SALADE }
    if C.Pos[1].X<Salade.Pos.X then
      Direction[1]:=Direction[1]+2
    else if C.Pos[1].X>Salade.Pos.X then
      Direction[3]:=Direction[3]+2;
    if C.Pos[1].Y<Salade.Pos.Y then
      Direction[2]:=Direction[2]+2
    else if C.Pos[1].Y>Salade.Pos.Y then
      Direction[0]:=Direction[0]+2;
{ ALEATOIRISATION VIVE LE CHAOS ! }
   	Direction[0]:=Direction[0]+random(2);
   	Direction[1]:=Direction[1]+random(2);
   	Direction[2]:=Direction[2]+random(2);
   	Direction[3]:=Direction[3]+random(2);
{ AFFAIBLIR LES CHANCES D'ALLER VERS UN MUR }
    if Tab[C.Pos[1].X,C.Pos[1].Y-1] in [1..99] then
    	Direction[0]:=0;
		if Tab[C.Pos[1].X+1,C.Pos[1].Y] in [1..99] then
    	Direction[1]:=0;
    if Tab[C.Pos[1].X,C.Pos[1].Y+1] in [1..99] then
    	Direction[2]:=0;
    if Tab[C.Pos[1].X-1,C.Pos[1].Y] in [1..99] then
    	Direction[3]:=0;
{ ORIENTER LA CHENILLE DANS LA DIRECTION LA PLUS AVANTAGEUSE }
    if ((Direction[0]>=Direction[1]) and (Direction[0]>=Direction[2]) and (Direction[0]>=Direction[3])) then
    	C.Direct:=0
    else if ((Direction[1]>=Direction[0]) and (Direction[1]>=Direction[2]) and (Direction[1]>=Direction[3])) then
    	C.Direct:=1
    else if ((Direction[2]>=Direction[0]) and (Direction[2]>=Direction[1]) and (Direction[2]>=Direction[3])) then
    	C.Direct:=2
    else if ((Direction[3]>=Direction[0]) and (Direction[3]>=Direction[1]) and (Direction[3]>=Direction[2])) then
    	C.Direct:=3;
  end;
end;


procedure MvtChen(var C: Chenille; Clr: byte);
begin
  if C.Valid then begin
    Decal(C,C.Long);
    if C.Direct=0 then
    	if C.Pos[1].Y>1 then
		  	dec(C.Pos[1].Y)
      else
      	C.Pos[1].Y:=Haut
    else if C.Direct=1 then
      if C.Pos[1].X<Larg then
        inc(C.Pos[1].X)
      else
      	C.Pos[1].X:=1
    else if C.Direct=2 then
      if C.Pos[1].Y<Haut then
        inc(C.Pos[1].Y)
      else
      	C.Pos[1].Y:=1
    else if C.Direct=3 then
    	if C.Pos[1].X>1 then
		  	dec(C.Pos[1].X)
      else
      	C.Pos[1].X:=Larg;
    if Tab[C.Pos[1].X,C.Pos[1].Y] in [1..99] then
		  C.Valid:=false
    else if Tab[C.Pos[1].X,C.Pos[1].Y]=100 then begin
		  PosRandom(Salade.Pos.X,Salade.Pos.Y,100);
      if C.Long<Max-1 then
	      C.Long:=C.Long+5*(C.Salad+1);
      inc(C.Salad);
    end
    else if Tab[C.Pos[1].X,C.Pos[1].Y]=101 then begin
		  Tab[C.Pos[1].X,C.Pos[1].Y]:=101;
		  PosRandom(C.Pos[1].X,C.Pos[1].Y,101);
		 	C.Direct:=random(4);
    end
    else if Tab[C.Pos[1].X,C.Pos[1].Y]=102 then begin
      for i:=1 to C.Long do
      	Chen.Pos[i]:=C.Pos[C.Long+1-i];
      for i:=C.Long+1 to Max do
      	Chen.Pos[i]:=C.Pos[1];
      for i:=1 to Max do
      	C.Pos[i]:=Chen.Pos[i];
      C.Direct:=(C.Direct+2) mod 4;
    end;
    for i:=1 to C.long do
		  Tab[C.Pos[i].X,C.Pos[i].Y]:=Clr;
  end;
end;


procedure InitChen( var C: Chenille);
var
	ic: 1..Max;
begin
 	PosRandom(C.Pos[1].X,C.Pos[1].Y,2);
 	for ic:=2 to Max do begin
 	 	C.Pos[ic].X:=C.Pos[1].X;
 	 	C.Pos[ic].Y:=C.Pos[1].Y;
 	end;
 	C.Direct:=random(4);
 	C.Long:=10;(*3+random(3);*)
 	C.Salad:=0;
end;


begin
  InitNewKeyb;
  textmode(259);
  Kill_CURSOR;
  randomize;
  PasFini:=true;
  while PasFini do begin
  	clrscr;
  	for i:=1 to Larg do
  		for j:=1 to Haut do
  	    Tab[i,j]:=0;
  	for i:=1 to NbMur do
  		PosRandom(j,k,99);
    for Nj:=1 to TotChen do
      InitChen(PLY[Nj]);
  	PosRandom(Salade.Pos.X,Salade.Pos.Y,100);
  	Salade.Etat:=true;G;
  	for i:=1 to NbTrou do
	  	PosRandom(j,k,101);
  	for i:=1 to NbInvers do
	  	PosRandom(j,k,102);
    for Nj:=1 to TotChen do
      PLY[Nj].Valid:=true;
  	while ((PLY[1].Valid) or (PLY[2].Valid) or (PLY[3].Valid) or (PLY[4].VAlid) or (PLY[5].VAlid) or (PLY[6].VAlid)
		        or (PLY[7].Valid) or (PLY[8].VAlid) or (PLY[9].VAlid) or (PLY[10].VAlid)) do begin
    	if KeyPress then begin

      	if TabKey[75] then
          if PLY[1].Direct>0 then
          	dec(PLY[1].Direct)
          else
          	PLY[1].Direct:=3;
      	if TabKey[77] then
          if PLY[1].Direct<3 then
          	inc(PLY[1].Direct)
          else
          	PLY[1].Direct:=0;

      	if TabKey[86] then
          if PLY[2].Direct>0 then
          	dec(PLY[2].Direct)
          else
          	PLY[2].Direct:=3;
      	if TabKey[44] then
          if PLY[2].Direct<3 then
          	inc(PLY[2].Direct)
          else
          	PLY[2].Direct:=0;

      	if TabKey[50] then
          if PLY[3].Direct>0 then
          	dec(PLY[3].Direct)
          else
          	PLY[3].Direct:=3;
      	if TabKey[51] then
          if PLY[3].Direct<3 then
          	inc(PLY[3].Direct)
          else
          	PLY[3].Direct:=0;

      	if TabKey[55] then
          if PLY[4].Direct>0 then
          	dec(PLY[4].Direct)
          else
          	PLY[4].Direct:=3;
      	if TabKey[74] then
          if PLY[4].Direct<3 then
          	inc(PLY[4].Direct)
          else
          	PLY[4].Direct:=0;

      	if TabKey[ESC] then begin
			    for Nj:=1 to TotChen do
			      PLY[Nj].Valid:=false;
 	      	PasFini:=false;
	 	    end;
      	if TabKey[SPACE] then
			    for Nj:=1 to TotChen do
			      PLY[Nj].Valid:=false;
	    end;
		  AffTab;
	    for Nj:=1+Joueur to TotChen do
				Reflech(PLY[Nj]);
	    for Nj:=1 to TotChen do
				MvtChen(PLY[Nj],Nj);
	    for Nj:=1 to TotChen do begin
        textcolor(16-Nj);
				Mov_CURSOR(0,5+(Nj-1)*5,49);
        write(PLY[Nj].Salad);
      end;
	    delay(200-Vitesse);
  	end;
    delay(1000);
  end;
  InitOldKeyb;
  Init_MODE($03);
end.