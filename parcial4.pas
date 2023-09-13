
Program parcial4;

Type 

  compras = Record
    codcli: integer;
    dia: integer;
    cantprod: integer;
    monto: real;
  End;

  lista = ^nodo2;
  nodo2 = Record
    dato: compras;
    sig: lista;
  End;
  arbol = ^nodo;
  nodo = Record
    codcli: integer;
    dato: lista;
    hi,hd: Arbol;
  End;

Procedure leerprod(Var c:compras);

Begin
  With c Do
    Begin
      ReadLn(cantprod);
      If Not(cantprod=0) Then
        Begin
          ReadLn(codcli);
          ReadLn(monto);
          ReadLn(dia);
        End;
    End;
End;

Procedure agregaratras(Var l:lista; c:compras);

Var n: lista;
Begin
  new(n);
  n^.dato := c;
  n^.sig := l;
  l := n;
End;

Procedure agregaraarbol(Var a:arbol; c:compras);

Begin

  If (a=Nil)Then
    Begin
      new(a);
      a^.codcli := c.codcli;
      a^.dato := Nil;
      a^.hi := Nil;
      a^.hd := Nil;
      agregaratras(a^.dato,c);


    End
  Else If (a^.codcli=c.codcli) Then
         agregaratras(a^.dato,c)
  Else If (c.codcli<a^.codcli) Then agregaraarbol(a^.hi,c)
  Else agregaraarbol(a^.hd,c)
End;

Procedure agregararbolesss(Var a:arbol);

Var c: compras;
Begin
  leerprod(c);
  While Not(c.cantprod=0) Do
    Begin
      agregaraarbol(a,c);
      leerprod(c);

    End;


End;

Procedure agregarlista(l:lista;Var l2:lista);
Begin

  While Not(l=Nil) Do
    Begin
      agregaratras(l2,l^.dato);
      l := l^.sig;
    End;
End;


Procedure comprascli(a:arbol;Var l:lista;cod:integer);

Begin

  If Not(a=Nil)Then
    Begin

      If (cod<a^.codcli)Then
        comprascli(a^.hi,l,cod)
      Else If (cod=a^.codcli)Then
             agregarlista(a^.dato,l)
      Else comprascli(a^.hd,l,cod)
    End;
End;

Function montototal(l:lista): real;

Begin

  If (l=Nil)Then
    montototal := 0
  Else
    Begin

      montototal := l^.dato.monto +montototal(l^.sig);

    End; ;


End;


Var a: arbol;
  l: lista;


Begin
  l := Nil;
  a := Nil;
  agregararbolesss(a);
  comprascli(a,l,1);
  WriteLn(montototal(l));

End.
