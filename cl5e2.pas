
Program cl5e2;

Const maxano = 2018;

Type 
  autos = Record
    patente,ano: integer;
    marca,modelo: string;
  End;


  lista = ^nodo3;
  nodo3 = Record
    dato: autos;
    sig: lista;
  End;
  marcas = Record
    marca: string;
    mautos: lista;
  End;


  arbol = ^nodo;
  nodo = Record
    dato: autos;
    hd,hi: arbol;
  End;
  arbol2 = ^nodo2;
  nodo2 = Record
    dato: marcas;
    hi,hd: arbol2;
  End;
  constano = 0..maxano;
  vectoranos = array[2010..maxano] Of lista;


Procedure leerautos(Var c:autos);
Begin

  ReadLn(c.marca);
  If Not(c.marca='-1') Then
    Begin
      c.ano := 2015;
      c.patente := 69;
      c.modelo := 'f100';
    End;

End;


Procedure cargararbol1(Var a:arbol; c:autos);

Begin
  If (a=Nil) Then
    Begin
      new(a);
      a^.dato := c;
      a^.hd := Nil;
      a^.hi := Nil;
    End
  Else If (c.patente<=a^.dato.patente)Then
         cargararbol1(a^.hi,c)
  Else cargararbol1(a^.hd,c);

End;

Procedure agregaradelante(Var l:lista; c:autos);

Var n: lista;
Begin
  new(n);
  n^.dato := c;
  n^.sig := l;
  l := n;
End;


Procedure cargararbol2(Var a:arbol2; c:autos);

Begin
  If (a=Nil) Then
    Begin
      new(a);
      a^.dato.marca := c.marca;
      a^.dato.mautos := Nil;
      agregaradelante(a^.dato.mautos,c);
      a^.hd := Nil;
      a^.hi := Nil;
    End
  Else If (c.marca=a^.dato.marca) Then
         Begin
           agregaradelante(a^.dato.mautos,c);
         End
  Else If (c.marca<=a^.dato.marca)Then
         cargararbol2(a^.hi,c)
  Else cargararbol2(a^.hd,c);

End;

Procedure buscar(l:lista;Var c:integer);
Begin

  While Not(l=Nil) Do
    Begin
      c := c+1;
      l := l^.sig;
    End;


End;

Procedure c2(a:arbol2; m:String;Var c:integer);
Begin
  If Not(a=Nil)Then
    Begin
      If (m<=a^.dato.marca)Then
        Begin
          c2(a^.hi,m,c);

        End
      Else
        If (a^.dato.marca=m)Then
          buscar(a^.dato.mautos,c)
      Else
        c2(a^.hd,m,c);



    End;



End;

Procedure puntob2(a:arbol; m:String;Var c:integer);
Begin
  If Not(a=Nil)Then
    Begin

      If (a^.dato.marca<m) Then
        puntob2(a^.hd,m,c)
      Else
        If (a^.dato.marca=m) Then
          Begin
            c := c+1;
            puntob2(a^.hi,m,c)
          End

      Else     puntob2(a^.hi,m,c)
    End;


End;


Procedure cargararboles(Var a:arbol; Var a2:arbol2);

Var c: autos;
Begin
  leerautos(c);
  While Not(c.marca='-1') Do
    Begin
      cargararbol1(a,c);
      cargararbol2(a2,c);
      leerautos(c);

    End;

End;
Procedure inicializar(Var v:vectoranos);

Var i : integer;
Begin

  For i:=2010 To maxano Do
    Begin

      v[i] := Nil;

    End;

End;

Procedure buscarano(a:arbol; Var v:vectoranos);
Begin

  If Not(a=Nil) Then
    Begin
      buscarano(a^.hi,v);
      agregaradelante(v[a^.dato.ano],a^.dato);
      buscarano(a^.hd,v);
    End;


End;

Procedure buscarpatente(a:arbol;p:integer;Var  m:String);
Begin
  If Not(a=Nil)Then
    Begin
      If (a^.dato.patente<p)Then
        buscarpatente(h^.hd,p)
      Else If (a^.dato.patente=p)Then
             m := a^.dato.modelo
      Else
        buscarpatente(h^.hi,p);

    End;
End;





Var a: arbol;
  a2: arbol2;
  c: integer;
  v: vectoranos;
Begin
  c := 0;
  inicializar(v);
  cargararboles(a,a2);
  //2c(a2,'ford',c);
  buscarano(a,v);
  WriteLn(v[2015]);
End.
