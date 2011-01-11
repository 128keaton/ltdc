UNIT TEXTASM;


(****************************************************************************)

																	INTERFACE

(****************************************************************************)


	{$M $4000,0,0 }   { 16K stack, no heap }

	uses
		CRT,DOS;

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
  procedure G;


(****************************************************************************)

																IMPLEMENTATION

(****************************************************************************)


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 10h, Fonction 00h, BIOS EGA/VGA                             *
*                                                                            *
*   Ecran: Fixer le mode video                                               *
*     Cette fonction permet de s‚lectionner et initialiser un mode video.    *
*                                                                            *
*   Entr‚e:                                                                  *
*     Mode: Mode video EGA/VGA.                                              *
*                                                                            *
*   Sortie:                                                                  *
*     Pas de sortie.                                                         *
*                                                                            *
*****************************************************************************)
	procedure	Init_MODE ( Mode: byte );
		assembler;
		asm
			mov ah,00h
			mov al,Mode
			int 10h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 10h, Fonction 01h, BIOS EGA/VGA                             *
*                                                                            *
*   Ecran: D‚finition de l'apparence du curseur                              *
*     Cette fonction permet de fixer les lignes de d‚part et de fin du       *
*	    curseur clignotant de l'‚cran. Elle est ind‚pendante de la page ‚cran  *
*	    affich‚e sur l'‚cran.                                                  *
*                                                                            *
*   Entr‚e:                                                                  *
*	    DebFC: Ligne de d‚part du curseur.                                     *
*	    FinFC: Ligne de fin du curseur.                                        *
*	    Les valeurs autoris‚es pour les lignes de depart et de fin sont 0 - 7. *
*	    Par defaut les valeurs sont DebFC: 6 et FinFC: 7.                      *
*                                                                            *
*   Sortie:                                                                  *
*     Pas de sortie.                                                         *
*                                                                            *
*****************************************************************************)
	procedure Form_CURSOR ( DebFC,FinFC: byte );
		assembler;
		asm
			mov ah,01h
			mov ch,DebFC
			mov cl,FinFC
			int 10h
		end;

{ Cas particulier de Form_Cursor qui permet de cacher le curseur }
	procedure Kill_CURSOR;
	assembler;
		asm
			mov ah,01h
			mov ch,01h
			mov cl,00h
			int 10h
		end;

{ Cas particulier de Form_Cursor qui permet de retablir la forme normal du curseur }
	procedure Aff_CURSOR;
		assembler;
		asm
			mov ah,01h
			mov ch,06h
			mov cl,07h
			int 10h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 10h, Fonction 02h, BIOS EGA/VGA                             *
*                                                                            *
*   Ecran: Positionnement du curseur                                         *
*	    Cette fonction permet de fixer le curseur, qui fixe la position de l'  *
*	    ‚cran que les fonctions BIOS pour la sortie de caractŠres doivent      *
*	    employer.                                                              *
*                                                                            *
*   Entr‚e:                                                                  *
*	    tX: Ligne de l'‚cran.                                                  *
*	    tY: Colonne de l'‚cran.                                                *
*	    Num_Page: Num‚ro de page ‚cran. Par defaut ‡a valeur est 0.            *
*                                                                            *
*   Sortie:                                                                  *
*     Pas de sortie.                                                         *
*                                                                            *
*****************************************************************************)
	procedure Mov_CURSOR ( Num_Page,tX,tY: byte );
		assembler;
		asm
			mov ah,02h
			mov bh,Num_Page
			mov dl,tX
			mov dh,tY
			int 10h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 10h, Fonction 05h, BIOS EGA/VGA                             *
*                                                                            *
*   Ecran: S‚lection de la page ‚cran actuelle                               *
*	    S‚lection de la page ‚cran actuelle, c'est-…-dire de la page ‚cran     *
*	    devant ˆtre affich‚e sur l'ecran ( seulement en mode texte ).          *
*                                                                            *
*   Entr‚e:                                                                  *
*	    Num_Page: Num‚ro de page ‚cran ( d‚pend de la taille de la m‚moire RAM *
*	    install‚e sur la carte EGA/VGA ).                                      *
*                                                                            *
*   Sortie:                                                                  *
*     Pas de sortie.                                                         *
*                                                                            *
*****************************************************************************)
	procedure Select_PAGE ( Num_Page: byte );
		assembler;
		asm
			mov ah,05h
			mov al,Num_Page
			int 10h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 10h, Fonction 08h, BIOS EGA/VGA                             *
