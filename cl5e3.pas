
Program cl5e3;

Const 
  maxr = 10;

Type 
  rubros = 1..maxr;
  productos = Record
    codigo: integer;
    rubro: rubros;
    stock: integer;
    precio: integer;
  End;

  arbol = ^nodo;
  nodo = Record
    dato: productos;
    hd,hi: arbol;
  End;
  maxar = array [rubros] Of productos;


  arboleda = array [rubros] Of arbol;

Procedure leerp(Var p:productos);
Begin

  ReadLn(p.codigo);
  If Not(p.codigo=-1) Then
    Begin
      ReadLn(p.rubro);
      ReadLn(p.stock);
      ReadLn(p.precio);
    End;


End;

Procedure inicializar(Var v:arboleda);

Var i: integer;
Begin

  For i:=1 To maxr Do
    Begin

      v[i] := Nil;


    End;

End;



Procedure cargar(Var a:arbol; p:productos);
Begin

  If (a=Nil)Then
    Begin
      new(a);
      a^.dato := p;
      a^.hd := Nil;
      a^.hi := Nil;

    End
  Else If (p.codigo<=a^.dato.codigo) Then cargar(a^.hi,p)
  Else cargar(a^.hd,p)
End;

Procedure cargararboleda(Var v:arboleda);

Var p: productos;
Begin
  leerp(p);
  While Not(p.codigo=-1) Do
    Begin
      cargar(v[p.rubro],p);
      leerp(p);
    End;
End;


Function buscacod (a:arbol;c:integer): Boolean;
Begin
  If (a= Nil) Then buscacod := false
  Else If (a^.dato.codigo = c) Then  buscacod := true
  Else If (c > a^.dato.codigo) Then
         buscacod := buscacod(a^.Hd,c)
  Else buscacod := buscacod(a^.Hi,c);
End;

Var v: arboleda;

Procedure bscmaximo (a:arbol;Var p:productos);

Begin

  If (a=Nil) Then
    WriteLn('arbol vacio')
  Else If (a^.hd=Nil) Then
         p := a^.dato
  Else bscmaximo(a^.hd,p)


End;


Procedure maxcod(v:arboleda;v2:maxar);

Var i: integer;
Begin

  For i:=1 To maxr Do
    Begin
      bscmaximo(v[i],v2[i]);
    End;
End;

Procedure busqueda2v(a:arbol; x,y:integer;Var c:integer);
Begin
  If Not(a=Nil) Then
    Begin
      If (a^.dato.codigo>x)Then
        Begin
          If (y>a^.dato.codigo) Then
            Begin
              c := c+1;
              busqueda2v(a^.hi,x,y,c);
              busqueda2v(a^.hd,x,y,c);

            End
          Else busqueda2v(a^.hi,x,y,c);

        End
      Else busqueda2v(a^.hd,x,y,c);
    End;
End;

Procedure busquedarang(v:arboleda);

Var i,c: integer;
Begin

  For i:=1 To maxr 
    Do
    Begin
      c := 0;
      busqueda2v(v[i],1,6,c);
      WriteLn('la cantidad es'c);

    End;

End;


Begin
  inicializar(v);
  cargararboleda(v);
  WriteLn(buscacod(v[3],3));
End.
