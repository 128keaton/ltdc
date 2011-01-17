{*****************************
 *      EXEMOD.PAS v1.0      *
 *                           *
 *    19(c)97  KRÜ$tY.007    *
 *     EXE MODifications     *
 *****************************
}
{$S-,R-,D-,I-}
{$IFOPT O+}
  {$F+}
{$ENDIF}

unit ExeMod;

(****************************************************************************)

interface

(****************************************************************************)

var
	ExeName : String;

function Write2Exe(var Data2Write; DataSize : Word) : Integer;

(****************************************************************************)

implementation

(****************************************************************************)


function Write2Exe(var Data2Write; DataSize : Word): Integer;
const
	PrefixSize=256;
var
	ExeFile    : File;
	HeaderSize : Word;
	IoError    : Integer;
begin
	Assign(ExeFile, ExeName);
	Reset(ExeFile, 1);
	IoError := IOResult;

	If IoError = 0 then
	begin
		Seek(ExeFile, 8);
		IoError := IOResult;
	end;

	If IoError = 0 then
	begin
		BlockRead(ExeFile, HeaderSize, Sizeof(HeaderSize));
		IoError := IOResult;
	end;

	If IoError = 0 then
	begin
		Seek(ExeFile, longint(HeaderSize+Seg(Data2Write) -PrefixSeg) shl 4 + Ofs(Data2Write)- 256);

		IoError := IOResult;
	end;

	If IoError = 0 then
	begin
		BlockWrite(ExeFile, Data2Write, DataSize);
		IoError := IOResult;
	end;

	Close(ExeFile);
	Write2Exe:=IoError;
end;

begin
	ExeName:=paramstr(0);
end.

