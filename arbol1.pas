program arbol1;

type
socios=record
nro:integer;
name:string;
gear:integer;
end;

arbol=^nodo;

nodo=record
dato:socios;
HI:arbol;
HD:arbol;
end;

procedure leersocio(var s:socios);

begin
  ReadLn(s.nro);
  if not(s.nro=0) then
    begin
      ReadLn(s.name);
      ReadLn(s.gear);
    end;


end;


procedure agregartree(var a:arbol;s:socios);
begin
   if(a=nil)then
    begin
      new(a);
      a^.dato:=s;
      a^.HI:=nil;
      a^.HD:=nil;
    end
    else
    if(s.nro<a^.dato.nro)then
      agregartree(a^.hi,s)
      else agregartree(a^.HD,s);
      
end;


function nroglande(a:arbol):integer;

begin
  
  if(a=nil)then nroglande:=-1 
  else if (a^.HD=nil) then nroglande:=a^.dato.nro
  else nroglande:=nroglande(a^.hd);

end;


function nrochico(a:arbol):integer;

begin
  
  if(a=nil)then nrochico:=-1 
  else if (a^.Hi=nil) then nrochico:=a^.dato.nro
  else nrochico:=nrochico(a^.hi);

end;

procedure recorrermax(a:arbol;var max,nro:integer);

begin
  
if not(a=nil) then
begin
  recorrermax(a^.hi,max,nro);
   if (max<a^.dato.gear) then
   begin
    nro:=a^.dato.nro;
     max:=a^.dato.gear
   end;
  recorrermax(a^.hd,max,nro);

 
 
end;
end;

procedure aumentar(a:arbol);

begin
  
if not(a=nil) then
begin
WriteLn('ao1',a^.dato.gear);
  aumentar(a^.hi);
a^.dato.gear:=a^.dato.gear+1;
  aumentar(a^.hd);
WriteLn('ao2',a^.dato.gear);

 end;
 
end;


function csocios(a:arbol;ca:integer):integer;

begin
  
if not(a=nil) then
begin

ca:= csocios(a^.hi,ca);
 ca:=ca+1;

 ca:=csocios(a^.hd,ca);

 end;
 csocios:=ca;
end;


function e(a:arbol;b:integer):boolean;

begin
  
if (a=nil)then e:=false
else begin
  if(a^.dato.nro=b)then
    e:=true
    else if (a^.dato.nro < b) then 
				e := e (a^.hd, b)
			else e := e (a^.hi, b);

end;

 
 
end;




procedure informarasc(a:arbol);

begin
  
if not(a=nil)then
 begin

informarasc(a^.Hd);
 WriteLn(a^.dato.nro);

informarasc(a^.Hi);

end;

 
 
end;


procedure cargartree(var a:arbol);

var s:socios;

begin
  leersocio(s);

while not(s.nro=0) do
  begin
 agregartree(a,s);
    leersocio(s);

  end;
  


end;

var a:arbol;
max,nro:integer;
begin
nro:=0;
  a:=nil;
  cargartree(a);
 informarasc(a);
end.