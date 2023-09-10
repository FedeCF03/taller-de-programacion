
Program cl5e3;

Const 
  maxr = 10;

Type 
  rubros = 1..maxr;
  productos = Record
    codigo: integer;
    rubro: rubros;
    stock: integer;
    precio: real;
  End;

  arbol = ^nodo;
  nodo = Record
    dato: productos;
    hd,hi: arbol;
  End;


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


Procedure cargar(Var a:arbol; p:productos);
Begin

  If Not(a=Nil)Then
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
      cargar(v[p.rubro]^.dato,p);
      leerp(p);
    End;
End;
