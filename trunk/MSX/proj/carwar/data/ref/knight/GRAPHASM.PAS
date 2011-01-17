unit GraphASM;

{$G+}

(****************************************************************************)
																	 INTERFACE
(****************************************************************************)

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


(****************************************************************************)
                                 IMPLEMENTATION
(****************************************************************************)


(***************************************************** ROUTINES DE BASE VGA *)
var
  ClipX1,ClipY1,ClipX2,ClipY2:integer;


procedure ClsMCGA(couleur: byte);
assembler;
asm
  mov ax, 0a000h
  mov es, ax
	xor di, di
	mov cx, 32000
	mov al, couleur
	mov ah, al
	rep stosw
end;


procedure DetectVESA(var segm,offs: word; var Vesa: boolean);
var
	Tseg,Toff: word;
	Tah: byte;
begin
	asm
		mov al,00h
		mov ah,4Fh
		int 10h
		mov Tseg,es
		mov Toff,di
		mov Tah,ah
	end;
	segm:=Tseg;
	offs:=Toff;
	Vesa:=(Tah=0);
end;


procedure InitMode(mode: byte);
assembler;
asm
	mov al,mode
	mov ah,00h
	int 10h
end;


procedure InitModeVESA(mode: word);
assembler;
asm
	mov bx, mode
	mov al, 02h
	mov ah, 4Fh
	int 10h
end;


procedure EffaceBuffer(buffer: pointer; couleur: byte);
assembler;
asm
  les di, buffer
  mov cx, 16000
  db $66, $33,$DB
  mov bl, couleur
  mov bh, bl
	mov ax, bx
  db $66, $C1, $E0, $10
  db $66, $03, $C3
  db $F3, $66, $AB
end;


procedure CopieBuffer(buffer: pointer);
assembler;
asm
  push ds
  lds si, buffer
  mov ax, 0A000h
  mov es, ax
  xor di, di
  mov cx, 16000
  db $66, $F3, $A5
  pop ds
end;


procedure VSync;
assembler;
asm
  @Sync_Boucle1:
    mov DX, 3dah
    in AL, DX
    test AL, 8
    jne @Sync_Boucle1
  @Sync_Boucle2:
    in AL, DX
    test AL, 8
    jz @Sync_Boucle2
end;


procedure Pxl(PxX,PxY:word; clr:byte);
assembler;
asm
	mov ax,0A000h
  mov es,ax
	mov ax,PxY
  shl ax,6
  mov bx,ax
  shl ax,2
  add ax,bx
	add ax,PxX
  mov di,ax
  mov al,clr
 	mov es:[DI], al
end;


procedure PixelMCGA(PxX,PxY:word; clr:byte);
begin
  if ((PxX>=0) and (PxX<319) and (PxY in [0..199])) then
		asm
			mov ax,0A000h
  		mov es,ax
			mov ax,PxY
		  shl ax,6
		  mov bx,ax
		  shl ax,2
		  add ax,bx
			add ax,PxX
 		  mov di,ax
		  mov al,clr
 			mov es:[DI], al
		end;
end;


procedure H_LineMCGA(HP1_X,HP1_Y,HP2_X:word; Clr:byte);
var
	Long: word;
begin
  if ((HP1_X>=0) and (HP2_X<320) and (HP1_Y in [0..199])) then begin
	  Long:=HP2_X-HP1_X+1;
	 	asm
			mov ax,0A000h
	    mov es,ax
			mov ax,HP1_Y
	    shl ax,6
	    mov bx,ax
	    shl ax,2
	    add ax,bx
		 	add ax,HP1_X
	    mov bx,Long
		  mov di,ax
	  @X_Loop:
		  mov al,clr
		 	mov es:[DI], al
  	  inc di
  	  dec bx
  	  jnz @X_Loop
    end;
	end;
end;


procedure V_LineMCGA(HP1_X,HP1_Y,HP2_Y:word; Clr:byte);
var
	Long: word;
begin
  if ((HP1_Y>=0) and (HP2_Y<200) and (HP1_X>=0) and (HP1_X<320)) then begin
	  Long:=HP2_Y-HP1_Y+1;
	 	asm
			mov ax,0A000h
	    mov es,ax
			mov ax,HP1_Y
	    shl ax,6
	    mov bx,ax
	    shl ax,2
	    add ax,bx
		 	add ax,HP1_X
	    mov bx,Long
		  mov di,ax
	  @Y_Loop:
		  mov al,clr
		 	mov es:[DI], al
	    add di,0140h
	    dec bx
	    jnz @Y_Loop
	  end;
  end;
