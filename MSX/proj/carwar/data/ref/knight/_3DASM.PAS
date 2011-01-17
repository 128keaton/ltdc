unit _3DASM;


(****************************************************************************)
                                   INTERFACE
(****************************************************************************)
uses crt,GraphASM;

const
  _Pi100=Pi/100;
	_Pi6=Pi/6;
	_Pi4=Pi/4;
	_Pi3=Pi/3;
	_Pi2=Pi/2;
	_2Pi3=2*Pi/3;
  _3Pi4=3*Pi/4;
	_5Pi6=5*Pi/6;
	_Pi=Pi;
	_7Pi6=7*Pi/6;
	_5Pi4=5*Pi/4;
	_4Pi3=4*Pi/3;
  _3Pi2=3*Pi/2;
	_5Pi3=5*Pi/3;
	_7Pi4=7*Pi/4;
	_11Pi6=11*Pi/6;
	_2Pi=2*Pi;


type
  bit=0..1;
	Obj3d= record
		Point2d: array [1..10,1..2] of real;
		Point3d: array [1..10,1..3] of real;
		NomPt3d: array [1..10] of string [5];
		MatAdjt: array [1..10,1..10] of bit;
		NbPoint: byte;
	end;
	Pt2d= array [1..2] of word;
	Pt3d= array [1..3] of real;
	PtMCGA= record
		X,Y: integer;
	end;

var
  Fac,Foc: real;


function  pow(pX,pN:real):real;
procedure T3d2d(X3d,Y3d,Z3d:real;var X2d,Y2d:integer);
Procedure TriangleMCGA(Pt1,Pt2,Pt3:PtMCGA; Clr:byte);


(****************************************************************************)
                                 IMPLEMENTATION
(****************************************************************************)
function pow(pX,pN:real):real;
begin
  if px>0 then
    pow:=exp(pN*(ln(pX)))
  else if px=0 then
    pow:=0
  else
    pow:=-exp(pN*(ln(-pX)));
end;


procedure T3d2d(X3d,Y3d,Z3d:real;var X2d,Y2d:integer);
begin
  X2d:=trunc(160+Fac*X3d*pow(Foc,Z3d));
  Y2d:=trunc(100-Fac*Y3d*pow(Foc,Z3d));
end;


Procedure TriangleMCGA(Pt1,Pt2,Pt3:PtMCGA; Clr:byte);
var
	PtH,PtB,PtD,PtG,PtM:PtMCGA;
	ci:integer;
  TCx,Cx1,Cx2,Dlt1,Dlt2,Dlt3:real;
begin
	if ((Pt1.Y<=Pt2.Y) and (Pt2.Y<=Pt3.Y)) then begin
		PtB:=Pt1;
		PtM:=Pt2;
		PtH:=Pt3;
	end
	else if ((Pt1.Y<=Pt3.Y) and (Pt3.Y<=Pt2.Y)) then begin
		PtB:=Pt1;
		PtM:=Pt3;
		PtH:=Pt2;
	end
	else if ((Pt2.Y<=Pt1.Y) and (Pt1.Y<=Pt3.Y)) then begin
		PtB:=Pt2;
		PtM:=Pt1;
		PtH:=Pt3;
	end
	else if ((Pt2.Y<=Pt3.Y) and (Pt3.Y<=Pt1.Y)) then begin
		PtB:=Pt2;
		PtM:=Pt3;
		PtH:=Pt1;
	end
	else if ((Pt3.Y<=Pt1.Y) and (Pt1.Y<=Pt2.Y)) then begin
		PtB:=Pt3;
		PtM:=Pt1;
		PtH:=Pt2;
	end
	else begin
		PtB:=Pt3;
		PtM:=Pt2;
		PtH:=Pt1;
	end;
  Dlt1:=(PtH.X-PtB.X)/(PtH.Y-PtB.Y);
  Dlt2:=(PtM.X-PtB.X)/(PtM.Y-PtB.Y);
  Dlt3:=(PtH.X-PtM.X)/(PtH.Y-PtM.Y);
  Cx1:=PtB.X;
  Cx2:=PtB.X;
  for Ci:=PtB.Y to PtH.Y do begin
    Cx1:=Cx1+Dlt1;
    if Ci<PtM.Y then
    	Cx2:=Cx2+Dlt3
    else
    	Cx2:=Cx2+Dlt2;
    if Cx1>Cx2 then begin
    	TCx:=Cx1;
      Cx1:=Cx2;
      Cx2:=TCx;
    end;
		H_LineMCGA(trunc(Cx1),Ci,trunc(Cx2),15);
	end;
end;


begin
end.