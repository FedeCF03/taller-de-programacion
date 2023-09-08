program arbol2c2;

type
productos=record
codp:integer;
cantidad:integer;
mt:integer;
end;

ventas= record
codp:integer;
cod:integer;
cu:integer;
p:integer;
end;
arbol=^nodo;

nodo= record
dato:productos;
hd:arbol;
hi:arbol;
end;

procedure leerp(var p:ventas);

begin
      ReadLn(p.codp);
  if not(p.codp=-1) then
    begin
      ReadLn(p.cu);
      ReadLn(p.p);
    end;
end;

procedure cargar(var a:arbol; v:ventas);

begin
  
  if (a=nil) then
  begin
    new(a);
    a^.dato.codp:=v.codp;
    a^.dato.cantidad:=v.cu;
    a^.dato.mt:= v.cu*v.p;
     a^.hi:=nil;
        a^.hd:=nil;
  end
  else if (a^.dato.codp=v.codp) then
  begin
    a^.dato.cantidad:=v.cu + a^.dato.cantidad;
    a^.dato.mt:= v.cu*v.p +  a^.dato.mt;
  end
  else if (a^.dato.codp<v.codp) then
    cargar(a^.hi,v)
    else 
    cargar(a^.hd,v);


end;

procedure cargararbol(var a:arbol);
var v:ventas;

begin
  leerp(v);
  while not(v.codp=-1) do
    begin
cargar(a,v);
leerp(v);
    end;


end;

procedure recorrer(a:arbol);

begin
  
  if not(a=nil)then
    begin
      recorrer(a^.hi);
      WriteLn(a^.dato.mt);
      recorrer(a^.hd);
    end;


end;

function recorrermaximo(a:arbol; c,cant:integer):integer;

begin
  
  if not(a=nil)then
    begin
c:=recorrermaximo(a^.hi,c,cant);
       if( cant<a^.dato.cantidad) then
       begin
         c:=a^.dato.codp;
         cant:=a^.dato.cantidad;
       end;
c:=recorrermaximo(a^.hd,c,cant);
end;
   
 recorrermaximo:=c;

end;


function menorc (a:arbol; e,c:integer):integer;

begin
  if not(a=nil) then
    begin
        e:=1+menorc(a^.hi,e,c);
        if (c<a^.dato.codp)then
          e:=e+1;
       
        e:=menorc(a^.hd,e,c);
        end;

menorc:=e;

end;






var a:arbol; 
c,cant:integer;
begin
  c:=0;
  cant:=0;
  cargararbol(a);
 Writeln(menorc(a,c,5))

end.