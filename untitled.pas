program parcial;
type
sub_mes=1..12;
sub_dia=1..31;
compras=record
cod:integer;
dia:sub_dia;
mes:sub_mes;
juego:integer;
end; 

lista=^nodo2;
nodo2=record
dato:compras;
sig:lista;
end;

cliente=record
cod:integer;
list:lista;
end;

arbol=^nodo;
nodo=record
dato:cliente;
hd,hi:arbol;
end;

v_compras=array [sub_mes] of integer;

procedure leercompra(var c:compras);

begin

readln(c.cod);
if not(c.cod=0) then begin
readln(c.juego);
readln(c.dia);
readln(c.mes);
end;
end;

procedure inicializarv(var v:v_compras);
var i:integer;
begin
for i:=1 to 12 do begin

v[i]:=0;

end;
end;

procedure agregaradelante(var l:lista; c:compras);
var nue:lista;
begin

new(nue);
nue^.dato:=c;
nue^.sig:=l;
l:=nue;
end;


procedure agregararbol(var a:arbol; c:compras);

begin
if (a=nil) then
begin
new(a);
a^.dato.list:=nil;
a^.dato.cod:=c.cod;
a^.hd:=niL;
a^.hi:=nil;
agregaradelante(a^.dato.list,c);
end else if(a^.dato.cod=c.cod) then agregaradelante(a^.dato.list,c) else 
if(c.cod<a^.dato.cod) then agregararbol(a^.hi,c) 
else agregararbol(a^.hd,c) 
end;

procedure agregararboleda(var a:arbol;v:v_compras);
var c:compras;
begin

leercompra(c);
while not(c.cod=0) do begin
agregararbol(a,c);
v[c.mes]:=v[c.mes]+1;

leercompra(c);
end;


end;


procedure puntob(a:arbol; cod:integer; var l:lista);

begin

if  not(a=nil) then
begin
if (cod=a^.dato.cod) then l:=a^.dato.list
else if (cod<a^.dato.cod) then puntob(a^.hi,cod,l)
else puntob(a^.hd,cod,l)
end;
end;


procedure ordenararray(var v:v_compras);

var i,j,pos:sub_mes; c:integer;

begin

for i:=1 to 11 do begin
pos:=i;

for j:=i+1 to 12 do
if  v[j]>v[pos] then pos:=j;
	
c:=v[pos];
v[pos]:=v[i];
v[i]:=c;
end;
end;



var v:v_compras;
i,C:integer;
begin

for i:=1 to 12 do begin 
readln(C);
v[i]:=C;
end;
ordenararray(v);


for i:=1 to 12 do writeln(v[i]);




end.





