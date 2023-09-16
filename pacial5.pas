
Program pacial5;

Type 
  sub_dia = 1..31;
  envios = Record
    cod,cod_postal: integer;
    peso: real;
    dia: sub_dia;
  End;


  lista = ^nodo;
  nodo = Record
    dato: envios;
    sig: lista;
  End;

  envdato = Record
    codigopos: integer;
    envio: lista;
  End;



  arbol = ^nodo2;

  nodo2 = Record
    dato: envdato;
    hd,hi: arbol;
  End;

Procedure leerenvio(Var e:envios);
Begin
  ReadLn(e.peso);
  If Not(e.peso=0) Then
    Begin
      ReadLn(e.cod);
      ReadLn( e.cod_postal );
      ReadLn(e.dia);
    End;

End;
Procedure agregraratras(Var l:lista;e:envios);

Var n: lista;
Begin
  new(n);
  n^.dato := e;
  n^.sig := l;
  l := n;

End;

Procedure agregararbol(Var a:arbol;e:envios);

Begin
  If (a=Nil) Then
    Begin
      new(a);
      a^.dato.codigopos := e.cod_postal;
      a^.dato.envio := Nil;
      a^.hd := Nil;
      a^.hi := Nil;
      agregraratras(a^.dato.envio,e);
    End
  Else If (a^.dato.codigopos=e.cod_postal)Then agregraratras(a^.dato.envio,e)
  Else If (e.cod_postal<a^.dato.codigopos)Then
         agregararbol(a^.hi,e)
  Else agregararbol(a^.hd,e)
End;


Procedure agregararboles(Var a:arbol);

Var e: envios;
Begin

  leerenvio(e);
  While Not(e.peso=0) Do
    Begin
      agregararbol(a,e);
      leerenvio(e);
    End;

End;

Procedure buscarcod_postal(a:arbol;Var l:lista;cod:integer);

Begin
  If Not(a=Nil)Then
    Begin
      If (cod<a^.dato.codigopos) Then
        buscarcod_postal(a^.hi,l,cod)
      Else If ( cod=a^.dato.codigopos) Then
             l := a^.dato.envio
      Else buscarcod_postal(a^.hd,l,cod)
    End;



End;

Procedure codmaxs(l:lista;Var cod1,cod2:integer;Var peso1,peso2:real);

Begin
  If Not(l=Nil)Then

    Begin
      If (peso1<l^.dato.peso)Then
        Begin
          cod1 := l^.dato.cod;
          peso1 := l^.dato.peso
        End;
      If (l^.dato.peso<peso2)Then
        cod2 := l^.dato.cod;
      peso2 := l^.dato.peso;
      codmaxs(l^.sig,cod1,cod2,peso1,peso2);
    End;
End;

Var a: arbol;
  cod1,cod2: integer;
  peso1,peso2: real;
  l: lista;
Begin
  peso1 := 0;
  peso2 := 999999999;
  a := Nil;
  agregararboles(a);
  buscarcod_postal(a,l,1);
  WriteLn('maxs');
  codmaxs(l,cod1,cod2,peso1,peso2);
  WriteLn(cod2,'min');
  WriteLn(cod1,'max');

End.
