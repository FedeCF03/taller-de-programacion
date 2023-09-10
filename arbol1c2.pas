
Program arbol1c2;

Type 
  productos = Record
    codp: integer;
    cantidad: integer;
    mt: integer;
  End;

  ventas = Record
    codp: integer;
    cod: integer;
    cu: integer;
    p: integer;
  End;
  arbol = ^nodo;

  nodo = Record
    dato: productos;
    hd: arbol;
    hi: arbol;
  End;

Procedure leerp(Var p:ventas);

Begin
  ReadLn(p.codp);
  If Not(p.codp=-1) Then
    Begin
      ReadLn(p.cu);
      ReadLn(p.p);
    End;
End;

Procedure cargar(Var a:arbol; v:ventas);

Begin

  If (a=Nil) Then
    Begin
      new(a);
      a^.dato.codp := v.codp;
      a^.dato.cantidad := v.cu;
      a^.dato.mt := v.cu*v.p;
      a^.hi := Nil;
      a^.hd := Nil;
    End
  Else If (a^.dato.codp=v.codp) Then
         Begin
           a^.dato.cantidad := v.cu + a^.dato.cantidad;
           a^.dato.mt := v.cu*v.p +  a^.dato.mt;
         End
  Else If (a^.dato.codp<v.codp) Then
         cargar(a^.hi,v)
  Else
    cargar(a^.hd,v);


End;

Procedure cargararbol(Var a:arbol);

Var v: ventas;

Begin
  leerp(v);
  While Not(v.codp=-1) Do
    Begin
      cargar(a,v);
      leerp(v);
    End;


End;

Procedure recorrer(a:arbol);

Begin

  If Not(a=Nil)Then
    Begin
      recorrer(a^.hi);
      WriteLn(a^.dato.mt);
      recorrer(a^.hd);
    End;


End;

Function recorrermaximo(a:arbol; c,cant:integer): integer;

Begin

  If Not(a=Nil)Then
    Begin
      c := recorrermaximo(a^.hi,c,cant);
      If ( cant<a^.dato.cantidad) Then
        Begin
          c := a^.dato.codp;
          cant := a^.dato.cantidad;
        End;
      c := recorrermaximo(a^.hd,c,cant);
    End;

  recorrermaximo := c;

End;


Function menorc (a:arbol; e,c:integer): integer;

Begin
  If (a=Nil) Then
    menorc := -1
  Else If (a^.dato.codp<c)Then
         e := menorc(a^.hd,e,c)
  Else

    Begin
      If (c<a^.dato.codp) Then
        e := e+1;
      e := menorc(a^.hi,e,c);

    End;




  menorc := e;

End;


Procedure pe(a:arbol;x,y:integer;Var m:integer);

Begin
  If Not(a=Nil) Then
    Begin

      If (a^.dato.codp > x) Then
        Begin
          If (a^.dato.codp <y) Then
            Begin
              m := m+a^.dato.mt;
              pe(a^.hi,x,y,m);
              pe(a^.hd,x,y,m);

            End
          Else  pe(a^.hi,x,y,m);
        End
      Else
        pe(a^.hd,x,y,m);
    End;
End;


Var a: arbol;
  c,cant: integer;
Begin
  c := 0;
  cant := 0;
  cargararbol(a);
  pe(a,1,3,c);
  WriteLn(c);
End.
