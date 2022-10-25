const n = 10;
var a: array[1..n, 1..n] of integer;
    i, j: integer;
begin 
    for i := 1 to n do
        for j := 1 to n do
            a[i][j] := (i-1)*n + j;
    writeln('Итоговый массив');
    for i := 1 to n do begin 
        for j := 1 to n do
            write(a[i][j], ' ');
        writeln;    
    end;
end.