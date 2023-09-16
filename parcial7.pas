
Program parcial7;


Type 
  pedidos = Record
    nro: integer;
    dia: integer;
    cantc: integer;
    monto: real;
  End;

  pedido_snum = Record
    dia: integer;
    cantc: integer;
    monto: real;
  End;


  lista = ^nodo;
  nodo = Record
    dato: pedido_snum;
    sig: lista;
  End;
  pedido_entero = Record
    cod: integer;
    dat: lista;
  End;
  arbol = ^nodo2;

  nodo2 = Record
    dato: pedido_entero;
    hd,hi: arbol;
  End;


Procedure leerpedido(Var p:pedidos);
Begin
  ReadLn(p.nro);
  If Not(p.nro=0)Then
    Begin
      ReadLn(p.dia);
      ReadLn(p.cantc);
      ReadLn(p.monto);
    End;
End;

Procedure agregaradelante(Var l:lista; p:pedidos);

Var nue: lista;
Begin
  new(nue);
  nue^.dato.dia := p.dia;
  nue^.dato.monto := p.monto;
  nue^.dato.cantc := p.cantc;
  nuevo^.sig := l;
  l := nue;

End;

Procedure agregararbol(Var a:arbol; p:pedidos);

Begin
  If (a=Nil) Then
    Begin
      new(a);
      a^.dato.dat := Nil;
      a^.hd := Nil;
      a^.hi := Nil;
      a^.dato.cod := p.nro;
      agregaradelante(a^.dato.dat,p);

    End
  Else If (p.nro=a^.dato.cod) Then agregaradelante(a^.dato.dat,p)
  Else If (p.nro<a^.dato.dat) Then
         agregararbol(a^.hi,p)
  Else agregararbol(a^.hi,p);
End;

Procedure agregararboleda(Var a:arbol);

Var p: pedidos;
Begin

  leerpedido(p);

  While Not(p.nro=0) Do
    Begin
      agregararbol(a,p);
      leerpedido(p);
    End;
End;
