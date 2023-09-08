program arbol2c1;

type
ventas= record
cod:integer;
fecha:string;
cu:integer;
end;

arbol=^nodo;
 nodo=record
 dato:ventas;
 hi:arbol;
 hd:arbol;
 end;

procedure leer(var d:ventas);

begin
    ReadLn(d.cod);
    if not(d.cod=0)
    then
      begin
        ReadLn(d.fecha);
        ReadLn(d.cu);
      end;


end;



 procedure cargar( var a:arbol; d:ventas);

 begin
   if (a=nil) then
     begin
       new(a);
       a^.dato:=d;
       a^.hi:=nil;
        a^.hd:=nil;
     end
     else
     if(d.cod<a^.dato.cod) then
       agregar(a^.hi,d)
       
       else agregar(a^.hd,d);
 end;

 procedure cargararbo(var a:arbol);
var d:ventas;
 begin
   leer(d);
   while not(d=0) do begin
     cargar(a,d);
     leer(d);
   end;


 end;