{$G+}
{$E+}
{$F+}

unit _KEYBASM;

(****************************************************************************)

                                   INTERFACE

(****************************************************************************)
uses dos,crt;

const
  ESC=1;
  ENTER=28;
  CTRL=29;
  ALT=56;
  SPACE=57;
  HG=71;
  HAUT=72;
  HD=73;
  GAUCHE=75;
  CENTRE=76;
  DROITE=77;
  BG=79;
  BAS=80;
  BD=81;
var
  TabKey: array [0..127] of boolean;

function KeyPress: boolean;
procedure NewInt09;
procedure InitNewKeyb;
procedure InitOldKeyb;

(****************************************************************************)

                                 IMPLEMENTATION

(****************************************************************************)
var
  NewkbDinstalled: boolean;
  OldInt9: pointer;


function KeyPress: boolean;
assembler;
asm
  mov si,offset TabKey
  xor ax,ax
  mov cx,128
@loopAdd:
  add ax,ds:[si]
  inc si
  dec cx
  jne @loopAdd
  or ax,ax
  jne @OkKEy
  xor ax,ax
  jmp @fin
@OkKey:
  mov ax,1
@fin:
end;


procedure NewInt09;
assembler;
asm
  push si
  push ax
  push ds
  pushf
  mov ax,seg @Data
  mov ds,ax
  mov si,offset TabKey
  xor ax,ax
  in al,60h
  mov ah,al
  and al,7Fh
  shr ah,7
  or ah,ah
  jne @BreakCode
  xor ah,ah
  add si,ax
  mov al,1
  mov ds:[si],al
  jmp @fin
@BreakCode:
  xor ah,ah
  add si,ax
  xor al,al
  mov ds:[si],al
@Fin:
  in al,61h
  mov ah,al
  or al,80h
  out 61h,al
  xchg ah,al
  out 61h,al
  popf
  pop ds
  cli
  mov al,20h
  out 20h,al
  pop ax
  pop si
  iret
end;


procedure InitNewKeyb;
begin
  if (not NewKbdInstalled) then
  begin
    GetIntVec(9,OldInt9);
    SetIntVec(9,@NewInt09);
    NewKbdInstalled:=true;
  end else
  begin
    Textmode(3);
    writeln('Clavier Multi-Touche deja install‚');
    halt(1);
  end;
end;


procedure InitOldKeyb;
begin
  if(NewKbdInstalled) then
  begin
    SetIntVec(9,OldInt9);
    NewKbdInstalled:=false;
  end else
  begin
    Textmode(3);
    writeln('Clavier Multi-Touche non install‚');
    halt(1);
  end;
end;

begin
end.
