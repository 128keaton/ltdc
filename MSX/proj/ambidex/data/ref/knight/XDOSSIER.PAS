{$G+}
{$E+}
{$F+}
(*
{$L VESA8x6 Routine dans VESA*x6.ASM}
function init800600: boolean; external;
procedure setpix(x,y: integer; couleur: byte); external;
function getpix(x,y: integer): byte; external;
*)
uses crt,GraphASM,TextASM;


type
	Tsprite= record
    x,y: integer;
    dx,dy: integer;
    largeur, hauteur: integer;
    image: Pbyte;
	end;
	Tab= array [0..3999] of byte;


var
	Im,image_sprite: PByte;
	a,b,c,pX,pY,pX1,pY1:integer;
	ChxPersp,PtX,PtY,i,j,k,Color: byte;
	PStr: ^string;
	s,o: word;
	ch,ch2: char;
	DtcVesa,Rest,Rest2: boolean;
	p1,p2,p3: PtMCGA;
	Tmp: string;
  Pal: TPalette;


procedure PCX320x200(x,y,largeur,hauteur: integer; sprite: Pbyte);
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
  mov es:[DI],al
  inc si
  inc di
  dec cx
  jnz @Boucle_PutSpriteX
  add di,bx
  dec dx
  jnz @Boucle_PutSpriteY
  pop ds
end;



begin
  InitMode($13);
  ChargePCX('cc.pcx',Im,Pal);
  SetPalette(Pal);
  PCX320x200(0,0,320,200,Im);
  freemem(Im,64000);
  Init_Mouse(Rest);
  Aff_MOUSE;
  readkey;
	InitMode($03);
end.