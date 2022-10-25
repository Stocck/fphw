const n = 6;
type vector = array[1..n] of integer;
     matrix = array[1..n] of vector;
var a: matrix;
    x: vector;
    b: array [1..n, 1..n] of integer;
    r,c: integer;
begin
    writeln('Введите кв. матрицу размером, - ',  n);
    for r := 1 to n do 
        for c := 1 to n do
            read(a[r][c]);
    for r := 1 to n div 2 do begin 
        x := a[2*r];
        a[2*r] := a[2*r-1];
        a[2*r-1] := x;
    end;
    writeln('Итоговый массив');
    for r := 1 to n do begin 
        for c := 1 to n do
            write(a[r][c], ' ');
        writeln;    
    end;
end.