*                                                                            *
*   Ecran: Lecture d'un caractŠre et de sa couleur                           *
*	    Cette fonction  renvoie le code ASCII du caractŠre dans la position    *
*	    actuelle du curseur ainsi que sa couleur ( son attribut ).             *
*                                                                            *
*   Entr‚e:                                                                  *
*	    Num_Page: Num‚ro de page ‚cran.                                        *
*                                                                            *
*   Sortie:                                                                  *
*	    Code: Code ASCII du caractŠre.                                         *
*	    Attrib: Couleur ( attribut ).                                          *
*                                                                            *
*****************************************************************************)
	procedure Lire_CARAC ( Num_Page: byte; var Code,Attrib: byte );
		var
			CodeTmp,AttribTmp: byte;
		begin
			asm
				mov ah,08h
				mov bh,Num_Page
				int 10h
				mov CodeTmp,al
				mov AttribTmp,ah
			end;
			Code:=CodeTmp;
			Attrib:=AttribTmp;
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 10h, Fonction 09h, BIOS EGA/VGA                             *
*                                                                            *
*   Ecran: Ecriture d'un caract‚re et d'une couleur                          *
*     Un caractŠre est ‚crit avec une couleur d‚termin‚e dans la position    *
*	    actuelle du curseur ( dans la page ‚cran sp‚cifi‚e ).                  *
*                                                                            *
*   Entr‚e:                                                                  *
*	    Num_Page: Num‚ro de page ‚cran.                                        *
*	    Long: Coefficient de r‚p‚tition.                                       *
*	    Code: Code ASCII du caractŠre.                                         *
*	    Attrib: Couleur ( attribut ).                                          *
*                                                                            *
*   Sortie:                                                                  *
*     Pas de sortie.                                                         *
*                                                                            *
*****************************************************************************)
	procedure Aff_CARAC ( Num_Page: byte; Long: Word; Code,Attrib: Byte );
		assembler;
		asm
			mov ah,09h
			mov bh,Num_Page
			mov cx,Long
			mov al,Code
			mov bl,Attrib
			int 10h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                **                                     *
