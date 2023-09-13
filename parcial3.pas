
Program parcial3;

Const maxnroalu = 7000;

Type 
  final = 0..10;
  nro_alu = 1..maxnroalu;
  alumnos = Record
    nro: nro_alu;
    codmateria: integer;
    nota: final;
  End;
  lista = ^nodo;
  nodo = Record
    dato: alumnos;
    sig: lista;
  End;
  v_notas = array[300..356] Of final;
  v_alu = array[nro_alu] Of lista;
  v_pro = array[nro_alu] Of real;
Procedure leernota(Var a:alumnos);
Begin
  With a Do
    Begin
      ReadLn(nro);
      If Not(nro=0) Then
        Begin
          ReadLn(codmateria);
          ReadLn(nota);
        End;
    End;
End;

Procedure inicializarvectordelistar(Var v:v_alu);

Var i: integer;
Begin
  For i:=1 To maxnroalu Do
    Begin
      v[i] := Nil;
    End;
End;


Procedure agregarenvector(Var v:v_alu;Var diml:integer);

Var a: alumnos;
  i: integer;
Begin
  i := 1;
  leernota(a);

  While Not(a=0) And Not(i=7001) Do
    Begin
      agregaratras(v[i]^.dato,a);
      i := i+1;
      leernota(a);
    End;
  diml := i-1;
End;


Procedure promedio (v:v_alu;)