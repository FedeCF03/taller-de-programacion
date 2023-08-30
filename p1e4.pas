program p1e4;

const cat=8; prodmax=30;r3=3;


type
r_cats=1..cat;
maxprod=1..prodmax;
productos=record
cod:integer;
ru:r_cats;
precio:integer;
end;

lista=^nodo;

nodo=record
dato:productos;
sig:lista;
end;

v_rub=array[maxprod] of productos;



procedure leerproducto(var p:productos);
begin
randomize;
p.precio:=random(10);
if not(p.precio=0)then
begin
randomize;
p.ru:=random(7);
p.cod:=random(20)+20;
 
end;
 end;

procedure ordenado(var l:lista; p:productos);
var  act,ant,nue:lista;
begin
  new(nue);
  nue^.dato:=p;
  act:=l;

while not(act=nil) and (p.ru>act^.dato.ru) do
begin
  ant:=act;
  act:=act^.sig;
end;

if (act=l)
then l:=nue

else
ant^.sig:=nue;
nue^.sig:=act;
end;

procedure cargarlista(var l:lista);
var p:productos;

begin
  leerproducto(p);
  while not(p.precio=0) do
begin
    ordenado(l,p);  
  leerproducto(p);

end;

end;

procedure mostrame(l:lista);

begin
  while not(l=nil) do
  begin
  WriteLn(l^.dato.precio);
    WriteLn(l^.dato.cod);
    WriteLn(l^.dato.ru);
    l:=l^.sig;
  end;
end;

procedure cargar_v(l:lista;var a:v_rub; var diml:integer);

begin
  diml:=0;

  while not(l=Nil) and (31>diml) and (4>l^.dato.ru) do
    begin
      if(l^.dato.ru=r3)then
      begin
          diml:=diml+1;

        a[diml]:=l^.dato;
        
      end;
        l:=l^.sig;

    end;
end;


procedure ordenarv (var v:v_rub;diml:integer);
var i,j:integer; act:productos;
begin
  
  for i:=2 to diml do begin
    act:=v[i];
    j:=i-1;
    while(j>0) and (v[j].precio>act.precio)
    do 
    begin
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=act;
  end;
end;


procedure leerarray(v:v_rub; diml:integer);
var i:integer;
begin
if (diml>0)then
begin
  for i:=1  to diml do begin
    WriteLn(v[i].precio);
       WriteLn('otro');

  end;

end;
  


end;


var l :lista; v:v_rub;diml:integer;

begin
l:=nil;
  cargarlista(l);
cargar_v(l,v,diml);
leerarray(v,diml);
ordenarv(v,diml);
WriteLn('ordenado');
leerarray(v,diml);


end.















