program recum;
type


vector=array[1..10] of String;


procedure secu(a:string; var i:integer; var v:vector);

begin
if not(a='.') and not(i=11)
then
begin
    ReadLn(a);
    v[i]:=a;
    i:=i+1;
  secu(a,i,v);

end;
end;

procedure secuinforme(a:string; var c:integer;i:integer);

begin
if not(a='.')
then
begin
c:=c+1;
    i:=i+1;
    ReadLn(a);
    WriteLn(i,'a');

  secuinforme(a,c,i);

end;
WriteLn(i);
if(i=1)then
  WriteLn('se añadieron ',c)
  else if (i=0) then WriteLn('no se añadio');



end;



function leer(v:vector;a,i:integer):integer;
begin
  if not(i=a)then
  begin
    WriteLn(v[a]);
    a:=a+1;
    leer(v,a,i);
  end;

leer:=a;

end;





var a:String;
i,b:integer;
v:vector;
begin
a:='a';
b:=0;
i:=0;
 
  secuinforme(a,b,i);
end.