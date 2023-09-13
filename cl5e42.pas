
Program cl5e42;


Type 
  reclamos = Record
    dni: integer;
    ano: integer;
    tipo: string;
    codigo: integer;

  End;
  lista2 = ^nodo3;
  nodo3 = Record
    cod: integer;
    sig: lista2;
  End;

  lista = ^nodo2;
  nodo2 = Record
    dato: reclamos;
    sig: lista;
  End;

  datos = Record
    dni: integer;
    cant: integer;
    reclam: lista;
  End;

  arbol = ^nodo;

  nodo = Record
    dato: datos;
    hi,hd: arbol;
  End;


Procedure leerreclamo (Var r:reclamos);
Begin
  With r Do
    Begin
      readln (codigo);
      If (codigo <> -1) Then
        Begin
          readln (dni);

          readln (ano);
          readln(tipo);
        End;
    End;
End;


Procedure agregaratras(Var l:lista; r:reclamos);

Var nue: lista;
Begin
  new(nue);
  nue^.dato := r;
  nue^.sig := l;
  l := nue
End;

Procedure agregaratras(Var l:lista2; cod:integer);

Var nue: lista2;
Begin
  new(nue);
  nue^.cod := cod;
  nue^.sig := l;
  l := nue
End;


Procedure agregararbol(Var a:arbol; r:reclamos);

Begin

  If (a=Nil)Then
    Begin
      new(a);
      a^.dato.dni := r.dni;

      a^.dato.cant := 1;

      a^.dato.reclam := Nil;

      a^.hi := Nil;
      a^.hd := Nil;
      WriteLn('aca');
      agregaratras(a^.dato.reclam,r);
    End
  Else If (a^.dato.dni=r.dni) Then
         Begin
           agregaratras(a^.dato.reclam,r);
           a^.dato.cant  := a^.dato.cant+1;
         End

  Else If (r.dni<a^.dato.dni) Then
         agregararbol(a^.hi,r)
  Else agregararbol(a^.hd,r);
End;


Procedure cargararboleda(Var a:arbol);

Var r: reclamos;
Begin
  leerreclamo(r);
  While Not(r.codigo=-1) Do
    Begin
      agregararbol(a,r);
      leerreclamo(r);
    End;


End;


Function buscardniuwunt(a:arbol;dni:integer): integer;

Begin
  If (a=Nil) Then
    buscardniuwunt := -1
  Else If (dni<a^.dato.dni) Then
         buscardniuwunt := buscardniuwunt(a^.hi,dni)
  Else If (dni=a^.dato.dni) Then buscardniuwunt := a^.dato.cant
  Else buscardniuwunt := buscardniuwunt(a^.hd,dni)
End;

Procedure huevoizqanderecho(a:arbol;x,y:integer;Var cantr:integer);

Begin

  If Not(a=Nil)Then
    Begin
      If (x<=a^.dato.dni)Then
        Begin
          If (a^.dato.dni<=y)Then
            Begin
              cantr := cantr+1;
              huevoizqanderecho(a^.hi,x,y,cantr);
              huevoizqanderecho(a^.hd,x,y,cantr);

            End
          Else huevoizqanderecho(a^.hi,x,y,cantr);

        End

      Else
        huevoizqanderecho(a^.hd,x,y,cantr);
    End;
End;

Procedure recorrerlesta(l:lista;Var l2:lista2; ano:integer);

Begin
  While Not(l=Nil) Do
    Begin
      If (l^.dato.ano=ano)Then
        agregaratras(l2,l^.dato.codigo);


      l := l^.sig;
    End;


End;
Procedure retornarcods(a:arbol;Var l:lista2;ano:integer) ;

Begin

  If Not(a=Nil)Then
    Begin
      retornarcods(a^.hi,l,ano);
      recorrerlesta(a^.dato.reclam,l,ano);
      retornarcods(a^.hi,l,ano);
    End;
End;



Var a: arbol;

Begin
  cargararboleda(a);
  WriteLn(buscardniuwunt(a,1));
End.
