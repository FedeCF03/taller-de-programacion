
Program parcial6;

Type 
  sub_mes = 1..12;
  compras = Record
    clicod: integer;
    mes: sub_mes;
    monto: real;
  End;

  mesesc = array[sub_mes] Of real;
  dat = Record
    cli: integer;
    monmeses: mesesc;
  End;

  arbol = ^nodo;

  nodo = Record
    dato: dat;
    hd,hi: arbol;
  End;

Procedure leercli(Var c:compras);

Begin
  Readln(c.clicod);
  If Not(c.clicod=0)
    Then
    Begin
      ReadLn(c.mes);
      ReadLn(c.monto);
    End;
End;

Procedure inicializarvector(Var v:mesesc);

Var i: integer;
Begin

  For i:=1 To 12  Do
    Begin
      v[i] := 0;
    End;
End;

Procedure agregarmontos(Var v:mesesc; c:compras);
Begin

  v[c.mes] := v[c.mes]+c.monto;


End;

Procedure agregararbol (Var a:arbol; c:compras);

Begin

  If (a=Nil) Then
    Begin
      new(a);
      inicializarvector(a^.dato.monmeses);
      a^.dato.monmeses[c.mes] := a^.dato.monmeses[c.mes]+c.monto;
      a^.dato.cli := c.clicod;
      a^.hd := Nil;
      a^.hi := Nil;

    End
  Else If (a^.dato.cli=c.clicod) Then
         a^.dato.monmeses[c.mes] := a^.dato.monmeses[c.mes]+c.monto
  Else If (c.clicod<a^.dato.cli)Then
         agregararbol(a^.hi,c)
  Else agregararbol(a^.hd,c);
End;


Procedure agregararboledas(Var a:arbol);

Var c: compras;
Begin

  leercli(c);

  While Not(c.clicod=0)  Do
    Begin
      agregararbol(a,c);
      leercli(c);
    End;
End;

Procedure buscarmaximo(v:mesesc; Var mes:sub_mes);

Var i: integer;

Begin
  mes := 1;
  For i:=2 To 12 Do
    Begin

      If (v[mes]<v[i])Then
        mes := i;


    End;


End;




Procedure mayorgasto(a:arbol; cod:integer;Var mes:sub_mes);
Begin

  If Not(a=Nil)Then
    Begin
      If (a^.dato.cli=cod) Then
        buscarmaximo(a^.dato.monmeses,mes)
      Else If (cod<a^.dato.cli) Then mayorgasto(a^.hi,cod,mes)
      Else mayorgasto(a^.hd,cod,mes);



    End;



End;


Procedure ratas(a:arbol; Var cantratas:integer; mes:sub_mes);

Begin
  If Not(a=Nil) Then
    Begin
      ratas(a^.hi,cantratas,mes);
      If (a^.dato.monmeses[mes]=0)Then
        cantratas := cantratas+1;
      ratas(a^.hd,cantratas,mes);





    End;




End;




Var a: arbol;
  m: sub_mes;
  cantaratas: integer;
Begin

  cantaratas := 0;
  agregararboledas(a);
  mayorgasto(a,90,m);
  ratas(a,cantaratas,5);
  WriteLn(cantaratas);
  WriteLn(m);



End.