*                                                                            *
*   Interruption 10h, Fonction 0Fh, BIOS EGA/VGA                             *
*                                                                            *
*   Ecran: Lecture du mode video ** **                                       *
*	    Cette fonction  renvoie le code ASCII du caractŠre dans la position    *
*	    actuelle du curseur ainsi que sa couleur ( son attribut ).             *
*                                                                            *
*   Entr‚e:                                                                  *
*	    Num_Page: Num‚ro de page ‚cran.                                        *
*                                        *          *                        *
*   Sortie:                               *    *                             *
*	    Code: Code ASCII du caractŠre.             *                           *
*	    Attrib: Couleur ( attribut ).        *                                 *
*                                            *                               *
*****************************************************************************)
	procedure Lire_MODE ( var Mode,CaracLgn,Num_Page: byte );
		var
			ModeT,CLgnT,NPagT: byte;
		begin
			asm
				mov ah,0Fh
				int 10h
				mov ModeT,al
				mov CLgnT,ah
				mov NPagT,bh
			end;
			Mode:=ModeT;
			CaracLgn:=CLgnT;
			Num_Page:=NPagT;
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE Aff_ECRAN                                                        *
*                                                                            *
*   Ecran: Affichage d'un ‚cran virtuel                                      *
*     Cette proc‚dure permet d'afficher en une seul fois un ‚cran virtuel    *
*     prealablement remplit.                                                 *
*     Ecran virtuel represente un ‚cran mode texte 80*25 ou 80*50, o– …      *
*     chaque point de coordonn‚e X,Y correspond un caractŠre et une couleur. *
*                                                                            *
*   Entr‚e:                                                                  *
*	    Num_Page: Num‚ro de page ‚cran.                                        *
*	    Ecr: Tableau de 80 colonnes sur 50 lignes representant l'‚cran virtuel.*
*	    Ecr50: Cette variable doit ˆtre … 1 pour l'affichage d'un ‚cran 80*50  *
*       ou ˆtre … 0 pour un ‚cran 80*25.                                     *
*                                                                            *
*   Sortie:                                                                  *
*     Pas de sortie.                                                         *
*                                                                            *
*                                                                            *
*   Pour le codage de l'ecran virtuel on utilise un tableau de 80 colonnes   *
*   pour 50 lignes (de type Ecran) de caractŠre et de couleur.               *
*   Le code ASCII du caractŠre devant apparˆtre en position X,Y est reng‚    *
*   dans la variable ECRAN[X,Y].CODE . De mˆme son attribut est stock‚ dans  *
*   la variable ECRAN[X,Y].ATTRIB .                                          *
*                                                                            *
*****************************************************************************)
	procedure Aff_ECRAN ( Num_Page: byte; Ecr: Ecran; Ecr50: Bit );
		var
			XAE,YAE: byte;
		begin
			if Ecr50=1 then begin
				for XAE:=0 to 79 do begin
					for YAE:=0 to 49 do begin
						Mov_CURSOR(Num_Page,XAE,YAE);
						Aff_CARAC(Num_Page,1,Ecr[XAE,YAE].Code,Ecr[XAE,YAE].Attrib);
					end;
				end;
			end
			else begin
				for XAE:=0 to 24 do begin
					for YAE:=0 to 49 do begin
						Mov_CURSOR(Num_Page,XAE,YAE);
						Aff_CARAC(Num_Page,1,Ecr[XAE,YAE].Code,Ecr[XAE,YAE].Attrib);
					end;
				end;
			end;
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE Aff_TEXT                                                         *
*                                                                            *
*   Ecran: Ecriture d'une chaine de caractŠre                                *
*     Ecriture … partir de la position actuelle du curseur d'une chaine de   *
*     caractŠre de taille constante.                                         *
*     Utilisation des Fonctions 02h et 09h de l'Interruption 10h.            *
*                                                                            *
*   Entr‚e:                                                                  *
*	    Num_Page: Num‚ro de page ‚cran.                                        *
*     tX: Position da la colonne du premier caractŠre de la chaine.          *
*     tY: Position de la ligne du premier caractŠre de la chaine.            *
*     Txt: Chaine de caractŠre dont la taille ne doit pas ˆtre variable.     *
*     C_Carac: Couleur des caractŠres.                                       *
*     C_Fond: Couleur de fond des caractŠres.                                *
*     Clign: 1 pour que le caractŠre clignote et 0 sinon.                    *
*                                                                            *
*   Sortie:                                                                  *
*     Pas de sortie.                                                         *
*                                                                            *
*****************************************************************************)
	procedure Aff_TEXT ( Num_Page,tX,tY: byte; Txt: string; C_Carc,C_Fond,Clign: Byte );
		var
			Index,Color,Tmp_X,Tmp_C: Byte;
		begin
			Color := C_Carc + C_Fond*16 + Clign*128;
			for Index:=1 to length(Txt) do begin
				Tmp_X:=tX+Index-1;
				Tmp_C:=ord(Txt[Index]);
				asm
					mov ah,02h
					mov bh,Num_Page
					mov dh,tY
					mov dl,Tmp_X
					int 10h
					mov ah,09h
					mov bh,Num_Page
					mov cx,0001h
					mov al,Tmp_C
					mov bl,Color
					int 10h
				end;
			end;
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 33h, Fonction 00h, BIOS                                     *
*                                                                            *
*   Souris: R‚initialiser le driver souris                                  *
*                                                                            *
*****************************************************************************)
	procedure Init_MOUSE ( var Driver_Mouse: boolean );
		var
			Valeur_AX: word;
		begin
			asm
				mov ax,0000h
				int 33h
				mov Valeur_AX,ax
			end;
			if Valeur_AX= 0 then
				Driver_Mouse:=false
			else
				Driver_Mouse:=true;
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 33h, Fonction 01h, BIOS                                     *
*                                                                            *
*   Souris: Afficher le curseur de la souris                                 *
*                                                                            *
*****************************************************************************)
	procedure Aff_MOUSE;
		assembler;
		asm
			mov ax,0001h
			int 33h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 33h, Fonction 02h, BIOS                                     *
*                                                                            *
*   Souris: Masquer le curseur de la souris                                  *
*                                                                            *
*****************************************************************************)
	procedure Kill_MOUSE;
		assembler;
		asm
			mov ax,0002h
			int 33h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 33h, Fonction 03h, BIOS                                     *
