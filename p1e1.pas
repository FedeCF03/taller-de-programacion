program p1e1;

type
c_r=1..15;
c_v=1..99;

ventas=record
codigo:c_r;
cantidad:c_v;
end;

ventas_array=array [1..20] of ventas;

procedure leerventa( var v:ventas);

begin
randomize;
  readln(v.cantidad);
v.codigo:=random(15);


end;

procedure cargararray(var a:ventas_array;var diml:integer);
var
v:ventas;

begin
  
  diml:=0;
leerventa(v);
while (diml<4) do
begin
  diml:=diml+1;
  a[diml]:=v;
leerventa(v);
end;
end;

procedure leerarray(a:ventas_array;i:integer);
var c:integer;
begin
c:=1;
while (c <= i) do  
begin
    WriteLn(a[c].codigo);
c:=c+1;

end;
  
end;

procedure seleccion ( var v:ventas_array; diml:integer);
var i,j,pos :integer; item :ventas;
begin
 for i:=1 to diml-1 do begin
   pos:=i;
   for j := i+1 to diml do 
   if v[j].codigo<v[pos].codigo then pos:=j;

item:=v[pos];
v[pos]:=v[i];
v[i]:=item;

 end; 

end;

procedure eliminar (var v:ventas_array;var  dl:integer; pos1,pos2:integer);
var i,c :integer;
begin 
i:=1;
c:=0;
while (v[i].codigo<=pos2) and (i<=dl) do
  begin
    if (pos1<=v[i].codigo) and (v[i].codigo<=pos2)
    then
    begin
      if (v[i].codigo=v[i+1].codigo)then
      
        v[i]:=v[i+2]
        else begin

      v[i]:=v[i+1];
      WriteLn('eliminado');
      WriteLn(i,'i');
      WriteLn(c,'c');
                
        end;

  c:=c+1;
i:=i+1;
    end;

  end; 
dl:=dl-c;
end;


var arrat:ventas_array;i:integer;

begin
  cargararray(arrat,i);
 
seleccion(arrat,i);
  WriteLn('cero');

  leerarray(arrat,i);
  WriteLn('uno');
eliminar(arrat,i,5,10);
  WriteLn('dos');
  leerarray(arrat,i);
  WriteLn(i);

end.