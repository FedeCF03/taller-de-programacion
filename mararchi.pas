program mararchi;

type

	rangoGen = 1..8;
	
	pelicula = record
		codigo: integer;
		codGen:	rangoGen;
		puntaje: real;
	end;
	
	listaPelis = ^nodo;
	nodo = record
		dato: pelicula;
		sig: ListaPelis;
	end;
	
	VectorCosas = record
		codigo: integer;
		puntaje: real;
	end;
	
	VectorPelis = array[rangoGen] of ListaPelis;
	
	VectorPuntaje= array[rangoGen] of VectorCosas;
	

procedure agregarAtras(var Lp: ListaPelis ; P: pelicula ; var ult: ListaPelis);
var
	nue: ListaPelis;
begin
	new(nue);
	nue^.dato:= P;
	nue^.sig:= nil;
	if(Lp = nil)then
		Lp:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;	
	
procedure leerPelicula(var P: pelicula);
begin
randomize;
	writeln('manda un codigo');
	P.codigo:=random(3)-3;
	if(P.codigo <> -1)then begin
		writeln('manda un codigoGen');
		P.codGen:=random(22);
		writeln('manda un puntaje');
		P.puntaje:=random(2);
	end;
end;	

procedure cargarLista(var Lp: ListaPelis);
var
	P: pelicula;
	ult: ListaPelis;
begin
	leerPelicula(P);
	while(P.codigo <> -1) do begin
		agregarAtras(Lp,P,ult);
		leerPelicula(P);
	end;
end;
	
procedure cargarListaNueva(var L2: ListaPelis ; Lp: pelicula);
var
	ult: listaPelis;
begin
	agregarAtras(L2,Lp,ult);	
end;
	
procedure cargarVector(var V: VectorPelis ; Lp: ListaPelis);	
var
	i: RangoGen;
	L2: ListaPelis;
begin
	for i:= 1 to 8 do begin
		L2:= nil;
		while(Lp <> nil)do begin
			if(Lp^.dato.codGen = i)then
				cargarListaNueva(L2,Lp^.dato);		{*}
			Lp:= Lp^.sig;
		end;
		V[i]:= L2;
	end;
end;


procedure recorrerVector(V: VectorPelis ; var V2: VectorPuntaje);
var
	maxPuntaje: real;
	codMax: integer;
	i: rangoGen;
begin
	for i:= 1 to 8 do begin
		maxPuntaje:= -1;
		while(V[i] <> nil) do begin
			if((V[i]^.dato.puntaje) > maxPuntaje)then begin
				maxPuntaje:= V[i]^.dato.puntaje;
				codMax:= V[i]^.dato.codigo;
			end;
			V[i]:= V[i]^.sig;
		end;
		V2[i].codigo:= codMax;
		V2[i].puntaje:= maxPuntaje;
	end;
end;

procedure leerlista(v:VectorPelis;i:rangoGen);

begin
	while not(v[i]=nil) do begin
        writeln(v[i]^.dato.puntaje);
        v[i]:=v[i]^.sig;
	   
    	end; 
     if (v[i]=nil)then
    	begin
    	i:=i+1;
    	leerlista(v,i);
    end;
end;
var
i:rangoGen;
	Lp: ListaPelis;
	V: VectorPelis;
	V2: VectorPuntaje;
	diml: rangoGen;
begin
	diml:= 8;
	Lp:= nil;
	cargarLista(Lp);
	cargarVector(V,Lp);
	i:=1;
	leerlista(V,i);

end.