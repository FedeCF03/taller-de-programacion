
Program arbol2doejercioclase2;

Type 
  prestamos = Record
    isbn: integer;
    nso: integer;
    fecha: integer;
    cp: integer;
  End;


  lista = ^nodo3;
  nodo3 = Record
    dato: prestamos;
    sig: lista;
  End;

  isbn = Record
    isb: integer;
    prestamos: lista;
  End;

  arbol = ^nodo2;
  nodo2 = Record
    dato: prestamos;
    hi,hd: arbol;
  End;

  cb = Record
    isbn: integer;
    cp: integer;
  End;
  arbol3 = ^nodo4;
  nodo4 = Record
    dato: cb;
    hi,hd: arbol;
  End;


  arbol2 = ^nodo;
  nodo = Record
    dato: isbn;
    hi,hd: arbol2;
  End;

Procedure leerp(Var p:prestamos);

Begin

  ReadLn(p.isbn);
  If Not(p.isbn=-1)Then
    Begin
      ReadLn(p.nso);
      ReadLn(p.cp);
    End;

End;

Procedure agregar(Var a:arbol;p:prestamos);

Begin
  If (a=Nil)Then
    Begin
      new(a);
      a^.dato := p;
      a^.hi := Nil;
      a^.hd := Nil;

    End
  Else
    If (p.isbn <= a^.dato.isbn) Then agregar(a^.HI,p)
  Else agregar(a^.HD,p);
End;

Procedure agregaradelante(Var l:lista; p:prestamos);

Var n: lista;
Begin
  new(n);
  n^.sig := l;
  n^.dato := p;
  l := n;
End;


Procedure agregar2(Var a:arbol2;p:prestamos);

Begin
  If (a=Nil)Then
    Begin
      new(a);
      a^.dato.isb := p.isbn;
      a^.dato.prestamos := Nil;
      agregaradelante(a^.dato.prestamos,p);
      a^.hi := Nil;
      a^.hd := Nil;

    End
  Else
    If (p.isbn <= a^.dato.isb) Then agregar2(a^.HI,p)
  Else agregar2(a^.HD,p);
End;

Procedure masglande(a:arbol;Var m:integer);
Begin
  If (a=Nil)Then
    m := -1
  Else If (a^.hd=Nil)Then
         m := a^.dato.isbn
  Else masglande(a^.hd,m);



End;

Procedure menosglande(a:arbol2;Var m:integer);
Begin
  If (a=Nil)Then
    m := -1
  Else If (a^.hi=Nil)Then
         m := a^.dato.isb
  Else menosglande(a^.hi,m);



End;




Procedure agregararboles(Var a:arbol;Var a2:arbol2);

Var p: prestamos;
Begin

  leerp(p);
  While Not(p.isbn=-1) Do
    Begin
      agregar(a,p);
      agregar2(a2,p);
      leerp(p);
    End;

End;


Procedure msocio(a:arbol;Var cantp:integer;n:integer);

Begin
  If Not(a=Nil)Then
    Begin

      msocio(a^.hi,cantp,n);
      If (a^.dato.nso=n)Then cantp := cantp+1;
      msocio(a^.hd,cantp,n);

    End;



End;





{
Procedure agregar3(Var a3:arbol3;a:arbol);
Begin
  If (a=Nil)Then
    Begin
      new(a3);
      a3^.dato.isbn := a^.dato.isbn;
      a3^.dato.isbn := a^.dato.cp;

      a3^.hi := Nil;
      a3^.hd := Nil;

    End
  Else
    If (a^.dato.isbn <= a3^.dato.isbn) Then agregar(a3^.HI,a)
  Else If (a^.dato.isbn <= a3^.dato.isbn) Then
         a3^.dato.isbn := a3^.dato.isbn + a^.dato.isbn

  Else agregar(a3^.HD,a);



End;

Procedure recorreryag (a:arbol;Var a2:arbol3);

Begin
  If Not(a=Nil)Then
    Begin
      recorrer(a^.hi);
      agregar3(a2,a);
      recorrer(a^.hd);

    End;



End;
}

Procedure pi(a:arbol; x,y:integer;Var m:integer);
Begin


  If Not(a=Nil) Then
    Begin

      If (a^.dato.isbn >= x) Then
        Begin
          If (a^.dato.isbn <=y) Then
            Begin
              m := m+a^.dato.cp;
              pi(a^.hi,x,y,m);
              pi(a^.hd,x,y,m);

            End
          Else  pi(a^.hi,x,y,m);
        End
      Else
        pi(a^.hd,x,y,m);
    End;





End;










Var a: arbol;
  a2: arbol2;
  a3: arbol3;
  m: integer;
Begin
  agregararboles(a,a2);
  pi(a,1,3,m);
  WriteLn(m);
End.
