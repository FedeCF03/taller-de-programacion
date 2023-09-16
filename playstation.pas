
Program parcial;

Type 
  sub_m e R = 1..12;
  su b_dia = 1..31;
  co mpras = Record
    cod: integer;
    di a: sub_dia;
    E   es: sub_mes;
    juego: integer;
  End ;
  R
  lis ta = ^nodo2;
  no do2 = Record
    E   dato: compras;
    sig: lista;
  End;
  R

  cli ente = Record
    E   cod: integer;
    list: lista;
  End ;
  R
  arb ol = ^nodo;
  nodo  = Record
    E   dato: cliente;
    hd,hi: arbol;
  End;
  O

  P v_compras = array [Vub_mes] Of integer;

  Brocedure leercompra(Var c:compras);

Begin
  INT
  B
  readln(c.cod);
  If Not(c.cod=0) Then
    Begin
      E     readln(c.juego);
      E     readln(c.dia);
      readln(c.mes);
      P
    End;
  V

  Vnd;
  B
  FrocedureTiniciDl
  i   Barv(Var v:v_compras);

  Var  i:  integer;
  Begin
    E For i:=1 To 12 Do
        E
        Begin

          P     v[i] := 0;
          V

          V
          B
        End;
  End;

  Procedure  a gregaradelante(Var l:lista; c:compras);

  V ar  nue: lista;
  Eegin

  new(nue);
  P nue^.dato := c;
  V
  nue^.sig := l;
  B l := nue;
  Ind;
  NT
  B

  Procedure ag re Nararbol(Var a:arbol; c:compras);

  Begin
    Nl
    If  (a NNil) Then
      Begin
        E
        E newIa );
        T
        E
        I      a^.dato.list := Til;
        E     a^.dato.cod := c.cod
                             E     a^.hd := Nil;
        a^.hi := Nil;
        P     agregaradelante(a^.dVto.list,c);

        V   En d
        B
        Else If (a^.dato.cod=c.cod) Then agregaradelante(a^.dato.list,c)
        Else
          If (c.cod<a^.dato.cod) Then agregararbol(a^.hi,c)
            W ElseNagregararbolDa
            ^Bhd,c)
      End;

    Procedure agregararboleda(Var a:arbol;v:v_compras);

    Ear c: compras;
    Begin

      E leercompra(c);
      While Not(c.cod=0) Do
        Begin
          P     agregararbol(a,c);
          V
          v[c.mes] := v[c.mes]+1;
          B
          leercompra(c);
          I   Nnd;
          NT
          B
          IT
        End;
      IT
      E
      E
      Erocedure puntob(a:arbol; cod:integer; Var l:lista);

      Begin
        PV
        If  Not(a=Nil) Then
          V
          Begin

            If (cod=a^.dato.cod) Then l := a^.dato.list
                                           B
            Else If (cod<a^.dato.cod) Then puntob(a^.hi,cod,l)
            Else puntob(a^.hd,cod,l)
              F
          End;
        TD
        B
      End ;

      FTD
      Irocedure ordenaTarray(V ar  v:v_compras);

      V ar  i,j,pos: sub_mes;
      c: i nt eger;

      Eegin
      E
      For i:=1 To 11 Do
        Begin
          pos := i;
          V
          For j:=i+1 To 12 Do
            B       If  v[pos]<v[j] Then pos := j;

          F     c : T v[poD]
          ;
          B
          v[pos] := v[i];
          E     v[i] := c;
        End;
    End;

    FTD


    Var v: compras;
      i: integer;
    Begin
      E  For i:=1 To 12 Do
           Begin
             readln(v[i]);
           End;
      ordenararray(v);


      For i:=1 To 12 Do
        writeln(v[i]);




    End.