*                                                                            *
*   Souris: Lire la position du curseur et l'‚tat des boutons                *
*                                                                            *
*****************************************************************************)
	procedure Coord_MOUSE ( var Bouton_Mouse,XMouse,YMouse: word );
		var
			Etat_Bouton,Coord_X,Coord_Y: word;
		begin
			asm
				mov ax,0003h
				int 33h
				mov Etat_Bouton,bx
				mov Coord_X,cx
				mov Coord_Y,dx
			end;
			Bouton_Mouse:=Etat_Bouton;
			XMouse:=Coord_X;
			YMouse:=Coord_Y;
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 33h, Fonction 04h, BIOS                                     *
*                                                                            *
*   Souris: D‚placer le curseur de la souris                                 *
*                                                                            *
*****************************************************************************)
	procedure Mov_MOUSE ( X_Mouse,Y_Mouse: word );
		assembler;
		asm
			mov ax,0004h
			mov cx,X_Mouse
			mov dx,Y_Mouse
			int 33h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 33h, Fonction 0Fh, BIOS                                     *
*                                                                            *
*   Souris: D‚finir la vitesse du curseur                                    *
*                                                                            *
*****************************************************************************)
	procedure Vitesse_MOUSE ( Vts_X,Vts_Y: word ); { Vts_X=8 Vts_Y=16 }
		assembler;
		asm
			mov ax,000Fh
			mov cx,Vts_X
			mov dx,Vts_Y
			int 33h
		end;


