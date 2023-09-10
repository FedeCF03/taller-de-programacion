
Program cl5e1.pas;

Const 
  max = 300;

Type 
  max_ofi = 1..max;

  oficinas = Record
    cod,dni,valor: integer;
  End;
  vector = array [max_ofi] Of oficinas;

Procedure leeroficiona(Var o:oficinas);
Begin
  ReadLn(o.cod);
  If Not(o.cod=-1) Then

    Begin
      ReadLn(o.dni);
      ReadLn(o.valor);
    End;
End;

Procedure cargarvector (Var v:vector; Var dl:integer);

Var o: oficinas;
  i: integer;
Begin
  leeroficiona(o);
  i := 1;
  While Not(o.cod=-1) And (dl<=300) Do
    Begin
      v[i] := o;
      i := i+1;
      leeroficiona(o);
    End;
  dl := i;
End;

Procedure insercion(Var v:vector; dl:integer);

Var i,j : integer;
  act: oficinas;
Begin
  For i:=2 To dl Do
    Begin
      act := v[i];
      j := i-1;
      While (0<j) And (act.cod<v[j].cod) Do
        Begin
          v[j+1] := v[j];
          j := j-1;
        End;
      v[j+1] := act;
    End;


End;

Procedure imprimir(v:vector;dl:integer);

Var i: integer;
Begin
  For i:=1 To dl Do
    Begin
      WriteLn(v[i].cod);

    End;

End;

Procedure monto(v:vector; Var m:integer;dl,i:integer);

Begin

  If (i>0) And (dl>=i) Then
    Begin
      m := v[i].valor+m;
      i := i+1;
      monto(v,m,dl,i);

    End;

End;





Var v: vector;
  i,m,  dl: integer;

Begin
  dl := 0;
  i := 1;
  m := 0;
  cargarvector(v,dl);

  monto(v,m,dl,i);
  WriteLn(m);
End.
