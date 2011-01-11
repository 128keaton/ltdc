Unit Joystick;


(****************************************************************************)

																	INTERFACE

(****************************************************************************)

var
	JoyXMin,JoyXMax,JoyXHalf,JoyYMin,JoyYMax,JoyYHalf: integer;

function JoystickExists : Boolean;
function JoystickPosX : Integer;
function JoystickPosY : Integer;
function JoystickButtonA : Boolean;
function JoystickButtonB : Boolean;
procedure CalibrateJoystick;
function JoystickRight: boolean;
function JoystickLeft: boolean;



(****************************************************************************)

																 IMPLEMENTATION

(****************************************************************************)

uses Crt, Dos;

const
	GamePortAddr = $200;
	MaxCount = 500;

function JoystickStatus (Mask: Byte): Integer;
var
	Counter: Integer;
label
	Read;
begin
	asm
		mov cx,MaxCount
		mov dx,GamePortAddr
		mov ah,Mask
		out dx,al
		read:
			in al,dx
			test al,ah
			loopnz read
		mov counter,cx
	end;
	JoystickStatus:=MaxCount-Counter;
	Delay (2);
end;

function JoystickPosX: Integer;
begin
	JoystickPosX:=JoystickStatus(1);
end;

function JoystickPosY: Integer;
begin
	JoystickPosY:=JoystickStatus(2);
end;

function JoystickButtonA:Boolean;
begin
	JoystickButtonA:=(Port [GamePortAddr] and 16)=0;
end;

function JoystickButtonB: Boolean;
begin
	JoystickButtonB:=(Port [GamePortAddr] and 32)=0;
end;

function JoystickExists: Boolean;
var
	Regs: Registers;
begin
	JoystickExists:= not ((JoystickPosX=0) and (JoystickPosY=0));
end;

procedure CalibrateJoystick;
begin
	write ('  Press joystick to upper left corner and press button 1...');
	repeat until JoystickButtonA;
	JoyXMin:=JoystickPosX;
	JoyYMin:=JoystickPosY;
	writeln('OK.');
	repeat until not JoystickButtonA;
	write ('  Press joystick to lower right corner and press button 2...');
	repeat until JoystickButtonB;
	JoyXMax:=JoystickPosX;
	JoyYMax:=JoystickPosY;
	writeln ('OK.');
	repeat until not JoystickButtonB;
	JoyXHalf:=(JoyXMin+JoyXMax) div 2;
	JoyYHalf:=(JoyYMin+JoyYMax) div 2;
end;

function JoystickRight: boolean;
begin
	JoystickRight:=(JoystickPosX=JoyXMax);
end;

function JoystickLeft: boolean;
begin
	JoystickLeft:=(JoystickPosX=JoyXMin);
end;

end.

{
JOYSTICK PIN-OUTS

 1  -  +5V to Joystick A (& to Joystick B via pin 9)
 2  -  + to Button 1 on Joystick A
 3  -  X Coordinate on Joystick A
 4  -  Joystick A to ground
 5  -  Joystick B to ground
 6  -  Y Coordinate on Joystick A
 7  -  + to Button 2 on Joystick A
 8  -  Ground
 9  -  +5V to Joystick B
 10 -  + to Button 1 on Joystick B
 11 -  X Coordinate on Joystick B
 12 -  not used for joysticks
 13 -  Y Coordinate on Joystick B
 14 -  + to Button 2 on Joystick B
 15 -  not used for joysticks

 Pin ID:
 		1   2   3   4   5   6   7   8

 	         9   10  11  12  13  14  15
 }