(*****************************************************************************
*                                                                            *
* PROCEDURE ASSEMBLEUR                                                       *
*                                                                            *
*   Interruption 33h, Fonction 1Ah, BIOS                                     *
*                                                                            *
*   Souris: R‚gler la sensibilit‚ de la souris                               *
*                                                                            *
*****************************************************************************)
	procedure Sensib_MOUSE ( Sensi_X,Sensi_Y,Accel: word );
		assembler;
		asm
			mov ax,001Ah
			mov bx,Sensi_X
			mov cx,Sensi_Y
			mov dx,Accel
			int 33h
		end;


	procedure	Aff_MENU(Num_Page,BX,BY,Larg,NbOpt,Esp:Byte;OptMenu:Menu;var Opt:Byte;FdW,TTxt,FTxt,FdB,TxtB:Byte;Ombr,T50:Bit);
		var
			BTM,AF1,AF2,AF3,AF4,BI,ASMChar,Sor_Menu,Sor_Menu2,Tmp: Byte;
			Index: integer;
			T_Mn: Char;
			Bt_Mouse,X_Mouse,Y_Mouse: Word;
		begin
			Kill_MOUSE;
			for BI:=BY to BY+2+Esp*(NbOpt-1) do	begin
				Mov_Cursor(Num_Page,BX,BI);
				Aff_Carac(Num_Page,Larg,0,TTxt+FdW*16);
			end;
			if Ombr=1 then begin
				if T50=1 then begin
					for BI:=BY+1 to BY+3+Esp*(NbOpt-1) do begin
						Mov_Cursor(Num_Page,BX+Larg,BI);
						Lire_CARAC(Num_Page,ASMChar,Tmp);
						Aff_Carac(Num_Page,1,ASMChar,8);
					end;
					for BI:=BX+1 to BX+Larg do begin
						Mov_Cursor(Num_Page,BI,BY+3+Esp*(NbOpt-1));
						Lire_CARAC(Num_Page,ASMChar,Tmp);
						Aff_Carac(Num_Page,1,ASMChar,8);
					end;
				end
				else begin
					for BI:=BY+1 to BY+3+Esp*(NbOpt-1) do begin
						Mov_Cursor(Num_Page,BX+Larg,BI);
						Lire_CARAC(Num_Page,ASMChar,Tmp);
						Aff_Carac(Num_Page,1,ASMCHar,8);
						Mov_Cursor(Num_Page,BX+Larg+1,BI);
						Lire_CARAC(Num_Page,ASMChar,Tmp);
						Aff_Carac(Num_Page,1,ASMCHar,8);
					end;
					for BI:=BX+1 to BX+Larg do begin
						Mov_Cursor(Num_Page,BI,BY+3+Esp*(NbOpt-1));
						Lire_CARAC(Num_Page,ASMChar,Tmp);
						Aff_Carac(Num_Page,1,ASMChar,8);
					end;
				end
			end;
			for Index:=1 to NbOpt do begin
				if OptMenu[index].Valid then
					Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Index].Texte)+1) div 2),By+1+(Index-1)*Esp,OptMenu[Index].Texte,TTxt,FdW,0)
				else
					Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Index].Texte)+1) div 2),By+1+(Index-1)*Esp,OptMenu[Index].Texte,FTxt,FdW,0);
			end;
			Aff_MOUSE;
			Index:=1;
			Sor_Menu2:=1;
			while ((Sor_Menu2>0) and (Index<NbOpt)) do begin
				if OptMenu[Index].Valid then begin
					Opt:=Index;
					Sor_Menu2:=0;
				end
				else
					inc(Index);
			end;
			Mov_Cursor(Num_Page,BX+1,By+1+(Opt-1)*Esp);
			Aff_Carac(Num_Page,Larg-2,0,TxtB+FdB*16);
			Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,TxtB,FdB,0);
			Sor_Menu:=1;
			BTM:=0;
			while (Sor_Menu>0) do begin
				Coord_MOUSE (Bt_Mouse,X_Mouse,Y_Mouse);
				X_Mouse:=X_Mouse div 8;
				Y_Mouse:=Y_Mouse div 8;
				if ((X_Mouse in [BX..BX+Larg]) and (Y_Mouse in [BY..BY+2+Esp*(NbOpt)])) then begin
					Tmp:=Y_Mouse-BY+Esp-1;
					if ((Tmp div Esp in [1..NbOpt])) then begin
						if ((Tmp mod Esp=0) and (OptMenu[Tmp div Esp].Valid) and (Tmp div Esp <>Opt)) then begin
							Kill_MOUSE;
							Mov_Cursor(Num_Page,BX+1,By+1+(Opt-1)*Esp);
							Aff_Carac(Num_Page,Larg-2,0,TTxt+16*FdW);
							if OptMenu[Opt].Valid then
								Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,TTxt,FdW,0)
							else
								Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,FTxt,FdW,0);
							Opt:=Tmp div Esp;
							Mov_Cursor(Num_Page,BX+1,By+1+(Opt-1)*Esp);
							Aff_Carac(Num_Page,Larg-2,0,TxtB+FdB*16);
							Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,TxtB,FdB,0);
							Aff_MOUSE;
						end;
					end;
				end;
				if ((Bt_Mouse=1) or (Bt_Mouse=2)) then
					BTM:=1
				else
					if BTM=1 then
						Sor_Menu:=0;
				if keypressed then begin
					T_Mn:=ReadKey;
					if T_Mn=chr(27) then begin
						for AF1:=0 to 80 do begin
							for AF2:=0 to 50 do begin
								Mov_CURSOR(0,AF1,AF2);
								Lire_CARAC(0,AF3,AF4);
								Aff_CARAC(0,1,AF3,8);
							end;
						end;
						Halt;
					end
					else if T_Mn=Chr(80) then begin
						if Opt<NbOpt then begin
							Index:=Opt;
							Sor_Menu2:=1;
							while((Sor_Menu2>0)and(Index<NbOpt)) do begin
								inc(Index);
								if OptMenu[Index].Valid then begin
									Mov_Cursor(Num_Page,BX+1,By+1+(Opt-1)*Esp);
									Aff_Carac(Num_Page,Larg-2,0,TTxt+16*FdW);
									if OptMenu[Opt].Valid then
										Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,TTxt,FdW,0)
									else
										Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,FTxt,FdW,0);
									Opt:=Index;
									Sor_Menu2:=0;
								end;
							end;
						end;
					end
					else if T_Mn=Chr(72) then begin
						if Opt>1 then begin
							Index:=Opt;
							Sor_Menu2:=1;
							while((Sor_Menu2>0)and(Index>1)) do begin
								dec(Index);
								if OptMenu[Index].Valid then begin
									Mov_Cursor(Num_Page,BX+1,By+1+(Opt-1)*Esp);
									Aff_Carac(Num_Page,Larg-2,0,TTxt+16*FdW);
									if OptMenu[Opt].Valid then
										Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,TTxt,FdW,0)
									else
										Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,FTxt,FdW,0);
									Opt:=Index;
									Sor_Menu2:=0;
								end;
							end;
						end;
					end
					else if T_Mn=Chr(13) then
						Sor_Menu:=0;
					Mov_Cursor(Num_Page,BX+1,By+1+(Opt-1)*Esp);
					Aff_Carac(Num_Page,Larg-2,0,TxtB+FdB*16);
					Aff_Text(Num_Page,BX+((Larg-Length(OptMenu[Opt].Texte)+1) div 2),By+1+(Opt-1)*Esp,OptMenu[Opt].Texte,TxtB,FdB,0);
				end;
			end;
		end;


	procedure	Box_TEXT ( Num_Page,BX1,BY1,BX2,BY2,TClr: Byte; BCadre,B50: Bit );
		var
			ASMChar,BI,Tmp: Byte;
		begin
			Kill_MOUSE;
			for BI:=BY1 to BY2 do	begin
				Mov_Cursor(Num_Page,BX1,BI);
				Aff_Carac(Num_Page,BX2-BX1+1,0,TClr*16);
			end;
			if BCadre=1 then begin
				Mov_Cursor(Num_Page,BX1,BY1);
				Aff_Carac(Num_Page,1,201,15+TClr*16);
				Mov_Cursor(Num_Page,BX1,BY2);
				Aff_Carac(Num_Page,1,200,15+TClr*16);
				Mov_Cursor(Num_Page,BX2,BY1);
				Aff_Carac(Num_Page,1,187,15+TClr*16);
				Mov_Cursor(Num_Page,BX2,BY2);
				Aff_Carac(Num_Page,1,188,15+TClr*16);
				Mov_Cursor(Num_Page,BX1+1,BY1);
				Aff_Carac(Num_Page,BX2-BX1-1,205,15+TClr*16);
				Mov_Cursor(Num_Page,BX1+1,BY2);
				Aff_Carac(Num_Page,BX2-BX1-1,205,15+TClr*16);
				for BI:=BY1+1 to BY2-1 do	begin
					Mov_Cursor(Num_Page,BX1,BI);
					Aff_Carac(Num_Page,1,186,15+TClr*16);
					Mov_Cursor(Num_Page,BX2,BI);
					Aff_Carac(Num_Page,1,186,15+TClr*16);
				end;
			end;
			if B50=1 then begin
				for BI:=BY1+1 to BY2+1 do begin
					Mov_Cursor(Num_Page,BX2+1,BI);
					Lire_CARAC(Num_Page,ASMChar,Tmp);
					Aff_Carac(Num_Page,1,ASMCHar,8);
				end;
				for BI:=BX1+1 to BX2 do begin
					Mov_Cursor(Num_Page,BI,BY2+1);
					Lire_CARAC(Num_Page,ASMChar,Tmp);
					Aff_Carac(Num_Page,1,ASMChar,8);
				end;
			end
			else begin
				for BI:=BY1+1 to BY2+1 do begin
					Mov_Cursor(Num_Page,BX2+1,BI);
					Lire_CARAC(Num_Page,ASMChar,Tmp);
					Aff_Carac(Num_Page,1,ASMCHar,8);
					Mov_Cursor(Num_Page,BX2+2,BI);
					Lire_CARAC(Num_Page,ASMChar,Tmp);
					Aff_Carac(Num_Page,1,ASMCHar,8);
				end;
				for BI:=BX1+2 to BX2 do begin
					Mov_Cursor(Num_Page,BI,BY2+1);
					Lire_CARAC(Num_Page,ASMChar,Tmp);
					Aff_Carac(Num_Page,1,ASMChar,8);
				end;
			end;
			Aff_MOUSE;
		end;


	procedure	Fond_TEXT ( Num_Page,TTxt,TFnd: byte; TBar,T50: Bit );
		var
			BI: Byte;
		begin
			Kill_Mouse;
			if T50=1 then begin
				for BI:=0 to 49 do	begin
					Mov_Cursor(Num_Page,0,BI);
					Aff_Carac(Num_Page,80,177,TTxt+16*TFnd);
				end;
				if TBar=1 then begin
					for BI:=0 to 1 do	begin
						Mov_Cursor(Num_Page,0,BI*49);
						Aff_Carac(Num_Page,80,0,TFnd*16);
					end;
				end;
			end
			else begin
				for BI:=0 to 24 do	begin
					Mov_Cursor(Num_Page,0,BI);
					Aff_Carac(Num_Page,80,177,TTxt+16*TFnd);
				end;
				if TBar=1 then begin
					for BI:=0 to 1 do	begin
						Mov_Cursor(Num_Page,0,BI*24);
						Aff_Carac(Num_Page,80,0,TFnd*16);
					end;
				end;
			end;
			Aff_Mouse;
		end;


	function Init_MouseDrv_Dos ( Chemin_Drv: string ): boolean;
		begin
			swapvectors;
			exec(Chemin_Drv,'');
			swapvectors;
			if doserror <> 0 then
				Init_MouseDrv_Dos:=false
			else
				Init_MouseDrv_Dos:=true;
		end;


  procedure G;
  begin
	  Aff_TEXT(0,1,0,'e rago',4,0,1);
	  Mov_CURSOR(0,0,0);
	  Aff_CARAC(0,1,82,12+1*128);
	  Mov_CURSOR(0,2,0);
	  Aff_CARAC(0,1,68,12+1*128);
	  Mov_CURSOR(0,7,0);
	  Aff_CARAC(0,1,78,12+1*128);
  end;
end.