
Program arcial;

Type 

  materias = Record
    codmate: integer;
    nota: integer;
  End;

  lista = ^nodo;
  nodo = Record
    dato: materias;
    sig: lista;
  End;
  v_alu = array[1..7000] Of lista;
