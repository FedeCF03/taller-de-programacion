program p1e2;



type
r_ofi=1..300;

oficinas= record
cod:integer;
dni:integer;
valor:real;
end;

ofi=array[r_ofi] of oficinas;

procedure leerofi(f:ofi;diml:integer);
var i:integer;
begin
  for i:=1 to diml 
  do begin
    Writeln(f[i].cod);
  end;
end;


procedure leerofici(var f:oficinas);

begin
  randomize;
 ReadLn(f.cod);

  f.dni:=random(22222);
  randomize;

f.valor:=random(4222);
end;

procedure cargararray(var v:ofi;var diml:integer);
var f:oficinas;
begin
  diml:=0;
leerofici(f);
while not(f.cod=-1) and not(diml=3) do
begin
  diml:=diml+1;
  v[diml]:=f;
  leerofici(f);
end;

end;

procedure insercion(var v:ofi; var diml:integer);
var i,j:integer; actual:oficinas;
begin
  
  for i:=2 to diml do begin
    actual:=v[i];
j:=i-1;
while (0<j) and (actual.cod<v[j].cod) do
begin
  v[j+1]:=v[j];
  j:=j-1;
end;
v[j+1]:=actual
  end;


end;

procedure seleccion(var v:ofi; diml:integer);
var i,j,pos:integer; item:oficinas;

begin
  for i:=1 to diml-1 do begin
    pos:=1;
    for j:=i+1 to diml do begin
      if (v[j].cod<v[i].cod) then pos:=j;
      item:=v[pos];
      v[pos]:=v[i];
      v[i]:=item;

    end;
  end;

end;


var ofa:ofi;
diml:integer;
begin
  
  cargararray(ofa
  ,diml);
  leerofi(ofa,diml);
insercion(ofa,diml);
WriteLn('insercion');
  leerofi(ofa,diml);


end.