end;


procedure LineMCGA(P1X,P1Y,P2X,P2Y:integer; Color:byte);
var
	PtX,PtY: word;
  Dlt,PtRX,PtRY: real;
begin
  if P1X=P2X then begin
    if P1Y>P2Y then begin
    	PtX:=P1X;
      PtY:=P1Y;
    	P1X:=P2X;
      P1Y:=P2Y;
    	P2X:=PtX;
      P2Y:=PtY;
    end;
	  PtY:=P2Y-P1Y+1;
	 	asm
			mov ax,0A000h
	    mov es,ax
			mov ax,P1Y
	    shl ax,6
	    mov bx,ax
	    shl ax,2
	    add ax,bx
		 	add ax,P1X
	    mov bx,PtY
		  mov di,ax
	  @Y_Loop:
		  mov al,color
		 	mov es:[DI], al
	    add di,0140h
	    dec bx
	    jnz @Y_Loop
	  end;
  end
  else if P1X>P2X then begin
   	PtX:=P1X;
    PtY:=P1Y;
   	P1X:=P2X;
    P1Y:=P2Y;
   	P2X:=PtX;
    P2Y:=PtY;
  end;
  if P1Y=P2Y then begin
	  PtX:=P2X-P1X+1;
	 	asm
			mov ax,0A000h
	    mov es,ax
			mov ax,P1Y
	    shl ax,6
	    mov bx,ax
	    shl ax,2
	    add ax,bx
		 	add ax,P1X
	    mov bx,PtX
		  mov di,ax
	  @X_Loop:
		  mov al,color
		 	mov es:[DI], al
  	  inc di
  	  dec bx
  	  jnz @X_Loop
    end;
  end
  else if P1Y<P2Y then
  	Dlt:=((P2Y-P1Y+1)/(P2X-P1X+1))
  else
  	Dlt:=((P2Y-P1Y-1)/(P2X-P1X+1));
  if ((Dlt>-1) and (Dlt<1)) then begin
	  PtRY:=P1Y;
	  for PtX:=P1X to P2X do begin
	    PixelMCGA(PtX,trunc(PtRY),color);
	    PtRY:=PtRY+Dlt;
    end;
  end
  else if Dlt<-1 then begin
    Dlt:=1/Dlt;
	  PtRX:=P1X;
	  for PtY:=P1Y downto P2Y do begin
	    PixelMCGA(trunc(PtRX),PtY,color);
	    PtRX:=PtRX+Dlt;
    end;
  end
  else begin
    Dlt:=1/Dlt;
	  PtRX:=P1X;
	  for PtY:=P1Y to P2Y do begin
	    PixelMCGA(trunc(PtRX),PtY,color);
	    PtRX:=PtRX+Dlt;
    end;
  end;
end;


procedure PixelVESA(PxX,PxY:word; clr:byte);
begin
  if ((PxX>=0) and (PxY<640) and (PxY>=0) and (PxY<480)) then begin
  	asm
		  mov ax, 0A000h
		  mov es, ax
		  mov ax, 640
		  mul PxY
		 	add ax, PxX
		  mov di, ax
		  mov al, clr
		 	mov es:[DI], al
		end;
  end;
end;


(********************************************************** ROUTINE PALETTE *)
procedure SetPalette(Colors:TPalette);
assembler;
asm
	  les di,colors
	  mov cx,0
	@colorLoop:
	  mov dx,$3c8
	  mov al,cl
	  out dx,al
	  mov dx,$3c9
	  mov al,es:[di]
	  out dx,al
	  inc di
	  mov al,es:[di]
	  out dx,al
	  inc di
	  mov al,es:[di]
	  out dx,al
	  inc di
	  inc cx
	  cmp cx,256
	  jne @ColorLoop
end;


procedure SetColor(index,r,g,b:byte);
assembler;
asm
  mov dx, $3c8
  mov al, index
  out dx, al
  mov dx, $3c9
  mov al, r
  out dx, al
  mov al, g
  out dx, al
  mov al, b
  out dx, al
end;


(************************************************************** ROUTINE PCX *)
procedure ChargePCX(nomfichier: string; var destination:Pbyte; var Palette:TPalette);
var
  f: file of byte;
  octet: byte;
  count: longint;
  repetition: byte;
  ptr: PByte;
  i: integer;
