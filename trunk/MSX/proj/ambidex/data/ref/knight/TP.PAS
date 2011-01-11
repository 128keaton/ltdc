type Arbre=^Noeud;
		 Noeud=record
			 Elem: integer;
			 FG,FD: Arbre;
		 end;

var A: Arbre;

procedure Placer(u:integer; var A:Arbre);
var Q,S: Arbre;
		Fini: boolean;
begin
	new(Q);
	Q^.Elem:=u;
	Q^.FD:=nil;
	Q^.FG:=nil;
	Fini:=false;
	if A=nil then
		A:=Q
	else begin
		S:=A;
		repeat
			if u<S^.Elem then
				if S^.FG=nil then begin
					S^.FG:=Q;
					Fini:=true;
				end
				else
					S:=S^.FG
			else
				if S^.FD=nil then begin
					S^.FD:=Q;
					Fini:=true;
				end
				else
					S:=S^.FG;
		until Fini;
	end;
end;

procedure Chercher(A:Arbre; Nom: string [10]; var Adr: string [20]; var Ok: boolean);
begin
	if A=nil then
		ok:=false
	else

end;

begin
end.