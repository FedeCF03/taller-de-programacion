
Program emotional;


Type 
  dias = 1..31;
  meses = 1..12;
  rangodehoras: 1..8;
  empleados = Record
    nro: integer;
    dia: dias;
    mese: meses;
    horas: rangodehoras;
  End;

  lista: ^nodo;
  nodo = Record;
    dato: empleados;
    sig: lista;
  End;

  datos = Record
    reg: lista;
    nro : integer;

    arbol = ^rama;
    rama = Record;
      dato : datos;
      hd, hi: arbol;
    End;

    Procedure leerregistro (Var r:registro);
    Begin
      With r Do
        Begin
          readln (dia);
          If (dia <> 0) Then
            Begin
              readln (nro);
              readln(mese);
              readln(horas);
            End;
        End;
    End;

    Procedure agregarrama (Var a:arbol; e:empleados);
    Begin
      If (a=Nil) Then
        Begin
          new (a);
          a^.dato.reg := Nil;
          agregaradelante (a^.dato.reg);
          a^.dato.nro := e.nro;
          a^.hd := Nil;
          a^.hi := Nil;
        End
      Else If (a^.dato.nro=e.nro) Then
             agregaradelante (a^.dato.reg)
      Else If (e.nro < a^.dato.nro)Then agregarhijo(a^.hi,e)
      Else agregarhijo(a^.hd,e)

    End;



    Procedure agregaradelante(Var l:lista; e:empleados)

    Var nue: lista;
    Begin
      new (nue);
      nue^.dato := e;
      nue^.sig := l;
      l := nue;
    End;

    Procedure cargararboleda(Var a:arbol);

    Var e: empleados;
    Begin
      a := Nil;
      leerregistro(e);
      While (e.dia <> 0) Do
        Begin
          agregarrama(a,e);
          leerregistro(e);
        End;
    End;
    Procedure recorrer(Var l:lista;l2:lista);
    Begin

      While Not(l2=Nil) Then
            Begin
            agregaradelante(l,l2^.dato);
            l2:=l2^.sig;
            End;



            End;

            Procedure BuscarRetornarXY (Var l:lista; a:arbol;x,y:integer)

            Begin

            If (a<>Nil) Then
            Begin
            If (a^.dato.nro => x) Then
            Begin
            If (a^.dato.nro <= y) Then Begin
            recorrer (l, a^.dato.reg);
            BuscarRetornarXY (l,a^.hi, x,y);
            BuscarRetornarXY (l,a^.hd, x,y)
            End
            Else BuscarRetornarXY (l,a^.hi, x,y);
            End BuscarRetornarXY (l,a^.hd, x,y)
            End;

            Function horastotales(l:lista):integer;

            Begin
            If (l=Nil) Then horastotales := 0
            Else horastotales := l^.dato.horas + horastotales (l^.sig);

            End;

            Var l:lista;
            a:arbol;
            horastot : integer;
            Begin
            l := Nil;
            cargararboleda(a);
            buscarretornarxy(l,x,2,6);
            horastot:=horastotales(l);


            End.
