program examen20232;
const
  pesoFin = 0;

type


rangoDia= 1..31;

reg_envio = record 
  cliente: integer;
  dia: rangoDia;
  codPostal: integer;
  pesoPaquete: real;
end;

envio = record
  cliente: integer;
  dia: rangoDia;
  pesoPaquete: real;
end;

listaEnvio = ^nodo;
nodo = record
  dato: envio;
  sig: listaEnvio;
end;

arbol = ^nodoA;
nodoA = record
  codPostal: integer;
  lista : listaEnvio;
  hi:arbol;
  hd:arbol;
end;

procedure leerEnvio(var e: reg_envio);
begin
  //write('ingrese peso: '); readln(e.pesoPaquete);
  e.pesoPaquete:= random(100) / (random(10)+1);
  if(e.pesoPaquete <> pesoFin)then
  begin
    e.cliente:= random(100) + 1;
    e.codPostal:= random(100) + 1;
    e.dia:= random(31)+1;
  end;
end;

procedure AgregarAdelante(var L: listaEnvio; e:reg_envio);
var nue:listaEnvio;
begin 
  new(nue);
  nue^.dato.cliente:= e.cliente;
  nue^.dato.dia:= e.dia;
  nue^.dato.pesoPaquete:= e.pesoPaquete;
  nue^.sig:= L;
  L:= nue;
end;

procedure InsertarEnArbol(var a:arbol; e:reg_envio);
begin
  if(a = nil)then
  begin
    new(a);
    a^.codPostal:= e.codPostal;
    a^.lista:= nil;
    AgregarAdelante(a^.lista,e);
    a^.hi:= nil;
    a^.hd:= nil;
  end
  else 
  if(e.codPostal = a^.codPostal) then
    AgregarAdelante(a^.lista,e)
  else
    if(e.codPostal < a^.codPostal) then
      InsertarEnArbol(a^.hi,e)
    else
      InsertarEnArbol(a^.hd,e);
end;

procedure CargarABB(var a: arbol);
var 
  e:reg_envio;
begin 
  leerEnvio(e);
  while(e.pesoPaquete <> pesoFin)do
  begin
    InsertarEnArbol(a,e);
    leerEnvio(e);
  end;
  writeln('se leyo condicion de fin');
end;

  
function RetornarLista(a:arbol; codP: integer): listaEnvio;
begin
  if(a = nil)then
    RetornarLista:= nil
  else
  begin
    if(a^.codPostal = codP)then
      RetornarLista:= a^.lista
    else
      if(codP < a^.codPostal)then
        RetornarLista:= RetornarLista(a^.hi,codP)
      else
        RetornarLista:= RetornarLista(a^.hd,codP);
  end;
end;

procedure MinYMax (L:listaEnvio; var min,max: real; var codmax,codmin: integer );
begin 
  if(L <> nil)then
  begin
    if(L^.dato.pesoPaquete > max)then begin
      max:= L^.dato.pesoPaquete;
      codmax:=L^.dato.cliente
    end;
    if(L^.dato.pesoPaquete < min)then begin
      min:= L^.dato.pesoPaquete;
      codmin:= L^.dato.cliente;
    end;
    MinYMax(L^.sig,min,max,codmax,codmin);
  end;
end;


var
  a:arbol;
  ListaIncisoB: listaEnvio;
  codP,codmin,codmax: integer;
  min,max: real;
begin
  randomize;
  a:= nil; ListaIncisoB:= nil;
  CargarABB(a);
  write('ingrese un codigo postal: '); readln(codP);
  
  ListaIncisoB:= RetornarLista(a,codP);
  if(ListaIncisoB = nil)then
    writeln('el codigo postal ingresado no existia en el arbol')
  else
    writeln('ese codigo corresponde al cliente: ',ListaIncisoB^.dato.cliente);
  
  codmin:= 0;
  codmax:=0;
  min:= 99999;
  max:= 0;
  if(ListaIncisoB <> nil)then begin
    MinYMax(ListaIncisoB,min,max,codmax,codmin);
    writeln(' los codigos de cliente maximos y minimos son ',codmax,' con ',max:2:2,' y ',codmin,' con ',min:2:2);
  end 
  else
    writeln('la lista esta vacia');
  
end.