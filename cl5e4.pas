
Program cl5e4;

Type 

  reclamo = Record
    cod: integer;
    ano: integer;
    tipo: string;
  End;

  lista2 = ^nodo2;

  nodo2 = Record
    dato: reclamo;
    sig: lista2;
  End;


  reclamos = Record
    dni: integer;
    cant: integer;
    cod: integer;
    ano: integer;
    tipo: string;

    reclam: lista2;
  End;


  lista = ^nodo;

  nodo = Record
    dato: reclamos;
    sig: lista;
  End;

Procedure leerreclamo(Var r:reclamos);

Begin
  ReadLn(r.cod);
  If Not(r.cod=-1)Then
    Begin
      readln(r.dni);
      readln(r.ano);
      readln(r.tipo);
    End;
End;

Procedure agregaradelante(Var l:lista2; r:reclamos);

Var n: lista2;
Begin
  new(n);
  n^.dato.cod := r.cod;
  n^.dato.ano := r.ano;
  n^.dato.tipo := r.tipo;
  n^.sig := l;
  l := n;
End;

Procedure insertarordenado(Var l:lista;r:reclamos);

Var nue,act,ant: lista;
Begin
  new(nue);
  nue^.dato.dni := r.dni;
  nue^.dato.cant := 1;
  nue^.dato.reclam := Nil;
  agregaradelante(nue^.dato.reclam,r);
  nue^.sig := Nil;
  act := l;

  While Not(act=Nil) And(r.dni>act^.dato.dni) Do
    Begin
      ant := act;
      act := act^.sig;

    End;

  If (act=l) Then
    l := nue

  Else ant^.sig := nue;
  nue^.sig := act;

End;



Procedure buscar(Var l:lista; r:reclamos);

Var act: lista;
Begin
  act := l;
  While Not(act=Nil) And Not(act^.dato.dni=r.dni) Do
    Begin
      act := act^.sig;
    End;
  If (act^.dato.cod=r.cod) Then
    agregaradelante(act^.dato.reclam,r)
  Else insertarordenado(l,r);


End;

Procedure cargarlista(Var l:lista);

Var r: reclamos;
Begin

  leerreclamo(r);
  While Not(r.cod=-1) Do
    Begin
      buscar(l,r);
      leerreclamo(r);
    End;


End;









Begin

End.
