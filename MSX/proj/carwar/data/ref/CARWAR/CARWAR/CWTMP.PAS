uses
	crt,GraphAsm;

type
	Bit=                  0..1;
	Vct= record
		Angl              : real;
		Norm              : real;
	end;
	Pt= record
		X                 : word;
		Y                 : word;
	end;
	Time= record
		h                 : word;
		m                 : word;
		s                 : word;
		ms                : word;
	end;
	Indic= record
		Pos               : Pt;
		Chrono            : PByte;
	end;

	_CAR= record
(* CARWAR.DAT INFO *)
		ID                : byte;
		SPRITE_FILE       : string;
		SPRITE_POSITION_X : word;
		SPRITE_POSITION_Y : word;
		TOP_SPEED         : byte;
		ACCELERATION      : byte;
		TURNING           : byte;
		GRIP              : byte;
		BREAK             : byte;
		FREE_WHEEL        : byte;
		LIFE              : byte;
(* Intern Car variable *)
		Srite             : array [0..15] of PByte;
	end;

	_KEY= record
		ID                : byte;
		KEY_RIGHT         : byte;
		KEY_LEFT          : byte;
		KEY_SPEED_UP      : byte;
		KEY_BREAK         : byte;
		KEY_ACTION        : byte;
	end;

	_DRIVER= record
(* CARWAR.DAT INFO *)
		ID                : byte;
		SPRITE_FILE       : string;
		SPRITE_POSITION_X : word;
		SPRITE_POSITION_Y : word;
		TOP_SPEED         : byte;
		LIFE              : byte;
(* Intern Driver variable *)
		Srite             : array [0..7,0..7] of PByte;
	end;

	_PLAYER= record
		Indicator         : Indic;
(* Intern Car variable *)
		Car_ID            : byte;
		Car_Direction     : byte;
		Car_X             : real;
		Car_Y             : real;
		Car_Z             : byte;
		Car_Spd           : Vct;
		Car_Acc           : Vct;
(* Intern Driver variable *)
		Driver_ID         : byte;
		Driver_Direction  : byte;
		Driver_X          : real;
		Driver_Y          : real;
		Driver_Z          : byte;
		Driver_Spd        : Vct;
		Driver_Acc        : Vct;
(* Intern control variable *)
		Key_ID            : byte;
(* Intern Car Counter *)
		Global_Count      : word;
		Kill_OL_Count     : word;
		Shock_Count       : byte;
		Blast_Count       : byte;
		Life_Count        : byte;
		Fly_Count         : byte;
		Laps_Count        : integer;
(* Time info *)
		FullTime          : Time;
		LapTime           : Time;
		OldTime           : Time;
		NewTime           : Time;
		BestTime          : Time;
(* Other variable *)
		Fly_Speed         : byte;
		Ground            : byte;
		Shock_Position    : Pt;
		Position          : array [0..13,0..11] of Pt;
		Check_Point_Valid : array [0..31] of boolean;
(* Init info *)
		Start_Position    : Pt;
		Start_Angle       : integer;
	end;

	_ONLOOKER= record
		Dead              : bit;
		Onlooker_Sprite   : array [0..1] of PByte;
		Position          : Pt;
		face              : byte;
	end;

var
	PLAYER              : array [1..10] of _PLAYER;
	CAR                 : array [0..31] of _CAR;
	DRIVER							: array [0..31] of _DRIVER;
	KEY   							: array [0..31] of _KEY;

	F										: text;
	Ch                  : char;
	Buf                 : string;
	DetectCar           : boolean;
	DetectDriver        : boolean;
	NumPlayer           : byte;
	NumCar							: byte;
	NumDriver           : byte;
	NumKey              : byte;

	a,b,c               : integer;
	i,j,k               : byte;
	x,y,z               : real;

function FileExists(FileName: String): Boolean;
var
 F: file;
begin
 {$I-}
 Assign(F, FileName);
 FileMode:=0;
 Reset(F);
 Close(F);
 {$I+}
 FileExists:=(IOResult=0) and (FileName<>'');
end;

procedure ReadLine(var FT: text; var Buffer: string);
begin
	Buffer:='';
	while not eoln(FT) do begin
		read(FT,Ch);
		Buffer:=Buffer+Ch;
	end;
	read(FT,Ch);
	Buffer:=Buffer+Ch;
end;



begin
	clrscr;
	Assign(F,'CARWAR.DAT');
	Reset(F);

	ReadLine(F,Buf);
	if ((FileExists('CARWAR.DAT')) and (copy(Buf,1,27)='CARWAR by PHENIX Corp. 1997')) then
		Writeln('þ CREATING CARS & DRIVERS DATAS ...')
	else begin
		writeln('þ ERROR 5 : GAME DATA FILE NOT FOUND');
		halt(5);
	end;

	while not eof(F) do begin
		ReadLine(F,Buf);
		if copy(Buf,2,4)='ðCAR' then begin
			writeln('  NEW CAR ADD >> ',copy(Buf,7,length(Buf)-7));
			ReadLine(F,Buf);
			if copy(Buf,2,6)='CAR_ID' then
				val(copy(Buf,9,length(Buf)-9),NumCar,a);
			DetectCar:=true;
		end;
		if DetectCar then begin
			if copy(Buf,2,15)='CAR_SPRITE_FILE' then
				CAR[NumCar].SPRITE_FILE:=copy(Buf,18,length(Buf)-18);
			if copy(Buf,2,21)='CAR_SPRITE_POSITION_X' then begin
				val(copy(Buf,24,length(Buf)-24),b,a);
				CAR[NumCar].SPRITE_POSITION_X:=b;
			end;
			if copy(Buf,2,21)='CAR_SPRITE_POSITION_Y' then begin
				val(copy(Buf,24,length(Buf)-24),b,a);
				CAR[NumCar].SPRITE_POSITION_Y:=b;
			end;
			if copy(Buf,2,13)='CAR_TOP_SPEED' then begin
				val(copy(Buf,16,length(Buf)-16),b,a);
				CAR[NumCar].TOP_SPEED:=b;
			end;
			if copy(Buf,2,16)='CAR_ACCELERATION' then begin
				val(copy(Buf,19,length(Buf)-19),b,a);
				CAR[NumCar].ACCELERATION:=b;
			end;
			if copy(Buf,2,7)='TURNING' then begin
				val(copy(Buf,10,length(Buf)-10),b,a);
				CAR[NumCar].TURNING:=b;
			end;
			if copy(Buf,2,4)='GRIP' then begin
				val(copy(Buf,7,length(Buf)-7),b,a);
				CAR[NumCar].GRIP:=b;
			end;
			if copy(Buf,2,5)='BREAK' then begin
				val(copy(Buf,8,length(Buf)-8),b,a);
				CAR[NumCar].BREAK:=b;
			end;
			if copy(Buf,2,10)='FREE_WHEEL' then begin
				val(copy(Buf,13,length(Buf)-13),b,a);
				CAR[NumCar].FREE_WHEEL:=b;
			end;
			if copy(Buf,2,4)='LIFE' then begin
				val(copy(Buf,7,length(Buf)-7),b,a);
				CAR[NumCar].LIFE:=b;
			end;
		end;
		if copy(Buf,2,7)='ðDRIVER' then begin
			writeln('  NEW DRIVER ADD >> ',copy(Buf,10,sizeof(Buf)-10));
			ReadLine(F,Buf);
		end;
	end;

	readkey;
	Close(F);
end.