begin
  Getmem(destination,64000);
  assign(f,nomfichier);
  reset(f);
  seek(f,128);
  ptr:=destination;
  count:=0;
  while(count<320*200) do begin
    read(f,octet);
    if(octet>$C0) then begin
      repetition:=octet-$C0;
      read(f,octet);
      for i:=1 to repetition do begin
        ptr^:=octet;
        inc(ptr);
        inc(count);
      end;
    end
		else begin
      ptr^:=octet;
      inc(ptr);
      inc(count);
    end;
  end;
  read(f,octet);
  for i:=0 to 767 do begin
    read(f,octet);
    Palette[i]:=(octet SHR 2);
  end;
  close(f);
end;


(****************************************** ROUTINES DE GESTION DES SPRITES *)
procedure SetClipZone(x1,y1,x2,y2 : integer);
begin
  ClipX1:=x1;
  ClipY1:=y1;
  ClipX2:=x2;
  ClipY2:=y2;
end;


procedure PutSprite(Buffer: pointer; x,y,largeur,hauteur: integer; sprite: Pbyte);
assembler;
asm
  push ds
  lds si,sprite
  les di,buffer
  mov ax,320
  mul y
  add ax,x
  add di,ax
  mov bx,320
  sub bx,largeur
  mov dx,hauteur
 @Boucle_PutSpriteY:
  mov cx,largeur
 @Boucle_PutSpriteX:
  mov al,[SI]
  cmp al,0
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


procedure PutSpriteClip(Buffer: pointer; x,y,largeur,hauteur: integer; sprite: Pbyte);
var
  deltaX1,deltaX2,deltaY1,deltaY2: integer;
  ancienne_largeur: integer;
begin
	asm
	  mov bx, largeur
	  mov ancienne_largeur, bx
	  mov ax, x
	  add bx, ax
	  mov cx, y
	  mov dx, cx
	  add dx, hauteur
	  cmp ax, ClipX2
	  jg @fin
	  cmp bx, ClipX1
	  jl @fin
	  cmp cx, ClipY2
	  jg @fin
	  cmp dx, ClipY1
	  jl @fin
	  xor si,si
	  mov deltaX1, si
	  mov deltaX2, si
	  mov deltaY1, si
	  mov deltaY2, si
	  cmp ax, ClipX1
	  jge @suite1
	  mov si, ClipX1
	  mov x, si
	  sub si, ax
	  mov DeltaX1, si
	  sub largeur, si
	  mov ax, x
	  mov bx, ax
	  add bx, largeur
	 @suite1:
	  cmp bx, ClipX2
	  jle @suite2
	  mov si, bx
	  sub si, ClipX2
	  mov DeltaX2, si
	  sub largeur, si
	 @suite2:
	  cmp cx, ClipY1
	  jge @suite3
	  mov si, ClipY1
	  mov y, si
	  sub si, cx
 	  mov DeltaY1, si
 	  sub hauteur, si
 	  mov cx, y
		mov dx, cx
		add dx, hauteur
	 @suite3:
	  cmp dx, ClipY2
	  jle @suite4
	  mov si, dx
	  sub si, ClipY2
	  mov DeltaY2, si
	  sub hauteur, si
	 @suite4:
	  push ds
	  lds si, sprite
	  les di, buffer
	  mov ax, ancienne_largeur
	  mul deltaY1
 	  add si, ax
 	  mov ax, 320
 	  mul y
 	  add ax, x
 	  add di, ax
 	  mov bx, 320
 	  sub bx, largeur
 	  mov dx, hauteur
	 @Boucle_PutSpriteY:
  	mov cx, largeur
	  add si, deltaX1
	 @Boucle_PutSpriteX:
	  mov al, [SI]
	  cmp al, 0
	  jz @Sauter_ce_pixel
	  mov es:[DI], al
	 @Sauter_ce_pixel:
	  inc si
	  inc di
	  dec cx
	  jnz @Boucle_PutSpriteX
	  add di, bx
 	  add si, deltaX2
 	  dec dx
 	  jnz @Boucle_PutSpriteY
 	  pop ds
	 @fin:
	end;
end;

procedure GetSprite(source: Pbyte; x1,y1,largeur,hauteur: integer; sprite: Pbyte);
assembler;
asm
  push ds
  lds si,source
  les di,sprite
  mov ax,140h
  mul y1
	add ax,x1
  add si,ax
  mov bx,320
  sub bx,largeur
  mov dx,hauteur
 @BoucleHauteur:
  mov cx,largeur
  rep movsb
  add si,bx
  dec dx
  jnz @BoucleHauteur
  pop ds
end;

begin
end.