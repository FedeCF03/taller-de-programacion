
Program arbolcl2e3;

Type 

  n_alu = Record
    codigoalu: integer;
    codigom: integer;
    nota: integer;
  End;
  n_mate = Record
    codigom,
    codigoalu,nota: integer;
  End;

  lista = ^nodo;

  nodo = Record
    dato: vector;
    sig: lista;
  End;
  lista2 = ^nodo2;
  nodo2 = Record
    dato: n_mate;
    sig: lista2;
  End;
  vector2 = array[1..30] Of lista2;
  vector = array[1..30] Of n_alu;
